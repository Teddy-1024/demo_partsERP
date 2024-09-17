import BasePage from "../base.js";

export default class PageRetentionSchedule extends BasePage {
    static hash = hashPageDataRetentionSchedule;

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
