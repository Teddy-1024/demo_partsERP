
import BasePage from "../base.js";

export default class PageUser extends BasePage {
    static hash = hashPageUser;

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
