
/*
import { PageAdminHome } from './pages/core/admin_home.js';
import { PageHome } from './pages/core/home.js';
import { PageContact } from './pages/core/contact.js';
import { PageAccessibilityStatement } from './pages/legal/accessibility_statement.js';
import { PageLicense } from './pages/legal/license.js';
import { PageServices } from './pages/core/services.js';
import { PageStoreBasket } from './pages/store/basket.js';
import { PageStoreHome } from './pages/store/home.js';
import { PageStoreProductCategories } from './pages/store/product_categories.js';
import { PageStoreProductPermutations } from './pages/store/product_permutations.js';
// import { PageStoreProductPrices } from './pages/store/product_prices.js';
// import { PageStoreProducts } from './pages/store/products.js';
// import { PageStoreProductVariations } from './pages/store/product_variations.js';
import { PageStoreStockItems } from './pages/store/stock_items.js';
*/
import API from './api.js';
import DOM from './dom.js';

export default class Router {
    constructor() {
        // Pages
        this.pages = {};
        // Core
        this.pages[hashPageHome] = { name: 'PageHome', pathModule: './pages/core/home.js' };
        this.pages[hashPageContact] = { name: 'PageContact', pathModule: './pages/core/contact.js' };
        this.pages[hashPageServices] = { name: 'PageServices', pathModule: './pages/core/services.js' };
        this.pages[hashPageAdminHome] = { name: 'PageAdminHome', pathModule: './pages/core/admin_home.js' };
        // Legal
        this.pages[hashPageAccessibilityStatement] = { name: 'PageAccessibilityStatement', pathModule: './pages/legal/accessibility_statement.js' };
        this.pages[hashPageLicense] = { name: 'PageLicense', pathModule: './pages/legal/license.js' };
        // Store
        this.pages[hashPageStoreProductCategories] = { name: 'PageStoreProductCategories', pathModule: './pages/store/product_categories.js' };
        this.pages[hashPageStoreProductPermutations] = { name: 'PageStoreProductPermutations', pathModule: './pages/store/product_permutations.js' };
        // this.pages[hashPageStoreProductPrices] = { name: 'PageStoreProductPrices', pathModule: './pages/store/product_prices.js' };
        this.pages[hashPageStoreProducts] = { name: 'PageStoreProducts', pathModule: './pages/store/products.js' };
        // this.pages[hashPageStoreProductVariations] = { name: 'PageStoreProductVariations', pathModule: './pages/store/product_variations.js' };
        // User
        // this.pages[hashPageUserLogin] = { name: 'PageUserLogin', pathModule: './pages/user/login.js' };
        // this.pages[hashPageUserLogout] = { name: 'PageUserLogout', pathModule: './pages/user/logout.js' };
        // this.pages[hashPageUserAccount] = { name: 'PageUserAccount', pathModule: './pages/user/account.js' };
        
        // Routes
        this.routes = {};
        // Core
        this.routes[hashPageHome] = (isPopState = false) => this.navigateToHash(hashPageHome, isPopState);
        this.routes[hashPageContact] = (isPopState = false) => this.navigateToHash(hashPageContact, isPopState);
        this.routes[hashPageServices] = (isPopState = false) => this.navigateToHash(hashPageServices, isPopState);
        this.routes[hashPageAdminHome] = (isPopState = false) => this.navigateToHash(hashPageAdminHome, isPopState);
        // Legal
        this.routes[hashPageAccessibilityStatement] = (isPopState = false) => this.navigateToHash(hashPageAccessibilityStatement, isPopState);
        this.routes[hashPageLicense] = (isPopState = false) => this.navigateToHash(hashPageLicense, isPopState);
        // Store
        this.routes[hashPageStoreProductCategories] = (isPopState = false) => this.navigateToHash(hashPageStoreProductCategories, isPopState);
        this.routes[hashPageStoreProductPermutations] = (isPopState = false) => this.navigateToHash(hashPageStoreProductPermutations, isPopState);
        // this.routes[hashPageStoreProductPrices] = (isPopState = false) => this.navigateToHash(hashPageStoreProductPrices, isPopState);
        this.routes[hashPageStoreProducts] = (isPopState = false) => this.navigateToHash(hashPageStoreProducts, isPopState);
        // this.routes[hashPageStoreProductVariations] = (isPopState = false) => this.navigateToHash(hashPageStoreProductVariations, isPopState);
        // User
        // this.routes[hashPageUserLogin] = (isPopState = false) => this.navigateToHash(hashPageUserLogin, isPopState);
        // this.routes[hashPageUserLogout] = (isPopState = false) => this.navigateToHash(hashPageUserLogout, isPopState);
        // this.routes[hashPageUserAccount] = (isPopState = false) => this.navigateToHash(hashPageUserAccount, isPopState);
        this.initialize();
    }
    async loadPage(hashPage, isPopState = false) {
        const PageClass = await this.getClassPageFromHash(hashPage);
        this.currentPage = new PageClass();
        this.currentPage.initialize(isPopState);
    }
    async getClassPageFromHash(hashPage) {
        let pageJson = this.pages[hashPage];
        const module = await import(pageJson.pathModule);
        return module[pageJson.name];
    }
    initialize() {
        /*
        let pages = Router.getPages();
        for (const key of Object.keys(pages)) {
            let page = pages[key];
            this.addRoute(page.hash, page.initialize);
        }
        */
        window.addEventListener('popstate', this.handlePopState.bind(this)); // page accessed by history navigation
    }
    handlePopState(event) {
        this.loadPageCurrent();
    }
    loadPageCurrent() {
        const hashPageCurrent = DOM.getHashPageCurrent();
        this.loadPage(hashPageCurrent);
    }
    navigateToHash(hash, data = null, params = null, isPopState = false) {
        this.beforeLeave();
        /*
        if (this.routes[hash]) {
            console.log("navigating to hash: " + hash);
            this.routes[hash](isPopState);
        } else {
            console.error(`Hash ${hash} not found`);
        }
        */
        let url = API.getUrlFromHash(hash, params);
        // if (!isPopState) 
        history.pushState(data, '', url);
        API.goToUrl(url, data);
    }
    async beforeLeave() {
        const ClassPageCurrent = await this.getClassPageFromHash(DOM.getHashPageCurrent());
        const pageCurrent = new ClassPageCurrent();
        pageCurrent.leave();
    }

    /*
    static getPages() {
        let pages = {};
        pages[hashPageAccessibilityStatement] = PageAccessibilityStatement;
        pages[hashPageAdminHome] = PageAdminHome;
        pages[hashPageHome] = PageHome;
        pages[hashPageContact] = PageContact;
        pages[hashPageLicense] = PageLicense;
        pages[hashPageServices] = PageServices;
        pages[hashPageStoreBasket] = PageStoreBasket;
        pages[hashPageStoreHome] = PageStoreHome;
        pages[hashPageStoreProductCategories] = PageStoreProductCategories;
        pages[hashPageStoreProductPermutations] = PageStoreProductPermutations;
        // pages[hashPageStoreProductPrices] = PageStoreProductPrices;
        // pages[hashPageStoreProducts] = PageStoreProducts;
        // pages[hashPageStoreProductVariations] = PageStoreProductVariations;
        pages[hashPageStoreStockItems] = PageStoreStockItems;
        console.log("pages: ", pages);
        return pages;
    }

    addRoute(path, handler) {
        this.routes[path] = handler;
    }

    handlePopState(event) {
        /*
        let url = window.location.pathname;
        url = url.split('?')[0];
        let hash = url.replace(_pathHost, '');
        console.log("handlePopState: " + hash);
        this.handleRouteHash(hash);
        *
        let pageCurrent = Router.getPageCurrent();
        pageCurrent.initialize(true);
    }

    navigateToHash(hash, data = null) {
        const url = API.getUrlFromHash(hash);
        this.navigateToUrl(url, data);
    }

    navigateToUrl(url, data = null, appendHistory = true) {
        this.leavePageCurrent();
        if (appendHistory) history.pushState(data, '', url);
        url = Router.parameteriseUrl(url, data);
        Router.#goToUrl(url);
    }

    leavePageCurrent() {
        const pageCurrent = Router.getPageCurrent();
        if (pageCurrent) pageCurrent.leave();
    }
    
    static getPageCurrent() {
        if (_pageCurrent) return _pageCurrent;
        const hashPageCurrent = DOM.getHashPageCurrent();
        console.log("hashPageCurrent: " + hashPageCurrent);
        const pages = Router.getPages();
        let page;
        for (const key of Object.keys(pages)) {
            page = pages[key];
            console.log("page hashL ", page.hash);
            if (page.hash == hashPageCurrent) return new page();
        }
        throw new Error('Page not found: ' + hashPageCurrent);
    }

    static parameteriseUrl(url, parameters) {
        if (!isEmpty(parameters)) {
            url += '%3F'; // '?';
            let firstParameter = true;
            for (var p in parameters) {
                if (!firstParameter) {
                    url += '&';
                } else {
                    firstParameter = false;
                }
                url += parameters[p];
            }
        }
        return url;
    }
    */

    /*
    handleRouteUrl(url) {
        const path = url.split('?')[0]; // Remove query parameters
        if (this.routes[path]) {
            this.routes[path]();
        } else if (url.includes('auth0.com')) {
            Router.goToUrl(url);
        } else {
            console.warn('No handler found for path:', path);
            // Optionally, handle 404 or redirect to a default route
        }
    }

    handleRouteHash(hash) {
        if (this.routes[hash]) {
            this.routes[hash]();
        } else {
            console.warn('No handler found for hash:', hash);
        }
    }
    */
    
    /*
    static htmlEncode(value) {
        return document.createElement('<div/>').text(value).innerHTML;
    }
    
    static htmlDecode(value) {
        if (_domParser == null) _domParser = DOMParser(); // https://www.w3docs.com/snippets/javascript/how-to-html-encode-a-string.html
        return _domParser.parseFromString(value, 'text/html').documentElement.textContent;
    }
    */

    // Additional utility methods
    /*
    static getQueryParams() {
        return Object.fromEntries(new URLSearchParams(window.location.search));
    }

    static updateQueryParams(params) {
        const searchParams = new URLSearchParams(window.location.search);
        for (const [key, value] of Object.entries(params)) {
            searchParams.set(key, value);
        }
        const newUrl = `${window.location.pathname}?${searchParams.toString()}`;
        history.replaceState(null, '', newUrl);
    }
    */
   
    static loadPageBodyFromResponse(response) {
        console.log(response.data);
        DOM.loadPageBody(response.data);
    }
}

// Create and export a singleton instance
export const router = new Router();
// import this for navigation

// Usage example (you can put this in your main.js or app.js)
/*
router.addRoute('/', () => {
    console.log('Home page');
    // Load home page content
});

router.addRoute('/about', () => {
    console.log('About page');
    // Load about page content
});

// Example of how to use the router in other parts of your application
export function setupNavigationEvents() {
    document.querySelectorAll('a[data-nav]').forEach(link => {
        link.addEventListener('click', (e) => {
            e.preventDefault();
            const url = e.target.getAttribute('href');
            router.navigateToUrl(url);
        });
    });
}
*/