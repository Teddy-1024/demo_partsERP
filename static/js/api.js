import DOM from './dom.js';

// Module for API calls
export default class API {
    
    static getCsrfToken() {
        return document.querySelector(idCSRFToken).getAttribute('content');
    }
    
    static async request(hashEndpoint, method = 'GET', data = null, params = null) {
        const url = API.getUrlFromHash(hashEndpoint, params);
        const csrfToken = API.getCsrfToken();
        const options = {
            method,
            headers: {
                'Content-Type': 'application/json',
                [flagCsrfToken]: csrfToken,
            }
        };

        if (data && (method === 'POST' || method === 'PUT' || method === 'PATCH')) {
            data = { 
                ...data, 
                [flagCsrfToken]: csrfToken,
            };
            options.body = JSON.stringify(data);
        }

        try {
            const response = await fetch(url, options);
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return await response.json();
        } catch (error) {
            console.error('API request failed:', error);
            throw error;
        }
    }
    
    static getUrlFromHash(hash, params = null) {
        if (hash == null) hash = hashPageHome;
        let url = API.parameteriseUrl(_pathHost + hash, params);
        return url;
    }
    static parameteriseUrl(url, params) {
        if (params) {
            url += '?' + new URLSearchParams(params).toString();
        }
        return url;
    }
    static goToUrl(url) {
        window.location.href = url;
    }
    static goToHash(hash, params = null) {
        const url = API.getUrlFromHash(hash, params);
        API.goToUrl(url);
    }

    
    // specific api calls
    /* Example:
    getUsers: () => request('/users'),
    getUserById: (id) => request(`/users/${id}`),
    createUser: (userData) => request('/users', 'POST', userData),
    updateUser: (id, userData) => request(`/users/${id}`, 'PUT', userData),
    deleteUser: (id) => request(`/users/${id}`, 'DELETE'),
    */
    static async loginUser() {
        let callback = {};
        callback[flagCallback] = DOM.getHashPageCurrent();
        return await API.request(hashPageUserLogin, 'POST', callback);
    }

    // store
    // product categories
    static async saveCategories(categories, formFilters, comment) {
        let dataRequest = {};
        dataRequest[flagFormFilters] = DOM.convertForm2JSON(formFilters);
        dataRequest[flagProductCategory] = categories;
        dataRequest[flagComment] = comment;
        return await API.request(hashSaveStoreProductCategory, 'POST', dataRequest);
    }
    
    // products
    static async saveProducts(products, formFilters, comment) {
        let dataRequest = {};
        dataRequest[flagFormFilters] = DOM.convertForm2JSON(formFilters);
        dataRequest[flagProduct] = products;
        dataRequest[flagComment] = comment;
        return await API.request(hashSaveStoreProduct, 'POST', dataRequest);
    }
    
    // product permutations
    static async saveProductPermutations(permutations, formFilters, comment) {
        let dataRequest = {};
        dataRequest[flagFormFilters] = DOM.convertForm2JSON(formFilters);
        dataRequest[flagProductPermutation] = permutations;
        dataRequest[flagComment] = comment;
        return await API.request(hashSaveStoreProductPermutation, 'POST', dataRequest);
    }
    
    // product variations
    static async saveProductVariations(variationTypes, formFilters, comment) {
        let dataRequest = {};
        dataRequest[flagFormFilters] = DOM.convertForm2JSON(formFilters);
        dataRequest[flagProductVariationType] = variationTypes;
        dataRequest[flagComment] = comment;
        return await API.request(hashSaveStoreProductVariation, 'POST', dataRequest);
    }
    
    // stock items
    static async saveStockItems(stockItems, formFilters, comment) {
        let dataRequest = {};
        dataRequest[flagFormFilters] = DOM.convertForm2JSON(formFilters);
        dataRequest[flagStockItem] = stockItems;
        dataRequest[flagComment] = comment;
        return await API.request(hashSaveStoreStockItem, 'POST', dataRequest);
    }
    
    // suppliers
    static async saveSuppliers(suppliers, formFilters, comment) {
        let dataRequest = {};
        dataRequest[flagFormFilters] = DOM.convertForm2JSON(formFilters);
        dataRequest[flagSupplier] = suppliers;
        dataRequest[flagComment] = comment;
        return await API.request(hashSaveStoreSupplier, 'POST', dataRequest);
    }
    
    // supplier purchase orders
    static async saveSupplierPurchaseOrders(supplierPurchaseOrders, formFilters, comment) {
        let dataRequest = {};
        dataRequest[flagFormFilters] = DOM.convertForm2JSON(formFilters);
        dataRequest[flagSupplierPurchaseOrder] = supplierPurchaseOrders;
        dataRequest[flagComment] = comment;
        return await API.request(hashSaveStoreSupplierPurchaseOrder, 'POST', dataRequest);
    }
    
    // manufacturing purchase orders
    static async saveManufacturingPurchaseOrders(manufacturingPurchaseOrders, formFilters, comment) {
        let dataRequest = {};
        dataRequest[flagFormFilters] = DOM.convertForm2JSON(formFilters);
        dataRequest[flagManufacturingPurchaseOrder] = manufacturingPurchaseOrders;
        dataRequest[flagComment] = comment;
        return await API.request(hashSaveStoreManufacturingPurchaseOrder, 'POST', dataRequest);
    }
}

/*

const api = new API();
export default api;

Example of using the API
document.addEventListener('DOMContentLoaded', () => {
    initializeApp();
    setupEventListeners();
    initializeComponents();
    
    // Example of using the API
    API.getData('/some-endpoint')
        .then(data => console.log('Data received:', data))
        .catch(error => console.error('Error:', error));
});
*/