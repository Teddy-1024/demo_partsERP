/*
// Bundle css imports
import '../css/lib/reset.css';
import '../css/lib/typography.css';
import '../css/lib/variables.css';
import '../css/lib/utils.css';

import '../css/layouts/header.css';
import '../css/layouts/footer.css';
import '../css/layouts/table-main.css'

import '../css/components/button.css';
import '../css/components/card.css';
import '../css/components/dialog.css';
import '../css/components/form.css';
import '../css/components/modal.css';
import '../css/components/navigation.css';
import '../css/components/overlay.css';

import '../css/sections/store.css';
*/


// Main entry point for the application
'use strict';

// import API from './api.js';
import DOM from './dom.js';
import Router from './router.js';


class App {
    constructor() {
        this.dom = new DOM();
        this.router = new Router();
    }

    initialize() {
        this.setupEventListeners();
        this.start();
    }

    setupEventListeners() {
        // Global event listeners
        // document.addEventListener('click', this.handleGlobalClick.bind(this));
        // Add more global event listeners as needed
    }

    handleGlobalClick(event) {
        // Handle global click events
    }

    start() {
        // Additional startup logic
        this.initPageCurrent();
    }

    initPageCurrent() {
        /*
        _pageCurrent = Router.getPageCurrent();
        _pageCurrent.initialize();
        */
        this.router.loadPageCurrent();
    }
    
}

// Application instance
const app = new App();

// DOM ready handler
function domReady(fn) {
    if (document.readyState !== 'loading') {
        fn();
    } else {
        document.addEventListener('DOMContentLoaded', fn);
    }
}

// Initialize and start the app when DOM is ready
domReady(() => {
    app.initialize();
});

// Expose app to window for debugging (optional)
window.app = app;

// Export app if using modules
export default app;