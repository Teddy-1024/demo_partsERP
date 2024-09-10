
import { BasePage } from "../base.js";

export class PageContact extends BasePage {
    static hash = hashPageContact;

    constructor() {
        super();
    }

    initialize() {
        this.sharedInitialize();
    }
}
