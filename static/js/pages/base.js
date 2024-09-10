import API from "../api.js";
import DOM from "../dom.js";
import { router } from "../router.js";

export class BasePage {
    constructor() {
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

        initialiseEventHandler(idButtonHamburger, flagInitialised, function(buttonToggleOverlayNavigation) {
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
        initialiseEventHandler('.' + flagNavHome, flagInitialised, function(navigator) {
            navigator.addEventListener("click", function(event) {
                event.stopPropagation();
                router.navigateToHash(hashPageHome);
            });
        });
    }
    hookupButtonNavServices() {        
        initialiseEventHandler('.' + flagNavServices, flagInitialised, function(navigator) {
            navigator.addEventListener("click", function(event) {
                event.stopPropagation();
                console.log('going to services page');
                router.navigateToHash(hashPageServices);
            });
        });
    }
    hookupButtonNavContact() {        
        initialiseEventHandler('.' + flagNavContact, flagInitialised, function(navigator) {
            navigator.addEventListener("click", function(event) {
                event.stopPropagation();
                router.navigateToHash(hashPageContact);
            });
        });
    }
    hookupButtonNavUserAccount() {        
        initialiseEventHandler('.' + flagNavUserAccount, flagInitialised, function(navigator) {
            navigator.addEventListener("click", function(event) {
                event.stopPropagation();
                router.navigateToHash(hashPageUserAccount);
            });
        });
    }
    hookupButtonNavUserLogout() {        
        initialiseEventHandler('.' + flagNavUserLogout, flagInitialised, function(navigator) {
            navigator.addEventListener("click", function(event) {
                event.stopPropagation();
                router.navigateToHash(hashPageUserLogout);
            });
        });
    }
    hookupButtonNavUserLogin() {        
        initialiseEventHandler('.' + flagNavUserLogin, flagInitialised, function(navigator) {
            navigator.addEventListener("click", function(event) {
                event.stopPropagation();
                // router.navigateToHash(hashPageUserLogin);
                /*
                let dataRequest = {};
                dataRequest[keyCallback] = hashPageCurrent;
                console.log('sending data to user login controller: '); 
                console.log(dataRequest);
                */
                API.loginUser()
                    .then(function(response) {
                    if (response.Success) {
                        window.app.router.navigateToUrl(response[keyCallback], null, false);
                    } else {
                        alertError("Error", response.Message);
                    }
                });
            });
        });
    }
    hookupButtonNavStoreHome() {        
        initialiseEventHandler('.' + flagNavStoreHome, flagInitialised, function(navigator) {
            navigator.addEventListener("click", function(event) {
                event.stopPropagation();
                router.navigateToHash(hashPageStoreHome);
            });
        });
    }
    hookupButtonNavStoreProductCategories() {
        initialiseEventHandler('.' + flagNavStoreProductCategories, flagInitialised, function(navigator) {
            navigator.addEventListener("click", function(event) {
                event.stopPropagation();
                router.navigateToHash(hashPageStoreProductCategories);
            });
        });
    }
    hookupButtonNavStoreProducts() {
        initialiseEventHandler('.' + flagNavStoreProducts, flagInitialised, function(navigator) {
            navigator.addEventListener("click", function(event) {
                event.stopPropagation();
                router.navigateToHash(hashPageStoreProducts);
            });
        });
    }
    hookupButtonNavStoreProductPermutations() {
        initialiseEventHandler('.' + flagNavStoreProductPermutations, flagInitialised, function(navigator) {
            navigator.addEventListener("click", function(event) {
                event.stopPropagation();
                router.navigateToHash(hashPageStoreProductPermutations);
            });
        });
    }
    hookupButtonNavStoreProductPrices() {
        initialiseEventHandler('.' + flagNavStoreProductPrices, flagInitialised, function(navigator) {
            navigator.addEventListener("click", function(event) {
                event.stopPropagation();
                router.navigateToHash(hashPageStoreProductPrices);
            });
        });
    }
    hookupButtonNavStoreProductVariations() {
        initialiseEventHandler('.' + flagNavStoreProductVariations, flagInitialised, function(navigator) {
            navigator.addEventListener("click", function(event) {
                event.stopPropagation();
                router.navigateToHash(hashPageStoreProductVariations);
            });
        });
    }
    hookupButtonNavStoreStockItems() {
        initialiseEventHandler('.' + flagNavStoreStockItems, flagInitialised, function(navigator) {
            navigator.addEventListener("click", function(event) {
                event.stopPropagation();
                router.navigateToHash(hashPageStoreStockItems);
            });
        });
    }
    hookupButtonNavAdminHome() {
        initialiseEventHandler('.' + flagNavAdminHome, flagInitialised, function(navigator) {
            navigator.addEventListener("click", function(event) {
                event.stopPropagation();
                router.navigateToHash(hashPageAdminHome);
            });
        });
    }

    hookupImagesLogo() {
        let selectorImagesLogo = "img." + flagImageLogo;
        initialiseEventHandler(selectorImagesLogo, flagInitialised, function(imageLogo) {
            imageLogo.addEventListener("click", function(event) {
                event.stopPropagation();
                router.navigateToHash(hashPageHome);
            });
        });
    }

    hookupOverlayFromId(idOverlay) {
        initialiseEventHandler(idOverlay, flagInitialised, function(overlay) {
            overlay.querySelector('button.' + flagClose).addEventListener("click", function(event) {
                event.stopPropagation();
                overlay.css('display', 'none');
            });
        });
    }

    
    hookupButtonSave() {
        initialiseEventHandler('form.' + flagFilter + ' button.' + flagSave, flagInitialised, function(button) {
            button.addEventListener("click", function(event) {
                event.stopPropagation();
                showOverlayConfirm();
            });
            button.classList.add(flagCollapsed);
        });
    }

    hookupVideos() {
        initialiseEventHandler('video', flagInitialised, function(video) {
            video.addEventListener("mouseover", videoPlay(video));
            video.addEventListener("mouseout", videoPause(video));
        });
    }

    leave() {
        console.log('Leaving ' + this.title + ' page');
        _pageCurrent = null;
        if (this.constructor === BasePage) {
            throw new Error("Must implement leave() method.");
        }
    }
    setLocalStoragePage(dataPage) {
        setLocalStorage(this.constructor.hash, dataPage);
    }
    getLocalStoragePage() {
        return getLocalStorage(this.constructor.hash);
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