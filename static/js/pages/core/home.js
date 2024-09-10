
import { BasePage } from "../base.js";

export class PageHome extends BasePage {
    static hash = hashPageHome;

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
