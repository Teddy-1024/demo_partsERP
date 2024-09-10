import { BasePage } from "../base.js";

export class PageAccessibilityStatement extends BasePage {
    static hash = hashPageAccessibilityStatement;

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
