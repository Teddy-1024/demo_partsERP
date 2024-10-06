import BasePage from "../base.js";

export default class PageAccessibilityReport extends BasePage {
    static hash = hashPageAccessibilityReport;

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
