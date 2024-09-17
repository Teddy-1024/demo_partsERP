
import BasePage from "../base.js";

export default class PagePrivacyPolicy extends BasePage {
    static hash = hashPagePrivacyPolicy;

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