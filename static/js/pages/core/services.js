
import BasePage from "../base.js";

export default class PageServices extends BasePage {
    static hash = hashPageServices;

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

