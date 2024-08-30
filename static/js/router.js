
import { PageAdminHome } from './pages/page_admin_home.js';
import { PageHome } from './pages/page_home.js';
import { PageContact } from './pages/page_contact.js';
import { PageAccessibilityStatement } from './pages/page_accessibility_statement.js';
import { PageLicense } from './pages/page_license.js';
import { PageServices } from './pages/page_services.js';
import { PageStoreBasket } from './pages/page_store_basket.js';
import { PageStoreHome } from './pages/page_store_home.js';
import { PageStoreProductCategories } from './pages/page_store_product_categories.js';
import { PageStoreProductPermutations } from './pages/page_store_product_permutations.js';
// import { PageStoreProductPrices } from './pages/page_store_product_prices.js';
// import { PageStoreProducts } from './pages/page_store_products.js';
// import { PageStoreProductVariations } from './pages/page_store_product_variations.js';
import { PageStoreStockItems } from './pages/page_store_stock_items.js';
import DOM from './dom.js';

export default class Router {
    constructor() {
        this.routes = {};
        this.initialize();
    }

    initialize() {
        let pages = Router.getPages();
        for (const key of Object.keys(pages)) {
            let page = pages[key];
            this.addRoute(page.hash, page.initialize);
        }
        window.addEventListener('popstate', this.handlePopState.bind(this)); // page accessed by history navigation
    }

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
        let url = window.location.pathname;
        url = url.split('?')[0];
        let hash = url.replace(_pathHost, '');
        console.log("handlePopState: " + hash);
        this.handleRouteHash(hash);
    }

    navigateToHash(hash, data = null) {
        const url = Router.getUrlFromHash(hash);
        this.navigateToUrl(url, data);
    }
    
    static getUrlFromHash(hash) {
        if (hash == null) hash = hashPageHome;
        console.log("getUrlFromHash:");
        console.log("base url: " + _pathHost + "\nhash: " + hash);
        return _pathHost + hash;
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

    static #goToUrl(url) {
        window.location.href = url;
    }
    
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