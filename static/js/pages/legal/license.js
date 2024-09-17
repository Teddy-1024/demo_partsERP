
import BasePage from "../base.js";

export default class PageLicense extends BasePage {
    static hash = hashPageLicense;

    constructor(router) {
        super(router);
    }

    initialize() {
        this.sharedInitialize();
    }

    leave() {
        super.leave();
    }
}