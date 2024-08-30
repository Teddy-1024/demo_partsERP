
import { PageBase } from "./page_base.js";

export class PageServices extends PageBase {
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

