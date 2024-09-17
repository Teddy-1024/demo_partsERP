import BasePage from "../base.js";

export default class PageAccessibilityStatement extends BasePage {
    static hash = hashPageAccessibilityStatement;

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
