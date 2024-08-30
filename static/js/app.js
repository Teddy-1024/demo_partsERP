
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
        console.log('Initializing application...');
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
        console.log('Global click:', event.target);
    }

    start() {
        console.log('Starting application...');
        // Additional startup logic
        this.initPageCurrent();
    }

    initPageCurrent() {
        console.log("initPageCurrent");
        _pageCurrent = Router.getPageCurrent();
        _pageCurrent.initialize();
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