const app = new Vue({
    el: '#app',
    data: {
        visible: false,
        activeTab: 'dashboard',
        loading: false,
        searchTerm: '',
        showCreator: false,
        showRankModal: false,
        showUserModal: false,
        showCustomDropdown: false,
        userActionValue: 0,
        userVipDays: 30,
        editingUser: {
            identifier: '',
            name: '',
            coins: 0,
            rank_id: null
        },
        data: {
            ranks: [],
            users: [],
            codes: [],
            ranking: [],
            items: [],
            totalCoins: 0
        },
        editingRank: {
            id: null,
            name: '',
            label: '',
            money_passive: 0,
            coins_passive: 0,
            interval: 30
        },
        tabs: [
            { id: 'dashboard', label: 'Dashboard', icon: 'layout-dashboard' },
            { id: 'users', label: 'Usuarios VIP', icon: 'users' },
            { id: 'ranks', label: 'Rangos VIP', icon: 'crown' },
            { id: 'codes', label: 'Cupones', icon: 'ticket' },
            { id: 'ranking', label: 'Ranking', icon: 'trophy' },
        ],
        newCode: {
            code: '',
            max_uses: 1,
            rewards: []
        },
        tempReward: {
            type: 'coins',
            val: ''
        }
    },
    computed: {
        filteredUsers() {
            if (!this.searchTerm) return this.data.users;
            return this.data.users.filter(u => 
                u.identifier.toLowerCase().includes(this.searchTerm.toLowerCase()) ||
                (u.rank_label && u.rank_label.toLowerCase().includes(this.searchTerm.toLowerCase()))
            );
        }
    },
    methods: {
        getActiveTabLabel() {
            const tab = this.tabs.find(t => t.id === this.activeTab);
            return tab ? tab.label : '';
        },
        closePanel() {
            this.visible = false;
            $.post(`https://${window.GetParentResourceName()}/close`, JSON.stringify({}));
        },
        refreshData() {
            this.loading = true;
            $.post(`https://${window.GetParentResourceName()}/getDashboardData`, JSON.stringify({}), (res) => {
                if (res) this.data = res;
                this.loading = false;
                this.$nextTick(() => { 
                    if (typeof lucide !== 'undefined') lucide.createIcons();
                });
            }).fail(() => {
                setTimeout(() => { this.loading = false; }, 1000);
            });
        },
        parseRewards(val) {
            try { return typeof val === 'string' ? JSON.parse(val) : val; } catch(e) { return []; }
        },
        formatReward(r) {
            if (r.type === 'coins') return `${r.amount} Coins`;
            if (r.type === 'vip') return `VIP ${r.rank_name || 'N/A'}`;
            if (r.type === 'item') return `${r.amount || 1}x ${r.item_name}`;
            if (r.type === 'vehicle') return `Auto: ${r.model}`;
            return 'Reward';
        },
        generateCode() {
            const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
            let result = 'VIP-';
            for (let i = 0; i < 8; i++) {
                result += chars.charAt(Math.floor(Math.random() * chars.length));
            }
            this.newCode.code = result;
        },
        addRewardToPack() {
            if (!this.tempReward.val) return;
            const reward = { type: this.tempReward.type };
            
            if (reward.type === 'coins') reward.amount = parseInt(this.tempReward.val);
            else if (reward.type === 'vip') {
                const rank = this.data.ranks.find(r => r.id == this.tempReward.val);
                reward.rank_id = this.tempReward.val;
                reward.rank_name = rank ? rank.label : 'N/A';
            } else if (reward.type === 'item') {
                const item = this.data.items.find(i => i.name == this.tempReward.val);
                reward.item_name = this.tempReward.val;
                reward.item_label = item ? item.label : this.tempReward.val;
                reward.amount = 1;
            } else if (reward.type === 'vehicle') {
                reward.model = this.tempReward.val;
            }

            this.newCode.rewards.push(reward);
            this.tempReward.val = '';
            this.$nextTick(() => { 
                if (typeof lucide !== 'undefined') lucide.createIcons();
            });
        },
        removeRewardFromPack(idx) {
            this.newCode.rewards.splice(idx, 1);
        },
        saveCode() {
            if (!this.newCode.code || this.newCode.rewards.length === 0) return;
            $.post(`https://${window.GetParentResourceName()}/saveCode`, JSON.stringify({
                code: this.newCode.code,
                max_uses: this.newCode.max_uses,
                type: 'bundle',
                value: this.newCode.rewards
            }));
            this.showCreator = false;
            this.newCode = { code: '', max_uses: 1, rewards: [] };
            setTimeout(() => { this.refreshData(); }, 200);
        },
        deleteCode(id) {
            $.post(`https://${window.GetParentResourceName()}/deleteCode`, JSON.stringify({ id: id }));
            setTimeout(() => { this.refreshData(); }, 200);
        },
        openRankModal(rank) {
            if (rank) {
                this.editingRank = { ...rank };
            } else {
                this.editingRank = {
                    id: null,
                    name: '',
                    label: '',
                    money_passive: 0,
                    coins_passive: 0,
                    interval: 30
                };
            }
            this.showRankModal = true;
        },
        saveRank() {
            if (!this.editingRank.name || !this.editingRank.label) return;
            $.post(`https://${window.GetParentResourceName()}/saveRank`, JSON.stringify(this.editingRank));
            this.showRankModal = false;
            setTimeout(() => { this.refreshData(); }, 200);
        },
        deleteRank(id) {
            $.post(`https://${window.GetParentResourceName()}/deleteRank`, JSON.stringify({ id: id }));
            setTimeout(() => { this.refreshData(); }, 200);
        },
        openUserModal(user) {
            this.editingUser = { ...user };
            this.userActionValue = 0;
            this.userVipDays = 30;
            this.showUserModal = true;
            this.showCustomDropdown = false;
        },
        getSelectedRankLabel() {
            if (this.editingUser.rank_id === null) return 'Ninguno';
            const rank = this.data.ranks.find(r => r.id === this.editingUser.rank_id);
            return rank ? rank.label : 'Ninguno';
        },
        selectCustomRank(id) {
            this.editingUser.rank_id = id;
            this.showCustomDropdown = false;
        },
        updateUserCoins(isAdd) {
            if (this.userActionValue <= 0) return;
            const amount = isAdd ? this.userActionValue : -this.userActionValue;
            $.post(`https://${window.GetParentResourceName()}/admin:updateUserCoins`, JSON.stringify({
                identifier: this.editingUser.identifier,
                amount: amount
            }));
            
            // Local update for immediate feedback
            this.editingUser.coins += amount;
            const u = this.data.users.find(u => u.identifier === this.editingUser.identifier);
            if (u) u.coins += amount;

            this.userActionValue = 0;
        },
        updateUserRank() {
            $.post(`https://${window.GetParentResourceName()}/admin:updateUserRank`, JSON.stringify({
                identifier: this.editingUser.identifier,
                rank_id: this.editingUser.rank_id,
                days: this.userVipDays
            }));
            this.showUserModal = false;
            setTimeout(() => { this.refreshData(); }, 300);
        }
    },
    mounted() {
        window.addEventListener('message', (event) => {
            const { action, data } = event.data;
            if (action === 'open') {
                if (data) this.data = data;
                this.visible = true;
                this.$nextTick(() => { 
                    if (typeof lucide !== 'undefined') lucide.createIcons();
                });
            }
        });

        window.addEventListener('keydown', (e) => {
            if (e.key === 'Escape') {
                if (this.showCreator) {
                    this.showCreator = false;
                } else if (this.showRankModal) {
                    this.showRankModal = false;
                } else if (this.showUserModal) {
                    this.showUserModal = false;
                } else {
                    this.closePanel();
                }
            }
        });
    },
    updated() {
        this.$nextTick(() => {
            if (typeof lucide !== 'undefined') lucide.createIcons();
        });
    },
    watch: {
        activeTab() {
            this.$nextTick(() => {
                if (typeof lucide !== 'undefined') lucide.createIcons();
            });
        },
        showCreator(val) {
            if (val) {
                this.$nextTick(() => {
                    if (typeof lucide !== 'undefined') lucide.createIcons();
                });
            }
        },
        showRankModal(val) {
            if (val) {
                this.$nextTick(() => {
                    if (typeof lucide !== 'undefined') lucide.createIcons();
                });
            }
        }
    }
});
