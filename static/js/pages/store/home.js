
import BasePage from "../base.js";

export default class PageStoreHome extends BasePage {
    static hash = hashPageStoreHome;

    constructor(router) {
        super(router);
    }

    initialize() {
        this.sharedInitialize();
        this.hookupFiltersStore();
        this.hookupStoreHome();
    }

    leave() {
        super.leave();
    }
}
