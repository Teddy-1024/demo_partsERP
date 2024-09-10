
import { BasePage } from "../base.js";

export class PageStoreHome extends BasePage {
    static hash = hashPageStoreHome;

    constructor() {
        super();
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
