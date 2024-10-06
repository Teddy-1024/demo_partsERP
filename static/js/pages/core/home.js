
import BasePage from "../base.js";

export default class PageHome extends BasePage {
    static hash = hashPageHome;

    constructor(router) {
        super(router);
    }

    initialize() {
        this.sharedInitialize();
        this.hookupButtonsNavContact();
    }

    leave() {
        super.leave();
    }
}
