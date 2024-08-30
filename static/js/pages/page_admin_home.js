
import { PageBase } from "./page_base.js";
import { router } from "../router.js";

export class PageAdminHome extends PageBase {
    static hash = hashPageAdminHome;

    constructor() {
        super();
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
        initialiseEventHandler('.' + flagNavAdminStoreStripeProducts, flagInitialised, function(navigator) {
            navigator.addEventListener("click", function(event) {
                router.navigateToHash(hashPageAdminStoreStripeProducts);
            });
        });
    }
    hookupButtonNavAdminStoreStripePrices() {
        initialiseEventHandler('.' + flagNavAdminStoreStripePrices, flagInitialised, function(navigator) {
            navigator.addEventListener("click", function(event) {
                router.navigateToHash(hashPageAdminStoreStripePrices);
            });
        });
    }

    leave() {
        super.leave();
    }
}
