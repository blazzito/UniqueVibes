const app = new Vue({
    el: '#app',
    data: function () {
        return {
            translations: {},
            translationsLoaded: false,
            modals: [],
            currentModal: null,
            visible: false,
            currentEditingVehicle: null,
            dealershipInfo: null,
            cameraControls: {
                zoom: 1.0,
                minZoom: 0.66,
                maxZoom: 3.0,
                rotation: 0,
                height: 1.5,
                minHeight: -2.0,
                maxHeight: 5.0,
                isDragging: false,
                lastX: 0,
                lastY: 0,
                sensitivity: 0.05,
                heightSensitivity: 0.02,
                autoRotateEnabled: true,
                autoRotateSpeed: 12.0,
                hasManualControl: false
            }, testDriving: false, currentEditingCategory: null,
            autoRotateFrameId: null,
            searchQuery: '',
            selectedCategory: 'all_categories',
            selectedVehicle: null,
            currentVehiclePrice: 0,
            currentVehicleFinancing: false,
            testDriveTimeRemaining: 0,
            testDriveTimer: null,
            sortBy: 'name',
            sortOrder: 'asc',
            priceFilter: {
                min: null,
                max: null,
                active: false
            },
            financingConfig: {
                enabled: true,
                timeUnit: 'days',
                maxPeriods: 7,
                interestRate: 5.0
            }, financingModal: {
                visible: false,
                vehicleName: '',
                vehiclePrice: 0,
                options: [],
                selectedOption: null
            }, addVehicleModal: {
                visible: false,
                searchQuery: '',
                selectedVehicle: null,
                isEditing: false,
                editingVehicle: null,
                form: {
                    category: '',
                    model: '',
                    label: '',
                    price: 0,
                    xp: 0,
                    image: '',
                    class: 'A',
                    financing: false,
                    paymentMethods: {
                        cash: false,
                        bank: false,
                        xp: false,
                        company: false
                    },
                    prices: {
                        cash: 0,
                        bank: 0,
                        xp: 0,
                        company: 0
                    },
                    stockEnabled: false,
                    stock: 10
                }
            },
            exhibitorConfigModal: {
                visible: false,
                currentExhibitorIndex: null,
                selectedVehicles: [],
                availableVehicles: [],
                searchQuery: '',
                fixedVehicleModel: '',
                rotateEnabled: false,
                interactable: true,
                allowPurchase: true,
                allowTestDrive: true
            },
            dealershipMenu: {
                visible: false,
                currentVehicleLabel: null,
                currentVehicleStats: [],
                primaryColor: '#ff6b00',
                secondaryColor: '#ff6b00',
                dealershipStock: {
                    sports_classics: {
                        label: 'Sports Classics',
                        categoryStock: []
                    }
                }
            },
            filteredVehicles: [],
            creatorMode: {
                active: false,
                stages: [],
                currentStage: '',
                activeTab: 'cars_exhibitor',
                tabs: [
                    { id: 'cars_exhibitor', labelKey: 'ui.admin_panel.exhibition_tab', icon: 'car', active: true },
                    { id: 'car_testdrive', labelKey: 'ui.admin_panel.test_drive_tab', icon: 'traffic-cone', active: false },
                    { id: 'car_delivery', labelKey: 'ui.admin_panel.delivery_tab', icon: 'package', active: false },
                    { id: 'car_preview', labelKey: 'ui.admin_panel.preview_tab', icon: 'eye', active: false },
                    { id: 'npcs', labelKey: 'ui.admin_panel.npcs_tab', icon: 'user', active: false },
                    { id: 'markers', labelKey: 'ui.admin_panel.markers_tab', icon: 'map-pin', active: false }
                ],
                points: {
                    cars_exhibitor: [],
                    car_testdrive: [],
                    car_delivery: [],
                    car_preview: [],
                    npcs: [],
                    markers: []
                }
            },
            adminPanel: {
                visible: false,
                tabs: {
                    'stock': {
                        id: 'stock',
                        name: 'Dealerships',
                        icon: 'box',
                        active: true,
                    },
                    'map': {
                        id: 'map',
                        name: 'Map',
                        icon: 'map',
                        active: false,
                    }
                },
                activeDealershipTab: 'general',
                dealershipTabs: [
                    { id: 'general', label: this.T ? this.T('ui.admin.general') : 'General', icon: 'settings', active: true },
                    { id: 'vehicles', label: this.T ? this.T('ui.admin.vehicles') : 'Vehicles', icon: 'car', active: false },
                    { id: 'locations', label: this.T ? this.T('ui.admin.locations') : 'Locations', icon: 'map-pin', active: false }
                ],
                activeLocationTab: 'cars_exhibitor',
                locationTabs: [
                    { id: 'cars_exhibitor', labelKey: 'ui.admin_panel.exhibition_tab', icon: 'car', active: true },
                    { id: 'car_testdrive', labelKey: 'ui.admin_panel.test_drive_tab', icon: 'traffic-cone', active: false },
                    { id: 'car_delivery', labelKey: 'ui.admin_panel.delivery_tab', icon: 'package', active: false },
                    { id: 'car_preview', labelKey: 'ui.admin_panel.preview_tab', icon: 'eye', active: false },
                    { id: 'npcs', labelKey: 'ui.admin_panel.npcs_tab', icon: 'user', active: false },
                    { id: 'markers', labelKey: 'ui.admin_panel.markers_tab', icon: 'map-pin', active: false }
                ],
                dealershipManagement: {
                    visible: true,
                    defaultGTAVehicles: [],
                    selectedDealership: undefined,
                    dealerships: [

                    ],
                }
            },
            showFilters: false,
            rightPanelExpanded: false,
            previewEntryPending: false,
            notifications: [],
            dealerCache: {},
            vehiclesReady: true,
            loadingVehicleStats: false,
            expandedCategories: {}, // Objeto para manejar el estado de expansión de categorías
        }
    }, methods: {
        loadTranslations() {
            return new Promise((resolve, reject) => {
                fetch(`https://${GetParentResourceName()}/getTranslations`, {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({})
                })
                    .then(response => {
                        return response.json();
                    })
                    .then(data => {
                        this.translations = data || {};
                        this.translationsLoaded = true;
                        this.updateAdminPanelTranslations();
                        resolve(this.translations);
                    })
                    .catch(error => {
                        this.translations = {};
                        this.translationsLoaded = false;
                        reject(error);
                    });
            });
        },

        updateAdminPanelTranslations() {
            if (this.translationsLoaded) {
                this.adminPanel.tabs.stock.name = this.T('ui.admin.dealerships');
                this.adminPanel.tabs.map.name = this.T('ui.admin.map');

                this.adminPanel.dealershipTabs[0].label = this.T('ui.admin.general');
                this.adminPanel.dealershipTabs[1].label = this.T('ui.admin.vehicles');
                this.adminPanel.dealershipTabs[2].label = this.T('ui.admin.locations');

                this.dealershipMenu.dealershipStock.sports_classics.label = this.T('ui.admin.sports_classics');
            }
        },

        T(key, ...args) {
            if (!this.translationsLoaded) {
                return key;
            }

            let translation = this.translations['ui.' + key] || this.translations[key];

            if (!translation) {
                if (key.startsWith('ui.')) {
                    translation = this.translations[key.substring(3)];
                }
                if (!translation) {
                    return key;
                }
            }

            if (args.length > 0) {
                let result = translation;
                args.forEach((arg, index) => {
                    result = result.replace('%s', arg).replace(new RegExp(`\\{${index}\\}`, 'g'), arg);
                });
                return result;
            }

            return translation;
        },

        setSortBy(sortType) {
            if (this.sortBy === sortType) {
                this.toggleSortDirection();
            } else {
                this.sortBy = sortType;
                this.sortOrder = 'asc';
            }
        },

        toggleSortDirection() {
            this.sortOrder = this.sortOrder === 'asc' ? 'desc' : 'asc';
        },

        applyPriceFilter() {
            const min = this.priceFilter.min;
            const max = this.priceFilter.max;

            if (min !== null && max !== null && min > max) {
                this.priceFilter.min = max;
                this.priceFilter.max = min;
            }

            this.priceFilter.active = (min !== null && min >= 0) || (max !== null && max >= 0);
        },

        clearPriceFilter() {
            this.priceFilter.min = null;
            this.priceFilter.max = null;
            this.priceFilter.active = false;
        },

        saveDealerState() {
            if (!this.dealershipInfo || !this.dealershipInfo.id) return;

            const dealerId = this.dealershipInfo.id;
            this.dealerCache[dealerId] = {
                selectedCategory: this.selectedCategory,
                selectedVehicle: this.selectedVehicle ? this.selectedVehicle.model : null,
                cameraControls: {
                    zoom: this.cameraControls.zoom,
                    rotation: this.cameraControls.rotation,
                    height: this.cameraControls.height
                },
                searchQuery: this.searchQuery,
                sortBy: this.sortBy,
                sortOrder: this.sortOrder,
                priceFilter: { ...this.priceFilter },
                showFilters: this.showFilters,
                timestamp: Date.now()
            };
        },

        loadDealerState() {
            if (!this.dealershipInfo || !this.dealershipInfo.id) return false;

            const dealerId = this.dealershipInfo.id;
            const cachedState = this.dealerCache[dealerId];

            if (cachedState && cachedState.timestamp) {
                const cacheAge = Date.now() - cachedState.timestamp;
                if (cacheAge > 3600000) {
                    delete this.dealerCache[dealerId];
                    return false;
                }

                this.$set(this, 'selectedCategory', cachedState.selectedCategory);
                this.searchQuery = cachedState.searchQuery || '';
                this.sortBy = cachedState.sortBy || 'name';
                this.sortOrder = cachedState.sortOrder || 'asc';
                this.showFilters = cachedState.showFilters || false;

                if (cachedState.priceFilter) {
                    this.priceFilter = { ...cachedState.priceFilter };
                }

                if (cachedState.cameraControls) {
                    this.cameraControls.zoom = cachedState.cameraControls.zoom || 1.0;
                    this.cameraControls.rotation = cachedState.cameraControls.rotation || 0;
                    this.cameraControls.height = cachedState.cameraControls.height || 1.0;
                }

                return true;
            }

            return false;
        },

        findCachedVehicle() {
            if (!this.dealershipInfo || !this.dealershipInfo.id) return null;

            const dealerId = this.dealershipInfo.id;
            const cachedState = this.dealerCache[dealerId];

            if (cachedState && cachedState.selectedVehicle) {
                const category = this.dealershipMenu.dealershipStock[cachedState.selectedCategory];
                if (category && category.categoryStock) {
                    const vehicle = category.categoryStock.find(v => v.model === cachedState.selectedVehicle);
                    if (vehicle) {
                        return { vehicle, category: cachedState.selectedCategory };
                    }
                }

                for (const categoryKey in this.dealershipMenu.dealershipStock) {
                    const category = this.dealershipMenu.dealershipStock[categoryKey];
                    if (category && category.categoryStock) {
                        const vehicle = category.categoryStock.find(v => v.model === cachedState.selectedVehicle);
                        if (vehicle) {
                            return { vehicle, category: categoryKey };
                        }
                    }
                }
            }

            return null;
        },

        selectFirstAvailableVehicle() {
            let firstVehicle = null;
            let firstCategory = null;

            for (const categoryKey in this.dealershipMenu.dealershipStock) {
                const category = this.dealershipMenu.dealershipStock[categoryKey];
                if (category && category.categoryStock && Array.isArray(category.categoryStock) && category.categoryStock.length > 0) {
                    firstVehicle = category.categoryStock[0];
                    firstCategory = categoryKey;
                    break;
                }
            }

            if (firstVehicle) {
                this.$set(this, 'selectedCategory', firstCategory);
                this.dmSelectVehicle(firstVehicle);
            } else {
                this.$set(this, 'selectedVehicle', null);
                this.currentVehicleLabel = null;
            }
        },
        selectVehicleByModel(model) {
            if (!model) {
                this.selectFirstAvailableVehicle();
                return;
            }

            for (const categoryKey in this.dealershipMenu.dealershipStock) {
                const category = this.dealershipMenu.dealershipStock[categoryKey];
                if (!category || !Array.isArray(category.categoryStock)) continue;

                const vehicle = category.categoryStock.find(v => v.model === model);
                if (vehicle) {
                    this.$set(this, 'selectedCategory', categoryKey);
                    this.dmSelectVehicle(vehicle);
                    return;
                }
            }

            this.selectFirstAvailableVehicle();
        },
        initializeCarrouselScroll() {
            this.setupCarrouselScroll();
            setTimeout(() => {
                this.setupCarrouselScroll();
            }, 100);
        }, setupCarrouselScroll() {
            const carrousel = document.querySelector('.vehicle-carrousel');
            if (carrousel && !carrousel.hasAttribute('data-wheel-scroll')) {
                carrousel.setAttribute('data-wheel-scroll', 'true');

                let lastScrollTime = 0;

                carrousel.addEventListener('wheel', (e) => {
                    e.preventDefault();
                    e.stopPropagation();

                    const now = Date.now();
                    if (now - lastScrollTime < 16) return;
                    lastScrollTime = now;

                    const scrollAmount = e.deltaY * 0.6;
                    carrousel.scrollLeft += scrollAmount;

                }, { passive: false });
            }
        },

        fetchEvent: async function (event, data) {
            return fetch(`https://${GetParentResourceName()}/` + event, {

                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(data)
            })
                .then(response => {
                    if (!response.ok) {
                        console.error(`[NUI Error] Event '${event}' failed with status: ${response.status}`);
                        throw new Error('Network response was not ok');
                    }
                    return response.text().then(text => {
                        try {
                            return text ? JSON.parse(text) : {};
                        } catch (e) {
                            return text;
                        }
                    });
                });
        },

        purchaseVehicleModal() {
            if (!this.canPurchaseCurrent) {
                this.notify('error', 'La compra esta desactivada para este coche de exhibicion');
                return;
            }

            const hasFinancing = this.currentVehicleFinancing;
            const vehiclePrice = parseInt(this.currentVehiclePrice) || 0;
            const vehicleXP = this.selectedVehicle ? parseInt(this.selectedVehicle.xp) || 0 : 0;

            const hasPaymentMethodsDefined = this.selectedVehicle && this.selectedVehicle.paymentMethods;

            let paymentMethods;
            let vehiclePrices;

            if (hasPaymentMethodsDefined) {
                paymentMethods = this.selectedVehicle.paymentMethods;
                vehiclePrices = this.selectedVehicle.prices || {
                    cash: vehiclePrice,
                    bank: vehiclePrice,
                    xp: vehicleXP
                };
            } else {
                const hasCashPrice = vehiclePrice > 0;
                const hasXPPrice = vehicleXP > 0;

                paymentMethods = {
                    cash: hasCashPrice,
                    bank: hasCashPrice,
                    xp: hasXPPrice
                };

                vehiclePrices = {
                    cash: vehiclePrice,
                    bank: vehiclePrice,
                    xp: vehicleXP
                };
            }


            const isPaymentMethodValid = (method) => {
                if (!paymentMethods[method]) return false;
                const methodPrice = parseInt(vehiclePrices[method]) || 0;
                return methodPrice > 0;
            };

            const stockEnabled = this.selectedVehicle.stockEnabled || false;
            const currentStock = stockEnabled ? (this.selectedVehicle.stock || 0) : null;
            const isOutOfStock = stockEnabled && currentStock <= 0;

            const validCashPayment = isPaymentMethodValid('cash') && !isOutOfStock;
            const validBankPayment = isPaymentMethodValid('bank') && !isOutOfStock;
            const validXPPayment = isPaymentMethodValid('xp') && !isOutOfStock;
            const validCompanyPayment = isPaymentMethodValid('company') && !isOutOfStock;


            const onlyXPPayment = validXPPayment && !validCashPayment && !validBankPayment;
            const showFinancing = hasFinancing && !onlyXPPayment && (validCashPayment || validBankPayment);

            let paymentMethodsHTML = '';

            if (validCashPayment) {
                const cashPrice = parseInt(vehiclePrices.cash) || vehiclePrice || 0;
                paymentMethodsHTML += `
                <button class="payment-method-btn cash" onclick="app.purchaseVehicle('cash')">
                    <div class="payment-icon">
                        <i data-lucide="banknote"></i>
                    </div>
                    <div class="payment-info">
                        <span class="payment-name">${this.T('ui.payment_methods.cash')}</span>
                        <span class="payment-desc">$${cashPrice.toLocaleString()}</span>
                    </div>
                </button>
            `;
            }

            if (validBankPayment) {
                const bankPrice = parseInt(vehiclePrices.bank) || vehiclePrice || 0;
                paymentMethodsHTML += `
                <button class="payment-method-btn bank" onclick="app.purchaseVehicle('bank')">
                    <div class="payment-icon">
                        <i data-lucide="building-2"></i>
                    </div>
                    <div class="payment-info">
                        <span class="payment-name">${this.T('ui.payment_methods.bank_transfer')}</span>
                        <span class="payment-desc">$${bankPrice.toLocaleString()}</span>
                    </div>
                </button>
            `;
            }

            if (validXPPayment) {
                const xpPrice = parseInt(vehiclePrices.xp) || vehicleXP || 0;
                paymentMethodsHTML += `
                <button class="payment-method-btn xp" onclick="app.purchaseVehicle('xp')">
                    <div class="payment-icon">
                        <i data-lucide="star"></i>
                    </div>
                    <div class="payment-info">
                        <span class="payment-name">${this.T('ui.payment_methods.experience')}</span>
                        <span class="payment-desc">${xpPrice} VIP</span>
                    </div>
                </button>
            `;
            }

            if (showFinancing) {
                paymentMethodsHTML += `
                <button class="payment-method-btn financing" onclick="app.showFinancingModal()">
                    <div class="payment-icon">
                        <i data-lucide="calendar-days"></i>
                    </div>
                    <div class="payment-info">
                        <span class="payment-name">${this.T('ui.payment_methods.financing')}</span>
                        <span class="payment-desc">${this.T('ui.payment_methods.monthly_payments')}</span>
                    </div>
                </button>
            `;
            }

            if (isPaymentMethodValid('company')) {
                const companyPrice = parseInt(vehiclePrices.company) || vehiclePrice || 0;
                paymentMethodsHTML += `
                <button class="payment-method-btn company" onclick="app.purchaseVehicle('company')">
                    <div class="payment-icon">
                        <i data-lucide="building"></i>
                    </div>
                    <div class="payment-info">
                        <span class="payment-name">${this.T('ui.payment_methods.company')}</span>
                        <span class="payment-desc">$${companyPrice.toLocaleString()}</span>
                    </div>
                </button>
            `;
            }

            this.OpenModal(this.T('ui.payment_methods.purchase_vehicle'),
                `
            <div class="purchase-modal-container">
                <!-- Sección de información del vehículo -->
                <div class="vehicle-info-section">
                    <div class="vehicle-header">
                        <div class="vehicle-icon">
                            <i data-lucide="car"></i>
                        </div>
                        <div class="vehicle-details">
                            <h3 class="vehicle-name">${this.currentVehicleLabel}</h3>
                            <p class="vehicle-model">${this.selectedVehicle ? this.selectedVehicle.model : ''}</p>
                            <div class="vehicle-price">
                                ${this.getVehiclePriceDisplay(validCashPayment, validBankPayment, validXPPayment, validCompanyPayment, vehiclePrices)}
                            </div>
                            ${stockEnabled ? `
                                <div class="vehicle-stock ${isOutOfStock ? 'out-of-stock' : 'in-stock'}">
                                    <i data-lucide="${isOutOfStock ? 'x-circle' : 'package'}"></i>
                                    <span>${isOutOfStock ? this.T('ui.payment_methods.out_of_stock') : `${this.T('ui.payment_methods.stock_label')} ${currentStock}`}</span>
                                </div>
                            ` : ''}
                        </div>
                    </div>
                </div>

                <!-- Sección de métodos de pago -->
                <div class="payment-section">
                    <div class="section-title">
                        <i data-lucide="credit-card"></i>
                        <span>${this.T('ui.payment_methods.available_payment_methods')}</span>
                    </div>
                    <div class="payment-methods-grid">
                        ${paymentMethodsHTML || (isOutOfStock ?
                    `<div class="no-payment-methods">
                                <i data-lucide="x-circle"></i>
                                <span>${this.T('ui.payment_methods.vehicle_no_stock')}</span>
                            </div>` :
                    `<div class="no-payment-methods">
                                <i data-lucide="alert-circle"></i>
                                <span>${this.T('ui.payment_methods.no_payment_methods')}</span>
                            </div>`
                )}
                    </div>
                </div>
            </div>
            `,
                ``,
                'Cancelar',
                65,
            )

            setTimeout(() => {
                if (typeof lucide !== 'undefined') {
                    lucide.createIcons();
                }
            }, 100);
        },

        getVehiclePriceDisplay(validCash, validBank, validXP, validCompany, prices) {
            const availablePrices = [];

            if (validCash) {
                const cashPrice = parseInt(prices.cash) || 0;
                if (cashPrice > 0) {
                    availablePrices.push(`$${cashPrice.toLocaleString()}`);
                }
            }

            if (validXP) {
                const xpPrice = parseInt(prices.xp) || 0;
                if (xpPrice > 0) {
                    availablePrices.push(`${xpPrice} VIP`);
                }
            }

            if (validCompany) {
                const companyPrice = parseInt(prices.company) || 0;
                if (companyPrice > 0) {
                    availablePrices.push(`$${companyPrice.toLocaleString()} (${this.T('ui.payment_methods.company')})`);
                }
            }

            if (availablePrices.length === 0) {
                return this.T('ui.payment_methods.not_available');
            } else if (availablePrices.length === 1) {
                return availablePrices[0];
            } else {
                return availablePrices.join(' / ');
            }
        },

        showFinancingModal() {
            const timeUnit = this.financingConfig.timeUnit;
            const maxPeriods = this.financingConfig.maxPeriods;
            const interestRate = this.financingConfig.interestRate;
            const vehiclePrice = this.currentVehiclePrice;

            this.financingModal.vehicleName = this.currentVehicleLabel;
            this.financingModal.vehiclePrice = vehiclePrice;
            this.financingModal.selectedOption = null;
            this.financingModal.options = [];

            for (let i = 1; i <= maxPeriods; i++) {
                const totalInterestRate = interestRate * i;
                const totalWithInterest = vehiclePrice + (vehiclePrice * totalInterestRate / 100);
                const monthlyPayment = totalWithInterest / i;

                this.financingModal.options.push({
                    period: i,
                    timeUnit: timeUnit,
                    monthlyPayment: Math.round(monthlyPayment),
                    totalAmount: Math.round(totalWithInterest),
                    interestRate: totalInterestRate
                });
            }

            this.financingModal.visible = true;

            this.addEscapeListener();

            this.$nextTick(() => {
                if (typeof lucide !== 'undefined') {
                    lucide.createIcons();
                }
            });
        },

        selectFinancingOption(index) {
            this.financingModal.selectedOption = index;
        }, closeFinancingModal() {
            this.financingModal.visible = false;
            this.financingModal.selectedOption = null;
            if (this.handleEscape) {
                document.removeEventListener('keydown', this.handleEscape);
                this.handleEscape = null;
            }
        }, confirmFinancingPurchase() {
            if (this.financingModal.selectedOption === null) {
                return;
            }

            const selectedOption = this.financingModal.options[this.financingModal.selectedOption];

            let firstColor = $('.coloris.instance2').val() || '#ff6b00';
            let secondaryColor = $('.coloris.instance3').val() || '#ff6b00';
            const rgbMatch = firstColor && typeof firstColor === 'string' ? firstColor.match(/rgb\((\d+),\s*(\d+),\s*(\d+)\)/) : null;
            const rgbMatch2 = secondaryColor && typeof secondaryColor === 'string' ? secondaryColor.match(/rgb\((\d+),\s*(\d+),\s*(\d+)\)/) : null;

            if (firstColor && typeof firstColor === 'string' && firstColor.startsWith('#')) {
                const hex = firstColor.replace('#', '');
                const r = parseInt(hex.substring(0, 2), 16);
                const g = parseInt(hex.substring(2, 4), 16);
                const b = parseInt(hex.substring(4, 6), 16);
                firstColor = { r, g, b };
            } else {
                if (rgbMatch) {
                    const r = parseInt(rgbMatch[1]);
                    const g = parseInt(rgbMatch[2]);
                    const b = parseInt(rgbMatch[3]);
                    firstColor = { r, g, b };
                }
            }

            if (secondaryColor && typeof secondaryColor === 'string' && secondaryColor.startsWith('#')) {
                const hex = secondaryColor.replace('#', '');
                const r = parseInt(hex.substring(0, 2), 16);
                const g = parseInt(hex.substring(2, 4), 16);
                const b = parseInt(hex.substring(4, 6), 16);
                secondaryColor = { r, g, b };
            } else {
                if (rgbMatch2) {
                    const r = parseInt(rgbMatch2[1]);
                    const g = parseInt(rgbMatch2[2]);
                    const b = parseInt(rgbMatch2[3]);
                    secondaryColor = { r, g, b };
                }
            }

            this.fetchEvent('financing:financeVehicle', {
                vehicle: this.selectedVehicle,
                periods: selectedOption.period,
                dealershipId: this.dealershipInfo.id,
                firstColor: firstColor,
                secondaryColor: secondaryColor,
                monthlyPayment: selectedOption.monthlyPayment,
                totalAmount: selectedOption.totalAmount,
                interestRate: selectedOption.interestRate
            }).then(data => {
                if (data.success) {
                    this.CloseModal()
                    this.closeDealershipMenu();
                } else {
                    this.CloseModal()
                }
            });
            this.closeFinancingModal();
        },

        confirmFinancing() {
            this.confirmFinancingPurchase();
        },

        showAddVehicleModal() {

            if (!this.adminPanel.visible || !this.adminPanel.dealershipManagement.selectedDealership) {
                return;
            }
            this.addVehicleModal.visible = true;
            this.addVehicleModal.searchQuery = '';
            this.addVehicleModal.form = {
                category: '',
                model: '',
                label: '',
                price: 0,
                xp: 0,
                image: '',
                class: 'A',
                financing: false,
                paymentMethods: {
                    cash: false,
                    bank: false,
                    xp: false
                },
                prices: {
                    cash: 0,
                    bank: 0,
                    xp: 0
                },
                stockEnabled: false,
                stock: 10
            };
            this.addVehicleModal.selectedVehicle = null;
        }, closeAddVehicleModal() {
            this.addVehicleModal.visible = false;
            this.addVehicleModal.isEditing = false;
            this.addVehicleModal.editingVehicle = null;
            this.currentEditingVehicle = null;
            this.currentEditingCategory = null;
        },

        getCurrentDealershipStock() {
            const dealership = this.getDealershipById(this.adminPanel.dealershipManagement.selectedDealership);
            return dealership ? dealership.stock : {};
        },

        selectDefaultVehicle(vehicle) {
            this.addVehicleModal.selectedVehicle = vehicle.model;
            this.addVehicleModal.form.model = vehicle.model;
            this.addVehicleModal.form.label = vehicle.label;
            this.addVehicleModal.form.image = this.getVehicleImageUrl(vehicle.model);
        }, handleVehicleImageError(event) {
            const defaultImage = 'assets/vehicles/default.png';
            if (event.target.src.includes(defaultImage)) return;
            event.target.src = defaultImage;
        }, confirmAddVehicle() {
            if (!this.isAddVehicleFormValid) {
                return;
            }

            const form = this.addVehicleModal.form;

            if (this.addVehicleModal.isEditing) {
                this.updateVehicle(form);
            } else {
                this.addNewVehicle(form);
                this.closeAddVehicleModal();
            }
        },

        addNewVehicle(form) {
            const mockModal = {
                querySelector: (selector) => {
                    const mockElement = { value: '' };
                    switch (selector) {
                        case 'select.select_label':
                            mockElement.value = form.category;
                            break;
                        case 'input.vehicle_label':
                            mockElement.value = form.model;
                            break;
                        case 'input.vehicle_model':
                            mockElement.value = form.label;
                            break;
                        case 'input.vehicle_price':
                            mockElement.value = form.price;
                            break;
                        case 'input.vehicle_xp':
                            mockElement.value = form.xp;
                            break;
                        case 'input.vehicle_image':
                            mockElement.value = form.image;
                            break;
                        case 'select.select_label:last-of-type':
                            mockElement.value = form.class;
                            break;
                        case 'input.financing-checkbox':
                            mockElement.checked = form.financing;
                            break;
                    }
                    return mockElement;
                }
            };

            const originalQuerySelector = document.querySelector;
            document.querySelector = (selector) => {
                if (selector === '.c-modal:last-child') {
                    return mockModal;
                }
                return originalQuerySelector.call(document, selector);
            };

            try {
                this.AddVehicle();
            } finally {
                document.querySelector = originalQuerySelector;
            }
        },

        updateVehicle(form) {
            const cashEnabled = form.paymentMethods?.cash || false;
            const xpEnabled = form.paymentMethods?.xp || false;
            const cashPrice = parseInt(form.prices?.cash) || 0;
            const xpPrice = parseInt(form.prices?.xp) || 0;

            const paymentMethods = {
                cash: cashEnabled,
                bank: cashEnabled,
                xp: xpEnabled,
                company: form.paymentMethods?.company || false
            };

            const prices = {
                cash: cashPrice,
                bank: cashPrice,
                xp: xpPrice,
                company: parseInt(form.prices?.company) || 0
            };

            const stockEnabled = form.stockEnabled || false;
            const stockAmount = stockEnabled ? parseInt(form.stock) || 0 : null;

            const finalImage = form.image && form.image.trim() !== ''
                ? form.image.trim()
                : `./assets/vehicles/default.png`;

            const updatedVehicleData = {
                category: form.category,
                model: form.model.trim(),
                label: form.label.trim(),
                price: cashEnabled ? cashPrice : 0,
                xp: xpEnabled ? xpPrice : 0,
                image: finalImage,
                class: form.class,
                financing: form.financing,
                paymentMethods: paymentMethods,
                prices: prices,
                stockEnabled: stockEnabled,
                stock: stockAmount
            };

            this.updateVehicleInStock(this.addVehicleModal.editingVehicle, updatedVehicleData, this.currentEditingCategory);
        }, addEscapeListener() {
            const handleEscape = (event) => {
                if (event.key === 'Escape') {
                    if (this.financingModal.visible) {
                        this.closeFinancingModal();
                    }
                }
            };

            this.handleEscape = handleEscape;
            document.addEventListener('keydown', handleEscape);
        },

        getTimeUnitText(timeUnit, count) {
            if (timeUnit === 'weeks') {
                return count === 1 ? this.T('ui.admin_panel.week') : this.T('ui.admin_panel.weeks');
            } else if (timeUnit === 'months') {
                return count === 1 ? this.T('ui.admin_panel.month') : this.T('ui.admin_panel.months');
            } else {
                return count === 1 ? this.T('ui.admin_panel.day') : this.T('ui.admin_panel.days');
            }
        },


        purchaseVehicle(method) {
            let vehicleModel = this.selectedVehicle.model;
            let vehicleLabel = this.currentVehicleLabel;

            // Obtener colores seleccionados desde el estado de Vue
            let firstColor = this.dealershipMenu.primaryColor || '#ff6b00';
            let secondaryColor = this.dealershipMenu.secondaryColor || '#ff6b00';

            console.log("[Dealership] Color primario seleccionado:", firstColor);
            console.log("[Dealership] Color secundario seleccionado:", secondaryColor);


            const rgbMatch = firstColor && typeof firstColor === 'string' ? firstColor.match(/rgb\((\d+),\s*(\d+),\s*(\d+)\)/) : null;
            const rgbMatch2 = secondaryColor && typeof secondaryColor === 'string' ? secondaryColor.match(/rgb\((\d+),\s*(\d+),\s*(\d+)\)/) : null;

            if (!vehicleModel || !vehicleLabel) {
                return;
            }

            this.fetchEvent('close', { silent: true });
            if (firstColor && typeof firstColor === 'string' && firstColor.startsWith('#')) {
                const hex = firstColor.replace('#', '');
                const r = parseInt(hex.substring(0, 2), 16);
                const g = parseInt(hex.substring(2, 4), 16);
                const b = parseInt(hex.substring(4, 6), 16);
                firstColor = { r, g, b };

            } else {
                if (rgbMatch) {
                    const r = parseInt(rgbMatch[1]);
                    const g = parseInt(rgbMatch[2]);
                    const b = parseInt(rgbMatch[3]);
                    firstColor = { r, g, b };
                }
            }

            if (secondaryColor && typeof secondaryColor === 'string' && secondaryColor.startsWith('#')) {
                const hex = secondaryColor.replace('#', '');
                const r = parseInt(hex.substring(0, 2), 16);
                const g = parseInt(hex.substring(2, 4), 16);
                const b = parseInt(hex.substring(4, 6), 16);
                secondaryColor = { r, g, b };
            } else {
                if (rgbMatch2) {
                    const r = parseInt(rgbMatch2[1]);
                    const g = parseInt(rgbMatch2[2]);
                    const b = parseInt(rgbMatch2[3]);
                    secondaryColor = { r, g, b };
                }
            }
            const vehicleXP = parseInt(this.selectedVehicle.xp) || 0;
            const vehiclePrice = parseInt(this.currentVehiclePrice) || 0;
            let price = 0;

            if (this.selectedVehicle.paymentMethods) {
                const vehiclePrices = this.selectedVehicle.prices || {
                    cash: vehiclePrice,
                    bank: vehiclePrice,
                    xp: vehicleXP
                };
                price = parseInt(vehiclePrices[method]) || 0;
            } else {
                price = method === 'xp' ? vehicleXP : vehiclePrice;
            }

            const vehicleData = {
                dealershipId: this.dealershipInfo.id,
                vehicleModel: vehicleModel,
                paymentMethod: method,
                price: price,
                primaryColor: firstColor,
                secondaryColor: secondaryColor
            };


            this.fetchEvent('mt-dealerships:ui:purchaseVehicle', vehicleData).then((result) => {
                this.CloseModal()
                if (!result.success) {
                    this.fetchEvent('maintainNuiFocus', {});
                    showNotification(result.message, 'error', 5000);

                    if (this.selectedVehicle) {
                        this.fetchEvent('mt-dealerships:ui:changeVehiclePreview', {
                            model: this.selectedVehicle.model,
                            zoom: this.cameraControls.zoom,
                            rotation: this.cameraControls.rotation
                        }).then((result) => {
                            this.loadingVehicleStats = true;
                            this.dealershipMenu.currentVehicleStats = null;
                            const start2 = Date.now();
                            this.dealershipMenu.currentVehicleStats = [
                                { label: 'Potencia', value: result.power },
                                { label: 'Velocidad punta', value: result.high_speed },
                                { label: 'Aceleración', value: result.acceleration * 100 },
                                { label: 'Frenado', value: result.braking * 100 }
                            ];
                            this.loadingVehicleStats = false;
                        });
                    }
                } else {
                    this.closeDealershipMenu();
                }
            })


        },

        testDriveVehicle() {
            if (!this.canTestDriveCurrent) {
                this.notify('error', 'La prueba de manejo esta desactivada para este coche de exhibicion');
                return;
            }

            this.stopTestDriveTimer();

            let vehicleModel = this.selectedVehicle.model;
            let vehicleLabel = this.currentVehicleLabel;

            if (!vehicleModel || !vehicleLabel) {
                return;
            }

            if (!this.dealershipInfo || !this.dealershipInfo.settings || !this.dealershipInfo.settings.allowTestDrive) {
                this.notify('error', this.T('ui.payment_methods.test_drive_not_allowed'));
                return;
            }

            // Obtener colores con validación
            let firstColor = $('.coloris.instance2').val() || '#000000';
            let secondaryColor = $('.coloris.instance3').val() || '#000000';

            // Colores configurados correctamente

            // Validar que los colores no sean null o undefined
            if (!firstColor || typeof firstColor !== 'string') {
                firstColor = '#000000';
            }
            if (!secondaryColor || typeof secondaryColor !== 'string') {
                secondaryColor = '#000000';
            }

            // Procesar primer color
            let processedFirstColor = { r: 0, g: 0, b: 0 };
            if (firstColor && typeof firstColor === 'string' && firstColor.startsWith('#')) {
                const hex = firstColor.replace('#', '');
                if (hex.length === 6) {
                    processedFirstColor = {
                        r: parseInt(hex.substring(0, 2), 16),
                        g: parseInt(hex.substring(2, 4), 16),
                        b: parseInt(hex.substring(4, 6), 16)
                    };
                }
            } else {
                const rgbMatch = firstColor && typeof firstColor === 'string' ? firstColor.match(/rgb\((\d+),\s*(\d+),\s*(\d+)\)/) : null;
                if (rgbMatch) {
                    processedFirstColor = {
                        r: parseInt(rgbMatch[1]),
                        g: parseInt(rgbMatch[2]),
                        b: parseInt(rgbMatch[3])
                    };
                }
            }

            // Procesar segundo color
            let processedSecondaryColor = { r: 0, g: 0, b: 0 };
            if (secondaryColor && typeof secondaryColor === 'string' && secondaryColor.startsWith('#')) {
                const hex = secondaryColor.replace('#', '');
                if (hex.length === 6) {
                    processedSecondaryColor = {
                        r: parseInt(hex.substring(0, 2), 16),
                        g: parseInt(hex.substring(2, 4), 16),
                        b: parseInt(hex.substring(4, 6), 16)
                    };
                }
            } else {
                const rgbMatch2 = secondaryColor && typeof secondaryColor === 'string' ? secondaryColor.match(/rgb\((\d+),\s*(\d+),\s*(\d+)\)/) : null;
                if (rgbMatch2) {
                    processedSecondaryColor = {
                        r: parseInt(rgbMatch2[1]),
                        g: parseInt(rgbMatch2[2]),
                        b: parseInt(rgbMatch2[3])
                    };
                }
            }


            this.CloseModal();
            this.fetchEvent('close', { silent: true });

            this.fetchEvent('mt-dealerships:ui:testDriveVehicle', {
                dealershipId: this.dealershipInfo.id,
                model: vehicleModel,
                label: vehicleLabel,
                firstColor: processedFirstColor,
                secondaryColor: processedSecondaryColor
            }).then((result) => {
                if (!result || !result.success) {
                    this.testDriving = false
                } else {
                    if (this.dealershipMenu.visible) {
                        this.dealershipMenu.visible = false
                    }
                    this.testDriving = true
                    this.CloseModal()
                    this.startTestDriveTimer(result.timer || 60000)
                }
            })

        },

        startTestDriveTimer(duration) {
            this.testDriveTimeRemaining = duration;
            this.testDriveTimer = setInterval(() => {
                this.testDriveTimeRemaining -= 1000;

                if (this.testDriveTimeRemaining <= 0) {
                    this.stopTestDriveTimer();
                    this.testDriving = false;
                }
            }, 1000);
        },

        stopTestDriveTimer() {
            if (this.testDriveTimer) {
                clearInterval(this.testDriveTimer);
                this.testDriveTimer = null;
            }
            this.testDriveTimeRemaining = 0;
        },

        resetNUIState() {
            if (this.modals && this.modals.length > 0) {
                this.CloseModal();
            }

            this.selectedVehicle = null;
            this.currentVehiclePrice = 0;
            this.currentVehicleFinancing = false;
            this.currentVehicleLabel = '';

            this.searchQuery = '';
            this.selectedCategory = 'all_categories';

            this.financingModal = {
                visible: false,
                vehicleName: '',
                vehiclePrice: 0,
                periods: 1,
                interestRate: 5.0,
                totalCost: 0,
                monthlyPayment: 0
            };

            this.currentEditingVehicle = null;
            this.currentEditingCategory = null;

            this.cameraControls = {
                zoom: 1.0,
                minZoom: 0.5,
                maxZoom: 3.0,
                rotation: 0,
                height: 1.0,
                minHeight: -2.0,
                maxHeight: 5.0,
                isDragging: false,
                lastX: 0,
                lastY: 0,
                sensitivity: 0.05,
                heightSensitivity: 0.02,
                autoRotateEnabled: true,
                autoRotateSpeed: 12.0,
                hasManualControl: false
            };

            setTimeout(() => {
                $('.c-modal').remove();
                $('.o-modal').hide();
                this.modals = [];

                $('.coloris').val('#000000');
                $('.coloris.instance2').val('#000000');
                $('.coloris.instance3').val('#000000');

                if (window.Coloris && typeof window.Coloris.close === 'function') {
                    window.Coloris.close();
                }

                $('.clr-picker').remove();
                $('.clr-overlay').remove();

            }, 100);

        },

        cleanupDOM() {
            $('.c-modal').remove();
            $('.o-modal').hide();
            $('.clr-picker').remove();
            $('.clr-overlay').remove();

            if (window.Coloris && typeof window.Coloris.close === 'function') {
                window.Coloris.close();
            }

            this.modals = [];

        },

        formatTimeRemaining(milliseconds) {
            if (milliseconds <= 0) return '00:00';

            const seconds = Math.floor(milliseconds / 1000);
            const minutes = Math.floor(seconds / 60);
            const remainingSeconds = seconds % 60;

            return `${minutes.toString().padStart(2, '0')}:${remainingSeconds.toString().padStart(2, '0')}`;
        },

        getTimerClass() {
            if (this.testDriveTimeRemaining <= 10000) {
                return 'danger';
            } else if (this.testDriveTimeRemaining <= 30000) {
                return 'warning';
            }
            return '';
        },

        dmSelectVehicle(vehicle) {
            if (vehicle.model == (this.selectedVehicle ? this.selectedVehicle.model : null)) {
                return
            };

            if (vehicle.stockEnabled && vehicle.stock <= 0) {
                return;
            }

            // Mostrar cargando inmediatamente
            this.loadingVehicleStats = true;
            this.dealershipMenu.currentVehicleStats = null;

            // Resetear colores al cambiar de vehículo (se actualizarán con los reales al terminar la carga)
            this.dealershipMenu.primaryColor = '#000000';
            this.dealershipMenu.secondaryColor = '#000000';

            this.selectedVehicle = vehicle;
            this.currentVehicleLabel = vehicle.label
            this.currentVehiclePrice = vehicle.price || false;
            this.currentVehicleXP = vehicle.xp || false;
            this.currentVehicleFinancing = vehicle.financing || false;

            this.resetCameraControls();

            this.$nextTick(() => {
                this.initializeCameraControls();
                // Reinicializar Coloris para los nuevos elementos del color picker
                this.initializeColorPickers();
            });

            const requestModel = vehicle.model;
            this.fetchEvent('mt-dealerships:ui:changeVehiclePreview', {
                model: requestModel,
                zoom: this.cameraControls.zoom,
                rotation: this.cameraControls.rotation
            }).then((result) => {
                // Solo actualizar si el modelo sigue siendo el mismo (evitar race conditions)
                if (this.selectedVehicle && this.selectedVehicle.model === requestModel) {
                    this.dealershipMenu.currentVehicleStats = [
                        { label: 'Potencia', value: result.power },
                        { label: 'Velocidad punta', value: result.high_speed },
                        { label: 'Aceleración', value: result.acceleration * 100 },
                        { label: 'Frenado', value: result.braking * 100 }
                    ];

                    // Actualizar colores con los del vehículo real
                    if (result.colors) {
                        const p = result.colors.primary;
                        const s = result.colors.secondary;
                        
                        // Convertir RGB a Hex
                        const rgbToHex = (r, g, b) => {
                            return "#" + ((1 << 24) + (r << 16) + (g << 8) + b).toString(16).slice(1);
                        };

                        this.dealershipMenu.primaryColor = rgbToHex(p.r, p.g, p.b);
                        this.dealershipMenu.secondaryColor = rgbToHex(s.r, s.g, s.b);
                    }

                    this.loadingVehicleStats = false;
                    this.notifyPreviewReadyIfNeeded();
                }
            }).catch(() => {
                if (this.selectedVehicle && this.selectedVehicle.model === requestModel) {
                    this.loadingVehicleStats = false;
                }
            });
        },

        initializeCameraControls() {
            this.removeCameraControls();

            const scroller = document.querySelector('.vehicle-scroller');
            if (!scroller) return;

            scroller.style.position = 'fixed';
            scroller.style.top = '0';
            scroller.style.left = '0';
            scroller.style.width = '100vw';
            scroller.style.height = '100vh';
            scroller.style.zIndex = '1';
            scroller.style.pointerEvents = 'none';
            scroller.style.cursor = 'grab';

            this.boundHandleZoom = this.handleZoom.bind(this);
            this.boundHandleMouseDown = this.handleMouseDown.bind(this);
            this.boundHandleMouseMove = this.handleMouseMove.bind(this);
            this.boundHandleMouseUp = this.handleMouseUp.bind(this);
            this.boundHandleMouseHover = this.handleMouseHover.bind(this);

            document.addEventListener('wheel', this.boundHandleZoom, { passive: false });
            document.addEventListener('mousedown', this.boundHandleMouseDown);
            document.addEventListener('mousemove', this.boundHandleMouseMove);
            document.addEventListener('mouseup', this.boundHandleMouseUp);

            document.addEventListener('mousemove', this.boundHandleMouseHover);

            scroller.dataset.cameraControlsActive = 'true';
            this.startAutoRotate();
        },

        removeCameraControls() {
            const scroller = document.querySelector('.vehicle-scroller');
            this.stopAutoRotate();

            if (this.boundHandleZoom) {
                document.removeEventListener('wheel', this.boundHandleZoom);
            }
            if (this.boundHandleMouseDown) {
                document.removeEventListener('mousedown', this.boundHandleMouseDown);
            }
            if (this.boundHandleMouseMove) {
                document.removeEventListener('mousemove', this.boundHandleMouseMove);
            }
            if (this.boundHandleMouseUp) {
                document.removeEventListener('mouseup', this.boundHandleMouseUp);
            }
            if (this.boundHandleMouseHover) {
                document.removeEventListener('mousemove', this.boundHandleMouseHover);
            }

            if (scroller) {
                scroller.dataset.cameraControlsActive = 'false';
            }
        },

        startAutoRotate() {
            this.stopAutoRotate();

            if (!this.dealershipMenu.visible || !this.cameraControls.autoRotateEnabled) return;

            let lastTs = performance.now();
            let lastSyncTs = 0;

            const tick = (ts) => {
                if (!this.dealershipMenu.visible || !this.cameraControls.autoRotateEnabled) {
                    this.stopAutoRotate();
                    return;
                }

                const deltaSeconds = (ts - lastTs) / 1000;
                lastTs = ts;

                if (!this.cameraControls.isDragging) {
                    this.cameraControls.rotation =
                        (this.cameraControls.rotation - (this.cameraControls.autoRotateSpeed * deltaSeconds)) % 360;
                    if (this.cameraControls.rotation < 0) this.cameraControls.rotation += 360;

                    if ((ts - lastSyncTs) >= 80) {
                        this.fetchEvent('mt-dealerships:ui:updateCameraControls', {
                            zoom: this.cameraControls.zoom,
                            rotation: this.cameraControls.rotation,
                            height: this.cameraControls.height,
                            speed: 0.05
                        }).catch(() => { });
                        lastSyncTs = ts;
                    }
                }

                this.autoRotateFrameId = requestAnimationFrame(tick);
            };

            this.autoRotateFrameId = requestAnimationFrame(tick);
        },

        stopAutoRotate() {
            if (this.autoRotateFrameId) {
                cancelAnimationFrame(this.autoRotateFrameId);
                this.autoRotateFrameId = null;
            }
        },

        disableAutoRotateByUser() {
            if (!this.cameraControls.autoRotateEnabled) return;
            this.cameraControls.autoRotateEnabled = false;
            this.cameraControls.hasManualControl = true;
            this.stopAutoRotate();
        },

        notifyPreviewReadyIfNeeded() {
            if (!this.previewEntryPending) return;
            this.previewEntryPending = false;
            this.fetchEvent('mt-dealerships:ui:previewReady', {});
        },

        closeDealershipMenu() {
            if (this.dealershipMenu.visible) {
                this.saveDealerState();

                this.dealershipMenu.visible = false;
                this.removeCameraControls();
                document.body.style.cursor = '';
                this.cameraControls.isDragging = false;
                this.resetCameraControls();
            }
        },


        isInteractiveElement(element) {
            if (!element) return false;

            let currentElement = element;
            while (currentElement && currentElement !== document.body) {
                if (['BUTTON', 'INPUT', 'SELECT', 'TEXTAREA', 'A'].includes(currentElement.tagName)) {
                    return true;
                }

                const classList = currentElement.classList;
                if (classList.contains('btn') ||
                    classList.contains('category') ||
                    classList.contains('vehicle-card') ||
                    classList.contains('action-btn') ||
                    classList.contains('color-picker') ||
                    classList.contains('dealership-tab-item') ||
                    classList.contains('vehicle-categories')) {
                    return true;
                }

                if (currentElement.hasAttribute('onclick') ||
                    currentElement.hasAttribute('@click') ||
                    currentElement.style.cursor === 'pointer') {
                    return true;
                }

                if (classList.contains('dealership-container') ||
                    classList.contains('vehicle-scroller')) {
                    return false;
                }

                currentElement = currentElement.parentElement;
            }

            return false;
        },

        handleZoom(event) {
            if (!this.dealershipMenu.visible) return;

            if (this.isInteractiveElement(event.target)) {
                return;
            }

            event.preventDefault();
            event.stopPropagation();
            this.disableAutoRotateByUser();

            const delta = event.deltaY;
            const zoomSpeed = 0.1;

            if (delta < 0) {
                this.cameraControls.zoom = Math.min(
                    this.cameraControls.maxZoom,
                    this.cameraControls.zoom + zoomSpeed
                );
            } else {
                this.cameraControls.zoom = Math.max(
                    this.cameraControls.minZoom,
                    this.cameraControls.zoom - zoomSpeed
                );
            }

            this.updateCamera();
        },

        handleMouseDown(event) {
            if (!this.dealershipMenu.visible) return;

            if (event.button !== 0) return;

            if (this.isInteractiveElement(event.target)) {
                return;
            }

            this.disableAutoRotateByUser();
            this.cameraControls.isDragging = true;
            this.cameraControls.lastX = event.clientX;
            this.cameraControls.lastY = event.clientY;

            document.body.style.cursor = 'grabbing';

            event.preventDefault();
            event.stopPropagation();
        },

        handleMouseMove(event) {
            if (!this.cameraControls.isDragging) return;

            const deltaX = event.clientX - this.cameraControls.lastX;
            const deltaY = event.clientY - this.cameraControls.lastY;

            this.cameraControls.rotation += deltaX * this.cameraControls.sensitivity;

            this.cameraControls.height = Math.max(this.cameraControls.minHeight,
                Math.min(this.cameraControls.maxHeight, this.cameraControls.height));

            if (this.cameraControls.rotation > 360) {
                this.cameraControls.rotation -= 360;
            } else if (this.cameraControls.rotation < 0) {
                this.cameraControls.rotation += 360;
            }

            this.cameraControls.lastX = event.clientX;
            this.cameraControls.lastY = event.clientY;

            this.fetchEvent('mt-dealerships:ui:updateCameraControls', {
                zoom: this.cameraControls.zoom,
                rotation: this.cameraControls.rotation,
                height: this.cameraControls.height,
                speed: 0.15
            }).catch(error => {
            });

            event.preventDefault();
            event.stopPropagation();
        },

        handleMouseUp() {
            if (this.cameraControls.isDragging) {
                this.cameraControls.isDragging = false;

                document.body.style.cursor = '';
            }
        },

        handleMouseHover(event) {
            if (!this.dealershipMenu.visible) return;

            if (this.cameraControls.isDragging) return;

            if (this.isInteractiveElement(event.target)) {
                document.body.style.cursor = '';
            } else {
                document.body.style.cursor = 'grab';
            }
        },

        updateCamera() {
            if (this.cameraUpdateThrottle) {
                clearTimeout(this.cameraUpdateThrottle);
            }

            this.cameraUpdateThrottle = setTimeout(() => {
                this.fetchEvent('mt-dealerships:ui:updateCameraControls', {
                    zoom: this.cameraControls.zoom,
                    rotation: this.cameraControls.rotation,
                    speed: 0.08
                }).catch(error => {
                });
            }, 16);
        },

        resetCameraControls() {
            this.cameraControls.zoom = 1.0;
            this.cameraControls.rotation = 0;
            this.cameraControls.height = 1.5;
            this.cameraControls.autoRotateEnabled = true;
            this.cameraControls.hasManualControl = false;
            if (this.dealershipMenu.visible) {
                this.startAutoRotate();
            }
        },

        selectVehicle(vehicle) {
        },

        formatPrice(price) {
            return price.toLocaleString();
        },

        getVehicleListPrice(vehicle) {
            const hasPaymentMethods = vehicle.paymentMethods;
            const vehiclePrice = parseInt(vehicle.price) || 0;
            const vehicleXP = parseInt(vehicle.xp) || 0;

            const prices = [];

            if (hasPaymentMethods) {
                if (hasPaymentMethods.cash && vehiclePrice > 0) {
                    const cashPrice = parseInt(vehicle.prices?.cash) || vehiclePrice;
                    prices.push(`$${cashPrice.toLocaleString()}`);
                }
                if (hasPaymentMethods.xp && vehicleXP > 0) {
                    const xpPrice = parseInt(vehicle.prices?.xp) || vehicleXP;
                    prices.push(`${xpPrice} VIP`);
                }
                if (hasPaymentMethods.company) {
                    const companyPrice = parseInt(vehicle.prices?.company) || 0;
                    if (companyPrice > 0) {
                        prices.push(`$${companyPrice.toLocaleString()} (${this.T('ui.payment_methods.company')})`);
                    }
                }
            } else {
                if (vehiclePrice > 0) {
                    prices.push(`$${vehiclePrice.toLocaleString()}`);
                }
                if (vehicleXP > 0) {
                    prices.push(`${vehicleXP} VIP`);
                }
            }

            return prices.length > 0 ? prices.join(' / ') : 'N/A';
        },

        getVehicleImageUrl(vehicleModel, customImage = null) {
            if (customImage && customImage.trim() !== '' && customImage.trim() !== 'null') {
                return customImage.trim();
            }
            if (!vehicleModel || vehicleModel.trim() === '') {
                return './assets/vehicles/default.png';
            }
            return './assets/vehicles/default.png';
        },

        handleVehicleImageLoadError(event, vehicleModel) {
            const defaultImage = './assets/vehicles/default.png';
            
            // Prevent infinite loops if the default image also fails
            if (event.target.src.includes('default.png')) {
                event.target.src = 'data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7';
                return;
            }

            if (event.target.dataset.fallbackAttempted) {
                event.target.src = defaultImage;
                return;
            }

            const currentSrc = event.target.src;

            if (currentSrc.includes('docs.fivem.net')) {
                event.target.dataset.fallbackAttempted = 'true';
                event.target.src = defaultImage;
            } else {
                event.target.dataset.fallbackAttempted = 'true';
                event.target.src = defaultImage;
            }
        },

        handleImageError(event) {
            const defaultImage = './assets/vehicles/default.png';
            if (event.target.src.includes('default.png')) return;
            event.target.src = defaultImage;
        },

        OpenModal: function (title, content, footerButtons, closeText, width) {
            const id = this.modals.length + 1;
            this.modals.push(id);
            $('.modals').append(`
                <div class="c-modal fadeIn" data-id="${id}">
                    <div class="modal-block">
                        <div class="modal-content scale-in-2" style="width: ${width ? width + 'vh' : 'max-content'
                }">
                            <div class="modal-header">

                                <h2 class="title">${title}</h2>
                            </div>
                            <div class="modal-body">
                                ${content}
                            </div>
                            <div class="modal-footer">
                                ${footerButtons}
                                <button class="btn-cancel" onclick='app.CloseModal(${id})'>${closeText}</button>
                            </div>
                        </div>
                    </div>
                </div>
            `);

            // Inicializar color pickers después de agregar el modal al DOM
            this.$nextTick(() => {
                this.initializeColorPickers();
            });

            return id;
        },
        CloseModal: function (id) {
            if (!id) {
                $('.c-modal .modal-block .modal-content').removeClass('scale-in-2').addClass('scale-out-2');
                $('.c-modal').removeClass('fadeIn').fadeOut(500, function () {
                    $(this).remove();
                    $('.o-modal').hide()
                    app.modals = [];
                });

            } else {
                $(`.c-modal[data-id='${id}']`).find('.modal-content').removeClass('scale-in-2').addClass('scale-out-2');
                $(`.c-modal[data-id='${id}']`).removeClass('fadeIn').fadeOut(500, function () {
                    $(this).remove();
                    app.modals.splice(app.modals.findIndex((item) => item == id), 1);
                    if ($('.c-modal').length === 0) {
                        $('.o-modal').hide();
                        app.modals = [];
                    }
                });
            }
        },

        closeAdminMenu() {
            this.adminPanel.visible = false
            this.CloseModal()
            this.fetchEvent('close', { silent: true })
        },
        hideAdminForPlacement() {
            this.adminPanel.visible = false
            this.CloseModal()
        },

        getStageLabel(stage) {
            const labels = {
                'car_exhibitor': 'Exhibidor',
                'car_testdrive': 'Prueba de Manejo',
                'car_delivery': 'Entrega de Vehículo',
                'car_preview': 'Previsualizacion de vehiculo',
                'npc': 'NPC',
                'markers': 'Marcadores'
            };
            return labels[stage] || stage;
        },

        setCreatorTab(tabId) {
            this.creatorMode.tabs.forEach(tab => {
                tab.active = false;
            });

            const selectedTab = this.creatorMode.tabs.find(tab => tab.id === tabId);
            if (selectedTab) {
                selectedTab.active = true;
                this.creatorMode.activeTab = tabId;
                this.creatorMode.currentStage = tabId;

                this.fetchEvent('changeCreatorTab', { tab: tabId });
            }
        },

        getTabCounter(tabId) {
            const maxCounts = {
                'car_testdrive': 1,
                'car_delivery': 1,
                'car_preview': 1,
                'npcs': 1
            };

            const count = this.creatorMode.points[tabId] ? this.creatorMode.points[tabId].length : 0;
            const maxCount = maxCounts[tabId];

            return maxCount ? `${count}/${maxCount}` : count.toString();
        },

        getActiveTabLabel() {
            const activeTab = this.creatorMode.tabs.find(tab => tab.active);
            return activeTab ? activeTab.label : 'N/A';
        },

        formatCoords(point) {
            if (!point) return 'N/A';
            return `${Math.round(point.x)}, ${Math.round(point.y)}, ${Math.round(point.z)}`;
        },

        deleteCreatorPoint(type, index) {
            if (this.creatorMode.points[type] && this.creatorMode.points[type][index]) {
                this.creatorMode.points[type].splice(index, 1);

                this.fetchEvent('deleteCreatorPoint', {
                    type: type,
                    index: index
                });
            }
        },

        nextCreatorTab() {
            const currentIndex = this.creatorMode.tabs.findIndex(tab => tab.active);
            const nextIndex = (currentIndex + 1) % this.creatorMode.tabs.length;
            this.setCreatorTab(this.creatorMode.tabs[nextIndex].id);
        },

        previousCreatorTab() {
            const currentIndex = this.creatorMode.tabs.findIndex(tab => tab.active);
            const previousIndex = currentIndex === 0 ? this.creatorMode.tabs.length - 1 : currentIndex - 1;
            this.setCreatorTab(this.creatorMode.tabs[previousIndex].id);
        },

        editDealership(dealerId) {
            if (this.adminPanel.dealershipManagement.selectedDealership === dealerId) {
                this.adminPanel.dealershipManagement.selectedDealership = undefined;
                this.creatorMode.points = {
                    cars_exhibitor: [],
                    car_testdrive: [],
                    car_delivery: [],
                    car_preview: [],
                    npcs: [],
                    markers: []
                };
            } else {
                this.adminPanel.dealershipManagement.selectedDealership = dealerId;
                const dealership = this.getDealershipById(dealerId);
                if (dealership) {
                    this.creatorMode.points = {
                        cars_exhibitor: dealership.cars_exhibitor || [],
                        car_testdrive: dealership.car_testdrive || [],
                        car_delivery: dealership.car_delivery || [],
                        car_preview: dealership.car_preview || [],
                        npcs: dealership.npcs || [],
                        markers: dealership.markers || []
                    };

                    if (dealership.blipConfig) {
                        this.$set(dealership, 'blipConfig', {
                            sprite: parseInt(dealership.blipConfig.sprite) || 326,
                            color: parseInt(dealership.blipConfig.color) || 3,
                            scale: parseFloat(dealership.blipConfig.scale) || 0.8
                        });
                    } else {
                        this.$set(dealership, 'blipConfig', {
                            sprite: 326,
                            color: 3,
                            scale: 0.8
                        });
                    }
                }
            }
        },

        confirmDeleteDealership(dealership) {
            this.OpenModal(this.T('ui.admin.deleting') + ' ' + (dealership.name || dealership.id).toUpperCase(), `
                    <h2>${this.T('ui.admin.are_you_sure')} ${(dealership.name || dealership.id).toUpperCase()}?</h2>
                    <p>${this.T('ui.admin.this_will_permanently')}</p>
                
            `,
                `<button class="btn-modal" onclick="app.deleteDealershipConfirm('${dealership.id}')">${this.T('ui.admin.confirm')}</button>`,
                this.T('ui.admin.close'),
                50)
        },

        deleteDealership(dealership) {
            this.OpenModal(this.T('ui.admin.deleting') + ' ' + dealership.name, `
                    <h2> ${this.T('ui.admin.are_you_sure')} ${dealership.name}? </h2>
                    <p> ${this.T('ui.admin.this_will_permanently')} </p>
                
            `,
                `<button class="btn-modal" onclick="app.deleteDealershipConfirm('${dealership.id}')">${this.T('ui.admin.confirm')}</button>`,
                this.T('ui.admin.close'),
                50)
        },
        tpDealership(dealership) {
            let Dealership = this.getDealershipById(dealership);
            if (!Dealership) return;

            let decoords = null;
            
            // Try to find a valid coordinate from the new schema
            if (Dealership.npc && Dealership.npc.length > 0) {
                decoords = Dealership.npc[0];
            } else if (Dealership.exhibitor && Dealership.exhibitor.length > 0) {
                decoords = Dealership.exhibitor[0];
            } else if (Dealership.car_preview && Dealership.car_preview.length > 0) {
                decoords = Dealership.car_preview[0];
            } else if (Dealership.car_testdrive && Dealership.car_testdrive.length > 0) {
                decoords = Dealership.car_testdrive[0];
            } else if (Dealership.car_delivery && Dealership.car_delivery.length > 0) {
                decoords = Dealership.car_delivery[0];
            } else if (Dealership.coords) {
                decoords = Dealership.coords;
            }

            if (!decoords) {
                console.log("No valid coordinates found for dealership.");
                return;
            }

            this.fetchEvent('mt-dealerships:ui:teleport', {
                coords: decoords
            }).done((result) => {
            });
        },

        spawnVehicle(vehicle) {
            this.fetchEvent('mt-dealerships:ui:spawnVehicle', {
                vehicle: vehicle
            })
            this.closeAdminMenu()
        },

        deleteDealershipConfirm(dealership) {
            this.fetchEvent('mt-dealerships:ui:deleteDealership', {
                dealership: dealership
            })
                .then((result) => {
                    if (!result) {
                        return;
                    }

                    const dealerships = this.adminPanel.dealershipManagement.dealerships;
                    const index = dealerships.findIndex(d => d.id === dealership);

                    if (index !== -1) {
                        dealerships.splice(index, 1);
                    }

                    this.CloseModal();
                    this.adminPanel.dealershipManagement.selectedDealership = undefined;

                    this.fetchEvent('mt-dealerships:ui:forceUpdate', { autoUpdate: true });

                })
                .catch((error) => {
                });
        },

        Save(dealerId, showNotification = false) {
            console.log("[Dealership Debug] Starting Save process. DealerId:", dealerId);
            const dealerships = this.adminPanel.dealershipManagement.dealerships;
            console.log("[Dealership Debug] Number of dealerships to save:", dealerships.length);

            this.fetchEvent('mt-dealerships:ui:saveAll', {
                dealerId: dealerId ? dealerId : false,
                data: dealerships
            }).then((result) => {
                console.log("[Dealership Debug] Received result from server:", JSON.stringify(result));

                if (result === undefined || result === null) {
                    return;
                }

                if (typeof result !== 'object') {
                    return;
                }

                if (result && result.success) {
                    this.fetchEvent('mt-dealerships:ui:forceUpdate', { autoUpdate: true });
                    if (showNotification) {
                        this.notify('success', this.T('notifications.dealership_saved'));
                    }
                } else {
                    const errorMsg = result?.error || this.T('notifications.unknown_error');
                    this.notify('error', this.T('notifications.error_saving') + ': ' + errorMsg);
                }
            }).catch((error) => {
                this.notify('error', this.T('notifications.connection_error'));
            });
        },


        deleteVehicle(vehicle, vehicleID, categoryKey) {
            const dealership = this.getDealershipById(this.adminPanel.dealershipManagement.selectedDealership);
            this.OpenModal(this.T('ui.admin.deleting') + ' ' + vehicle.label, `
                    <h2> ${this.T('ui.admin.are_you_sure')} ${vehicle.label}? </h2>
                    <p> ${this.T('ui.admin.this_will_permanently')} </p>
                
            `,
                `<button class="btn-modal" onclick="app.deleteVehicleConfirm(${vehicleID}, '${categoryKey}','${dealership.id}' )">${this.T('ui.admin.confirm_spanish')}</button>`,
                this.T('ui.admin.close_spanish'),
                50)
        },

        deleteVehicleConfirm(vehicleID, categoryKey, dealershipId) {
            const dealership = this.getDealershipById(dealershipId || this.adminPanel.dealershipManagement.selectedDealership);

            if (!dealership || !dealership.stock) {
                return;
            }

            if (!dealership.stock[categoryKey]) {
                return;
            }

            if (!dealership.stock[categoryKey].categoryStock) {
                return;
            }

            if (typeof vehicleID === 'number' && vehicleID >= 0 && vehicleID < dealership.stock[categoryKey].categoryStock.length) {
                dealership.stock[categoryKey].categoryStock.splice(vehicleID, 1);

                if (dealership.stock[categoryKey].isFiltering && dealership.stock[categoryKey].filteredStock) {
                    this.$delete(dealership.stock[categoryKey], 'filteredStock');
                    this.$set(dealership.stock[categoryKey], 'isFiltering', false);
                }

                this.Save(null, true);
            } else {
            }

            this.CloseModal();
        },
        createDealership() {
            console.log("[Dealership Debug] Creating new dealership...");
            const uniqueId = 'dealership_' + Date.now();
            const newDealership = {
                id: uniqueId,
                name: this.T ? this.T('ui.admin.new_dealership') : 'New Dealership',
                description: '',
                coords: {
                    x: 0,
                    y: 0,
                    z: 0
                },
                car_delivery: [],
                car_preview: [],
                car_testdrive: [],
                cars_exhibitor: [],
                markers: [],
                npcs: [],
                stock: {
                    default_category: {
                        label: this.T ? this.T('ui.admin.default_category') : 'Default Category',
                        categoryStock: []
                    }
                },
                settings: {
                    allowFinancing: true,
                    allowTestDrive: true,
                    testDriveTime: 5,
                    allowCatalog: true
                },
                blipConfig: {
                    sprite: 326,
                    color: 3,
                    scale: 0.8
                }
            };
            this.adminPanel.dealershipManagement.dealerships.push(newDealership);
            this.adminPanel.dealershipManagement.selectedDealership = uniqueId;

            this.Save(null, false);

            this.$nextTick(() => {
                lucide.createIcons();
            });
        },

        saveDealershipInfo() {
            this.Save(null, true)
        },

        addNewCategory() {
            const dealership = this.getDealershipById(this.adminPanel.dealershipManagement.selectedDealership);

            const categoryKey = 'category_' + Date.now();

            this.$set(dealership.stock, categoryKey, {
                label: this.T ? this.T('ui.admin.new_category') : 'New Category',
                categoryStock: [],
                job: ''
            });


            this.Save(null, true);
        },

        deleteCategory(categoryKey) {
            const dealership = this.getDealershipById(this.adminPanel.dealershipManagement.selectedDealership);
            this.$delete(dealership.stock, categoryKey);

            this.Save(null, true);
        },

        editVehicle(vehicle, categoryKey) {

            this.currentEditingVehicle = vehicle;
            this.currentEditingCategory = categoryKey;

            const cashPrice = vehicle.prices?.cash || vehicle.price || 0;
            const xpPrice = vehicle.prices?.xp || parseInt(vehicle.xp) || 0;
            const companyPrice = vehicle.prices?.company || 0;

            this.addVehicleModal.form = {
                category: categoryKey,
                model: vehicle.model,
                label: vehicle.label,
                price: vehicle.price,
                xp: vehicle.xp,
                image: vehicle.img,
                class: vehicle.class,
                financing: vehicle.financing,
                paymentMethods: {
                    cash: vehicle.paymentMethods?.cash || false,
                    bank: false,
                    xp: vehicle.paymentMethods?.xp || false,
                    company: vehicle.paymentMethods?.company || false
                },
                prices: {
                    cash: cashPrice,
                    bank: 0,
                    xp: xpPrice,
                    company: companyPrice
                },
                stockEnabled: vehicle.stockEnabled || false,
                stock: vehicle.stock || 10
            };

            this.addVehicleModal.isEditing = true;
            this.addVehicleModal.editingVehicle = vehicle;
            this.addVehicleModal.visible = true;
        },

        AddVehicle() {
            const category = this.addVehicleModal.form.category;

            const vehicleModel = this.addVehicleModal.form.model;
            const vehicleLabel = this.addVehicleModal.form.label;
            const vehiclePrice = parseFloat(this.addVehicleModal.form.price) || 0;
            const vehicleXP = parseFloat(this.addVehicleModal.form.xp) || 0;
            const vehicleImage = this.addVehicleModal.form.image;
            const vehicleClass = this.addVehicleModal.form.class;
            const financingEnabled = this.addVehicleModal.form.financing;
            const cashEnabled = this.addVehicleModal.form.paymentMethods?.cash || false;
            const xpEnabled = this.addVehicleModal.form.paymentMethods?.xp || false;
            const cashPrice = parseInt(this.addVehicleModal.form.prices?.cash) || 0;
            const xpPrice = parseInt(this.addVehicleModal.form.prices?.xp) || 0;

            const paymentMethods = {
                cash: cashEnabled,
                bank: cashEnabled,
                xp: xpEnabled,
                company: this.addVehicleModal.form.paymentMethods?.company || false
            };

            const prices = {
                cash: cashPrice,
                bank: cashPrice,
                xp: xpPrice,
                company: parseInt(this.addVehicleModal.form.prices?.company) || 0
            };

            const stockEnabled = this.addVehicleModal.form.stockEnabled || false;
            const stockAmount = stockEnabled ? parseInt(this.addVehicleModal.form.stock) || 0 : null;

            if (!vehicleModel || !vehicleModel.trim()) {
                return;
            }

            if (!vehicleLabel || !vehicleLabel.trim()) {
                return;
            }

            const finalImage = vehicleImage && vehicleImage.trim() !== ''
                ? vehicleImage.trim()
                : `./assets/vehicles/default.png`;

            const vehicleData = {
                category: category,
                model: vehicleModel.trim(),
                label: vehicleLabel.trim(),
                price: cashEnabled ? cashPrice : 0,
                xp: xpEnabled ? xpPrice : 0,
                image: finalImage,
                class: vehicleClass,
                financing: financingEnabled,
                paymentMethods: paymentMethods,
                prices: prices,
                stockEnabled: stockEnabled,
                stock: stockAmount
            };

            this.saveVehicleToStock(vehicleData);
        },

        saveVehicleToStock(vehicleData) {
            const dealership = this.getDealershipById(this.adminPanel.dealershipManagement.selectedDealership);

            if (!dealership || !dealership.stock) {
                return;
            }

            if (!dealership.stock[vehicleData.category]) {
                return;
            }

            const newVehicle = {
                label: vehicleData.label,
                model: vehicleData.model,
                img: vehicleData.image,
                stock: vehicleData.stockEnabled ? vehicleData.stock : null,
                stockEnabled: vehicleData.stockEnabled || false,
                price: vehicleData.price,
                xp: vehicleData.xp,
                class: vehicleData.class,
                financing: vehicleData.financing || false,
                paymentMethods: vehicleData.paymentMethods || { cash: false, bank: false, xp: false, company: false },
                prices: vehicleData.prices || { cash: 0, bank: 0, xp: 0, company: 0 }
            };

            if (!dealership.stock[vehicleData.category].categoryStock) {
                this.$set(dealership.stock[vehicleData.category], 'categoryStock', []);
            }

            dealership.stock[vehicleData.category].categoryStock.push(newVehicle);

            this.CloseModal();

            this.Save(null, true)
        },

        updateVehicleInStock(originalVehicle, updatedVehicleData, originalCategory) {
            const dealership = this.getDealershipById(this.adminPanel.dealershipManagement.selectedDealership);

            if (!dealership || !dealership.stock) {
                return;
            }

            if (originalCategory !== updatedVehicleData.category) {
                if (dealership.stock[originalCategory] && dealership.stock[originalCategory].categoryStock) {
                    const originalIndex = dealership.stock[originalCategory].categoryStock.findIndex(v =>
                        v.model === originalVehicle.model && v.label === originalVehicle.label
                    );

                    if (originalIndex !== -1) {
                        dealership.stock[originalCategory].categoryStock.splice(originalIndex, 1);
                    }
                }

                if (!dealership.stock[updatedVehicleData.category]) {
                    return;
                }

                if (!dealership.stock[updatedVehicleData.category].categoryStock) {
                    this.$set(dealership.stock[updatedVehicleData.category], 'categoryStock', []);
                }

                const newVehicle = {
                    label: updatedVehicleData.label,
                    model: updatedVehicleData.model,
                    img: updatedVehicleData.image,
                    stock: updatedVehicleData.stockEnabled ? updatedVehicleData.stock : (originalVehicle.stockEnabled ? originalVehicle.stock : null),
                    stockEnabled: updatedVehicleData.stockEnabled || false,
                    price: updatedVehicleData.price,
                    xp: updatedVehicleData.xp,
                    class: updatedVehicleData.class,
                    financing: updatedVehicleData.financing || false,
                    paymentMethods: updatedVehicleData.paymentMethods || { cash: false, bank: false, xp: false },
                    prices: updatedVehicleData.prices || { cash: 0, bank: 0, xp: 0 }
                };

                dealership.stock[updatedVehicleData.category].categoryStock.push(newVehicle);

            } else {
                if (dealership.stock[originalCategory] && dealership.stock[originalCategory].categoryStock) {
                    const vehicleIndex = dealership.stock[originalCategory].categoryStock.findIndex(v =>
                        v.model === originalVehicle.model && v.label === originalVehicle.label
                    );

                    if (vehicleIndex !== -1) {
                        const updatedVehicle = {
                            label: updatedVehicleData.label,
                            model: updatedVehicleData.model,
                            img: updatedVehicleData.image,
                            stock: updatedVehicleData.stockEnabled ? updatedVehicleData.stock : (originalVehicle.stockEnabled ? originalVehicle.stock : null),
                            stockEnabled: updatedVehicleData.stockEnabled || false,
                            price: updatedVehicleData.price,
                            xp: updatedVehicleData.xp,
                            class: updatedVehicleData.class,
                            financing: updatedVehicleData.financing || false,
                            paymentMethods: updatedVehicleData.paymentMethods || { cash: false, bank: false, xp: false },
                            prices: updatedVehicleData.prices || { cash: 0, bank: 0, xp: 0 }
                        };

                        this.$set(dealership.stock[originalCategory].categoryStock, vehicleIndex, updatedVehicle);
                    } else {
                        return;
                    }
                }
            }
            this.closeAddVehicleModal();
            this.Save(null, true)
        },

        searchVehicles() {
            if (!this.adminPanel.dealershipManagement.selectedDealership) return;

            const dealership = this.getDealershipById(this.adminPanel.dealershipManagement.selectedDealership);
            if (!dealership) return;

            if (!this.searchQuery.trim()) {
                this.resetVehicleFiltering();
                return;
            }

            const query = this.searchQuery.toLowerCase().trim();
            const currentDealership = this.adminPanel.dealershipManagement.selectedDealership;

            Object.keys(dealership.stock).forEach(categoryKey => {
                const category = dealership.stock[categoryKey];

                category.filteredStock = category.categoryStock.filter(vehicle => {
                    return vehicle.label.toLowerCase().includes(query) ||
                        vehicle.model.toLowerCase().includes(query);
                });

                this.$set(category, 'isFiltering', true);

                // Expandir automáticamente las categorías que tienen resultados de búsqueda
                if (category.filteredStock.length > 0) {
                    const key = `${currentDealership}_${categoryKey}`;
                    this.$set(this.expandedCategories, key, true);
                }
            });

            this.$nextTick(() => {
                lucide.createIcons();
            });
        },

        clearSearch() {
            this.searchQuery = '';
            this.resetVehicleFiltering();
        },

        resetVehicleFiltering() {
            if (!this.adminPanel.dealershipManagement.selectedDealership) return;

            const dealership = this.getDealershipById(this.adminPanel.dealershipManagement.selectedDealership);
            if (!dealership) return;

            Object.keys(dealership.stock).forEach(categoryKey => {
                const category = dealership.stock[categoryKey];
                this.$delete(category, 'filteredStock');
                this.$set(category, 'isFiltering', false);
            });

            this.$nextTick(() => {
                lucide.createIcons();
            });
        },

        getDealershipById(id) {
            return this.adminPanel.dealershipManagement.dealerships.find(d => d.id === id);
        },

        // Métodos para manejar categorías expandibles
        toggleCategoryExpansion(categoryKey) {
            const currentDealership = this.adminPanel.dealershipManagement.selectedDealership;
            const key = `${currentDealership}_${categoryKey}`;

            this.$set(this.expandedCategories, key, !this.expandedCategories[key]);

            // Refrescar iconos de Lucide después de cambiar el estado
            this.$nextTick(() => {
                lucide.createIcons();
            });
        },

        isCategoryExpanded(categoryKey) {
            const currentDealership = this.adminPanel.dealershipManagement.selectedDealership;
            const key = `${currentDealership}_${categoryKey}`;

            // Por defecto, expandir la primera categoría si no hay estado guardado
            if (this.expandedCategories[key] === undefined) {
                const dealership = this.getDealershipById(currentDealership);
                if (dealership && dealership.stock) {
                    const categories = Object.keys(dealership.stock);
                    const isFirstCategory = categories.indexOf(categoryKey) === 0;
                    return isFirstCategory;
                }
                return false;
            }

            return this.expandedCategories[key];
        },

        // Método para expandir todas las categorías (útil para búsquedas)
        expandAllCategories() {
            const currentDealership = this.adminPanel.dealershipManagement.selectedDealership;
            const dealership = this.getDealershipById(currentDealership);

            if (dealership && dealership.stock) {
                Object.keys(dealership.stock).forEach(categoryKey => {
                    const key = `${currentDealership}_${categoryKey}`;
                    this.$set(this.expandedCategories, key, true);
                });
            }
        },

        // Método para colapsar todas las categorías
        collapseAllCategories() {
            const currentDealership = this.adminPanel.dealershipManagement.selectedDealership;
            const dealership = this.getDealershipById(currentDealership);

            if (dealership && dealership.stock) {
                Object.keys(dealership.stock).forEach(categoryKey => {
                    const key = `${currentDealership}_${categoryKey}`;
                    this.$set(this.expandedCategories, key, false);
                });
            }
        },

        setTabActive(tab_id) {
            for (let key in this.adminPanel.tabs) {
                this.adminPanel.tabs[key].active = false;
            }

            if (this.adminPanel.tabs[tab_id]) {
                this.adminPanel.tabs[tab_id].active = true;
            }

            if (tab_id === 'map') {
                this.Save()
                setTimeout(() => {
                    if (map) {
                        map.remove();
                        map = null;
                    }
                    initMap(this.adminPanel.dealershipManagement.dealerships);
                }, 100);
            } else {
                if (map) {
                    map.remove();
                    map = null;
                }
            }

        },

        setDealershipTab(tabId) {
            this.adminPanel.dealershipTabs.forEach(tab => {
                tab.active = false;
            });

            const selectedTab = this.adminPanel.dealershipTabs.find(tab => tab.id === tabId);
            if (selectedTab) {
                selectedTab.active = true;
                this.adminPanel.activeDealershipTab = tabId;

                if (tabId === 'vehicles') {
                    this.vehiclesReady = false;
                    this.$nextTick(() => {
                        this.vehiclesReady = true;
                    });
                }
            }

            this.$nextTick(() => {
                lucide.createIcons();
            });
        },

        setLocationTab(tabId) {
            this.adminPanel.locationTabs.forEach(tab => {
                tab.active = false;
            });

            const selectedTab = this.adminPanel.locationTabs.find(tab => tab.id === tabId);
            if (selectedTab) {
                selectedTab.active = true;
                this.adminPanel.activeLocationTab = tabId;
            }

            this.$nextTick(() => {
                lucide.createIcons();
            });
        },

        getLocationCounter(dealership, tabId) {
            const maxCounts = {
                'car_testdrive': 1,
                'car_delivery': 1,
                'car_preview': 1,
                'npcs': 1
            };

            // Use creatorMode.points if available for real-time feedback
            const locations = (this.creatorMode.points && this.creatorMode.points[tabId]) ? this.creatorMode.points[tabId] : (dealership[tabId] || []);
            const count = locations.length;
            const maxCount = maxCounts[tabId];

            return maxCount ? `${count}/${maxCount}` : count.toString();
        },

        formatLocationCoords(location) {
            if (!location) return 'N/A';
            return `${Math.round(location.x)}, ${Math.round(location.y)}, ${Math.round(location.z)}`;
        },

        teleportToLocation(location) {
            if (location && location.x !== undefined && location.y !== undefined && location.z !== undefined) {
                this.fetchEvent('mt-dealerships:ui:teleport', {
                    coords: location
                });
            }
        },

        deleteLocation(dealership, locationType, index) {
            if (dealership[locationType] && dealership[locationType][index]) {
                dealership[locationType].splice(index, 1);
                this.Save(null, true);
            }
        },

        setupLocationCoords(dealership, locationType) {
            this.hideAdminForPlacement();
            this.fetchEvent('prepareLocationPlacement', {})
                .then(() => {
                    this.fetchEvent('setupIndividualLocation', {
                        dealershipId: dealership.id,
                        locationType: locationType,
                        currentData: {
                            cars_exhibitor: dealership.cars_exhibitor || [],
                            car_testdrive: dealership.car_testdrive || [],
                            car_delivery: dealership.car_delivery || [],
                            car_preview: dealership.car_preview || [],
                            npcs: dealership.npcs || [],
                            markers: dealership.markers || []
                        }
                    }).then((result) => {
                        this.creatorMode.active = false;
                        this.adminPanel.visible = true;
                        
                        if (result && result.locations) {
                            this.creatorMode.points[locationType] = result.locations;
                            dealership[locationType] = result.locations;
                            this.Save(null, true);
                        }
                    }).catch(() => {
                        this.creatorMode.active = false;
                        this.adminPanel.visible = true;
                    });
                })
                .catch(() => {
                    this.creatorMode.active = false;
                    this.adminPanel.visible = true;
                });
        },

        handleKeyDown(event) {
            if (event.key === 'Escape') {
                const wasDealershipVisible = this.dealershipMenu.visible;
                const isLiveInspect = this.dealershipInfo?.liveInspect === true;
                this.adminPanel.visible = false
                if (this.dealershipMenu.visible) {
                    this.closeDealershipMenu();
                }

                this.CloseModal()
                this.fetchEvent('close', { silent: !wasDealershipVisible || isLiveInspect });
            }

            if (this.creatorMode.active) {
                if (event.key === 'Tab') {
                    event.preventDefault();
                    if (event.shiftKey) {
                        this.previousCreatorTab();
                    } else {
                        this.nextCreatorTab();
                    }
                }
            }
        },
        handlePrimaryColorChange(color) {
            this.dealershipMenu.primaryColor = color;
            let r, g, b;

            // Convertir hex a RGB
            if (color.startsWith('#')) {
                const hex = color.replace('#', '');
                r = parseInt(hex.substring(0, 2), 16);
                g = parseInt(hex.substring(2, 4), 16);
                b = parseInt(hex.substring(4, 6), 16);
            } else {
                // Si ya es RGB
                const rgbMatch = color.match(/rgb\((\d+),\s*(\d+),\s*(\d+)\)/);
                if (rgbMatch) {
                    r = parseInt(rgbMatch[1]);
                    g = parseInt(rgbMatch[2]);
                    b = parseInt(rgbMatch[3]);
                }
            }

            if (r !== undefined && g !== undefined && b !== undefined) {
                this.fetchEvent('mt-dealerships:ui:changePrimary', { r, g, b });
            }
        },


        // Métodos para el modal de configuración de exhibidores
        configureExhibitorVehicles(index) {
            this.exhibitorConfigModal.currentExhibitorIndex = index;
            this.exhibitorConfigModal.selectedVehicles = [];
            this.exhibitorConfigModal.fixedVehicleModel = '';
            this.exhibitorConfigModal.rotateEnabled = false;
            this.exhibitorConfigModal.interactable = true;
            this.exhibitorConfigModal.allowPurchase = true;
            this.exhibitorConfigModal.allowTestDrive = true;

            // Obtener vehículos disponibles del concesionario actual
            const dealership = this.getDealershipById(this.adminPanel.dealershipManagement.selectedDealership);
            if (dealership && dealership.stock) {
                this.exhibitorConfigModal.availableVehicles = [];

                Object.values(dealership.stock).forEach(category => {
                    if (category.categoryStock && Array.isArray(category.categoryStock)) {
                        category.categoryStock.forEach(vehicle => {
                            if (vehicle.model && vehicle.label) {
                                this.exhibitorConfigModal.availableVehicles.push({
                                    model: vehicle.model,
                                    label: vehicle.label,
                                    class: vehicle.class || 'A',
                                    img: vehicle.image || './assets/vehicles/default.png'
                                });
                            }
                        });
                    }
                });
            }

            // Cargar vehículos ya configurados para este exhibidor
            if (this.creatorMode.points.cars_exhibitor[index] &&
                this.creatorMode.points.cars_exhibitor[index].allowedVehicles) {
                this.exhibitorConfigModal.selectedVehicles = [...this.creatorMode.points.cars_exhibitor[index].allowedVehicles];
            }
            if (this.creatorMode.points.cars_exhibitor[index]) {
                const exhibitor = this.creatorMode.points.cars_exhibitor[index];
                this.exhibitorConfigModal.fixedVehicleModel = exhibitor.fixedVehicleModel || '';
                this.exhibitorConfigModal.rotateEnabled = exhibitor.rotateEnabled !== false;
                this.exhibitorConfigModal.interactable = exhibitor.interactable !== false;
                this.exhibitorConfigModal.allowPurchase = exhibitor.allowPurchase !== false;
                this.exhibitorConfigModal.allowTestDrive = exhibitor.allowTestDrive !== false;
            }

            this.exhibitorConfigModal.visible = true;
        },

        // Método para configurar vehículos desde la lista de ubicaciones
        configureExhibitorVehiclesFromList(dealership, index) {
            this.exhibitorConfigModal.currentExhibitorIndex = index;
            this.exhibitorConfigModal.selectedVehicles = [];
            this.exhibitorConfigModal.fixedVehicleModel = '';
            this.exhibitorConfigModal.rotateEnabled = false;
            this.exhibitorConfigModal.interactable = true;
            this.exhibitorConfigModal.allowPurchase = true;
            this.exhibitorConfigModal.allowTestDrive = true;

            // Obtener vehículos disponibles del concesionario
            if (dealership && dealership.stock) {
                this.exhibitorConfigModal.availableVehicles = [];

                Object.values(dealership.stock).forEach(category => {
                    if (category.categoryStock && Array.isArray(category.categoryStock)) {
                        category.categoryStock.forEach(vehicle => {
                            if (vehicle.model && vehicle.label) {
                                this.exhibitorConfigModal.availableVehicles.push({
                                    model: vehicle.model,
                                    label: vehicle.label,
                                    class: vehicle.class || 'A',
                                    img: vehicle.img || vehicle.image || './assets/vehicles/default.png'
                                });
                            }
                        });
                    }
                });
            }

            // Cargar vehículos ya configurados para este exhibidor
            if (dealership.cars_exhibitor && dealership.cars_exhibitor[index] &&
                dealership.cars_exhibitor[index].allowedVehicles) {
                this.exhibitorConfigModal.selectedVehicles = [...dealership.cars_exhibitor[index].allowedVehicles];
            }
            if (dealership.cars_exhibitor && dealership.cars_exhibitor[index]) {
                const exhibitor = dealership.cars_exhibitor[index];
                this.exhibitorConfigModal.fixedVehicleModel = exhibitor.fixedVehicleModel || '';
                this.exhibitorConfigModal.rotateEnabled = exhibitor.rotateEnabled !== false;
                this.exhibitorConfigModal.interactable = exhibitor.interactable !== false;
                this.exhibitorConfigModal.allowPurchase = exhibitor.allowPurchase !== false;
                this.exhibitorConfigModal.allowTestDrive = exhibitor.allowTestDrive !== false;
            }

            // Forzar actualización del DOM
            this.$nextTick(() => {
                this.exhibitorConfigModal.visible = true;

                // Inicializar iconos de Lucide después de mostrar el modal
                this.$nextTick(() => {
                    if (typeof lucide !== 'undefined' && lucide.createIcons) {
                        lucide.createIcons();
                    }
                });
            });
        },

        closeExhibitorConfigModal() {
            this.exhibitorConfigModal.visible = false;
            this.exhibitorConfigModal.currentExhibitorIndex = null;
            this.exhibitorConfigModal.selectedVehicles = [];
            this.exhibitorConfigModal.availableVehicles = [];
            this.exhibitorConfigModal.searchQuery = '';
            this.exhibitorConfigModal.fixedVehicleModel = '';
            this.exhibitorConfigModal.rotateEnabled = false;
            this.exhibitorConfigModal.interactable = true;
            this.exhibitorConfigModal.allowPurchase = true;
            this.exhibitorConfigModal.allowTestDrive = true;
        },

        selectAllVehicles() {
            this.exhibitorConfigModal.selectedVehicles = [...this.exhibitorConfigModal.availableVehicles.map(v => v.model)];
        },

        selectAllFilteredVehicles() {
            const filteredModels = this.filteredExhibitorVehicles.map(v => v.model);
            const currentSelected = [...this.exhibitorConfigModal.selectedVehicles];

            filteredModels.forEach(model => {
                if (!currentSelected.includes(model)) {
                    currentSelected.push(model);
                }
            });

            this.exhibitorConfigModal.selectedVehicles = currentSelected;
        },

        clearAllVehicles() {
            this.exhibitorConfigModal.selectedVehicles = [];
        },

        isVehicleSelected(model) {
            return this.exhibitorConfigModal.selectedVehicles.includes(model);
        },

        toggleVehicleSelection(model) {
            const index = this.exhibitorConfigModal.selectedVehicles.indexOf(model);
            if (index > -1) {
                this.exhibitorConfigModal.selectedVehicles.splice(index, 1);
            } else {
                this.exhibitorConfigModal.selectedVehicles.push(model);
            }
        },

        saveExhibitorConfig() {

            if (this.exhibitorConfigModal.currentExhibitorIndex !== null) {
                const exhibitorIndex = this.exhibitorConfigModal.currentExhibitorIndex;
                const selectedVehicles = [...new Set(this.exhibitorConfigModal.selectedVehicles)];
                const fixedVehicleModel = selectedVehicles.length === 1 ? selectedVehicles[0] : '';

                const currentDealership = this.getDealershipById(this.adminPanel.dealershipManagement.selectedDealership);

                if (this.creatorMode.active && this.creatorMode.points.cars_exhibitor && this.creatorMode.points.cars_exhibitor[exhibitorIndex]) {
                    if (!this.creatorMode.points.cars_exhibitor[exhibitorIndex].allowedVehicles) {
                        this.$set(this.creatorMode.points.cars_exhibitor[exhibitorIndex], 'allowedVehicles', []);
                    }
                    this.creatorMode.points.cars_exhibitor[exhibitorIndex].allowedVehicles = selectedVehicles;
                    this.creatorMode.points.cars_exhibitor[exhibitorIndex].fixedVehicleModel = fixedVehicleModel;
                    this.creatorMode.points.cars_exhibitor[exhibitorIndex].rotateEnabled = !!this.exhibitorConfigModal.rotateEnabled;
                    this.creatorMode.points.cars_exhibitor[exhibitorIndex].interactable = !!this.exhibitorConfigModal.interactable;
                    this.creatorMode.points.cars_exhibitor[exhibitorIndex].allowPurchase = !!this.exhibitorConfigModal.allowPurchase;
                    this.creatorMode.points.cars_exhibitor[exhibitorIndex].allowTestDrive = !!this.exhibitorConfigModal.allowTestDrive;
                } else if (currentDealership && currentDealership.cars_exhibitor && currentDealership.cars_exhibitor[exhibitorIndex]) {
                    if (!currentDealership.cars_exhibitor[exhibitorIndex].allowedVehicles) {
                        this.$set(currentDealership.cars_exhibitor[exhibitorIndex], 'allowedVehicles', []);
                    }
                    currentDealership.cars_exhibitor[exhibitorIndex].allowedVehicles = selectedVehicles;
                    currentDealership.cars_exhibitor[exhibitorIndex].fixedVehicleModel = fixedVehicleModel;
                    currentDealership.cars_exhibitor[exhibitorIndex].rotateEnabled = !!this.exhibitorConfigModal.rotateEnabled;
                    currentDealership.cars_exhibitor[exhibitorIndex].interactable = !!this.exhibitorConfigModal.interactable;
                    currentDealership.cars_exhibitor[exhibitorIndex].allowPurchase = !!this.exhibitorConfigModal.allowPurchase;
                    currentDealership.cars_exhibitor[exhibitorIndex].allowTestDrive = !!this.exhibitorConfigModal.allowTestDrive;
                }

                this.Save(null, true);

                this.closeExhibitorConfigModal();

                this.showNotification('Configuración del exhibidor guardada correctamente', 'success');
            }
        },

        handleImageError(event) {
            event.target.src = './assets/vehicles/default.png';
        },

        handleSecondaryColorChange(color) {
            this.dealershipMenu.secondaryColor = color;
            let r, g, b;

            if (color.startsWith('#')) {
                const hex = color.replace('#', '');
                r = parseInt(hex.substring(0, 2), 16);
                g = parseInt(hex.substring(2, 4), 16);
                b = parseInt(hex.substring(4, 6), 16);
            } else {
                const rgbMatch = color.match(/rgb\((\d+),\s*(\d+),\s*(\d+)\)/);
                if (rgbMatch) {
                    r = parseInt(rgbMatch[1]);
                    g = parseInt(rgbMatch[2]);
                    b = parseInt(rgbMatch[3]);
                }
            }

            if (r !== undefined && g !== undefined && b !== undefined) {
                this.fetchEvent('mt-dealerships:ui:changeSecondary', { r, g, b });
            }
        },
        toggleFilters() {
            this.showFilters = !this.showFilters;
        },
        notify(type = 'info', message = '') {
            if (window.showNotification) {
                window.showNotification(message, type);
            }
        },

        initializeColorPickers() {
            // No es necesario añadir listeners manuales si usamos v-model y @input en el HTML
            // Este método se mantiene por compatibilidad si se llama desde otros sitios
            console.log('[Dealership] Color pickers reactivos inicializados');
        },
    }, computed: {
        currentCategoryVehicles() {
            if (this.selectedCategory === 'all_categories') {
                const allVehicles = [];
                Object.values(this.dealershipMenu.dealershipStock || {}).forEach(category => {
                    if (category.categoryStock && Array.isArray(category.categoryStock)) {
                        allVehicles.push(...category.categoryStock);
                    }
                });
                return allVehicles;
            }

            if (this.selectedCategory && this.dealershipMenu.dealershipStock[this.selectedCategory]) {
                return this.dealershipMenu.dealershipStock[this.selectedCategory].categoryStock;
            }

            return [];
        },

        filteredByPriceVehicles() {
            const vehicles = [...this.currentCategoryVehicles];

            if (!this.priceFilter.active) {
                return vehicles;
            }

            return vehicles.filter(vehicle => {
                const price = vehicle.price || 0;
                const min = this.priceFilter.min;
                const max = this.priceFilter.max;

                if (min !== null && max === null) {
                    return price >= min;
                }

                if (min === null && max !== null) {
                    return price <= max;
                }

                if (min !== null && max !== null) {
                    return price >= min && price <= max;
                }

                return true;
            });
        },

        sortedVehicles() {
            const vehicles = [...this.filteredByPriceVehicles];

            return vehicles.sort((a, b) => {
                let valueA, valueB;

                switch (this.sortBy) {
                    case 'name':
                        valueA = a.label.toLowerCase();
                        valueB = b.label.toLowerCase();
                        break;
                    case 'price':
                        valueA = a.price;
                        valueB = b.price;
                        break;
                    case 'xp':
                        valueA = a.xp;
                        valueB = b.xp;
                        break;
                    case 'class':
                        valueA = a.class;
                        valueB = b.class;
                        break;
                    default:
                        return 0;
                }

                if (this.sortOrder === 'asc') {
                    if (valueA < valueB) return -1;
                    if (valueA > valueB) return 1;
                    return 0;
                } else {
                    if (valueA > valueB) return -1;
                    if (valueA < valueB) return 1;
                    return 0;
                }
            });
        }, filteredDefaultVehicles() {
            const defaultVehicles = this.adminPanel.dealershipManagement.defaultGTAVehicles || [];
            if (!this.addVehicleModal.searchQuery) {
                return defaultVehicles;
            }

            const query = this.addVehicleModal.searchQuery.toLowerCase();
            return defaultVehicles.filter(vehicle =>
                vehicle.label.toLowerCase().includes(query) ||
                vehicle.model.toLowerCase().includes(query)
            );
        },

        sortedDefaultVehicles() {
            const vehicles = [...this.filteredDefaultVehicles];

            return vehicles.sort((a, b) => {
                let valueA, valueB;

                switch (this.sortBy) {
                    case 'name':
                        valueA = a.label.toLowerCase();
                        valueB = b.label.toLowerCase();
                        break;
                    case 'price':
                        valueA = a.label.toLowerCase();
                        valueB = b.label.toLowerCase();
                        break;
                    default:
                        valueA = a.label.toLowerCase();
                        valueB = b.label.toLowerCase();
                }

                if (this.sortOrder === 'asc') {
                    if (valueA < valueB) return -1;
                    if (valueA > valueB) return 1;
                    return 0;
                } else {
                    if (valueA > valueB) return -1;
                    if (valueA < valueB) return 1;
                    return 0;
                }
            });
        },

        isAddVehicleFormValid() {
            const form = this.addVehicleModal.form;
            const hasCashPayment = form.paymentMethods?.cash && form.prices?.cash > 0;
            const hasXPPayment = form.paymentMethods?.xp && form.prices?.xp > 0;

            if (form.stockEnabled) {
                const stock = parseInt(form.stock) || 0;
                if (stock < 0) {
                    return false;
                }
            }

            return form.category &&
                form.model &&
                form.label &&
                form.class &&
                form.paymentMethods &&
                (hasCashPayment || hasXPPayment);
        },

        isPriceFilterValid() {
            const min = this.priceFilter.min;
            const max = this.priceFilter.max;

            const hasValidMin = min !== null && min !== '' && min >= 0;
            const hasValidMax = max !== null && max !== '' && max >= 0;

            if (hasValidMin && hasValidMax) {
                return parseFloat(min) <= parseFloat(max);
            }

            return hasValidMin || hasValidMax;
        },
        existingVehicleModels() {
            const dealership = this.getDealershipById(this.adminPanel.dealershipManagement.selectedDealership);
            if (!dealership || !dealership.stock) return [];
            let models = [];
            Object.values(dealership.stock).forEach(category => {
                if (category.categoryStock && Array.isArray(category.categoryStock)) {
                    models.push(...category.categoryStock.map(v => v.model.toLowerCase()));
                }
            });
            return models;
        },

        filteredExhibitorVehicles() {
            if (!this.exhibitorConfigModal.searchQuery) {
                return this.exhibitorConfigModal.availableVehicles;
            }

            const query = this.exhibitorConfigModal.searchQuery.toLowerCase();
            return this.exhibitorConfigModal.availableVehicles.filter(vehicle =>
                vehicle.label.toLowerCase().includes(query) ||
                vehicle.model.toLowerCase().includes(query) ||
                vehicle.class.toLowerCase().includes(query)
            );
        },
        catalogEnabled() {
            return this.dealershipInfo?.settings?.allowCatalog !== false && this.dealershipInfo?.allowCatalog !== false;
        },
        canPurchaseCurrent() {
            if (this.dealershipInfo?.interactionType !== 'exhibitor') return true;
            return this.dealershipInfo?.exhibitorAccess?.allowPurchase !== false;
        },
        canTestDriveCurrent() {
            if (this.dealershipInfo?.interactionType !== 'exhibitor') return true;
            return this.dealershipInfo?.exhibitorAccess?.allowTestDrive !== false;
        },
    },
    mounted() {

        this.vehiclesReady = true;

        this.loadTranslations().then(() => {
        }).catch(error => {
        });

        this.fetchEvent('getConfig', {}).then(data => {
            this.financingConfig = data.FinancingConfig;
        });

        this.dealerCache = {};

        this.initializeCameraControls();



        this.initializeCarrouselScroll();
        this.listener = window.addEventListener('message', (event) => {
            const data = event.data;

            if (data.action == 'closeTestDrive') {
                this.testDriving = false;
                this.stopTestDriveTimer();

                this.resetNUIState();
            }

            if (data.action == 'openDealership') {
                if (this.testDriving) {
                    this.resetNUIState();
                }

                this.cleanupDOM();
                this.previewEntryPending = true;

                this.$set(this.dealershipMenu, 'visible', true);

                this.dealershipInfo = data.dealershipMenu.dealershipInfo;

                if (data.dealershipMenu && data.dealershipMenu.dealershipStock) {
                    this.$set(this.dealershipMenu, 'dealershipStock', data.dealershipMenu.dealershipStock);

                    Object.keys(data.dealershipMenu.dealershipStock).forEach(categoryId => {
                        const category = data.dealershipMenu.dealershipStock[categoryId];
                    });
                }
                if (data.dealershipMenu && data.dealershipMenu.dealershipInfo) {
                    this.$set(this.dealershipMenu, 'dealershipInfo', data.dealershipMenu.dealershipInfo);
                }

                if (this.dealershipInfo?.liveInspect) {
                    this.previewEntryPending = false;
                    this.loadingVehicleStats = false;
                    this.removeCameraControls();

                    const selectedCategory = this.dealershipInfo.selectedCategory || Object.keys(this.dealershipMenu.dealershipStock || {})[0] || 'all_categories';
                    const selectedVehicle = this.dealershipInfo.selectedVehicle || null;

                    this.$set(this, 'selectedCategory', selectedCategory);
                    this.$set(this, 'selectedVehicle', selectedVehicle);
                    this.currentVehicleLabel = selectedVehicle?.label || null;
                    this.currentVehiclePrice = selectedVehicle?.price || 0;
                    this.currentVehicleXP = selectedVehicle?.xp || 0;
                    this.currentVehicleFinancing = selectedVehicle?.financing || false;
                    this.$set(this.dealershipMenu, 'currentVehicleStats', this.dealershipInfo.currentVehicleStats || []);

                    this.$nextTick(() => {
                        this.initializeColorPickers();
                    });
                    return;
                }

                const stateLoaded = this.loadDealerState();
                const focusVehicleModel = this.dealershipInfo?.focusVehicleModel;

                if (focusVehicleModel) {
                    this.selectVehicleByModel(focusVehicleModel);
                } else if (stateLoaded) {
                    const cachedVehicleData = this.findCachedVehicle();

                    if (cachedVehicleData) {
                        this.$set(this, 'selectedCategory', cachedVehicleData.category);
                        this.$set(this, 'selectedVehicle', cachedVehicleData.vehicle);
                        this.currentVehicleLabel = cachedVehicleData.vehicle.label;

                        this.$nextTick(() => {
                            this.fetchEvent('mt-dealerships:ui:changeVehiclePreview', {
                                model: cachedVehicleData.vehicle.model,
                                zoom: this.cameraControls.zoom,
                                rotation: this.cameraControls.rotation
                            }).then((result) => {
                                this.loadingVehicleStats = true;
                                this.dealershipMenu.currentVehicleStats = null;
                                const start4 = Date.now();
                                this.dealershipMenu.currentVehicleStats = [
                                    { label: 'Potencia', value: result.power },
                                    { label: 'Velocidad punta', value: result.high_speed },
                                    { label: 'Aceleración', value: result.acceleration * 100 },
                                    { label: 'Frenado', value: result.braking * 100 }
                                ];
                                this.loadingVehicleStats = false;
                                this.notifyPreviewReadyIfNeeded();
                            });
                        });
                    } else {
                        this.selectFirstAvailableVehicle();
                    }
                } else {
                    this.selectFirstAvailableVehicle();
                }

                this.initializeCarrouselScroll();

                this.$nextTick(() => {
                    if (this.dealershipMenu.visible) {
                        this.initializeCameraControls();
                        this.initializeColorPickers();
                    }
                });
            }


            if (data.action === 'openAdmin') {
                this.adminPanel.visible = true;

                this.adminPanel.dealershipManagement.defaultGTAVehicles = data.vehicles;

                if (data.dealerships && Array.isArray(data.dealerships)) {
                    const formattedDealerships = data.dealerships.map(dealership => {
                        let coords = dealership.coords;
                        if (!coords || (Array.isArray(coords) && coords.length === 0)) {
                            coords = dealership.markers && dealership.markers.length > 0 ?
                                {
                                    x: dealership.markers[0].x,
                                    y: dealership.markers[0].y,
                                    z: dealership.markers[0].z
                                } :
                                {
                                    x: 0,
                                    y: 0,
                                    z: 0
                                };
                        }

                        // Normalizar stock para asegurar que categoryStock sean arrays apropiados
                        const normalizedStock = {};
                        if (dealership.stock && typeof dealership.stock === 'object') {
                            Object.keys(dealership.stock).forEach(categoryKey => {
                                const category = dealership.stock[categoryKey];
                                if (category && typeof category === 'object') {
                                    normalizedStock[categoryKey] = {
                                        label: category.label || categoryKey,
                                        categoryStock: [],
                                        job: category.job || ""
                                    };

                                    // Convertir categoryStock a array apropiado si existe
                                    if (category.categoryStock) {
                                        if (Array.isArray(category.categoryStock)) {
                                            // Ya es un array, pero asegurar que no tenga huecos
                                            normalizedStock[categoryKey].categoryStock = category.categoryStock.filter(vehicle =>
                                                vehicle && typeof vehicle === 'object' && vehicle.model
                                            );
                                        } else if (typeof category.categoryStock === 'object') {
                                            // Es un objeto, convertir a array
                                            const vehicleArray = [];
                                            Object.keys(category.categoryStock).forEach(key => {
                                                const vehicle = category.categoryStock[key];
                                                if (vehicle && typeof vehicle === 'object' && vehicle.model) {
                                                    vehicleArray.push(vehicle);
                                                }
                                            });
                                            normalizedStock[categoryKey].categoryStock = vehicleArray;
                                        }
                                    }
                                }
                            });
                        }

                        return {
                            id: dealership.id,
                            name: dealership.name,
                            description: dealership.description || '',
                            coords: coords,
                            car_delivery: dealership.car_delivery || [],
                            car_preview: dealership.car_preview || [],
                            car_testdrive: dealership.car_testdrive || [],
                            cars_exhibitor: dealership.cars_exhibitor || [],
                            markers: dealership.markers || [],
                            npcs: dealership.npcs || [],
                            stock: normalizedStock,
                            settings: {
                                allowFinancing: dealership.settings?.allowFinancing ?? true,
                                allowTestDrive: dealership.settings?.allowTestDrive ?? true,
                                testDriveTime: dealership.settings?.testDriveTime ?? 5,
                                allowCatalog: dealership.settings?.allowCatalog ?? true
                            },
                            blipConfig: {
                                sprite: parseInt(dealership.blipConfig?.sprite) || 326,
                                color: parseInt(dealership.blipConfig?.color) || 3,
                                scale: parseFloat(dealership.blipConfig?.scale) || 0.8
                            }
                        };
                    });

                    this.$set(this.adminPanel.dealershipManagement, 'dealerships', formattedDealerships);
                }
            }


            if (data.action === "updateStages" || data.action === "startCreator") {

                this.creatorMode.active = true;
                this.creatorMode.stages = data.stages || [];

                const activeTabId = data.currentStage || 'cars_exhibitor';
                this.setCreatorTab(activeTabId);

                this.$nextTick(() => {
                    lucide.createIcons();
                });
            }


            if (data.action === "updatePoints") {
                this.creatorMode.points = Object.assign({}, this.creatorMode.points, data.data);
                this.$forceUpdate();
            }

            if (data.action === "dealershipCreated") {
                this.creatorMode.active = false;
            }

            if (data.action === "dealershipCancelled" || data.action === "creatorDisabled") {
                this.creatorMode.active = false;
            }

            if (data.action === "refreshDealerships") {
                if (data.dealerships && Array.isArray(data.dealerships)) {
                    const formattedDealerships = data.dealerships.map(dealership => {
                        let coords = dealership.coords;
                        if (!coords || (Array.isArray(coords) && coords.length === 0)) {
                            coords = dealership.markers && dealership.markers.length > 0 ?
                                {
                                    x: dealership.markers[0].x,
                                    y: dealership.markers[0].y,
                                    z: dealership.markers[0].z
                                } :
                                {
                                    x: 0,
                                    y: 0,
                                    z: 0
                                };
                        }

                        return {
                            id: dealership.id,
                            name: dealership.name,
                            description: dealership.description || '',
                            coords: coords,
                            car_delivery: dealership.car_delivery || [],
                            car_preview: dealership.car_preview || [],
                            car_testdrive: dealership.car_testdrive || [],
                            cars_exhibitor: dealership.cars_exhibitor || [],
                            markers: dealership.markers || [],
                            npcs: dealership.npcs || [],
                            stock: dealership.stock || {},
                            settings: {
                                allowFinancing: dealership.settings?.allowFinancing ?? true,
                                allowTestDrive: dealership.settings?.allowTestDrive ?? true,
                                testDriveTime: dealership.settings?.testDriveTime ?? 5,
                                allowCatalog: dealership.settings?.allowCatalog ?? true
                            },
                            blipConfig: {
                                sprite: parseInt(dealership.blipConfig?.sprite) || 326,
                                color: parseInt(dealership.blipConfig?.color) || 3,
                                scale: parseFloat(dealership.blipConfig?.scale) || 0.8
                            }
                        };
                    });

                    this.$set(this.adminPanel.dealershipManagement, 'dealerships', formattedDealerships);
                }
            }

            if (data.action === "individualLocationMode") {
                this.creatorMode.active = true;
                this.creatorMode.stages = [data.currentStage];
                this.setCreatorTab(data.locationType);
                this.creatorMode.points = data.data;
                this.$nextTick(() => {
                    lucide.createIcons();
                });
            }

            if (data.action === "individualLocationFinished" || data.action === "individualLocationCancelled") {
                this.creatorMode.active = false;
                if (!data.onlyCreator) {
                    this.adminPanel.visible = true;
                }

                this.$nextTick(() => {
                    this.fetchEvent('maintainNuiFocus', {});
                });
            }
        });

        window.addEventListener('keydown', this.handleKeyDown);

        lucide.createIcons();
        Coloris({
            themeMode: 'dark',
            alpha: false,
            theme: 'pill',
            el: '.coloris',
            margin: 2,
            format: 'rgb',
            focusInput: true,
            onChange: (color, input) => {
                if (input.classList.contains('instance2')) {
                    this.handlePrimaryColorChange(color);
                } else if (input.classList.contains('instance3')) {
                    this.handleSecondaryColorChange(color);
                }
            }
        });



        const carrousel = document.querySelector('.vehicle-carrousel');
        if (!carrousel) return;

        carrousel.addEventListener('wheel', function (e) {
            if (e.deltaY !== 0) {
                e.preventDefault();
                carrousel.scrollBy({
                    left: e.deltaY * 10,
                    behavior: 'smooth'
                });
            }
        }, {
            passive: false
        });

        let isDown = false;
        let startX;
        let scrollLeft;

        carrousel.addEventListener('mousedown', (e) => {
            isDown = true;
            startX = e.pageX - carrousel.offsetLeft;
            scrollLeft = carrousel.scrollLeft;
        });

        carrousel.addEventListener('mouseup', () => {
            isDown = false;
        });

        carrousel.addEventListener('mouseleave', () => {
            isDown = false;
        }); carrousel.addEventListener('mousemove', (e) => {
            if (!isDown) return;
            e.preventDefault();

            const x = e.pageX - carrousel.offsetLeft;
            const walk = (x - startX) * 2;
            carrousel.scrollLeft = scrollLeft - walk;
        });


    },
    updated() {
        lucide.createIcons();
        Coloris({
            themeMode: 'dark',
            alpha: false,
            theme: 'pill',
            el: '.coloris',
            margin: 2,
            format: 'rgb',
            focusInput: true,
            onChange: (color, input) => {

                if (input.classList.contains('instance2')) {
                    this.handlePrimaryColorChange(color);
                } else if (input.classList.contains('instance3')) {
                    this.handleSecondaryColorChange(color);
                }
            }
        });
        this.initializeCarrouselScroll();

        this.boundLocationsWheelHandler = (event) => {
            const target = event.target;
            if (!target || typeof target.closest !== 'function') return;

            const locationsList = target.closest('.locations-list');
            if (!locationsList) return;

            if (locationsList.scrollHeight <= locationsList.clientHeight) return;

            event.preventDefault();
            event.stopPropagation();
            locationsList.scrollTop += event.deltaY;
        };

        document.addEventListener('wheel', this.boundLocationsWheelHandler, {
            passive: false,
            capture: true
        });
    },

    beforeDestroy() {
        window.removeEventListener('message', this.listener);
        window.removeEventListener('keydown', this.handleKeyDown);
        this.stopTestDriveTimer();

        if (this.cameraUpdateThrottle) {
            clearTimeout(this.cameraUpdateThrottle);
        }

        this.removeCameraControls();

        if (this.boundLocationsWheelHandler) {
            document.removeEventListener('wheel', this.boundLocationsWheelHandler, true);
            this.boundLocationsWheelHandler = null;
        }
    },

    watch: {
        'addVehicleModal.form.prices.cash': {
            handler(newValue) {
                if (newValue > 0) {
                    this.addVehicleModal.form.price = newValue;
                }
            }
        },

        'addVehicleModal.form.prices.xp': {
            handler(newValue) {
                if (newValue > 0) {
                    this.addVehicleModal.form.xp = newValue;
                }
            }
        },
        sortedVehicles() {
            this.vehiclesReady = false;
            this.$nextTick(() => {
                this.vehiclesReady = true;
            });
        },
    }

})

function getNotificationIcon(type) {
    switch (type) {
        case 'error':
            return '<i data-lucide="alert-triangle" style="color:#ff4d6d"></i>';
        case 'success':
            return '<i data-lucide="check-circle" style="color:#7fff7f"></i>';
        case 'info':
        default:
            return '<i data-lucide="info" style="color:#7a7aff"></i>';
    }
}

function showNotification(message, type = 'info', duration = 3000) {
    const container = document.getElementById('notifications-container');
    if (!container) return;

    message = message || 'Texto de prueba visible';

    const notification = document.createElement('div');
    notification.className = 'notification';
    notification.innerHTML = `${getNotificationIcon(type)}<span>${message}</span>`;

    container.appendChild(notification);

    if (window.lucide) {
        lucide.createIcons();
    }

    setTimeout(() => {
        notification.style.opacity = '1';
    }, 10);

    setTimeout(() => {
        notification.style.opacity = '0';
        setTimeout(() => {
            if (notification.parentNode) {
                notification.parentNode.removeChild(notification);
            }
        }, 400);
    }, duration);
}

window.showNotification = showNotification;



