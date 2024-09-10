
import { BasePage } from "../base.js";

export class PageLicense extends BasePage {
    static hash = hashPageLicense;

    constructor() {
        super();
    }

    initialize() {
        this.sharedInitialize();
    }

    leave() {
        super.leave();
    }
}