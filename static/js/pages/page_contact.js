
import { PageBase } from "./page_base.js";

export class PageContact extends PageBase {
    static hash = hashPageContact;

    constructor() {
        super();
    }

    initialize() {
        this.sharedInitialize();
    }
}
