import DOM from './dom.js';

// Module for API calls
export default class API {
    
    static getCsrfToken() {
        // return document.querySelectorAll('meta[name=' + nameCSRFToken + ']').attr('content');
        return document.querySelector(idCSRFToken).getAttribute('content');
    }
    
    static async request(hashEndpoint, method = 'GET', data = null) {
        const url = API.getUrlFromHash(hashEndpoint);
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
    
    static getUrlFromHash(hash) {
        if (hash == null) hash = hashPageHome;
        console.log("getUrlFromHash:");
        console.log("base url: " + _pathHost + "\nhash: " + hash);
        return _pathHost + hash;
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
    // categories
    static async getCategories() {
        return await API.request(hashGetStoreProductCategory);
    }
    static async getCategoriesByFilters(formFilters) {
        let dataRequest = {};
        dataRequest[keyForm] = DOM.convertForm2JSON(formFilters);
        return await API.request(hashGetStoreProductCategory, 'POST', dataRequest);
    }
    static async saveCategories(categories, formFilters, comment) {
        let dataRequest = {};
        dataRequest[keyForm] = DOM.convertForm2JSON(formFilters);
        dataRequest[flagCategory] = categories;
        dataRequest[flagComment] = comment;
        return await API.request(hashSaveStoreProductCategory, 'POST', dataRequest);
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