
// Pages
// Core
import PageAdminHome from './pages/core/admin_home.js';
import PageHome from './pages/core/home.js';
import PageContact from './pages/core/contact.js';
import PageServices from './pages/core/services.js';
// Legal
import PageAccessibilityReport from './pages/legal/accessibility_report.js';
import PageAccessibilityStatement from './pages/legal/accessibility_statement.js';
import PageLicense from './pages/legal/license.js';
// Store
import PageStoreBasket from './pages/store/basket.js';
import PageStoreHome from './pages/store/home.js';
import PageStoreManufacturingPurchaseOrders from './pages/store/manufacturing_purchase_orders.js';
import PageStoreProductCategories from './pages/store/product_categories.js';
import PageStoreProductPermutations from './pages/store/product_permutations.js';
// import PageStoreProductPrices from './pages/store/product_prices.js';
import PageStoreProducts from './pages/store/products.js';
import PageStoreProductVariations from './pages/store/product_variations.js';
import PageStoreStockItems from './pages/store/stock_items.js';
import PageStoreSuppliers from './pages/store/suppliers.js';
import PageStoreSupplierPurchaseOrders from './pages/store/supplier_purchase_orders.js';
// User
// import PageUserLogin from './pages/user/login.js';
// import PageUserLogout from './pages/user/logout.js';
// import PageUserAccount from './pages/user/account.js';


import API from './api.js';
import DOM from './dom.js';
import PagePrivacyPolicy from './pages/legal/privacy_policy.js';
import PageRetentionSchedule from './pages/legal/retention_schedule.js';

export default class Router {
    constructor() {
        // Pages
        this.pages = {};
        // Core
        this.pages[hashPageHome] = { name: 'PageHome', module: PageAdminHome }; //  importModule: () => import(/* webpackChunkName: "page_core_home" */ './pages/core/home.js') , pathModule: './pages/core/home.js'
        this.pages[hashPageContact] = { name: 'PageContact', module: PageContact }; // pathModule: './pages/core/contact.js' };
        this.pages[hashPageServices] = { name: 'PageServices', module: PageServices }; // pathModule: './pages/core/services.js' };
        this.pages[hashPageAdminHome] = { name: 'PageAdminHome', module: PageAdminHome }; // pathModule: './pages/core/admin_home.js' };
        // Legal
        this.pages[hashPageAccessibilityStatement] = { name: 'PageAccessibilityStatement', module: PageAccessibilityStatement }; // pathModule: '../../static/js/pages/legal/accessibility_statement.js' }; // , page: PageAccessibilityStatement
        this.pages[hashPageDataRetentionSchedule] = { name: 'PageDataRetentionSchedule', module: PageRetentionSchedule }; // pathModule: './pages/legal/data_retention_schedule.js' };
        this.pages[hashPageLicense] = { name: 'PageLicense', module: PageLicense }; // pathModule: './pages/legal/license.js' };
        this.pages[hashPagePrivacyPolicy] = { name: 'PagePrivacyPolicy', module: PagePrivacyPolicy }; // pathModule: './pages/legal/privacy_policy.js' }; // importModule: () => {return import(/* webpackChunkName: "page_privacy_policy" */ './pages/legal/privacy_policy.js'); }
        // Store
        this.pages[hashPageStoreManufacturingPurchaseOrders] = { name: 'PageManufacturingPurchaseOrders', module: PageStoreManufacturingPurchaseOrders }; // pathModule
        this.pages[hashPageStoreProductCategories] = { name: 'PageStoreProductCategories', module: PageStoreProductCategories }; // pathModule: './pages/store/product_categories.js' };
        this.pages[hashPageStoreProductPermutations] = { name: 'PageStoreProductPermutations', module: PageStoreProductPermutations }; // pathModule: './pages/store/product_permutations.js' };
        // this.pages[hashPageStoreProductPrices] = { name: 'PageStoreProductPrices', module: PageStoreProductPrices }; // pathModule: './pages/store/product_prices.js' };
        this.pages[hashPageStoreProducts] = { name: 'PageStoreProducts', module: PageStoreProducts }; // pathModule: './pages/store/products.js' };
        this.pages[hashPageStoreProductVariations] = { name: 'PageStoreProductVariations', module: PageStoreProductVariations }; // pathModule: './pages/store/product_variations.js' };
        this.pages[hashPageStoreStockItems] = { name: 'PageStoreStockItems', module: PageStoreStockItems };
        this.pages[hashPageStoreSuppliers] = { name: 'PageStoreSuppliers', module: PageStoreSuppliers };
        this.pages[hashPageStoreSupplierPurchaseOrders] = { name: 'PageSupplierPurchaseOrders', module: PageStoreSupplierPurchaseOrders };
        // User
        // this.pages[hashPageUserLogin] = { name: 'PageUserLogin', module: PageUserLogin }; // pathModule: './pages/user/login.js' };
        // this.pages[hashPageUserLogout] = { name: 'PageUserLogout', module: PageUserLogout }; // pathModule: './pages/user/logout.js' };
        // this.pages[hashPageUserAccount] = { name: 'PageUserAccount', module: PageUserAccount }; // pathModule: './pages/user/account.js' };
        
        // Routes
        this.routes = {};
        // Core
        this.routes[hashPageHome] = (isPopState = false) => this.navigateToHash(hashPageHome, isPopState);
        this.routes[hashPageContact] = (isPopState = false) => this.navigateToHash(hashPageContact, isPopState);
        this.routes[hashPageServices] = (isPopState = false) => this.navigateToHash(hashPageServices, isPopState);
        this.routes[hashPageAdminHome] = (isPopState = false) => this.navigateToHash(hashPageAdminHome, isPopState);
        // Legal
        this.routes[hashPageAccessibilityStatement] = (isPopState = false) => this.navigateToHash(hashPageAccessibilityStatement, isPopState);
        this.routes[hashPageDataRetentionSchedule] = (isPopState = false) => this.navigateToHash(hashPageDataRetentionSchedule, isPopState);
        this.routes[hashPageLicense] = (isPopState = false) => this.navigateToHash(hashPageLicense, isPopState);
        this.routes[hashPagePrivacyPolicy] = (isPopState = false) => this.navigateToHash(hashPagePrivacyPolicy, isPopState);
        // Store
        this.routes[hashPageStoreManufacturingPurchaseOrders] = (isPopState = false) => this.navigateToHash(hashPageStoreManufacturingPurchaseOrders, isPopState);
        this.routes[hashPageStoreProductCategories] = (isPopState = false) => this.navigateToHash(hashPageStoreProductCategories, isPopState);
        this.routes[hashPageStoreProductPermutations] = (isPopState = false) => this.navigateToHash(hashPageStoreProductPermutations, isPopState);
        // this.routes[hashPageStoreProductPrices] = (isPopState = false) => this.navigateToHash(hashPageStoreProductPrices, isPopState);
        this.routes[hashPageStoreProducts] = (isPopState = false) => this.navigateToHash(hashPageStoreProducts, isPopState);
        this.routes[hashPageStoreProductVariations] = (isPopState = false) => this.navigateToHash(hashPageStoreProductVariations, isPopState);
        this.routes[hashPageStoreStockItems] = (isPopState = false) => this.navigateToHash(hashPageStoreStockItems, isPopState);
        this.routes[hashPageStoreSuppliers] = (isPopState = false) => this.navigateToHash(hashPageStoreSuppliers, isPopState);
        this.routes[hashPageStoreSupplierPurchaseOrders] = (isPopState = false) => this.navigateToHash(hashPageStoreSupplierPurchaseOrders, isPopState);
        // User
        // this.routes[hashPageUserLogin] = (isPopState = false) => this.navigateToHash(hashPageUserLogin, isPopState);
        // this.routes[hashPageUserLogout] = (isPopState = false) => this.navigateToHash(hashPageUserLogout, isPopState);
        // this.routes[hashPageUserAccount] = (isPopState = false) => this.navigateToHash(hashPageUserAccount, isPopState);
        this.initialize();
    }
    loadPage(hashPage, isPopState = false) {
        const PageClass = this.getClassPageFromHash(hashPage);
        this.currentPage = new PageClass(this);
        this.currentPage.initialize(isPopState);
        window.addEventListener('beforeunload', () => this.currentPage.leave());
    }
    getClassPageFromHash(hashPage) {
        
        let pageJson = this.pages[hashPage];
        try {
            /*
            const module = await pagesContext(pageJson.pathModule);
            console.log("module: ", module);
            return module[pageJson.name];
            */
            // const module = await import(pageJson.pathModule); //  pageJson.page;
            // const module = () => import(pageJson.pathModule);
            const module = pageJson.module; // importModule;
            return module; // [pageJson.name];
        }
        catch (error) {
            if (_verbose) { console.log("this.pages: ", this.pages); };
            console.error('Page not found:', hashPage);
            throw error;
        }
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
        // this.beforeLeave();
        /*
        if (this.routes[hash]) {
            this.routes[hash](isPopState);
        } else {
            console.error(`Hash ${hash} not found`);
        }
        */
        let url = API.getUrlFromHash(hash, params);
        // if (!isPopState) 
        history.pushState({data: data, params: params}, '', hash);
        API.goToUrl(url, data);
    }
    /* beforeunload listener
    async beforeLeave() {
        const ClassPageCurrent = await this.getClassPageFromHash(DOM.getHashPageCurrent());
        const pageCurrent = new ClassPageCurrent(this);
        pageCurrent.leave();
    }
    */
    navigateToUrl(url, data = null, appendHistory = true) {
        // this.beforeLeave();
        if (appendHistory) history.pushState(data, '', url);
        url = API.parameteriseUrl(url, data);
        API.goToUrl(url);
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
        if (!Validation.isEmpty(parameters)) {
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
        DOM.loadPageBody(response.data);
    }
}

export const router = new Router();

/*
router.addRoute('/', () => {
    console.log('Home page');
    // Load home page content
});

router.addRoute('/about', () => {
    console.log('About page');
    // Load about page content
});

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