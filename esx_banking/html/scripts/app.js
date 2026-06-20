function safePlay(audioEl) {
    if (!audioEl || !audioEl.play) return;
    try {
        audioEl.currentTime = 0;
        const p = audioEl.play();
        if (p && p.catch) p.catch(() => {});
    } catch (e) {}
}

const clickSfx = document.getElementById('clickSfx');
const overButtonSfx = document.getElementById('overButtonSfx');
const bankOnSfx = document.getElementById('bankOnSfx');
const cargadoSfx = document.getElementById('cargadoSfx');

clickSfx.volume = 0.2;
overButtonSfx.volume = 0.2;
bankOnSfx.volume = 0.2;
cargadoSfx.volume = 0.4;

const bankingApp = Vue.createApp({
    data() {
        return {
            isBankOpen: false,
            isATMOpen: false,
            showLogo: false,
            atmView: 'inicio',
            showPinPrompt: false,
            notification: null,
            activeView: "home",
            accounts: [],
            statements: { checking: [] },
            selectedAccountStatement: "checking",
            playerName: "",
            accountNumber: "",
            playerCash: 0,
            selectedMoneyAccount: null,
            selectedMoneyAmount: 0,
            moneyReason: "",
            transferType: "internal",
            internalFromAccount: null,
            internalToAccount: null,
            internalTransferAmount: 0,
            externalAccountNumber: "",
            externalFromAccount: null,
            externalTransferAmount: 0,
            transferReason: "",
            debitPin: "",
            enteredPin: "",
            acceptablePins: [],
            tempBankData: null,
            createAccountName: "",
            createAccountAmount: 0,
            editAccount: null,
            editAccountName: "",
            manageAccountName: null,
            manageUserName: "",
            filteredUsers: [],
            showUsersDropdown: false,
            openBankTimeout: null,
        };
    },
    computed: {
        currentAccountBalance() {
            const acc = this.accounts.find(a => a.name === this.selectedAccountStatement);
            return acc ? acc.balance : 0;
        },
        accountStatements() {
            return this.statements[this.selectedAccountStatement] || [];
        }
    },
    watch: {
        "manageAccountName.users": function () {
            this.filterUsers();
        },
    },
    methods: {
        openBank(bankData) {
            if (this.openBankTimeout) {
                clearTimeout(this.openBankTimeout);
                this.openBankTimeout = null;
            }

            safePlay(cargadoSfx);

            this.showLogo = true;
            this.isBankOpen = false;

            this.playerName = bankData.playerName;
            this.accountNumber = bankData.playerIban;
            this.playerCash = bankData.playerCash;

            this.accounts = [
                {
                    name: 'checking',
                    type: 'personal',
                    balance: bankData.playerBank,
                    users: '[]',
                    id: 1,
                }
            ];
            this.selectedAccountStatement = 'checking';

            this.statements = {
                'checking': bankData.playerStatements || []
            };

            this.openBankTimeout = setTimeout(() => {
                this.showLogo = false;
                this.isBankOpen = true;
                safePlay(bankOnSfx);
                this.openBankTimeout = null;
            }, 3000);
        },
        openATM(bankData) {
            safePlay(cargadoSfx);
            this.playerName = bankData.playerName;
            this.accountNumber = bankData.playerIban;
            this.playerCash = bankData.playerCash;
            this.accounts = [
                {
                    name: 'checking',
                    type: 'personal',
                    balance: bankData.playerBank,
                    users: '[]',
                    id: 1,
                }
            ];
            this.selectedAccountStatement = 'checking';
            this.atmView = 'inicio';
            this.isATMOpen = true;
        },
        pinPrompt(enteredPin) {
            this.playClick();
            if (!enteredPin || enteredPin.length < 4) return;

            axios.post(`https://${GetParentResourceName()}/checkPin`, {
                pin: enteredPin
            }).then(({ data }) => {
                if (data.success) {
                    this.showPinPrompt = false;
                    this.openATM(this.tempBankData);
                    this.enteredPin = "";
                } else {
                    this.enteredPin = "";
                }
            }).catch(() => {
                this.enteredPin = "";
            });
        },
        deposit(amount) {
            safePlay(clickSfx);
            if (!this.selectedAccountStatement || amount <= 0) return;
            axios.post(`https://${GetParentResourceName()}/deposit`, {
                accountName: this.selectedAccountStatement,
                amount: amount,
                reason: `Depósito rápido $${amount}`
            })
                .then(({ data }) => {
                    if (data.success) {
                        const acc = this.accounts.find(a => a.name === this.selectedAccountStatement);
                        acc.balance += amount;
                        this.playerCash -= amount;
                        this.addStatement(this.accountNumber, this.selectedAccountStatement, `Depósito rápido`, amount, "deposit");
                        this.addNotification(data.message, "success");
                        this.selectedMoneyAmount = 0;
                    } else {
                        this.addNotification(data.message, "error");
                    }
                });
        },
        withdraw(amount) {
            safePlay(clickSfx);
            if (!this.selectedAccountStatement || amount <= 0) return;
            axios.post(`https://${GetParentResourceName()}/withdraw`, {
                accountName: this.selectedAccountStatement,
                amount: amount,
                reason: `Retiro rápido $${amount}`
            })
                .then(({ data }) => {
                    if (data.success) {
                        const acc = this.accounts.find(a => a.name === this.selectedAccountStatement);
                        acc.balance -= amount;
                        this.playerCash += amount;
                        this.addStatement(this.accountNumber, this.selectedAccountStatement, `Retiro rápido`, amount, "withdraw");
                        this.addNotification(data.message, "success");
                        this.selectedMoneyAmount = 0;
                    } else {
                        this.addNotification(data.message, "error");
                    }
                });
        },
        withdrawMoney() {
            safePlay(clickSfx);
            const accountName = this.selectedAccountStatement;
            const amount = Number(this.selectedMoneyAmount);
            if (amount <= 0) return;

            axios.post(`https://${GetParentResourceName()}/withdraw`, {
                accountName: accountName,
                amount: amount,
                reason: "Retiro manual"
            })
                .then(({ data }) => {
                    if (data.success) {
                        const account = this.accounts.find(acc => acc.name === accountName);
                        if (account) {
                            account.balance -= amount;
                        }
                        this.playerCash += amount;
                        this.addStatement(
                            this.accountNumber,
                            accountName,
                            "Retiro manual",
                            amount,
                            "withdraw"
                        );
                        this.selectedMoneyAmount = 0;
                        this.addNotification(data.message, "success");
                    } else {
                        this.addNotification(data.message, "error");
                    }
                })
                .catch(() => {
                    this.addNotification("Error de red", "error");
                });
        },
        internalTransfer() {
            if (!this.internalFromAccount || !this.internalToAccount || this.internalTransferAmount <= 0) {
                return;
            }
            axios
                .post(`https://${GetParentResourceName()}/internalTransfer`, {
                    fromAccountName: this.internalFromAccount.name,
                    toAccountName: this.internalToAccount.name,
                    amount: this.internalTransferAmount,
                    reason: this.transferReason,
                })
                .then((response) => {
                    if (response.data.success) {
                        const fromAccount = this.accounts.find((acc) => acc.name === this.internalFromAccount.name);
                        if (fromAccount) {
                            fromAccount.balance -= this.internalTransferAmount;
                        }
                        const toAccount = this.accounts.find((acc) => acc.name === this.internalToAccount.name);
                        if (toAccount) {
                            toAccount.balance += this.internalTransferAmount;
                        }
                        this.addStatement(this.accountNumber, this.internalFromAccount.name, this.transferReason, this.internalTransferAmount, "withdraw");
                        this.addStatement(this.accountNumber, this.internalToAccount.name, this.transferReason, this.internalTransferAmount, "deposit");
                        this.internalTransferAmount = 0;
                        this.transferReason = "";
                        this.internalFromAccount = null;
                        this.internalToAccount = null;
                        this.addNotification(response.data.message, "success");
                    } else {
                        this.addNotification(response.data.message, "error");
                    }
                });
        },
        externalTransfer() {
            const amount = Number(this.externalTransferAmount);
            const toAccount = this.externalAccountNumber?.toString().trim();

            if (!toAccount || amount <= 0) {
                return this.addNotification("Destino o cantidad inválida", "error");
            }

            axios.post(`https://${GetParentResourceName()}/transfer`, {
                amount: amount,
                to: toAccount
            })
                .then(({ data }) => {
                    if (data.success) {
                        const checking = this.accounts.find(acc => acc.name === 'checking');
                        if (checking) checking.balance -= amount;

                        this.externalTransferAmount = 0;
                        this.externalAccountNumber = "";

                        this.addNotification(data.message, "success");
                    } else {
                        this.addNotification(data.message, "error");
                    }
                })
                .catch(() => {
                    this.addNotification("Error de red", "error");
                });
        },
        orderDebitCard() {
            const pin = this.debitPin?.toString().trim();
            if (!/^\d{4}$/.test(pin)) {
                return this.addNotification("Ingresa un NIP de 4 dígitos", "error");
            }

            axios.post(`https://${GetParentResourceName()}/orderCard`, { pin })
                .then(({ data }) => {
                    if (data.success) {
                        this.addNotification(data.message, "success");
                        this.debitPin = "";
                        this.setActiveView("home");
                    } else {
                        this.addNotification(data.message, "error");
                    }
                })
                .catch(() => {
                    this.addNotification("Error de red", "error");
                });
        },
        openAccount() {
            if (!this.createAccountName || this.createAccountAmount < 0) {
                return;
            }

            axios.post(`https://${GetParentResourceName()}/openAccount`, {
                accountName: this.createAccountName,
                amount: this.createAccountAmount,
            })
                .then((response) => {
                    if (response.data.success) {
                        const checkingAccount = this.accounts.find((acc) => acc.name === "checking");
                        checkingAccount.balance -= this.createAccountAmount;
                        this.accounts.push({
                            name: this.createAccountName,
                            type: "shared",
                            balance: this.createAccountAmount,
                            users: JSON.stringify([this.playerName]),
                        });
                        this.addStatement(this.accountNumber, "checking", "Initial deposit for " + this.createAccountName, this.createAccountAmount, "withdraw");
                        this.addStatement(this.accountNumber, this.createAccountName, "Initial deposit", this.createAccountAmount, "deposit");
                        this.createAccountName = "";
                        this.createAccountAmount = 0;
                        this.addNotification(response.data.message, "success");
                    } else {
                        this.createAccountName = "";
                        this.createAccountAmount = 0;
                        this.addNotification(response.data.message, "error");
                    }
                });
        },
        renameAccount() {
            if (!this.editAccount || !this.editAccountName) {
                return;
            }

            axios.post(`https://${GetParentResourceName()}/renameAccount`, {
                oldName: this.editAccount.name,
                newName: this.editAccountName,
            })
                .then((response) => {
                    if (response.data.success) {
                        const account = this.accounts.find((acc) => acc.name === this.editAccount.name);
                        if (account) {
                            account.name = this.editAccountName;
                        }
                        this.editAccount = null;
                        this.editAccountName = "";
                        this.addNotification(response.data.message, "success");
                    } else {
                        this.addNotification(response.data.message, "error");
                    }
                });
        },
        deleteAccount() {
            if (!this.editAccount) {
                return;
            }

            axios.post(`https://${GetParentResourceName()}/deleteAccount`, {
                accountName: this.editAccount.name,
            })
                .then((response) => {
                    if (response.data.success) {
                        this.accounts = this.accounts.filter((acc) => acc.name !== this.editAccount.name);
                        this.editAccount = null;
                        this.addNotification(response.data.message, "success");
                    } else {
                        this.addNotification(response.data.message, "error");
                    }
                });
        },
        addUserToAccount() {
            if (!this.manageAccountName || !this.manageUserName) {
                return;
            }
            axios.post(`https://${GetParentResourceName()}/addUser`, {
                accountName: this.manageAccountName.name,
                userName: this.manageUserName,
            })
                .then((response) => {
                    if (response.data.success) {
                        let usersArray = JSON.parse(this.manageAccountName.users);
                        usersArray.push(this.manageUserName);
                        this.manageAccountName.users = JSON.stringify(usersArray);
                        this.manageUserName = "";
                        this.addNotification(response.data.message, "success");
                    } else {
                        this.addNotification(response.data.message, "error");
                    }
                });
        },
        removeUserFromAccount() {
            if (!this.manageAccountName || !this.manageUserName) {
                return;
            }

            axios.post(`https://${GetParentResourceName()}/removeUser`, {
                accountName: this.manageAccountName.name,
                userName: this.manageUserName,
            })
                .then((response) => {
                    if (response.data.success) {
                        let usersArray = JSON.parse(this.manageAccountName.users);
                        usersArray = usersArray.filter((user) => user !== this.manageUserName);
                        this.manageAccountName.users = JSON.stringify(usersArray);
                        this.manageUserName = "";
                        this.addNotification(response.data.message, "success");
                    } else {
                        this.addNotification(response.data.message, "error");
                    }
                });
        },
        addStatement(accountNumber, accountName, reason, amount, type) {
            let newStatement = {
                date: Date.now(),
                user: accountNumber,
                iban: accountNumber,
                reason: reason,
                amount: amount,
                type: type,
            };

            if (!this.statements[accountName]) {
                this.statements[accountName] = [];
            }

            this.statements[accountName].push(newStatement);
        },
        addNotification(message, type) {
            this.notification = {
                message: message,
                type: type,
            };

            setTimeout(() => {
                this.notification = null;
            }, 3000);
        },
        appendNumber(number) {
            this.enteredPin += number.toString();
        },
        selectAccount(account) {
            this.selectedAccountStatement = account.name;
        },
        setTransferType(type) {
            this.transferType = type;
        },
        setActiveView(view) {
            this.activeView = view;
        },
        formatCurrency(amount) {
            return new Intl.NumberFormat().format(amount);
        },
        filterUsers() {
            if (!this.manageAccountName || typeof this.manageAccountName.users !== "string") {
                this.filteredUsers = [];
                return;
            }
            let usersArray;
            try {
                usersArray = JSON.parse(this.manageAccountName.users);
            } catch (e) {
                this.filteredUsers = [];
                return;
            }
            if (this.manageUserName === "") {
                this.filteredUsers = usersArray;
            } else {
                this.filteredUsers = usersArray.filter((user) => user.toLowerCase().includes(this.manageUserName.toLowerCase()));
            }
        },
        selectUser(user) {
            this.manageUserName = user;
            this.showUsersDropdown = false;
        },
        hideDropdown() {
            setTimeout(() => {
                this.showUsersDropdown = false;
            }, 100);
        },
        formatDate(timestamp) {
            const date = new Date(parseInt(timestamp));
            const month = (date.getMonth() + 1).toString().padStart(2, "0");
            const day = date.getDate().toString().padStart(2, "0");
            const year = date.getFullYear();
            return `${month}/${day}/${year}`;
        },
        balanceClass(statementType) {
            return statementType === "deposit" ? "positive-balance" : "negative-balance";
        },
        handleMessage(event) {
            const action = event.data.action;
            if (action === "openBank") {
                this.openBank(event.data);
            } else if (action === "openATM") {
                this.tempBankData = event.data;
                this.showPinPrompt = true;
            }
        },
        handleKeydown(event) {
            if (event.key === "Escape") {
                this.closeApplication();
            }
        },
        clearPin() {
            this.enteredPin = '';
        },
        playClick() {
            safePlay(clickSfx);
        },
        playOver() {
            safePlay(overButtonSfx);
        },
        removeLastDigit() {
            this.enteredPin = this.enteredPin.slice(0, -1);
        },
        closeApplication() {
            safePlay(clickSfx);

            axios.post(`https://${GetParentResourceName()}/closeApp`, {});

            if (this.openBankTimeout) {
                clearTimeout(this.openBankTimeout);
                this.openBankTimeout = null;
            }

            this.showLogo = false;
            this.isBankOpen = false;
            this.isATMOpen = false;
            this.showPinPrompt = false;
            this.enteredPin = "";
            this.tempBankData = null;
        },
    },
    mounted() {
        document.addEventListener("keydown", this.handleKeydown);
        window.addEventListener("message", this.handleMessage);
        const clickTargets = 'button, .nav-option, .quick-btn, .action-button, .submit-btn, .clear-btn';

        document.querySelectorAll(clickTargets).forEach(el => {
            el.addEventListener('click', () => {
                safePlay(clickSfx);
            });
            el.addEventListener('mouseover', () => {
                safePlay(overButtonSfx);
            });
        });
    },
    beforeUnmount() {
        document.removeEventListener("keydown", this.handleKeydown);
    },
}).mount("#app");
