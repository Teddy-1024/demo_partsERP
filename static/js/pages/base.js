
import Events from "../lib/events.js";
import LocalStorage from "../lib/local_storage.js";
import API from "../api.js";
import DOM from "../dom.js";

export default class BasePage {
    constructor(router) {
        if (!router) {
            throw new Error("Router is required");
        }
        else {
            console.log("initialising with router: ", router);
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
        console.log('Initializing ' + this.title + ' page');
    }
    
    hookupCommonElements() {
        // hookupVideos();
        this.hookupNavigation();
        this.hookupImagesLogo();
    }
    
    hookupNavigation() {
        /* Can be removed: */
        console.log("hooking up navigation");
        let overlayHamburger = document.querySelector(idOverlayHamburger);
        let hamburgerOptions = overlayHamburger.querySelectorAll('div.' + flagRow);
        let countOptions = hamburgerOptions.length;
        console.log('count nav options: ', countOptions);
        // overlayHamburger.css('height', (countOptions * 27) + 'px');
        /* end of can be removed */

        Events.initialiseEventHandler(idButtonHamburger, flagInitialised, function(buttonToggleOverlayNavigation) {
            buttonToggleOverlayNavigation.addEventListener("click", function(event) {
                event.stopPropagation();
                let overlayHamburger = document.querySelector(idOverlayHamburger);
                if (overlayHamburger.classList.contains(flagCollapsed)) {
                    overlayHamburger.classList.remove(flagCollapsed);
                    overlayHamburger.classList.add(flagExpanded);
                } else {
                    overlayHamburger.classList.remove(flagExpanded);
                    overlayHamburger.classList.add(flagCollapsed);
                }
                // overlayHamburger.classList.add(flagInitialised);
            });
        });

        this.hookupButtonNavHome();
        this.hookupButtonNavServices();
        this.hookupButtonNavContact();
        this.hookupButtonNavUserAccount();
        this.hookupButtonNavUserLogout();
        this.hookupButtonNavUserLogin();
        this.hookupButtonNavStoreHome();
        this.hookupButtonNavStoreProductPermutations();
        this.hookupButtonNavStoreStockItems();
        this.hookupButtonNavAdminHome();
    }
    hookupButtonNavHome() {
        Events.initialiseEventHandler('.' + flagNavHome, flagInitialised, (navigator) => {
            navigator.addEventListener("click", (event) => {
                event.stopPropagation();
                this.router.navigateToHash(hashPageHome);
            });
        });
    }
    hookupButtonNavServices() {        
        Events.initialiseEventHandler('.' + flagNavServices, flagInitialised, (navigator) => {
            navigator.addEventListener("click", (event) => {
                event.stopPropagation();
                console.log('going to services page');
                this.router.navigateToHash(hashPageServices);
            });
        });
    }
    hookupButtonNavContact() {        
        Events.initialiseEventHandler('.' + flagNavContact, flagInitialised, (navigator) => {
            navigator.addEventListener("click", (event) => {
                event.stopPropagation();
                this.router.navigateToHash(hashPageContact);
            });
        });
    }
    hookupButtonNavUserAccount() {        
        Events.initialiseEventHandler('.' + flagNavUserAccount, flagInitialised, (navigator) => {
            navigator.addEventListener("click", (event) => {
                event.stopPropagation();
                this.router.navigateToHash(hashPageUserAccount);
            });
        });
    }
    hookupButtonNavUserLogout() {        
        Events.initialiseEventHandler('.' + flagNavUserLogout, flagInitialised, (navigator) => {
            navigator.addEventListener("click", (event) => {
                event.stopPropagation();
                this.router.navigateToHash(hashPageUserLogout);
            });
        });
    }
    hookupButtonNavUserLogin() {        
        Events.initialiseEventHandler('.' + flagNavUserLogin, flagInitialised, (navigator) => {
            navigator.addEventListener("click", (event) => {
                event.stopPropagation();
                // this.router.navigateToHash(hashPageUserLogin);
                /*
                let dataRequest = {};
                dataRequest[keyCallback] = hashPageCurrent;
                console.log('sending data to user login controller: '); 
                console.log(dataRequest);
                */
                API.loginUser()
                    .then(function(response) {
                    if (response.Success) {
                        this.router.navigateToUrl(response[keyCallback], null, false); // window.app.
                    } else {
                        DOM.alertError("Error", response.Message);
                    }
                });
            });
        });
    }
    hookupButtonNavStoreHome() {        
        Events.initialiseEventHandler('.' + flagNavStoreHome, flagInitialised, (navigator) => {
            navigator.addEventListener("click", (event) => {
                event.stopPropagation();
                this.router.navigateToHash(hashPageStoreHome);
            });
        });
    }
    hookupButtonNavStoreProductCategories() {
        Events.initialiseEventHandler('.' + flagNavStoreProductCategories, flagInitialised, (navigator) => {
            navigator.addEventListener("click", (event) => {
                event.stopPropagation();
                this.router.navigateToHash(hashPageStoreProductCategories);
            });
        });
    }
    hookupButtonNavStoreProducts() {
        Events.initialiseEventHandler('.' + flagNavStoreProducts, flagInitialised, (navigator) => {
            navigator.addEventListener("click", (event) => {
                event.stopPropagation();
                this.router.navigateToHash(hashPageStoreProducts);
            });
        });
    }
    hookupButtonNavStoreProductPermutations() {
        Events.initialiseEventHandler('.' + flagNavStoreProductPermutations, flagInitialised, (navigator) => {
            navigator.addEventListener("click", (event) => {
                event.stopPropagation();
                this.router.navigateToHash(hashPageStoreProductPermutations);
            });
        });
    }
    hookupButtonNavStoreProductPrices() {
        Events.initialiseEventHandler('.' + flagNavStoreProductPrices, flagInitialised, (navigator) => {
            navigator.addEventListener("click", (event) => {
                event.stopPropagation();
                this.router.navigateToHash(hashPageStoreProductPrices);
            });
        });
    }
    hookupButtonNavStoreProductVariations() {
        Events.initialiseEventHandler('.' + flagNavStoreProductVariations, flagInitialised, (navigator) => {
            navigator.addEventListener("click", (event) => {
                event.stopPropagation();
                this.router.navigateToHash(hashPageStoreProductVariations);
            });
        });
    }
    hookupButtonNavStoreStockItems() {
        Events.initialiseEventHandler('.' + flagNavStoreStockItems, flagInitialised, (navigator) => {
            navigator.addEventListener("click", (event) => {
                event.stopPropagation();
                this.router.navigateToHash(hashPageStoreStockItems);
            });
        });
    }
    hookupButtonNavAdminHome() {
        Events.initialiseEventHandler('.' + flagNavAdminHome, flagInitialised, (navigator) => {
            navigator.addEventListener("click", (event) => {
                event.stopPropagation();
                this.router.navigateToHash(hashPageAdminHome);
            });
        });
    }

    hookupImagesLogo() {
        let selectorImagesLogo = "img." + flagImageLogo;
        Events.initialiseEventHandler(selectorImagesLogo, flagInitialised, (buttonImageLogo) => {
            buttonImageLogo.addEventListener("click", (event) => {
                event.stopPropagation();
                this.router.navigateToHash(hashPageHome);
            });
        });
    }

    hookupOverlayFromId(idOverlay) {
        Events.initialiseEventHandler(idOverlay, flagInitialised, function(overlay) {
            overlay.querySelector('button.' + flagClose).addEventListener("click", function(event) {
                event.stopPropagation();
                overlay.css('display', 'none');
            });
        });
    }

    
    hookupButtonSave() {
        Events.initialiseEventHandler('form.' + flagFilter + ' button.' + flagSave, flagInitialised, function(button) {
            button.addEventListener("click", function(event) {
                event.stopPropagation();
                showOverlayConfirm();
            });
            button.classList.add(flagCollapsed);
        });
    }

    hookupVideos() {
        Events.initialiseEventHandler('video', flagInitialised, function(video) {
            video.addEventListener("mouseover", videoPlay(video));
            video.addEventListener("mouseout", videoPause(video));
        });
    }

    leave() {
        console.log('Leaving ' + this.title + ' page');
        if (this.constructor === BasePage) {
            throw new Error("Must implement leave() method.");
        }
    }
    setLocalStoragePage(dataPage) {
        LocalStorage.setLocalStorage(this.constructor.hash, dataPage);
    }
    getLocalStoragePage() {
        return LocalStorage.getLocalStorage(this.constructor.hash);
    }

    toggleShowButtonsSaveCancel(show, buttonSave = null, buttonCancel = null) {
        if (buttonSave == null) buttonSave = document.querySelector('form.' + flagFilter + ' button.' + flagSave);
        if (buttonCancel == null) buttonCancel = document.querySelector('form.' + flagFilter + ' button.' + flagCancel);
        if (show) {
            buttonCancel.classList.remove(flagCollapsed);
            buttonSave.classList.remove(flagCollapsed);
        } else {
            buttonCancel.classList.add(flagCollapsed);
            buttonSave.classList.add(flagCollapsed);
        }
    }

    static isDirtyFilter(filter) {
        let isDirty = DOM.isElementDirty(filter);
        if (isDirty) document.querySelectorAll(idTableMain + ' tbody tr').remove();
        return isDirty;
    }
}