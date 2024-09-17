
import BasePage from "../base.js";

export default class PageContact extends BasePage {
    static hash = hashPageContact;

    constructor(router) {
        super(router);
    }

    initialize() {
        this.sharedInitialize();
    }
}
