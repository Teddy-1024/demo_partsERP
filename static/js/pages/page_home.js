
import { PageBase } from "./page_base.js";

export class PageHome extends PageBase {
    static hash = hashPageHome;

    constructor() {
        super();
    }

    initialize() {
        this.sharedInitialize();
        this.hookupButtonsContactUs();
    }

    leave() {
        super.leave();
    }
}
