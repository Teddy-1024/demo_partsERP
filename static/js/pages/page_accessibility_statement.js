import { PageBase } from "./page_base.js";

export class PageAccessibilityStatement extends PageBase {
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
