
import BusinessObjects from "../lib/business_objects/business_objects.js";
import Events from "../lib/events.js";
import LocalStorage from "../lib/local_storage.js";
import API from "../api.js";
import DOM from "../dom.js";

import OverlayConfirm from "../components/common/temporary/overlay_confirm.js";
import OverlayError from "../components/common/temporary/overlay_error.js";

export default class BasePage {
    constructor(router) {
        if (!router) {
            throw new Error("Router is required");
        }
        else {
            if (_verbose) { console.log("initialising with router: ", router); }
        }
        this.router = router;
        this.title = titlePageCurrent;
        // this.hash = hashPageCurrent;
        if (this.constructor === BasePage) {
            throw new Error("Cannot instantiate abstract class");
        }
        
        if (!this.constructor.hash) {
            throw new Error(`Class ${this.constructor.name} must have a static hash attribute.`);
        }
    }

    initialize() {
        throw new Error("Method 'initialize()' must be implemented.");
    }

    sharedInitialize() {
        this.logInitialisation();
        this.hookupCommonElements();
    }

    logInitialisation() {
        if (_verbose) { console.log('Initializing ' + this.title + ' page'); }
    }
    
    hookupCommonElements() {
        // hookupVideos();
        this.hookupNavigation();
        this.hookupImagesLogo();
        this.hookupOverlays();
    }
    
    hookupNavigation() {
        this.hookupEventHandler("click", idButtonHamburger, (event, element) => {
            let overlayHamburger = document.querySelector(idOverlayHamburger);
            if (overlayHamburger.classList.contains(flagCollapsed)) {
                overlayHamburger.classList.remove(flagCollapsed);
                overlayHamburger.classList.add(flagExpanded);
            } else {
                overlayHamburger.classList.remove(flagExpanded);
                overlayHamburger.classList.add(flagCollapsed);
            }
        });

        this.hookupButtonsNavHome();
        this.hookupButtonsNavServices();
        this.hookupButtonsNavContact();
        this.hookupButtonsNavUserAccount();
        this.hookupButtonsNavUserLogout();
        this.hookupButtonsNavUserLogin();
        this.hookupButtonsNavStoreHome();
        this.hookupButtonsNavStoreManufacturingPurchaseOrders();
        this.hookupButtonsNavStoreProductPermutations();
        this.hookupButtonsNavStoreStockItems();
        this.hookupButtonsNavStoreSuppliers();
        this.hookupButtonsNavStoreSupplierPurchaseOrders();
        this.hookupButtonsNavAdminHome();
    }
    hookupEventHandler(eventType, selector, callback) {
        Events.initialiseEventHandler(selector, flagInitialised, (element) => {
            element.addEventListener(eventType, (event) => {
                event.stopPropagation();
                callback(event, element);
            });
        });
    }
    hookupButtonsNavHome() {
        this.hookupButtonsNav('.' + flagNavHome, hashPageHome);
    }
    hookupButtonsNav(buttonSelector, hashPageNav) {
        this.hookupEventHandler("click", buttonSelector, (event, button) => { 
            this.router.navigateToHash(hashPageNav); 
        });
    }
    hookupButtonsNavServices() {
        this.hookupButtonsNav('.' + flagNavServices, hashPageServices);
    }
    hookupButtonsNavContact() {
        this.hookupButtonsNav('.' + flagNavContact, hashPageContact);
    }
    hookupButtonsNavUserAccount() {
        this.hookupButtonsNav('.' + flagNavUserAccount, hashPageUserAccount);
    }
    hookupButtonsNavUserLogout() {
        this.hookupButtonsNav('.' + flagNavUserLogout, hashPageUserLogout);
    }
    hookupButtonsNavUserLogin() {
        this.hookupEventHandler("click", '.' + flagNavUserLogin, (event, navigator) => { 
            event.stopPropagation();
            this.leave();
            API.loginUser()
                .then((response) => {
                if (response.Success) {
                    window.location.href = response[flagCallback];
                } else {
                    DOM.alertError("Error", response.Message);
                }
            });
        });
    }
    hookupButtonsNavStoreHome() {
        this.hookupButtonsNav('.' + flagNavStoreHome, hashPageStoreHome);
    }
    hookupButtonsNavStoreManufacturingPurchaseOrders() {
        this.hookupButtonsNav('.' + flagNavStoreManufacturingPurchaseOrders, hashPageStoreManufacturingPurchaseOrders);
    }
    hookupButtonsNavStoreProductCategories() {
        this.hookupButtonsNav('.' + flagNavStoreProductCategories, hashPageStoreProductCategories);
    }
    hookupButtonsNavStoreProducts() {
        this.hookupButtonsNav('.' + flagNavStoreProducts, hashPageStoreProducts);
    }
    hookupButtonsNavStoreProductPermutations() {
        this.hookupButtonsNav('.' + flagNavStoreProductPermutations, hashPageStoreProductPermutations);
    }
    hookupButtonsNavStoreProductPrices() {
        this.hookupButtonsNav('.' + flagNavStoreProductPrices, hashPageStoreProductPrices);
    }
    hookupButtonsNavStoreProductVariations() {
        this.hookupButtonsNav('.' + flagNavStoreProductVariations, hashPageStoreProductVariations);
    }
    hookupButtonsNavStoreStockItems() {
        this.hookupButtonsNav('.' + flagNavStoreStockItems, hashPageStoreStockItems);
    }
    hookupButtonsNavAdminHome() {
        this.hookupButtonsNav('.' + flagNavAdminHome, hashPageAdminHome);
    }
    hookupButtonsNavStoreSuppliers() {
        this.hookupButtonsNav('.' + flagNavStoreSuppliers, hashPageStoreSuppliers);
    }
    hookupButtonsNavStoreSupplierPurchaseOrders() {
        this.hookupButtonsNav('.' + flagNavStoreSupplierPurchaseOrders, hashPageStoreSupplierPurchaseOrders);
    }

    hookupImagesLogo() {
        this.hookupButtonsNav("img." + flagImageLogo, hashPageHome);
    }

    hookupOverlays() {
        this.hookupOverlayFromId(idOverlayConfirm);
        this.hookupOverlayFromId(idOverlayError);
    }

    hookupOverlayFromId(idOverlay) {
        Events.initialiseEventHandler(idOverlay, flagInitialised, (overlay) => {
            overlay.querySelector('button.' + flagCancel).addEventListener("click", (event) => {
                event.stopPropagation();
                overlay.style.display = 'none';
            });
        });
    }

    
    hookupButtonSave() {
        Events.initialiseEventHandler('form.' + flagFilter + ' button.' + flagSave, flagInitialised, (button) => {
            button.addEventListener("click", (event) => {
                event.stopPropagation();
                if (_verbose) { console.log('saving page: ', this.title); }
                OverlayConfirm.show();
            });
        });
    }

    hookupVideos() {
        Events.initialiseEventHandler('video', flagInitialised, (video) => {
            video.addEventListener("mouseover", videoPlay(video));
            video.addEventListener("mouseout", videoPause(video));
        });
    }

    leave() {
        if (_verbose) { console.log('Leaving ' + this.title + ' page'); }
        if (this.constructor === BasePage) {
            throw new Error("Must implement leave() method.");
        }
    }
    setLocalStoragePage(dataPage) {
        LocalStorage.setLocalStorage(this.hash, dataPage);
    }
    getLocalStoragePage() {
        return LocalStorage.getLocalStorage(this.hash);
    }

    toggleShowButtonsSaveCancel(show) {
        let buttonSave = document.querySelector('form.' + flagFilter + ' button.' + flagSave);
        let buttonCancel = document.querySelector('form.' + flagFilter + ' button.' + flagCancel);
        if (show) {
            buttonCancel.classList.remove(flagCollapsed);
            buttonSave.classList.remove(flagCollapsed);
            if (_verbose) { console.log('showing buttons'); }
        } else {
            buttonCancel.classList.add(flagCollapsed);
            buttonSave.classList.add(flagCollapsed);
            if (_verbose) { console.log('hiding buttons'); }
        }
    }

    static isDirtyFilter(filter) {
        let isDirty = DOM.updateAndCheckIsElementDirty(filter);
        if (isDirty) document.querySelectorAll(idTableMain + ' tbody tr').remove();
        return isDirty;
    }
}