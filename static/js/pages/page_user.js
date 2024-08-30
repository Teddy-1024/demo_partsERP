
import { PageBase } from "./page_base.js";

export class PageUser extends PageBase {
    static hash = hashPageUser;

    constructor() {
        super();
    }

    initialize() {
        this.sharedInitialize();
        hookupButtonsContactUs();
    }

    leave() {
        super.leave();
    }
}
