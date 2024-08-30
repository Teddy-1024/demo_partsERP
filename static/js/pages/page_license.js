
import { PageBase } from "./page_base.js";

export class PageLicense extends PageBase {
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