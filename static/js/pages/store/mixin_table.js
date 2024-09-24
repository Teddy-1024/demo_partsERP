
import Events from "../../lib/events.js";
import LocalStorage from "../../lib/local_storage.js";
import Validation from "../../lib/validation.js";
// import BasePage from "../base.js";
import DOM from "../../dom.js";
import { isEmpty } from "../../lib/utils.js";
import StoreMixinPage from "./mixin.js";

export default class StoreTableMixinPage extends StoreMixinPage {
    constructor(pageCurrent) {
        super(pageCurrent);
    }
    initialize() {
        super.initialize();
        this.hookupFilters();
        this.hookupTable();
    }
    hookupFilters() {
        // Implement filter-specific functionality here
    }
    hookupTable() {
        // Implement table-specific functionality here
    }
}