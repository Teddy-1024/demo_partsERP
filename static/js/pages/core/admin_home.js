
import Events from "../../lib/events.js";
import BasePage from "../base.js";

export default class PageAdminHome extends BasePage {
    static hash = hashPageAdminHome;

    constructor(router) {
        super(router);
    }

    initialize() {
        this.sharedInitialize();
        this.hookupAdminStore();
    }
    
    hookupAdminStore() {
        this.hookupButtonsNavStoreProductCategories();
        this.hookupButtonsNavStoreProducts();
        this.hookupButtonsNavStoreProductPermutations();
        this.hookupButtonsNavStoreProductPrices();
        this.hookupButtonsNavStoreStockItems();
        this.hookupButtonsNavStoreProductVariations();

        this.hookupButtonsNavAdminStoreStripeProducts();
        this.hookupButtonsNavAdminStoreStripePrices();
    }
    hookupButtonsNavAdminStoreStripeProducts() {
        Events.initialiseEventHandler('.' + flagNavAdminStoreStripeProducts, flagInitialised, function(navigator) {
            navigator.addEventListener("click", function(event) {
                this.router.navigateToHash(hashPageAdminStoreStripeProducts);
            });
        });
    }
    hookupButtonsNavAdminStoreStripePrices() {
        Events.initialiseEventHandler('.' + flagNavAdminStoreStripePrices, flagInitialised, function(navigator) {
            navigator.addEventListener("click", function(event) {
                this.router.navigateToHash(hashPageAdminStoreStripePrices);
            });
        });
    }

    leave() {
        super.leave();
    }
}
