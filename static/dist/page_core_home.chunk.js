"use strict";(self.webpackChunkapp=self.webpackChunkapp||[]).push([[930],{48:(t,e,o)=>{function n(t){return n="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"==typeof Symbol&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t},n(t)}function i(t,e){for(var o=0;o<e.length;o++){var n=e[o];n.enumerable=n.enumerable||!1,n.configurable=!0,"value"in n&&(n.writable=!0),Object.defineProperty(t,a(n.key),n)}}function a(t){var e=function(t){if("object"!=n(t)||!t)return t;var e=t[Symbol.toPrimitive];if(void 0!==e){var o=e.call(t,"string");if("object"!=n(o))return o;throw new TypeError("@@toPrimitive must return a primitive value.")}return String(t)}(t);return"symbol"==n(e)?e:e+""}o.d(e,{A:()=>h});var r=function(){return t=function t(){!function(t,e){if(!(t instanceof e))throw new TypeError("Cannot call a class as a function")}(this,t)},e=[{key:"initialiseEventHandler",value:function(t,e,o){document.querySelectorAll(t).forEach((function(t){t.classList.contains(e)||(t.classList.add(e),o(t))}))}}],null&&i(t.prototype,null),e&&i(t,e),Object.defineProperty(t,"prototype",{writable:!1}),t;var t,e}();function u(t){return u="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"==typeof Symbol&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t},u(t)}function l(t,e){for(var o=0;o<e.length;o++){var n=e[o];n.enumerable=n.enumerable||!1,n.configurable=!0,"value"in n&&(n.writable=!0),Object.defineProperty(t,c(n.key),n)}}function c(t){var e=function(t){if("object"!=u(t)||!t)return t;var e=t[Symbol.toPrimitive];if(void 0!==e){var o=e.call(t,"string");if("object"!=u(o))return o;throw new TypeError("@@toPrimitive must return a primitive value.")}return String(t)}(t);return"symbol"==u(e)?e:e+""}var s=function(){return t=function t(){!function(t,e){if(!(t instanceof e))throw new TypeError("Cannot call a class as a function")}(this,t)},e=[{key:"getLocalStorage",value:function(t){return JSON.parse(localStorage.getItem(t))}},{key:"setLocalStorage",value:function(t,e){localStorage.setItem(t,JSON.stringify(e))}}],null&&l(t.prototype,null),e&&l(t,e),Object.defineProperty(t,"prototype",{writable:!1}),t;var t,e}(),f=o(595),v=o(661);function p(t){return p="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"==typeof Symbol&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t},p(t)}function g(t,e){for(var o=0;o<e.length;o++){var n=e[o];n.enumerable=n.enumerable||!1,n.configurable=!0,"value"in n&&(n.writable=!0),Object.defineProperty(t,d(n.key),n)}}function d(t){var e=function(t){if("object"!=p(t)||!t)return t;var e=t[Symbol.toPrimitive];if(void 0!==e){var o=e.call(t,"string");if("object"!=p(o))return o;throw new TypeError("@@toPrimitive must return a primitive value.")}return String(t)}(t);return"symbol"==p(e)?e:e+""}var h=function(){function t(e){if(function(t,e){if(!(t instanceof e))throw new TypeError("Cannot call a class as a function")}(this,t),this.router=e,this.title=titlePageCurrent,this.constructor===t)throw new Error("Cannot instantiate abstract class");if(!this.constructor.hash)throw new Error("Class ".concat(this.constructor.name," must have a static hash attribute."))}return e=t,o=[{key:"initialize",value:function(){throw new Error("Method 'initialize()' must be implemented.")}},{key:"sharedInitialize",value:function(){this.logInitialisation(),this.hookupCommonElements()}},{key:"logInitialisation",value:function(){console.log("Initializing "+this.title+" page")}},{key:"hookupCommonElements",value:function(){this.hookupNavigation(),this.hookupImagesLogo()}},{key:"hookupNavigation",value:function(){console.log("hooking up navigation");var t=document.querySelector(idOverlayHamburger).querySelectorAll("div."+flagRow).length;console.log("count nav options: ",t),r.initialiseEventHandler(idButtonHamburger,flagInitialised,(function(t){t.addEventListener("click",(function(t){t.stopPropagation();var e=document.querySelector(idOverlayHamburger);e.classList.contains(flagCollapsed)?(e.classList.remove(flagCollapsed),e.classList.add(flagExpanded)):(e.classList.remove(flagExpanded),e.classList.add(flagCollapsed))}))})),this.hookupButtonNavHome(),this.hookupButtonNavServices(),this.hookupButtonNavContact(),this.hookupButtonNavUserAccount(),this.hookupButtonNavUserLogout(),this.hookupButtonNavUserLogin(),this.hookupButtonNavStoreHome(),this.hookupButtonNavStoreProductPermutations(),this.hookupButtonNavStoreStockItems(),this.hookupButtonNavAdminHome()}},{key:"hookupButtonNavHome",value:function(){r.initialiseEventHandler("."+flagNavHome,flagInitialised,(function(t){t.addEventListener("click",(function(t){t.stopPropagation(),this.router.navigateToHash(hashPageHome)}))}))}},{key:"hookupButtonNavServices",value:function(){r.initialiseEventHandler("."+flagNavServices,flagInitialised,(function(t){t.addEventListener("click",(function(t){t.stopPropagation(),console.log("going to services page"),this.router.navigateToHash(hashPageServices)}))}))}},{key:"hookupButtonNavContact",value:function(){r.initialiseEventHandler("."+flagNavContact,flagInitialised,(function(t){t.addEventListener("click",(function(t){t.stopPropagation(),this.router.navigateToHash(hashPageContact)}))}))}},{key:"hookupButtonNavUserAccount",value:function(){r.initialiseEventHandler("."+flagNavUserAccount,flagInitialised,(function(t){t.addEventListener("click",(function(t){t.stopPropagation(),this.router.navigateToHash(hashPageUserAccount)}))}))}},{key:"hookupButtonNavUserLogout",value:function(){r.initialiseEventHandler("."+flagNavUserLogout,flagInitialised,(function(t){t.addEventListener("click",(function(t){t.stopPropagation(),this.router.navigateToHash(hashPageUserLogout)}))}))}},{key:"hookupButtonNavUserLogin",value:function(){r.initialiseEventHandler("."+flagNavUserLogin,flagInitialised,(function(t){t.addEventListener("click",(function(t){t.stopPropagation(),f.A.loginUser().then((function(t){t.Success?this.router.navigateToUrl(t[keyCallback],null,!1):v.A.alertError("Error",t.Message)}))}))}))}},{key:"hookupButtonNavStoreHome",value:function(){r.initialiseEventHandler("."+flagNavStoreHome,flagInitialised,(function(t){t.addEventListener("click",(function(t){t.stopPropagation(),this.router.navigateToHash(hashPageStoreHome)}))}))}},{key:"hookupButtonNavStoreProductCategories",value:function(){r.initialiseEventHandler("."+flagNavStoreProductCategories,flagInitialised,(function(t){t.addEventListener("click",(function(t){t.stopPropagation(),this.router.navigateToHash(hashPageStoreProductCategories)}))}))}},{key:"hookupButtonNavStoreProducts",value:function(){r.initialiseEventHandler("."+flagNavStoreProducts,flagInitialised,(function(t){t.addEventListener("click",(function(t){t.stopPropagation(),this.router.navigateToHash(hashPageStoreProducts)}))}))}},{key:"hookupButtonNavStoreProductPermutations",value:function(){r.initialiseEventHandler("."+flagNavStoreProductPermutations,flagInitialised,(function(t){t.addEventListener("click",(function(t){t.stopPropagation(),this.router.navigateToHash(hashPageStoreProductPermutations)}))}))}},{key:"hookupButtonNavStoreProductPrices",value:function(){r.initialiseEventHandler("."+flagNavStoreProductPrices,flagInitialised,(function(t){t.addEventListener("click",(function(t){t.stopPropagation(),this.router.navigateToHash(hashPageStoreProductPrices)}))}))}},{key:"hookupButtonNavStoreProductVariations",value:function(){r.initialiseEventHandler("."+flagNavStoreProductVariations,flagInitialised,(function(t){t.addEventListener("click",(function(t){t.stopPropagation(),this.router.navigateToHash(hashPageStoreProductVariations)}))}))}},{key:"hookupButtonNavStoreStockItems",value:function(){r.initialiseEventHandler("."+flagNavStoreStockItems,flagInitialised,(function(t){t.addEventListener("click",(function(t){t.stopPropagation(),this.router.navigateToHash(hashPageStoreStockItems)}))}))}},{key:"hookupButtonNavAdminHome",value:function(){r.initialiseEventHandler("."+flagNavAdminHome,flagInitialised,(function(t){t.addEventListener("click",(function(t){t.stopPropagation(),this.router.navigateToHash(hashPageAdminHome)}))}))}},{key:"hookupImagesLogo",value:function(){var t="img."+flagImageLogo;r.initialiseEventHandler(t,flagInitialised,(function(t){t.addEventListener("click",(function(t){t.stopPropagation(),this.router.navigateToHash(hashPageHome)}))}))}},{key:"hookupOverlayFromId",value:function(t){r.initialiseEventHandler(t,flagInitialised,(function(t){t.querySelector("button."+flagClose).addEventListener("click",(function(e){e.stopPropagation(),t.css("display","none")}))}))}},{key:"hookupButtonSave",value:function(){r.initialiseEventHandler("form."+flagFilter+" button."+flagSave,flagInitialised,(function(t){t.addEventListener("click",(function(t){t.stopPropagation(),showOverlayConfirm()})),t.classList.add(flagCollapsed)}))}},{key:"hookupVideos",value:function(){r.initialiseEventHandler("video",flagInitialised,(function(t){t.addEventListener("mouseover",videoPlay(t)),t.addEventListener("mouseout",videoPause(t))}))}},{key:"leave",value:function(){if(console.log("Leaving "+this.title+" page"),this.constructor===t)throw new Error("Must implement leave() method.")}},{key:"setLocalStoragePage",value:function(t){s.setLocalStorage(this.constructor.hash,t)}},{key:"getLocalStoragePage",value:function(){return s.getLocalStorage(this.constructor.hash)}},{key:"toggleShowButtonsSaveCancel",value:function(t){var e=arguments.length>1&&void 0!==arguments[1]?arguments[1]:null,o=arguments.length>2&&void 0!==arguments[2]?arguments[2]:null;null==e&&(e=document.querySelector("form."+flagFilter+" button."+flagSave)),null==o&&(o=document.querySelector("form."+flagFilter+" button."+flagCancel)),t?(o.classList.remove(flagCollapsed),e.classList.remove(flagCollapsed)):(o.classList.add(flagCollapsed),e.classList.add(flagCollapsed))}}],n=[{key:"isDirtyFilter",value:function(t){var e=v.A.isElementDirty(t);return e&&document.querySelectorAll(idTableMain+" tbody tr").remove(),e}}],o&&g(e.prototype,o),n&&g(e,n),Object.defineProperty(e,"prototype",{writable:!1}),e;var e,o,n}()},835:(t,e,o)=>{function n(t){return n="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(t){return typeof t}:function(t){return t&&"function"==typeof Symbol&&t.constructor===Symbol&&t!==Symbol.prototype?"symbol":typeof t},n(t)}function i(t,e){for(var o=0;o<e.length;o++){var n=e[o];n.enumerable=n.enumerable||!1,n.configurable=!0,"value"in n&&(n.writable=!0),Object.defineProperty(t,s(n.key),n)}}function a(t,e,o){return e=l(e),function(t,e){if(e&&("object"==n(e)||"function"==typeof e))return e;if(void 0!==e)throw new TypeError("Derived constructors may only return object or undefined");return function(t){if(void 0===t)throw new ReferenceError("this hasn't been initialised - super() hasn't been called");return t}(t)}(t,r()?Reflect.construct(e,o||[],l(t).constructor):e.apply(t,o))}function r(){try{var t=!Boolean.prototype.valueOf.call(Reflect.construct(Boolean,[],(function(){})))}catch(t){}return(r=function(){return!!t})()}function u(){return u="undefined"!=typeof Reflect&&Reflect.get?Reflect.get.bind():function(t,e,o){var n=function(t,e){for(;!{}.hasOwnProperty.call(t,e)&&null!==(t=l(t)););return t}(t,e);if(n){var i=Object.getOwnPropertyDescriptor(n,e);return i.get?i.get.call(arguments.length<3?t:o):i.value}},u.apply(null,arguments)}function l(t){return l=Object.setPrototypeOf?Object.getPrototypeOf.bind():function(t){return t.__proto__||Object.getPrototypeOf(t)},l(t)}function c(t,e){return c=Object.setPrototypeOf?Object.setPrototypeOf.bind():function(t,e){return t.__proto__=e,t},c(t,e)}function s(t){var e=function(t){if("object"!=n(t)||!t)return t;var e=t[Symbol.toPrimitive];if(void 0!==e){var o=e.call(t,"string");if("object"!=n(o))return o;throw new TypeError("@@toPrimitive must return a primitive value.")}return String(t)}(t);return"symbol"==n(e)?e:e+""}o.r(e),o.d(e,{default:()=>g});var f,v,p,g=function(t){function e(t){return function(t,e){if(!(t instanceof e))throw new TypeError("Cannot call a class as a function")}(this,e),a(this,e,[t])}return function(t,e){if("function"!=typeof e&&null!==e)throw new TypeError("Super expression must either be null or a function");t.prototype=Object.create(e&&e.prototype,{constructor:{value:t,writable:!0,configurable:!0}}),Object.defineProperty(t,"prototype",{writable:!1}),e&&c(t,e)}(e,t),o=e,n=[{key:"initialize",value:function(){this.sharedInitialize(),this.hookupButtonNavContact()}},{key:"leave",value:function(){var t,o,n;(t=e,o=this,"function"==typeof(n=u(l(1&3?t.prototype:t),"leave",o))?function(t){return n.apply(o,t)}:n)([])}}],n&&i(o.prototype,n),Object.defineProperty(o,"prototype",{writable:!1}),o;var o,n}(o(48).A);f=g,v="hash",p=hashPageHome,(v=s(v))in f?Object.defineProperty(f,v,{value:p,enumerable:!0,configurable:!0,writable:!0}):f[v]=p}}]);