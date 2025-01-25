
'use strict';

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
        // document.addEventListener('click', this.handleGlobalClick.bind(this));
    }

    handleGlobalClick(event) {
    }

    start() {
        this.initPageCurrent();
    }

    initPageCurrent() {
        this.router.loadPageCurrent();
    }
    
}

const app = new App();

function domReady(fn) {
    if (document.readyState !== 'loading') {
        fn();
    } else {
        document.addEventListener('DOMContentLoaded', fn);
    }
}

domReady(() => {
    app.initialize();
});

window.app = app;

export default app;