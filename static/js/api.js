import DOM from './dom.js';

// Module for API calls
export default class API {
    
    static getCsrfToken() {
        // return document.querySelectorAll('meta[name=' + nameCSRFToken + ']').getAttribute('content');
        return document.querySelector(idCSRFToken).getAttribute('content');
    }
    
    static async request(hashEndpoint, method = 'GET', data = null, params = null) {
        const url = API.getUrlFromHash(hashEndpoint, params);
        const options = {
            method,
            headers: {
                'Content-Type': 'application/json',
                'X-CSRFToken': API.getCsrfToken()
            }
        };

        if (data && (method === 'POST' || method === 'PUT' || method === 'PATCH')) {
            options.body = JSON.stringify(data);
        }

        console.log('API request:', method, url, data);

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
        console.log("getUrlFromHash:");
        console.log("base url: " + _pathHost + "\nhash: " + hash + '\nparams: ' + params);
        let url = API.parameteriseUrl(_pathHost + hash, params);
        console.log("url: " + url);
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
        callback[keyCallback] = DOM.getHashPageCurrent();
        return await API.request(hashPageUserLogin, 'POST', callback);
    }

    // store
    // product categories
    static async getCategories() {
        return await API.request(hashGetStoreProductCategory);
    }
    static async getCategoriesByFilters(filtersJson) {
        /*
        let dataRequest = {};
        dataRequest[keyForm] = filtersJson;
        return await API.request(hashGetStoreProductCategory, 'POST', dataRequest);
        */
        // return await API.request(hashPageStoreProductCategories, 'GET', filtersJson);
        API.goToHash(hashPageStoreProductCategories, filtersJson);
    }
    static async saveCategories(categories, formFilters, comment) {
        let dataRequest = {};
        dataRequest[flagFormFilters] = DOM.convertForm2JSON(formFilters);
        dataRequest[flagProductCategory] = categories;
        dataRequest[flagComment] = comment;
        return await API.request(hashSaveStoreProductCategory, 'POST', dataRequest);
    }
    
    // product permutations
    static async getProductPermutations() {
        return await API.request(hashGetStoreProductPermutation);
    }
    static async getProductPermutationsByFilters(filtersJson) {
        API.goToHash(hashPageStoreProductPermutations, filtersJson);
    }
    static async saveProductPermutations(permutations, formFilters, comment) {
        let dataRequest = {};
        dataRequest[flagFormFilters] = DOM.convertForm2JSON(formFilters);
        dataRequest[flagProductPermutation] = permutations;
        dataRequest[flagComment] = comment;
        return await API.request(hashSaveStoreProductPermutation, 'POST', dataRequest);
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