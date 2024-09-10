
import { BasePage } from "../base.js";

export class PageUser extends BasePage {
    static hash = hashPageUser;

    constructor() {
        super();
    }

    initialize() {
        this.sharedInitialize();
        this.hookupButtonNavContact();
    }

    leave() {
        super.leave();
    }
}
