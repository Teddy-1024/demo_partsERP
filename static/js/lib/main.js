// main.js

import { initializeAPI } from './shared/api.js';
import { setupEventListeners } from './shared/events.js';
import { initializeComponents } from './components/componentInitializer.js';
import { router } from './shared/router.js';
import { CONFIG } from './config/config.js';

// DOM ready function
function domReady(fn) {
    if (document.readyState !== 'loading') {
        fn();
    } else {
        document.addEventListener('DOMContentLoaded', fn);
    }
}

// Main initialization function
function initializeApp() {
    console.log('Initializing application...');

    // Initialize API with base URL
    initializeAPI(CONFIG.API_BASE_URL);

    // Setup global event listeners
    setupEventListeners();

    // Initialize reusable components
    initializeComponents();

    // Initialize router
    router.init();

    // Page-specific initialization
    const currentPage = document.body.dataset.page;
    switch (currentPage) {
        case 'home':
            import('./pages/home.js').then(module => module.initHomePage());
            break;
        case 'about':
            import('./pages/about.js').then(module => module.initAboutPage());
            break;
        case 'contact':
            import('./pages/contact.js').then(module => module.initContactPage());
            break;
        default:
            console.log('No specific initialization for this page');
    }

    console.log('Application initialized');
}

// Run the initialization when the DOM is ready
domReady(initializeApp);

// Expose a global app object if needed
window.app = {
    // Add methods or properties that need to be globally accessible
    reloadPage: () => {
        window.location.reload();
    },
    navigateTo: (url) => {
        router.navigateTo(url);
    }
};