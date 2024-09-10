
import { BasePage } from "../base.js";

export class PageServices extends BasePage {
    static hash = hashPageServices;

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

