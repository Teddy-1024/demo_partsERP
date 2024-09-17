
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
        this.hookupButtonNavStoreProductCategories();
        this.hookupButtonNavStoreProducts();
        this.hookupButtonNavStoreProductPermutations();
        this.hookupButtonNavStoreProductPrices();
        this.hookupButtonNavStoreStockItems();
        this.hookupButtonNavStoreProductVariations();

        this.hookupButtonNavAdminStoreStripeProducts();
        this.hookupButtonNavAdminStoreStripePrices();
    }
    hookupButtonNavAdminStoreStripeProducts() {
        Events.initialiseEventHandler('.' + flagNavAdminStoreStripeProducts, flagInitialised, function(navigator) {
            navigator.addEventListener("click", function(event) {
                this.router.navigateToHash(hashPageAdminStoreStripeProducts);
            });
        });
    }
    hookupButtonNavAdminStoreStripePrices() {
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
