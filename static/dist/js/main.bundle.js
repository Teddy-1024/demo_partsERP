/******/ (() => { // webpackBootstrap
/******/ 	"use strict";
// This entry need to be wrapped in an IIFE because it need to be isolated against other entry modules.
(() => {

// UNUSED EXPORTS: default

;// CONCATENATED MODULE: ./static/js/lib/validation.js
function _typeof(o) { "@babel/helpers - typeof"; return _typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, _typeof(o); }
function _classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function _defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, _toPropertyKey(o.key), o); } }
function _createClass(e, r, t) { return r && _defineProperties(e.prototype, r), t && _defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function _toPropertyKey(t) { var i = _toPrimitive(t, "string"); return "symbol" == _typeof(i) ? i : i + ""; }
function _toPrimitive(t, r) { if ("object" != _typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != _typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }
var validation_Validation = /*#__PURE__*/function () {
  function Validation() {
    _classCallCheck(this, Validation);
  }
  return _createClass(Validation, null, [{
    key: "isEmpty",
    value:
    /*
    isNullOrWhitespace(v) {
        let txt = JSON.stringify(v).replace('/\s\g', '');
        return (txt == '' || 'null');
    }
    */

    function isEmpty(object) {
      var isEmpty = true;
      if (object !== null && object !== "null" && object !== undefined && object !== "undefined") {
        if (object.length == undefined) {
          isEmpty = false; // object exists but isn't a collection
        } else if (typeof object === "function") {
          isEmpty = false; // object is reference
        } else {
          // string or collection

          var isString = typeof object == "string";
          if (isString) object = object.trim();
          if (object.length > 0) {
            if (isString) {
              isEmpty = false; // String greater than length 0
            } else {
              if (typeof object[0] != "string") {
                isEmpty = false;
              } else {
                for (var i = 0; i < object.length; i++) {
                  if (object[i] != "") {
                    isEmpty = false;
                    break;
                  }
                }
              }
            }
          }
        }
      }
      return isEmpty;
    }
  }, {
    key: "isValidNumber",
    value: function isValidNumber(value, positiveOnly) {
      return !Validation.isEmpty(value) && !isNaN(value) && (!positiveOnly || parseFloat(value) > 0);
    }
  }, {
    key: "getDataContentType",
    value: function getDataContentType(params) {
      var data = null;
      var contentType = '';
      if (!Validation.isEmpty(params)) {
        if (typeof params === "string") {
          data = params;
          contentType = "application/x-www-form-urlencoded; charset=UTF-8";
        } else {
          data = JSON.stringify(params);
          contentType = "application/json; charset=UTF-8";
        }
      }
      return {
        Data: data,
        ContentType: contentType
      };
    }
  }, {
    key: "arrayContainsItem",
    value: function arrayContainsItem(array, itemValue) {
      var hasItem = false;
      if (!Validation.isEmpty(array) && !Validation.isEmpty(itemValue)) {
        var isJQueryElementArray = array[0] instanceof jQuery;
        if (isJQueryElementArray) {
          for (var i = 0; i < array.length; i++) {
            if (document.querySelectorAll(array[i]).is(itemValue)) {
              hasItem = true;
              break;
            }
          }
        } else {
          var isDate = array[0] instanceof Date;
          if (isDate) {
            for (var _i = 0; _i < array.length; _i++) {
              if (array[_i].getTime() === itemValue.getTime()) {
                hasItem = true;
                break;
              }
            }
          } else {
            for (var _i2 = 0; _i2 < array.length; _i2++) {
              if (array[_i2] == itemValue) {
                hasItem = true;
                break;
              }
            }
          }
        }
      }
      return hasItem;
    }
  }, {
    key: "dictHasKey",
    value: function dictHasKey(d, k) {
      return k in d;
    }
  }, {
    key: "areEqualDicts",
    value: function areEqualDicts(dict1, dict2) {
      var keys1 = Object.keys(dict1);
      var keys2 = Object.keys(dict2);
      if (keys1.length !== keys2.length) {
        return false;
      }
      for (var _i3 = 0, _keys = keys1; _i3 < _keys.length; _i3++) {
        var key = _keys[_i3];
        if (dict1[key] !== dict2[key]) {
          return false;
        }
      }
      return true;
    }
  }, {
    key: "imageExists",
    value: function imageExists(url, callback) {
      var img = new Image();
      img.onload = function () {
        callback(true);
      };
      img.onerror = function () {
        callback(false);
      };
      img.src = url;
    }
  }, {
    key: "toFixedOrDefault",
    value: function toFixedOrDefault(value, decimalPlaces) {
      var defaultValue = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : null;
      return Validation.isValidNumber(value) ? parseFloat(value).toFixed(decimalPlaces) : defaultValue;
    }
  }]);
}();

;// CONCATENATED MODULE: ./static/js/dom.js
function dom_typeof(o) { "@babel/helpers - typeof"; return dom_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, dom_typeof(o); }
function _defineProperty(e, r, t) { return (r = dom_toPropertyKey(r)) in e ? Object.defineProperty(e, r, { value: t, enumerable: !0, configurable: !0, writable: !0 }) : e[r] = t, e; }
function dom_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function dom_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, dom_toPropertyKey(o.key), o); } }
function dom_createClass(e, r, t) { return r && dom_defineProperties(e.prototype, r), t && dom_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function dom_toPropertyKey(t) { var i = dom_toPrimitive(t, "string"); return "symbol" == dom_typeof(i) ? i : i + ""; }
function dom_toPrimitive(t, r) { if ("object" != dom_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != dom_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }

var DOM = /*#__PURE__*/function () {
  function DOM() {
    dom_classCallCheck(this, DOM);
  }
  return dom_createClass(DOM, null, [{
    key: "setElementAttributesValuesCurrentAndPrevious",
    value: function setElementAttributesValuesCurrentAndPrevious(element, data) {
      DOM.setElementAttributeValueCurrent(element, data);
      DOM.setElementAttributeValuePrevious(element, data);
    }
  }, {
    key: "setElementAttributeValueCurrent",
    value: function setElementAttributeValueCurrent(element, data) {
      element.setAttribute(attrValueCurrent, data);
    }
  }, {
    key: "setElementAttributeValuePrevious",
    value: function setElementAttributeValuePrevious(element, data) {
      element.setAttribute(attrValuePrevious, data);
    }
  }, {
    key: "setElementValuesCurrentAndPrevious",
    value: function setElementValuesCurrentAndPrevious(element, data) {
      DOM.setElementValueCurrent(element, data);
      DOM.setElementAttributeValuePrevious(element, data);
    }
  }, {
    key: "setElementValueCurrent",
    value: function setElementValueCurrent(element, data) {
      DOM.setElementAttributeValueCurrent(element, data);
      if (element.type === "checkbox") {
        element.checked = data;
      } else if (element.tagName === 'INPUT' || element.tagName === 'TEXTAREA' || element.tagName === 'SELECT') {
        element.value = data;
      } else {
        element.textContent = data;
      }
    }
  }, {
    key: "setElementValueCurrentIfEmpty",
    value: function setElementValueCurrentIfEmpty(element, data) {
      if (validation_Validation.isEmpty(DOM.getElementValueCurrent(element))) {
        DOM.setElementValueCurrent(element, data);
      }
    }
  }, {
    key: "getCellFromElement",
    value: function getCellFromElement(element) {
      return element.closest('td');
    }
  }, {
    key: "getRowFromElement",
    value: function getRowFromElement(element, flagRow) {
      var selector = validation_Validation.isEmpty(flagRow) ? 'tr' : 'tr.' + flagRow;
      return element.closest(selector);
    }
  }, {
    key: "getClosestParent",
    value: function getClosestParent(element, selector) {
      var parent = element.parentElement;
      while (parent) {
        if (parent.matches(selector)) {
          return parent;
        }
        parent = parent.parentElement;
      }
      return null;
    }
  }, {
    key: "convertForm2JSON",
    value: function convertForm2JSON(elementForm) {
      var dataForm = {};
      if (validation_Validation.isEmpty(elementForm)) {
        return dataForm;
      }
      var containersFilter = elementForm.querySelectorAll('.' + flagContainerInput + '.' + flagFilter);
      var containerFilter, labelFilter, keyFilter, filter;
      for (var indexFilter = 0; indexFilter < containersFilter.length; indexFilter++) {
        containerFilter = containersFilter[indexFilter];
        labelFilter = containerFilter.querySelector('label');
        keyFilter = labelFilter.getAttribute('for');
        filter = containerFilter.querySelector("#".concat(keyFilter));
        dataForm[keyFilter] = DOM.getElementValueCurrent(filter);
      }
      return dataForm;
    }
  }, {
    key: "loadPageBody",
    value: function loadPageBody(contentNew) {
      var pageBody = document.querySelector(idPageBody);
      pageBody.innerHTML = contentNew;
    }
  }, {
    key: "getHashPageCurrent",
    value: function getHashPageCurrent() {
      var hashPageCurrent = document.body.dataset.page;
      return hashPageCurrent;
    }
  }, {
    key: "updateAndCheckIsElementDirty",
    value: function updateAndCheckIsElementDirty(element) {
      element.setAttribute(attrValueCurrent, DOM.getElementValueCurrent(element));
      return DOM.isElementDirty(element);
    }
  }, {
    key: "isElementDirty",
    value: function isElementDirty(element) {
      var isDirty = element.getAttribute(attrValuePrevious) != element.getAttribute(attrValueCurrent);
      DOM.handleDirtyElement(element, isDirty);
      return isDirty;
    }
  }, {
    key: "handleDirtyElement",
    value: function handleDirtyElement(element, isDirty) {
      DOM.toggleElementHasClassnameFlag(element, isDirty, flagDirty);
    }
  }, {
    key: "toggleElementHasClassnameFlag",
    value: function toggleElementHasClassnameFlag(element, elementHasFlag, flag) {
      var elementAlreadyHasFlag = element.classList.contains(flag);
      if (elementHasFlag == elementAlreadyHasFlag) return;
      if (elementHasFlag) {
        element.classList.add(flag);
      } else {
        element.classList.remove(flag);
      }
    }
  }, {
    key: "hasDirtyChildrenContainer",
    value: function hasDirtyChildrenContainer(container) {
      if (container == null) return false;
      return container.querySelector('.' + flagDirty) != null;
    }
  }, {
    key: "hasDirtyChildrenNotDeletedContainer",
    value: function hasDirtyChildrenNotDeletedContainer(container) {
      if (container == null || container.classList.contains(flagDelete)) return false;
      return container.querySelector('.' + flagDirty + ':not(.' + flagDelete + ', .' + flagDelete + ' *)') != null;
    }
  }, {
    key: "getElementValueCurrent",
    value: function getElementValueCurrent(element) {
      var returnVal = '';
      if (!validation_Validation.isEmpty(element)) {
        if (element.type === "checkbox") {
          returnVal = element.checked;
        }
        /*
        else if (element.classList.contains(flagIsDatePicker)) {
            returnVal = getDatePickerDate(element, adjust4DayLightSavings);
        }
        */else if (element.tagName === 'INPUT' || element.tagName === 'TEXTAREA' || element.tagName === 'SELECT') {
          returnVal = element.value;
        } else if (element.tagName === 'BUTTON' && element.classList.contains(flagActive)) {
          returnVal = element.classList.contains(flagDelete);
        } else if (element.tagName === 'TD') {
          returnVal = DOM.getElementAttributeValueCurrent(element);
        } else {
          returnVal = element.textContent;
        }
      }
      if (validation_Validation.isEmpty(returnVal)) returnVal = '';
      return returnVal;
    }
  }, {
    key: "getElementAttributeValueCurrent",
    value: function getElementAttributeValueCurrent(element) {
      if (validation_Validation.isEmpty(element)) return null;
      return element.getAttribute(attrValueCurrent);
      if (!validation_Validation.isEmpty(value) && element.type === "checkbox") {
        value = value === 'true';
      }
      return value;
    }
  }, {
    key: "getElementAttributeValuePrevious",
    value: function getElementAttributeValuePrevious(element) {
      if (validation_Validation.isEmpty(element)) return null;
      return element.getAttribute(attrValuePrevious);
      if (!validation_Validation.isEmpty(value) && element.type === "checkbox") {
        value = value === 'true';
      }
      return value;
    }
    /* base_table.handleChangeElementCellTable
    static updateAndCheckIsTableElementDirty(element) {
        let wasDirty = DOM.isElementDirty(element);
        let row = DOM.getRowFromElement(element);
        let wasDirtyRow = DOM.hasDirtyChildrenNotDeletedContainer(row);
        let isDirty = DOM.updateAndCheckIsElementDirty(element);
        let cell = DOM.getCellFromElement(element);
        console.log({element, row, cell, isDirty, wasDirty});
        if (isDirty != wasDirty) {
            DOM.handleDirtyElement(cell, isDirty);
            let isDirtyRow = DOM.hasDirtyChildrenNotDeletedContainer(row);
            console.log({isDirtyRow, wasDirtyRow});
            if (isDirtyRow != wasDirtyRow) {
                DOM.handleDirtyElement(row, isDirtyRow);
            }
        }
    }
    */
    /*
    static updateElement(id, data) {
        const element = document.getElementById(id);
        if (element) {
            element.textContent = data;
        }
    }
    */
    /* non-static method on page object to use
    static handleChangeElement(element) {}
    */
  }, {
    key: "scrollToElement",
    value: function scrollToElement(parent, element) {
      // REQUIRED: parent has scroll-bar
      parent.scrollTop(parent.scrollTop() + (element.offset().top - parent.offset().top));
    }
  }, {
    key: "isElementInContainer",
    value: function isElementInContainer(container, element) {
      if (typeof jQuery === 'function') {
        if (container instanceof jQuery) container = container[0];
        if (element instanceof jQuery) element = element[0];
      }
      var containerBounds = container.getBoundingClientRect();
      var elementBounds = element.getBoundingClientRect();
      return containerBounds.top <= elementBounds.top && containerBounds.left <= elementBounds.left && elementBounds.top + elementBounds.height <= containerBounds.top + containerBounds.height && elementBounds.left + elementBounds.width <= containerBounds.left + containerBounds.width;
    }
  }, {
    key: "alertError",
    value: function alertError(errorType, errorText) {
      alert(errorType + '\n' + errorText);
    }
  }, {
    key: "createOptionUnselectedProductVariation",
    value: function createOptionUnselectedProductVariation() {
      return _defineProperty(_defineProperty({}, flagProductVariationType, _defineProperty(_defineProperty(_defineProperty(_defineProperty({}, flagNameAttrOptionText, [flagName]), flagNameAttrOptionValue, [attrIdProductVariationType]), flagName, 'Select Variation Type'), attrIdProductVariationType, 0)), flagProductVariation, _defineProperty(_defineProperty(_defineProperty(_defineProperty({}, flagNameAttrOptionText, [flagName]), flagNameAttrOptionValue, [attrIdProductVariation]), flagName, 'Select Variation'), attrIdProductVariation, 0));
    }
  }, {
    key: "createOption",
    value: function createOption(optionJson) {
      if (validation_Validation.isEmpty(optionJson)) optionJson = {
        text: 'Select',
        value: 0
      };
      var option = document.createElement('option');
      option.value = optionJson.value;
      option.textContent = optionJson.text;
      option.selected = optionJson.selected;
      return option;
    }
  }]);
}();

;// CONCATENATED MODULE: ./static/js/lib/events.js
function events_typeof(o) { "@babel/helpers - typeof"; return events_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, events_typeof(o); }
function events_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function events_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, events_toPropertyKey(o.key), o); } }
function events_createClass(e, r, t) { return r && events_defineProperties(e.prototype, r), t && events_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function events_toPropertyKey(t) { var i = events_toPrimitive(t, "string"); return "symbol" == events_typeof(i) ? i : i + ""; }
function events_toPrimitive(t, r) { if ("object" != events_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != events_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }
var Events = /*#__PURE__*/function () {
  function Events() {
    events_classCallCheck(this, Events);
  }
  return events_createClass(Events, null, [{
    key: "initialiseEventHandler",
    value: function initialiseEventHandler(selectorElement, classInitialised, eventHandler) {
      document.querySelectorAll(selectorElement).forEach(function (element) {
        if (element.classList.contains(classInitialised)) return;
        element.classList.add(classInitialised);
        eventHandler(element);
      });
    }
  }]);
}();

;// CONCATENATED MODULE: ./static/js/lib/local_storage.js
function local_storage_typeof(o) { "@babel/helpers - typeof"; return local_storage_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, local_storage_typeof(o); }
function local_storage_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function local_storage_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, local_storage_toPropertyKey(o.key), o); } }
function local_storage_createClass(e, r, t) { return r && local_storage_defineProperties(e.prototype, r), t && local_storage_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function local_storage_toPropertyKey(t) { var i = local_storage_toPrimitive(t, "string"); return "symbol" == local_storage_typeof(i) ? i : i + ""; }
function local_storage_toPrimitive(t, r) { if ("object" != local_storage_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != local_storage_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }

var LocalStorage = /*#__PURE__*/function () {
  function LocalStorage() {
    local_storage_classCallCheck(this, LocalStorage);
  }
  return local_storage_createClass(LocalStorage, null, [{
    key: "getLocalStorage",
    value:
    /*
    function getPageLocalStorage(pageHash) {
    
        let ls;
        try {
            ls = JSON.parse(localStorage.getItem(pageHash));
        } catch {
    
        }
    
        if (Validation.isEmpty(ls)) return {}
    
        return ls;
    }
    function getPageLocalStorageCurrent() {
    
        return JSON.parse(localStorage.getItem(hashPageCurrent));
    }
    
    function setPageLocalStorage(pageHash, newLS) {
    
        localStorage.setItem(pageHash, JSON.stringify(newLS));
    }
    
    function clearPageLocalStorage(pageHash) {
        localStorage.removeItem(pageHash);
    }
    
    function setupPageLocalStorage(pageHash) {
    
        let ls = getPageLocalStorage(pageHash);
    
        if (Validation.isEmpty(ls)) ls = {};
    
        setPageLocalStorage(pageHash, ls);
    }
    */

    function getLocalStorage(key) {
      return JSON.parse(localStorage.getItem(key));
    }
  }, {
    key: "setLocalStorage",
    value: function setLocalStorage(key, newLS) {
      localStorage.setItem(key, JSON.stringify(newLS));
    }

    /*
    function setupPageLocalStorageNext(pageHashNext) {
        let lsOld = getPageLocalStorage(hashPageCurrent);
        hashPageCurrent = pageHashNext;
        clearPageLocalStorage(hashPageCurrent);
        setupPageLocalStorage(hashPageCurrent);
        let lsNew = getPageLocalStorage(hashPageCurrent);
        lsNew[keyBasket] = (keyBasket in lsOld) ? lsOld[keyBasket] : {'items': []};
        setPageLocalStorage(hashPageCurrent, lsNew);
    }
    */
  }]);
}();

;// CONCATENATED MODULE: ./static/js/api.js
function api_typeof(o) { "@babel/helpers - typeof"; return api_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, api_typeof(o); }
function _regeneratorRuntime() { "use strict"; /*! regenerator-runtime -- Copyright (c) 2014-present, Facebook, Inc. -- license (MIT): https://github.com/facebook/regenerator/blob/main/LICENSE */ _regeneratorRuntime = function _regeneratorRuntime() { return e; }; var t, e = {}, r = Object.prototype, n = r.hasOwnProperty, o = Object.defineProperty || function (t, e, r) { t[e] = r.value; }, i = "function" == typeof Symbol ? Symbol : {}, a = i.iterator || "@@iterator", c = i.asyncIterator || "@@asyncIterator", u = i.toStringTag || "@@toStringTag"; function define(t, e, r) { return Object.defineProperty(t, e, { value: r, enumerable: !0, configurable: !0, writable: !0 }), t[e]; } try { define({}, ""); } catch (t) { define = function define(t, e, r) { return t[e] = r; }; } function wrap(t, e, r, n) { var i = e && e.prototype instanceof Generator ? e : Generator, a = Object.create(i.prototype), c = new Context(n || []); return o(a, "_invoke", { value: makeInvokeMethod(t, r, c) }), a; } function tryCatch(t, e, r) { try { return { type: "normal", arg: t.call(e, r) }; } catch (t) { return { type: "throw", arg: t }; } } e.wrap = wrap; var h = "suspendedStart", l = "suspendedYield", f = "executing", s = "completed", y = {}; function Generator() {} function GeneratorFunction() {} function GeneratorFunctionPrototype() {} var p = {}; define(p, a, function () { return this; }); var d = Object.getPrototypeOf, v = d && d(d(values([]))); v && v !== r && n.call(v, a) && (p = v); var g = GeneratorFunctionPrototype.prototype = Generator.prototype = Object.create(p); function defineIteratorMethods(t) { ["next", "throw", "return"].forEach(function (e) { define(t, e, function (t) { return this._invoke(e, t); }); }); } function AsyncIterator(t, e) { function invoke(r, o, i, a) { var c = tryCatch(t[r], t, o); if ("throw" !== c.type) { var u = c.arg, h = u.value; return h && "object" == api_typeof(h) && n.call(h, "__await") ? e.resolve(h.__await).then(function (t) { invoke("next", t, i, a); }, function (t) { invoke("throw", t, i, a); }) : e.resolve(h).then(function (t) { u.value = t, i(u); }, function (t) { return invoke("throw", t, i, a); }); } a(c.arg); } var r; o(this, "_invoke", { value: function value(t, n) { function callInvokeWithMethodAndArg() { return new e(function (e, r) { invoke(t, n, e, r); }); } return r = r ? r.then(callInvokeWithMethodAndArg, callInvokeWithMethodAndArg) : callInvokeWithMethodAndArg(); } }); } function makeInvokeMethod(e, r, n) { var o = h; return function (i, a) { if (o === f) throw Error("Generator is already running"); if (o === s) { if ("throw" === i) throw a; return { value: t, done: !0 }; } for (n.method = i, n.arg = a;;) { var c = n.delegate; if (c) { var u = maybeInvokeDelegate(c, n); if (u) { if (u === y) continue; return u; } } if ("next" === n.method) n.sent = n._sent = n.arg;else if ("throw" === n.method) { if (o === h) throw o = s, n.arg; n.dispatchException(n.arg); } else "return" === n.method && n.abrupt("return", n.arg); o = f; var p = tryCatch(e, r, n); if ("normal" === p.type) { if (o = n.done ? s : l, p.arg === y) continue; return { value: p.arg, done: n.done }; } "throw" === p.type && (o = s, n.method = "throw", n.arg = p.arg); } }; } function maybeInvokeDelegate(e, r) { var n = r.method, o = e.iterator[n]; if (o === t) return r.delegate = null, "throw" === n && e.iterator["return"] && (r.method = "return", r.arg = t, maybeInvokeDelegate(e, r), "throw" === r.method) || "return" !== n && (r.method = "throw", r.arg = new TypeError("The iterator does not provide a '" + n + "' method")), y; var i = tryCatch(o, e.iterator, r.arg); if ("throw" === i.type) return r.method = "throw", r.arg = i.arg, r.delegate = null, y; var a = i.arg; return a ? a.done ? (r[e.resultName] = a.value, r.next = e.nextLoc, "return" !== r.method && (r.method = "next", r.arg = t), r.delegate = null, y) : a : (r.method = "throw", r.arg = new TypeError("iterator result is not an object"), r.delegate = null, y); } function pushTryEntry(t) { var e = { tryLoc: t[0] }; 1 in t && (e.catchLoc = t[1]), 2 in t && (e.finallyLoc = t[2], e.afterLoc = t[3]), this.tryEntries.push(e); } function resetTryEntry(t) { var e = t.completion || {}; e.type = "normal", delete e.arg, t.completion = e; } function Context(t) { this.tryEntries = [{ tryLoc: "root" }], t.forEach(pushTryEntry, this), this.reset(!0); } function values(e) { if (e || "" === e) { var r = e[a]; if (r) return r.call(e); if ("function" == typeof e.next) return e; if (!isNaN(e.length)) { var o = -1, i = function next() { for (; ++o < e.length;) if (n.call(e, o)) return next.value = e[o], next.done = !1, next; return next.value = t, next.done = !0, next; }; return i.next = i; } } throw new TypeError(api_typeof(e) + " is not iterable"); } return GeneratorFunction.prototype = GeneratorFunctionPrototype, o(g, "constructor", { value: GeneratorFunctionPrototype, configurable: !0 }), o(GeneratorFunctionPrototype, "constructor", { value: GeneratorFunction, configurable: !0 }), GeneratorFunction.displayName = define(GeneratorFunctionPrototype, u, "GeneratorFunction"), e.isGeneratorFunction = function (t) { var e = "function" == typeof t && t.constructor; return !!e && (e === GeneratorFunction || "GeneratorFunction" === (e.displayName || e.name)); }, e.mark = function (t) { return Object.setPrototypeOf ? Object.setPrototypeOf(t, GeneratorFunctionPrototype) : (t.__proto__ = GeneratorFunctionPrototype, define(t, u, "GeneratorFunction")), t.prototype = Object.create(g), t; }, e.awrap = function (t) { return { __await: t }; }, defineIteratorMethods(AsyncIterator.prototype), define(AsyncIterator.prototype, c, function () { return this; }), e.AsyncIterator = AsyncIterator, e.async = function (t, r, n, o, i) { void 0 === i && (i = Promise); var a = new AsyncIterator(wrap(t, r, n, o), i); return e.isGeneratorFunction(r) ? a : a.next().then(function (t) { return t.done ? t.value : a.next(); }); }, defineIteratorMethods(g), define(g, u, "Generator"), define(g, a, function () { return this; }), define(g, "toString", function () { return "[object Generator]"; }), e.keys = function (t) { var e = Object(t), r = []; for (var n in e) r.push(n); return r.reverse(), function next() { for (; r.length;) { var t = r.pop(); if (t in e) return next.value = t, next.done = !1, next; } return next.done = !0, next; }; }, e.values = values, Context.prototype = { constructor: Context, reset: function reset(e) { if (this.prev = 0, this.next = 0, this.sent = this._sent = t, this.done = !1, this.delegate = null, this.method = "next", this.arg = t, this.tryEntries.forEach(resetTryEntry), !e) for (var r in this) "t" === r.charAt(0) && n.call(this, r) && !isNaN(+r.slice(1)) && (this[r] = t); }, stop: function stop() { this.done = !0; var t = this.tryEntries[0].completion; if ("throw" === t.type) throw t.arg; return this.rval; }, dispatchException: function dispatchException(e) { if (this.done) throw e; var r = this; function handle(n, o) { return a.type = "throw", a.arg = e, r.next = n, o && (r.method = "next", r.arg = t), !!o; } for (var o = this.tryEntries.length - 1; o >= 0; --o) { var i = this.tryEntries[o], a = i.completion; if ("root" === i.tryLoc) return handle("end"); if (i.tryLoc <= this.prev) { var c = n.call(i, "catchLoc"), u = n.call(i, "finallyLoc"); if (c && u) { if (this.prev < i.catchLoc) return handle(i.catchLoc, !0); if (this.prev < i.finallyLoc) return handle(i.finallyLoc); } else if (c) { if (this.prev < i.catchLoc) return handle(i.catchLoc, !0); } else { if (!u) throw Error("try statement without catch or finally"); if (this.prev < i.finallyLoc) return handle(i.finallyLoc); } } } }, abrupt: function abrupt(t, e) { for (var r = this.tryEntries.length - 1; r >= 0; --r) { var o = this.tryEntries[r]; if (o.tryLoc <= this.prev && n.call(o, "finallyLoc") && this.prev < o.finallyLoc) { var i = o; break; } } i && ("break" === t || "continue" === t) && i.tryLoc <= e && e <= i.finallyLoc && (i = null); var a = i ? i.completion : {}; return a.type = t, a.arg = e, i ? (this.method = "next", this.next = i.finallyLoc, y) : this.complete(a); }, complete: function complete(t, e) { if ("throw" === t.type) throw t.arg; return "break" === t.type || "continue" === t.type ? this.next = t.arg : "return" === t.type ? (this.rval = this.arg = t.arg, this.method = "return", this.next = "end") : "normal" === t.type && e && (this.next = e), y; }, finish: function finish(t) { for (var e = this.tryEntries.length - 1; e >= 0; --e) { var r = this.tryEntries[e]; if (r.finallyLoc === t) return this.complete(r.completion, r.afterLoc), resetTryEntry(r), y; } }, "catch": function _catch(t) { for (var e = this.tryEntries.length - 1; e >= 0; --e) { var r = this.tryEntries[e]; if (r.tryLoc === t) { var n = r.completion; if ("throw" === n.type) { var o = n.arg; resetTryEntry(r); } return o; } } throw Error("illegal catch attempt"); }, delegateYield: function delegateYield(e, r, n) { return this.delegate = { iterator: values(e), resultName: r, nextLoc: n }, "next" === this.method && (this.arg = t), y; } }, e; }
function ownKeys(e, r) { var t = Object.keys(e); if (Object.getOwnPropertySymbols) { var o = Object.getOwnPropertySymbols(e); r && (o = o.filter(function (r) { return Object.getOwnPropertyDescriptor(e, r).enumerable; })), t.push.apply(t, o); } return t; }
function _objectSpread(e) { for (var r = 1; r < arguments.length; r++) { var t = null != arguments[r] ? arguments[r] : {}; r % 2 ? ownKeys(Object(t), !0).forEach(function (r) { api_defineProperty(e, r, t[r]); }) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : ownKeys(Object(t)).forEach(function (r) { Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r)); }); } return e; }
function api_defineProperty(e, r, t) { return (r = api_toPropertyKey(r)) in e ? Object.defineProperty(e, r, { value: t, enumerable: !0, configurable: !0, writable: !0 }) : e[r] = t, e; }
function asyncGeneratorStep(n, t, e, r, o, a, c) { try { var i = n[a](c), u = i.value; } catch (n) { return void e(n); } i.done ? t(u) : Promise.resolve(u).then(r, o); }
function _asyncToGenerator(n) { return function () { var t = this, e = arguments; return new Promise(function (r, o) { var a = n.apply(t, e); function _next(n) { asyncGeneratorStep(a, r, o, _next, _throw, "next", n); } function _throw(n) { asyncGeneratorStep(a, r, o, _next, _throw, "throw", n); } _next(void 0); }); }; }
function api_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function api_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, api_toPropertyKey(o.key), o); } }
function api_createClass(e, r, t) { return r && api_defineProperties(e.prototype, r), t && api_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function api_toPropertyKey(t) { var i = api_toPrimitive(t, "string"); return "symbol" == api_typeof(i) ? i : i + ""; }
function api_toPrimitive(t, r) { if ("object" != api_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != api_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }

var api_API = /*#__PURE__*/function () {
  function API() {
    api_classCallCheck(this, API);
  }
  return api_createClass(API, null, [{
    key: "getCsrfToken",
    value: function getCsrfToken() {
      return document.querySelector(idCSRFToken).getAttribute('content');
    }
  }, {
    key: "request",
    value: function () {
      var _request = _asyncToGenerator(/*#__PURE__*/_regeneratorRuntime().mark(function _callee(hashEndpoint) {
        var method,
          data,
          params,
          url,
          csrfToken,
          options,
          response,
          _args = arguments;
        return _regeneratorRuntime().wrap(function _callee$(_context) {
          while (1) switch (_context.prev = _context.next) {
            case 0:
              method = _args.length > 1 && _args[1] !== undefined ? _args[1] : 'GET';
              data = _args.length > 2 && _args[2] !== undefined ? _args[2] : null;
              params = _args.length > 3 && _args[3] !== undefined ? _args[3] : null;
              url = API.getUrlFromHash(hashEndpoint, params);
              csrfToken = API.getCsrfToken();
              options = {
                method: method,
                headers: api_defineProperty({
                  'Content-Type': 'application/json'
                }, flagCsrfToken, csrfToken)
              };
              if (data && (method === 'POST' || method === 'PUT' || method === 'PATCH')) {
                data = _objectSpread(_objectSpread({}, data), {}, api_defineProperty({}, flagCsrfToken, csrfToken));
                options.body = JSON.stringify(data);
              }
              _context.prev = 7;
              _context.next = 10;
              return fetch(url, options);
            case 10:
              response = _context.sent;
              if (response.ok) {
                _context.next = 13;
                break;
              }
              throw new Error("HTTP error! status: ".concat(response.status));
            case 13:
              _context.next = 15;
              return response.json();
            case 15:
              return _context.abrupt("return", _context.sent);
            case 18:
              _context.prev = 18;
              _context.t0 = _context["catch"](7);
              console.error('API request failed:', _context.t0);
              throw _context.t0;
            case 22:
            case "end":
              return _context.stop();
          }
        }, _callee, null, [[7, 18]]);
      }));
      function request(_x) {
        return _request.apply(this, arguments);
      }
      return request;
    }()
  }, {
    key: "getUrlFromHash",
    value: function getUrlFromHash(hash) {
      var params = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : null;
      if (hash == null) hash = hashPageHome;
      var url = API.parameteriseUrl(_pathHost + hash, params);
      return url;
    }
  }, {
    key: "parameteriseUrl",
    value: function parameteriseUrl(url, params) {
      if (params) {
        url += '?' + new URLSearchParams(params).toString();
      }
      return url;
    }
  }, {
    key: "goToUrl",
    value: function goToUrl(url) {
      window.location.href = url;
    }
  }, {
    key: "goToHash",
    value: function goToHash(hash) {
      var params = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : null;
      var url = API.getUrlFromHash(hash, params);
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
  }, {
    key: "loginUser",
    value: function () {
      var _loginUser = _asyncToGenerator(/*#__PURE__*/_regeneratorRuntime().mark(function _callee2() {
        var callback;
        return _regeneratorRuntime().wrap(function _callee2$(_context2) {
          while (1) switch (_context2.prev = _context2.next) {
            case 0:
              callback = {};
              callback[flagCallback] = DOM.getHashPageCurrent();
              _context2.next = 4;
              return API.request(hashPageUserLogin, 'POST', callback);
            case 4:
              return _context2.abrupt("return", _context2.sent);
            case 5:
            case "end":
              return _context2.stop();
          }
        }, _callee2);
      }));
      function loginUser() {
        return _loginUser.apply(this, arguments);
      }
      return loginUser;
    }() // store
    // product categories
  }, {
    key: "saveCategories",
    value: function () {
      var _saveCategories = _asyncToGenerator(/*#__PURE__*/_regeneratorRuntime().mark(function _callee3(categories, formFilters, comment) {
        var dataRequest;
        return _regeneratorRuntime().wrap(function _callee3$(_context3) {
          while (1) switch (_context3.prev = _context3.next) {
            case 0:
              dataRequest = {};
              dataRequest[flagFormFilters] = DOM.convertForm2JSON(formFilters);
              dataRequest[flagProductCategory] = categories;
              dataRequest[flagComment] = comment;
              _context3.next = 6;
              return API.request(hashSaveStoreProductCategory, 'POST', dataRequest);
            case 6:
              return _context3.abrupt("return", _context3.sent);
            case 7:
            case "end":
              return _context3.stop();
          }
        }, _callee3);
      }));
      function saveCategories(_x2, _x3, _x4) {
        return _saveCategories.apply(this, arguments);
      }
      return saveCategories;
    }() // products
  }, {
    key: "saveProducts",
    value: function () {
      var _saveProducts = _asyncToGenerator(/*#__PURE__*/_regeneratorRuntime().mark(function _callee4(products, formFilters, comment) {
        var dataRequest;
        return _regeneratorRuntime().wrap(function _callee4$(_context4) {
          while (1) switch (_context4.prev = _context4.next) {
            case 0:
              dataRequest = {};
              dataRequest[flagFormFilters] = DOM.convertForm2JSON(formFilters);
              dataRequest[flagProduct] = products;
              dataRequest[flagComment] = comment;
              _context4.next = 6;
              return API.request(hashSaveStoreProduct, 'POST', dataRequest);
            case 6:
              return _context4.abrupt("return", _context4.sent);
            case 7:
            case "end":
              return _context4.stop();
          }
        }, _callee4);
      }));
      function saveProducts(_x5, _x6, _x7) {
        return _saveProducts.apply(this, arguments);
      }
      return saveProducts;
    }() // product permutations
  }, {
    key: "saveProductPermutations",
    value: function () {
      var _saveProductPermutations = _asyncToGenerator(/*#__PURE__*/_regeneratorRuntime().mark(function _callee5(permutations, formFilters, comment) {
        var dataRequest;
        return _regeneratorRuntime().wrap(function _callee5$(_context5) {
          while (1) switch (_context5.prev = _context5.next) {
            case 0:
              dataRequest = {};
              dataRequest[flagFormFilters] = DOM.convertForm2JSON(formFilters);
              dataRequest[flagProductPermutation] = permutations;
              dataRequest[flagComment] = comment;
              _context5.next = 6;
              return API.request(hashSaveStoreProductPermutation, 'POST', dataRequest);
            case 6:
              return _context5.abrupt("return", _context5.sent);
            case 7:
            case "end":
              return _context5.stop();
          }
        }, _callee5);
      }));
      function saveProductPermutations(_x8, _x9, _x10) {
        return _saveProductPermutations.apply(this, arguments);
      }
      return saveProductPermutations;
    }() // product variations
  }, {
    key: "saveProductVariations",
    value: function () {
      var _saveProductVariations = _asyncToGenerator(/*#__PURE__*/_regeneratorRuntime().mark(function _callee6(variationTypes, formFilters, comment) {
        var dataRequest;
        return _regeneratorRuntime().wrap(function _callee6$(_context6) {
          while (1) switch (_context6.prev = _context6.next) {
            case 0:
              dataRequest = {};
              dataRequest[flagFormFilters] = DOM.convertForm2JSON(formFilters);
              dataRequest[flagProductVariationType] = variationTypes;
              dataRequest[flagComment] = comment;
              _context6.next = 6;
              return API.request(hashSaveStoreProductVariation, 'POST', dataRequest);
            case 6:
              return _context6.abrupt("return", _context6.sent);
            case 7:
            case "end":
              return _context6.stop();
          }
        }, _callee6);
      }));
      function saveProductVariations(_x11, _x12, _x13) {
        return _saveProductVariations.apply(this, arguments);
      }
      return saveProductVariations;
    }() // stock items
  }, {
    key: "saveStockItems",
    value: function () {
      var _saveStockItems = _asyncToGenerator(/*#__PURE__*/_regeneratorRuntime().mark(function _callee7(stockItems, formFilters, comment) {
        var dataRequest;
        return _regeneratorRuntime().wrap(function _callee7$(_context7) {
          while (1) switch (_context7.prev = _context7.next) {
            case 0:
              dataRequest = {};
              dataRequest[flagFormFilters] = DOM.convertForm2JSON(formFilters);
              dataRequest[flagStockItem] = stockItems;
              dataRequest[flagComment] = comment;
              _context7.next = 6;
              return API.request(hashSaveStoreStockItem, 'POST', dataRequest);
            case 6:
              return _context7.abrupt("return", _context7.sent);
            case 7:
            case "end":
              return _context7.stop();
          }
        }, _callee7);
      }));
      function saveStockItems(_x14, _x15, _x16) {
        return _saveStockItems.apply(this, arguments);
      }
      return saveStockItems;
    }() // suppliers
  }, {
    key: "saveSuppliers",
    value: function () {
      var _saveSuppliers = _asyncToGenerator(/*#__PURE__*/_regeneratorRuntime().mark(function _callee8(suppliers, formFilters, comment) {
        var dataRequest;
        return _regeneratorRuntime().wrap(function _callee8$(_context8) {
          while (1) switch (_context8.prev = _context8.next) {
            case 0:
              dataRequest = {};
              dataRequest[flagFormFilters] = DOM.convertForm2JSON(formFilters);
              dataRequest[flagSupplier] = suppliers;
              dataRequest[flagComment] = comment;
              _context8.next = 6;
              return API.request(hashSaveStoreSupplier, 'POST', dataRequest);
            case 6:
              return _context8.abrupt("return", _context8.sent);
            case 7:
            case "end":
              return _context8.stop();
          }
        }, _callee8);
      }));
      function saveSuppliers(_x17, _x18, _x19) {
        return _saveSuppliers.apply(this, arguments);
      }
      return saveSuppliers;
    }() // supplier purchase orders
  }, {
    key: "saveSupplierPurchaseOrders",
    value: function () {
      var _saveSupplierPurchaseOrders = _asyncToGenerator(/*#__PURE__*/_regeneratorRuntime().mark(function _callee9(supplierPurchaseOrders, formFilters, comment) {
        var dataRequest;
        return _regeneratorRuntime().wrap(function _callee9$(_context9) {
          while (1) switch (_context9.prev = _context9.next) {
            case 0:
              dataRequest = {};
              dataRequest[flagFormFilters] = DOM.convertForm2JSON(formFilters);
              dataRequest[flagSupplierPurchaseOrder] = supplierPurchaseOrders;
              dataRequest[flagComment] = comment;
              _context9.next = 6;
              return API.request(hashSaveStoreSupplierPurchaseOrder, 'POST', dataRequest);
            case 6:
              return _context9.abrupt("return", _context9.sent);
            case 7:
            case "end":
              return _context9.stop();
          }
        }, _callee9);
      }));
      function saveSupplierPurchaseOrders(_x20, _x21, _x22) {
        return _saveSupplierPurchaseOrders.apply(this, arguments);
      }
      return saveSupplierPurchaseOrders;
    }() // manufacturing purchase orders
  }, {
    key: "saveManufacturingPurchaseOrders",
    value: function () {
      var _saveManufacturingPurchaseOrders = _asyncToGenerator(/*#__PURE__*/_regeneratorRuntime().mark(function _callee10(manufacturingPurchaseOrders, formFilters, comment) {
        var dataRequest;
        return _regeneratorRuntime().wrap(function _callee10$(_context10) {
          while (1) switch (_context10.prev = _context10.next) {
            case 0:
              dataRequest = {};
              dataRequest[flagFormFilters] = DOM.convertForm2JSON(formFilters);
              dataRequest[flagManufacturingPurchaseOrder] = manufacturingPurchaseOrders;
              dataRequest[flagComment] = comment;
              _context10.next = 6;
              return API.request(hashSaveStoreManufacturingPurchaseOrder, 'POST', dataRequest);
            case 6:
              return _context10.abrupt("return", _context10.sent);
            case 7:
            case "end":
              return _context10.stop();
          }
        }, _callee10);
      }));
      function saveManufacturingPurchaseOrders(_x23, _x24, _x25) {
        return _saveManufacturingPurchaseOrders.apply(this, arguments);
      }
      return saveManufacturingPurchaseOrders;
    }()
  }]);
}();
/*

const api = new API();
export default api;

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

;// CONCATENATED MODULE: ./static/js/components/common/temporary/overlay_confirm.js
function overlay_confirm_typeof(o) { "@babel/helpers - typeof"; return overlay_confirm_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, overlay_confirm_typeof(o); }
function overlay_confirm_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function overlay_confirm_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, overlay_confirm_toPropertyKey(o.key), o); } }
function overlay_confirm_createClass(e, r, t) { return r && overlay_confirm_defineProperties(e.prototype, r), t && overlay_confirm_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function overlay_confirm_toPropertyKey(t) { var i = overlay_confirm_toPrimitive(t, "string"); return "symbol" == overlay_confirm_typeof(i) ? i : i + ""; }
function overlay_confirm_toPrimitive(t, r) { if ("object" != overlay_confirm_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != overlay_confirm_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }

var OverlayConfirm = /*#__PURE__*/function () {
  function OverlayConfirm() {
    overlay_confirm_classCallCheck(this, OverlayConfirm);
  }
  return overlay_confirm_createClass(OverlayConfirm, null, [{
    key: "hookup",
    value: function hookup(callbackSuccess) {
      Events.initialiseEventHandler(idOverlayConfirm + ' button.' + flagCancel, flagInitialised, function (buttonCancel) {
        buttonCancel.addEventListener('click', function () {
          var overlay = document.querySelector(idOverlayConfirm);
          overlay.style.visibility = 'hidden';
        });
      });
      Events.initialiseEventHandler(idOverlayConfirm + ' button.' + flagSubmit, flagInitialised, function (buttonConfirm) {
        buttonConfirm.addEventListener('click', function () {
          var overlay = document.querySelector(idOverlayConfirm);
          var textarea = overlay.querySelector('textarea');
          overlay.style.visibility = 'hidden';
          callbackSuccess(textarea.value);
        });
      });
    }
  }, {
    key: "show",
    value: function show() {
      var overlay = document.querySelector(idOverlayConfirm);
      overlay.classList.remove(flagCollapsed);
      overlay.style.visibility = 'visible';
    }
  }]);
}();

;// CONCATENATED MODULE: ./static/js/pages/base.js
function base_typeof(o) { "@babel/helpers - typeof"; return base_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, base_typeof(o); }
function base_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function base_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, base_toPropertyKey(o.key), o); } }
function base_createClass(e, r, t) { return r && base_defineProperties(e.prototype, r), t && base_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function base_toPropertyKey(t) { var i = base_toPrimitive(t, "string"); return "symbol" == base_typeof(i) ? i : i + ""; }
function base_toPrimitive(t, r) { if ("object" != base_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != base_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }







var BasePage = /*#__PURE__*/function () {
  function BasePage(router) {
    base_classCallCheck(this, BasePage);
    if (!router) {
      throw new Error("Router is required");
    } else {
      if (_verbose) {
        console.log("initialising with router: ", router);
      }
    }
    this.router = router;
    this.title = titlePageCurrent;
    // this.hash = hashPageCurrent;
    if (this.constructor === BasePage) {
      throw new Error("Cannot instantiate abstract class");
    }
    if (!this.constructor.hash) {
      throw new Error("Class ".concat(this.constructor.name, " must have a static hash attribute."));
    }
  }
  return base_createClass(BasePage, [{
    key: "initialize",
    value: function initialize() {
      throw new Error("Method 'initialize()' must be implemented.");
    }
  }, {
    key: "sharedInitialize",
    value: function sharedInitialize() {
      this.logInitialisation();
      this.hookupCommonElements();
    }
  }, {
    key: "logInitialisation",
    value: function logInitialisation() {
      if (_verbose) {
        console.log('Initializing ' + this.title + ' page');
      }
    }
  }, {
    key: "hookupCommonElements",
    value: function hookupCommonElements() {
      // hookupVideos();
      this.hookupNavigation();
      this.hookupImagesLogo();
      this.hookupOverlays();
    }
  }, {
    key: "hookupNavigation",
    value: function hookupNavigation() {
      this.hookupEventHandler("click", idButtonHamburger, function (event, element) {
        var overlayHamburger = document.querySelector(idOverlayHamburger);
        if (overlayHamburger.classList.contains(flagCollapsed)) {
          overlayHamburger.classList.remove(flagCollapsed);
          overlayHamburger.classList.add(flagExpanded);
        } else {
          overlayHamburger.classList.remove(flagExpanded);
          overlayHamburger.classList.add(flagCollapsed);
        }
      });
      this.hookupButtonsNavHome();
      this.hookupButtonsNavServices();
      this.hookupButtonsNavContact();
      this.hookupButtonsNavUserAccount();
      this.hookupButtonsNavUserLogout();
      this.hookupButtonsNavUserLogin();
      this.hookupButtonsNavStoreHome();
      this.hookupButtonsNavStoreManufacturingPurchaseOrders();
      this.hookupButtonsNavStoreProductPermutations();
      this.hookupButtonsNavStoreStockItems();
      this.hookupButtonsNavStoreSuppliers();
      this.hookupButtonsNavStoreSupplierPurchaseOrders();
      this.hookupButtonsNavAdminHome();
    }
  }, {
    key: "hookupEventHandler",
    value: function hookupEventHandler(eventType, selector, callback) {
      Events.initialiseEventHandler(selector, flagInitialised, function (element) {
        element.addEventListener(eventType, function (event) {
          event.stopPropagation();
          callback(event, element);
        });
      });
    }
  }, {
    key: "hookupButtonsNavHome",
    value: function hookupButtonsNavHome() {
      this.hookupButtonsNav('.' + flagNavHome, hashPageHome);
    }
  }, {
    key: "hookupButtonsNav",
    value: function hookupButtonsNav(buttonSelector, hashPageNav) {
      var _this = this;
      this.hookupEventHandler("click", buttonSelector, function (event, button) {
        _this.router.navigateToHash(hashPageNav);
      });
    }
  }, {
    key: "hookupButtonsNavServices",
    value: function hookupButtonsNavServices() {
      this.hookupButtonsNav('.' + flagNavServices, hashPageServices);
    }
  }, {
    key: "hookupButtonsNavContact",
    value: function hookupButtonsNavContact() {
      this.hookupButtonsNav('.' + flagNavContact, hashPageContact);
    }
  }, {
    key: "hookupButtonsNavUserAccount",
    value: function hookupButtonsNavUserAccount() {
      this.hookupButtonsNav('.' + flagNavUserAccount, hashPageUserAccount);
    }
  }, {
    key: "hookupButtonsNavUserLogout",
    value: function hookupButtonsNavUserLogout() {
      this.hookupButtonsNav('.' + flagNavUserLogout, hashPageUserLogout);
    }
  }, {
    key: "hookupButtonsNavUserLogin",
    value: function hookupButtonsNavUserLogin() {
      var _this2 = this;
      this.hookupEventHandler("click", '.' + flagNavUserLogin, function (event, navigator) {
        event.stopPropagation();
        _this2.leave();
        api_API.loginUser().then(function (response) {
          if (response.Success) {
            window.location.href = response[flagCallback];
          } else {
            DOM.alertError("Error", response.Message);
          }
        });
      });
    }
  }, {
    key: "hookupButtonsNavStoreHome",
    value: function hookupButtonsNavStoreHome() {
      this.hookupButtonsNav('.' + flagNavStoreHome, hashPageStoreHome);
    }
  }, {
    key: "hookupButtonsNavStoreManufacturingPurchaseOrders",
    value: function hookupButtonsNavStoreManufacturingPurchaseOrders() {
      this.hookupButtonsNav('.' + flagNavStoreManufacturingPurchaseOrders, hashPageStoreManufacturingPurchaseOrders);
    }
  }, {
    key: "hookupButtonsNavStoreProductCategories",
    value: function hookupButtonsNavStoreProductCategories() {
      this.hookupButtonsNav('.' + flagNavStoreProductCategories, hashPageStoreProductCategories);
    }
  }, {
    key: "hookupButtonsNavStoreProducts",
    value: function hookupButtonsNavStoreProducts() {
      this.hookupButtonsNav('.' + flagNavStoreProducts, hashPageStoreProducts);
    }
  }, {
    key: "hookupButtonsNavStoreProductPermutations",
    value: function hookupButtonsNavStoreProductPermutations() {
      this.hookupButtonsNav('.' + flagNavStoreProductPermutations, hashPageStoreProductPermutations);
    }
  }, {
    key: "hookupButtonsNavStoreProductPrices",
    value: function hookupButtonsNavStoreProductPrices() {
      this.hookupButtonsNav('.' + flagNavStoreProductPrices, hashPageStoreProductPrices);
    }
  }, {
    key: "hookupButtonsNavStoreProductVariations",
    value: function hookupButtonsNavStoreProductVariations() {
      this.hookupButtonsNav('.' + flagNavStoreProductVariations, hashPageStoreProductVariations);
    }
  }, {
    key: "hookupButtonsNavStoreStockItems",
    value: function hookupButtonsNavStoreStockItems() {
      this.hookupButtonsNav('.' + flagNavStoreStockItems, hashPageStoreStockItems);
    }
  }, {
    key: "hookupButtonsNavAdminHome",
    value: function hookupButtonsNavAdminHome() {
      this.hookupButtonsNav('.' + flagNavAdminHome, hashPageAdminHome);
    }
  }, {
    key: "hookupButtonsNavStoreSuppliers",
    value: function hookupButtonsNavStoreSuppliers() {
      this.hookupButtonsNav('.' + flagNavStoreSuppliers, hashPageStoreSuppliers);
    }
  }, {
    key: "hookupButtonsNavStoreSupplierPurchaseOrders",
    value: function hookupButtonsNavStoreSupplierPurchaseOrders() {
      this.hookupButtonsNav('.' + flagNavStoreSupplierPurchaseOrders, hashPageStoreSupplierPurchaseOrders);
    }
  }, {
    key: "hookupImagesLogo",
    value: function hookupImagesLogo() {
      this.hookupButtonsNav("img." + flagImageLogo, hashPageHome);
    }
  }, {
    key: "hookupOverlays",
    value: function hookupOverlays() {
      this.hookupOverlayFromId(idOverlayConfirm);
      this.hookupOverlayFromId(idOverlayError);
    }
  }, {
    key: "hookupOverlayFromId",
    value: function hookupOverlayFromId(idOverlay) {
      Events.initialiseEventHandler(idOverlay, flagInitialised, function (overlay) {
        overlay.querySelector('button.' + flagCancel).addEventListener("click", function (event) {
          event.stopPropagation();
          overlay.style.display = 'none';
        });
      });
    }
  }, {
    key: "hookupButtonSave",
    value: function hookupButtonSave() {
      var _this3 = this;
      Events.initialiseEventHandler('form.' + flagFilter + ' button.' + flagSave, flagInitialised, function (button) {
        button.addEventListener("click", function (event) {
          event.stopPropagation();
          if (_verbose) {
            console.log('saving page: ', _this3.title);
          }
          OverlayConfirm.show();
        });
      });
    }
  }, {
    key: "hookupVideos",
    value: function hookupVideos() {
      Events.initialiseEventHandler('video', flagInitialised, function (video) {
        video.addEventListener("mouseover", videoPlay(video));
        video.addEventListener("mouseout", videoPause(video));
      });
    }
  }, {
    key: "leave",
    value: function leave() {
      if (_verbose) {
        console.log('Leaving ' + this.title + ' page');
      }
      if (this.constructor === BasePage) {
        throw new Error("Must implement leave() method.");
      }
    }
  }, {
    key: "setLocalStoragePage",
    value: function setLocalStoragePage(dataPage) {
      LocalStorage.setLocalStorage(this.hash, dataPage);
    }
  }, {
    key: "getLocalStoragePage",
    value: function getLocalStoragePage() {
      return LocalStorage.getLocalStorage(this.hash);
    }
  }, {
    key: "toggleShowButtonsSaveCancel",
    value: function toggleShowButtonsSaveCancel(show) {
      var buttonSave = document.querySelector('form.' + flagFilter + ' button.' + flagSave);
      var buttonCancel = document.querySelector('form.' + flagFilter + ' button.' + flagCancel);
      if (show) {
        buttonCancel.classList.remove(flagCollapsed);
        buttonSave.classList.remove(flagCollapsed);
        if (_verbose) {
          console.log('showing buttons');
        }
      } else {
        buttonCancel.classList.add(flagCollapsed);
        buttonSave.classList.add(flagCollapsed);
        if (_verbose) {
          console.log('hiding buttons');
        }
      }
    }
  }], [{
    key: "isDirtyFilter",
    value: function isDirtyFilter(filter) {
      var isDirty = DOM.updateAndCheckIsElementDirty(filter);
      if (isDirty) document.querySelectorAll(idTableMain + ' tbody tr').remove();
      return isDirty;
    }
  }]);
}();

;// CONCATENATED MODULE: ./static/js/pages/core/admin_home.js
function admin_home_typeof(o) { "@babel/helpers - typeof"; return admin_home_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, admin_home_typeof(o); }
function admin_home_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function admin_home_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, admin_home_toPropertyKey(o.key), o); } }
function admin_home_createClass(e, r, t) { return r && admin_home_defineProperties(e.prototype, r), t && admin_home_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function _callSuper(t, o, e) { return o = _getPrototypeOf(o), _possibleConstructorReturn(t, _isNativeReflectConstruct() ? Reflect.construct(o, e || [], _getPrototypeOf(t).constructor) : o.apply(t, e)); }
function _possibleConstructorReturn(t, e) { if (e && ("object" == admin_home_typeof(e) || "function" == typeof e)) return e; if (void 0 !== e) throw new TypeError("Derived constructors may only return object or undefined"); return _assertThisInitialized(t); }
function _assertThisInitialized(e) { if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); return e; }
function _isNativeReflectConstruct() { try { var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); } catch (t) {} return (_isNativeReflectConstruct = function _isNativeReflectConstruct() { return !!t; })(); }
function _superPropGet(t, e, o, r) { var p = _get(_getPrototypeOf(1 & r ? t.prototype : t), e, o); return 2 & r && "function" == typeof p ? function (t) { return p.apply(o, t); } : p; }
function _get() { return _get = "undefined" != typeof Reflect && Reflect.get ? Reflect.get.bind() : function (e, t, r) { var p = _superPropBase(e, t); if (p) { var n = Object.getOwnPropertyDescriptor(p, t); return n.get ? n.get.call(arguments.length < 3 ? e : r) : n.value; } }, _get.apply(null, arguments); }
function _superPropBase(t, o) { for (; !{}.hasOwnProperty.call(t, o) && null !== (t = _getPrototypeOf(t));); return t; }
function _getPrototypeOf(t) { return _getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function (t) { return t.__proto__ || Object.getPrototypeOf(t); }, _getPrototypeOf(t); }
function _inherits(t, e) { if ("function" != typeof e && null !== e) throw new TypeError("Super expression must either be null or a function"); t.prototype = Object.create(e && e.prototype, { constructor: { value: t, writable: !0, configurable: !0 } }), Object.defineProperty(t, "prototype", { writable: !1 }), e && _setPrototypeOf(t, e); }
function _setPrototypeOf(t, e) { return _setPrototypeOf = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function (t, e) { return t.__proto__ = e, t; }, _setPrototypeOf(t, e); }
function admin_home_defineProperty(e, r, t) { return (r = admin_home_toPropertyKey(r)) in e ? Object.defineProperty(e, r, { value: t, enumerable: !0, configurable: !0, writable: !0 }) : e[r] = t, e; }
function admin_home_toPropertyKey(t) { var i = admin_home_toPrimitive(t, "string"); return "symbol" == admin_home_typeof(i) ? i : i + ""; }
function admin_home_toPrimitive(t, r) { if ("object" != admin_home_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != admin_home_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }


var PageAdminHome = /*#__PURE__*/function (_BasePage) {
  function PageAdminHome(router) {
    admin_home_classCallCheck(this, PageAdminHome);
    return _callSuper(this, PageAdminHome, [router]);
  }
  _inherits(PageAdminHome, _BasePage);
  return admin_home_createClass(PageAdminHome, [{
    key: "initialize",
    value: function initialize() {
      this.sharedInitialize();
      this.hookupAdminStore();
    }
  }, {
    key: "hookupAdminStore",
    value: function hookupAdminStore() {
      this.hookupButtonsNavStoreProductCategories();
      this.hookupButtonsNavStoreProducts();
      this.hookupButtonsNavStoreProductPermutations();
      this.hookupButtonsNavStoreProductPrices();
      this.hookupButtonsNavStoreStockItems();
      this.hookupButtonsNavStoreProductVariations();
      this.hookupButtonsNavAdminStoreStripeProducts();
      this.hookupButtonsNavAdminStoreStripePrices();
    }
  }, {
    key: "hookupButtonsNavAdminStoreStripeProducts",
    value: function hookupButtonsNavAdminStoreStripeProducts() {
      Events.initialiseEventHandler('.' + flagNavAdminStoreStripeProducts, flagInitialised, function (navigator) {
        navigator.addEventListener("click", function (event) {
          this.router.navigateToHash(hashPageAdminStoreStripeProducts);
        });
      });
    }
  }, {
    key: "hookupButtonsNavAdminStoreStripePrices",
    value: function hookupButtonsNavAdminStoreStripePrices() {
      Events.initialiseEventHandler('.' + flagNavAdminStoreStripePrices, flagInitialised, function (navigator) {
        navigator.addEventListener("click", function (event) {
          this.router.navigateToHash(hashPageAdminStoreStripePrices);
        });
      });
    }
  }, {
    key: "leave",
    value: function leave() {
      _superPropGet(PageAdminHome, "leave", this, 3)([]);
    }
  }]);
}(BasePage);
admin_home_defineProperty(PageAdminHome, "hash", hashPageAdminHome);

;// CONCATENATED MODULE: ./static/js/pages/core/home.js
function home_typeof(o) { "@babel/helpers - typeof"; return home_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, home_typeof(o); }
function home_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function home_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, home_toPropertyKey(o.key), o); } }
function home_createClass(e, r, t) { return r && home_defineProperties(e.prototype, r), t && home_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function home_callSuper(t, o, e) { return o = home_getPrototypeOf(o), home_possibleConstructorReturn(t, home_isNativeReflectConstruct() ? Reflect.construct(o, e || [], home_getPrototypeOf(t).constructor) : o.apply(t, e)); }
function home_possibleConstructorReturn(t, e) { if (e && ("object" == home_typeof(e) || "function" == typeof e)) return e; if (void 0 !== e) throw new TypeError("Derived constructors may only return object or undefined"); return home_assertThisInitialized(t); }
function home_assertThisInitialized(e) { if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); return e; }
function home_isNativeReflectConstruct() { try { var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); } catch (t) {} return (home_isNativeReflectConstruct = function _isNativeReflectConstruct() { return !!t; })(); }
function home_superPropGet(t, e, o, r) { var p = home_get(home_getPrototypeOf(1 & r ? t.prototype : t), e, o); return 2 & r && "function" == typeof p ? function (t) { return p.apply(o, t); } : p; }
function home_get() { return home_get = "undefined" != typeof Reflect && Reflect.get ? Reflect.get.bind() : function (e, t, r) { var p = home_superPropBase(e, t); if (p) { var n = Object.getOwnPropertyDescriptor(p, t); return n.get ? n.get.call(arguments.length < 3 ? e : r) : n.value; } }, home_get.apply(null, arguments); }
function home_superPropBase(t, o) { for (; !{}.hasOwnProperty.call(t, o) && null !== (t = home_getPrototypeOf(t));); return t; }
function home_getPrototypeOf(t) { return home_getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function (t) { return t.__proto__ || Object.getPrototypeOf(t); }, home_getPrototypeOf(t); }
function home_inherits(t, e) { if ("function" != typeof e && null !== e) throw new TypeError("Super expression must either be null or a function"); t.prototype = Object.create(e && e.prototype, { constructor: { value: t, writable: !0, configurable: !0 } }), Object.defineProperty(t, "prototype", { writable: !1 }), e && home_setPrototypeOf(t, e); }
function home_setPrototypeOf(t, e) { return home_setPrototypeOf = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function (t, e) { return t.__proto__ = e, t; }, home_setPrototypeOf(t, e); }
function home_defineProperty(e, r, t) { return (r = home_toPropertyKey(r)) in e ? Object.defineProperty(e, r, { value: t, enumerable: !0, configurable: !0, writable: !0 }) : e[r] = t, e; }
function home_toPropertyKey(t) { var i = home_toPrimitive(t, "string"); return "symbol" == home_typeof(i) ? i : i + ""; }
function home_toPrimitive(t, r) { if ("object" != home_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != home_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }

var PageHome = /*#__PURE__*/function (_BasePage) {
  function PageHome(router) {
    home_classCallCheck(this, PageHome);
    return home_callSuper(this, PageHome, [router]);
  }
  home_inherits(PageHome, _BasePage);
  return home_createClass(PageHome, [{
    key: "initialize",
    value: function initialize() {
      this.sharedInitialize();
      this.hookupButtonsNavContact();
    }
  }, {
    key: "leave",
    value: function leave() {
      home_superPropGet(PageHome, "leave", this, 3)([]);
    }
  }]);
}(BasePage);
home_defineProperty(PageHome, "hash", hashPageHome);

;// CONCATENATED MODULE: ./static/js/pages/core/contact.js
function contact_typeof(o) { "@babel/helpers - typeof"; return contact_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, contact_typeof(o); }
function contact_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function contact_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, contact_toPropertyKey(o.key), o); } }
function contact_createClass(e, r, t) { return r && contact_defineProperties(e.prototype, r), t && contact_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function contact_callSuper(t, o, e) { return o = contact_getPrototypeOf(o), contact_possibleConstructorReturn(t, contact_isNativeReflectConstruct() ? Reflect.construct(o, e || [], contact_getPrototypeOf(t).constructor) : o.apply(t, e)); }
function contact_possibleConstructorReturn(t, e) { if (e && ("object" == contact_typeof(e) || "function" == typeof e)) return e; if (void 0 !== e) throw new TypeError("Derived constructors may only return object or undefined"); return contact_assertThisInitialized(t); }
function contact_assertThisInitialized(e) { if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); return e; }
function contact_isNativeReflectConstruct() { try { var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); } catch (t) {} return (contact_isNativeReflectConstruct = function _isNativeReflectConstruct() { return !!t; })(); }
function contact_getPrototypeOf(t) { return contact_getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function (t) { return t.__proto__ || Object.getPrototypeOf(t); }, contact_getPrototypeOf(t); }
function contact_inherits(t, e) { if ("function" != typeof e && null !== e) throw new TypeError("Super expression must either be null or a function"); t.prototype = Object.create(e && e.prototype, { constructor: { value: t, writable: !0, configurable: !0 } }), Object.defineProperty(t, "prototype", { writable: !1 }), e && contact_setPrototypeOf(t, e); }
function contact_setPrototypeOf(t, e) { return contact_setPrototypeOf = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function (t, e) { return t.__proto__ = e, t; }, contact_setPrototypeOf(t, e); }
function contact_defineProperty(e, r, t) { return (r = contact_toPropertyKey(r)) in e ? Object.defineProperty(e, r, { value: t, enumerable: !0, configurable: !0, writable: !0 }) : e[r] = t, e; }
function contact_toPropertyKey(t) { var i = contact_toPrimitive(t, "string"); return "symbol" == contact_typeof(i) ? i : i + ""; }
function contact_toPrimitive(t, r) { if ("object" != contact_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != contact_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }

var PageContact = /*#__PURE__*/function (_BasePage) {
  function PageContact(router) {
    contact_classCallCheck(this, PageContact);
    return contact_callSuper(this, PageContact, [router]);
  }
  contact_inherits(PageContact, _BasePage);
  return contact_createClass(PageContact, [{
    key: "initialize",
    value: function initialize() {
      this.sharedInitialize();
    }
  }]);
}(BasePage);
contact_defineProperty(PageContact, "hash", hashPageContact);

;// CONCATENATED MODULE: ./static/js/pages/core/services.js
function services_typeof(o) { "@babel/helpers - typeof"; return services_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, services_typeof(o); }
function services_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function services_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, services_toPropertyKey(o.key), o); } }
function services_createClass(e, r, t) { return r && services_defineProperties(e.prototype, r), t && services_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function services_callSuper(t, o, e) { return o = services_getPrototypeOf(o), services_possibleConstructorReturn(t, services_isNativeReflectConstruct() ? Reflect.construct(o, e || [], services_getPrototypeOf(t).constructor) : o.apply(t, e)); }
function services_possibleConstructorReturn(t, e) { if (e && ("object" == services_typeof(e) || "function" == typeof e)) return e; if (void 0 !== e) throw new TypeError("Derived constructors may only return object or undefined"); return services_assertThisInitialized(t); }
function services_assertThisInitialized(e) { if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); return e; }
function services_isNativeReflectConstruct() { try { var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); } catch (t) {} return (services_isNativeReflectConstruct = function _isNativeReflectConstruct() { return !!t; })(); }
function services_superPropGet(t, e, o, r) { var p = services_get(services_getPrototypeOf(1 & r ? t.prototype : t), e, o); return 2 & r && "function" == typeof p ? function (t) { return p.apply(o, t); } : p; }
function services_get() { return services_get = "undefined" != typeof Reflect && Reflect.get ? Reflect.get.bind() : function (e, t, r) { var p = services_superPropBase(e, t); if (p) { var n = Object.getOwnPropertyDescriptor(p, t); return n.get ? n.get.call(arguments.length < 3 ? e : r) : n.value; } }, services_get.apply(null, arguments); }
function services_superPropBase(t, o) { for (; !{}.hasOwnProperty.call(t, o) && null !== (t = services_getPrototypeOf(t));); return t; }
function services_getPrototypeOf(t) { return services_getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function (t) { return t.__proto__ || Object.getPrototypeOf(t); }, services_getPrototypeOf(t); }
function services_inherits(t, e) { if ("function" != typeof e && null !== e) throw new TypeError("Super expression must either be null or a function"); t.prototype = Object.create(e && e.prototype, { constructor: { value: t, writable: !0, configurable: !0 } }), Object.defineProperty(t, "prototype", { writable: !1 }), e && services_setPrototypeOf(t, e); }
function services_setPrototypeOf(t, e) { return services_setPrototypeOf = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function (t, e) { return t.__proto__ = e, t; }, services_setPrototypeOf(t, e); }
function services_defineProperty(e, r, t) { return (r = services_toPropertyKey(r)) in e ? Object.defineProperty(e, r, { value: t, enumerable: !0, configurable: !0, writable: !0 }) : e[r] = t, e; }
function services_toPropertyKey(t) { var i = services_toPrimitive(t, "string"); return "symbol" == services_typeof(i) ? i : i + ""; }
function services_toPrimitive(t, r) { if ("object" != services_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != services_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }

var PageServices = /*#__PURE__*/function (_BasePage) {
  function PageServices(router) {
    services_classCallCheck(this, PageServices);
    return services_callSuper(this, PageServices, [router]);
  }
  services_inherits(PageServices, _BasePage);
  return services_createClass(PageServices, [{
    key: "initialize",
    value: function initialize() {
      this.sharedInitialize();
    }
  }, {
    key: "leave",
    value: function leave() {
      services_superPropGet(PageServices, "leave", this, 3)([]);
    }
  }]);
}(BasePage);
services_defineProperty(PageServices, "hash", hashPageServices);

;// CONCATENATED MODULE: ./static/js/pages/legal/accessibility_report.js
function accessibility_report_typeof(o) { "@babel/helpers - typeof"; return accessibility_report_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, accessibility_report_typeof(o); }
function accessibility_report_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function accessibility_report_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, accessibility_report_toPropertyKey(o.key), o); } }
function accessibility_report_createClass(e, r, t) { return r && accessibility_report_defineProperties(e.prototype, r), t && accessibility_report_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function accessibility_report_callSuper(t, o, e) { return o = accessibility_report_getPrototypeOf(o), accessibility_report_possibleConstructorReturn(t, accessibility_report_isNativeReflectConstruct() ? Reflect.construct(o, e || [], accessibility_report_getPrototypeOf(t).constructor) : o.apply(t, e)); }
function accessibility_report_possibleConstructorReturn(t, e) { if (e && ("object" == accessibility_report_typeof(e) || "function" == typeof e)) return e; if (void 0 !== e) throw new TypeError("Derived constructors may only return object or undefined"); return accessibility_report_assertThisInitialized(t); }
function accessibility_report_assertThisInitialized(e) { if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); return e; }
function accessibility_report_isNativeReflectConstruct() { try { var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); } catch (t) {} return (accessibility_report_isNativeReflectConstruct = function _isNativeReflectConstruct() { return !!t; })(); }
function accessibility_report_superPropGet(t, e, o, r) { var p = accessibility_report_get(accessibility_report_getPrototypeOf(1 & r ? t.prototype : t), e, o); return 2 & r && "function" == typeof p ? function (t) { return p.apply(o, t); } : p; }
function accessibility_report_get() { return accessibility_report_get = "undefined" != typeof Reflect && Reflect.get ? Reflect.get.bind() : function (e, t, r) { var p = accessibility_report_superPropBase(e, t); if (p) { var n = Object.getOwnPropertyDescriptor(p, t); return n.get ? n.get.call(arguments.length < 3 ? e : r) : n.value; } }, accessibility_report_get.apply(null, arguments); }
function accessibility_report_superPropBase(t, o) { for (; !{}.hasOwnProperty.call(t, o) && null !== (t = accessibility_report_getPrototypeOf(t));); return t; }
function accessibility_report_getPrototypeOf(t) { return accessibility_report_getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function (t) { return t.__proto__ || Object.getPrototypeOf(t); }, accessibility_report_getPrototypeOf(t); }
function accessibility_report_inherits(t, e) { if ("function" != typeof e && null !== e) throw new TypeError("Super expression must either be null or a function"); t.prototype = Object.create(e && e.prototype, { constructor: { value: t, writable: !0, configurable: !0 } }), Object.defineProperty(t, "prototype", { writable: !1 }), e && accessibility_report_setPrototypeOf(t, e); }
function accessibility_report_setPrototypeOf(t, e) { return accessibility_report_setPrototypeOf = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function (t, e) { return t.__proto__ = e, t; }, accessibility_report_setPrototypeOf(t, e); }
function accessibility_report_defineProperty(e, r, t) { return (r = accessibility_report_toPropertyKey(r)) in e ? Object.defineProperty(e, r, { value: t, enumerable: !0, configurable: !0, writable: !0 }) : e[r] = t, e; }
function accessibility_report_toPropertyKey(t) { var i = accessibility_report_toPrimitive(t, "string"); return "symbol" == accessibility_report_typeof(i) ? i : i + ""; }
function accessibility_report_toPrimitive(t, r) { if ("object" != accessibility_report_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != accessibility_report_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }

var PageAccessibilityReport = /*#__PURE__*/function (_BasePage) {
  function PageAccessibilityReport(router) {
    accessibility_report_classCallCheck(this, PageAccessibilityReport);
    return accessibility_report_callSuper(this, PageAccessibilityReport, [router]);
  }
  accessibility_report_inherits(PageAccessibilityReport, _BasePage);
  return accessibility_report_createClass(PageAccessibilityReport, [{
    key: "initialize",
    value: function initialize() {
      this.sharedInitialize();
    }
  }, {
    key: "leave",
    value: function leave() {
      accessibility_report_superPropGet(PageAccessibilityReport, "leave", this, 3)([]);
    }
  }]);
}(BasePage);
accessibility_report_defineProperty(PageAccessibilityReport, "hash", hashPageAccessibilityReport);

;// CONCATENATED MODULE: ./static/js/pages/legal/accessibility_statement.js
function accessibility_statement_typeof(o) { "@babel/helpers - typeof"; return accessibility_statement_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, accessibility_statement_typeof(o); }
function accessibility_statement_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function accessibility_statement_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, accessibility_statement_toPropertyKey(o.key), o); } }
function accessibility_statement_createClass(e, r, t) { return r && accessibility_statement_defineProperties(e.prototype, r), t && accessibility_statement_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function accessibility_statement_callSuper(t, o, e) { return o = accessibility_statement_getPrototypeOf(o), accessibility_statement_possibleConstructorReturn(t, accessibility_statement_isNativeReflectConstruct() ? Reflect.construct(o, e || [], accessibility_statement_getPrototypeOf(t).constructor) : o.apply(t, e)); }
function accessibility_statement_possibleConstructorReturn(t, e) { if (e && ("object" == accessibility_statement_typeof(e) || "function" == typeof e)) return e; if (void 0 !== e) throw new TypeError("Derived constructors may only return object or undefined"); return accessibility_statement_assertThisInitialized(t); }
function accessibility_statement_assertThisInitialized(e) { if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); return e; }
function accessibility_statement_isNativeReflectConstruct() { try { var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); } catch (t) {} return (accessibility_statement_isNativeReflectConstruct = function _isNativeReflectConstruct() { return !!t; })(); }
function accessibility_statement_superPropGet(t, e, o, r) { var p = accessibility_statement_get(accessibility_statement_getPrototypeOf(1 & r ? t.prototype : t), e, o); return 2 & r && "function" == typeof p ? function (t) { return p.apply(o, t); } : p; }
function accessibility_statement_get() { return accessibility_statement_get = "undefined" != typeof Reflect && Reflect.get ? Reflect.get.bind() : function (e, t, r) { var p = accessibility_statement_superPropBase(e, t); if (p) { var n = Object.getOwnPropertyDescriptor(p, t); return n.get ? n.get.call(arguments.length < 3 ? e : r) : n.value; } }, accessibility_statement_get.apply(null, arguments); }
function accessibility_statement_superPropBase(t, o) { for (; !{}.hasOwnProperty.call(t, o) && null !== (t = accessibility_statement_getPrototypeOf(t));); return t; }
function accessibility_statement_getPrototypeOf(t) { return accessibility_statement_getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function (t) { return t.__proto__ || Object.getPrototypeOf(t); }, accessibility_statement_getPrototypeOf(t); }
function accessibility_statement_inherits(t, e) { if ("function" != typeof e && null !== e) throw new TypeError("Super expression must either be null or a function"); t.prototype = Object.create(e && e.prototype, { constructor: { value: t, writable: !0, configurable: !0 } }), Object.defineProperty(t, "prototype", { writable: !1 }), e && accessibility_statement_setPrototypeOf(t, e); }
function accessibility_statement_setPrototypeOf(t, e) { return accessibility_statement_setPrototypeOf = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function (t, e) { return t.__proto__ = e, t; }, accessibility_statement_setPrototypeOf(t, e); }
function accessibility_statement_defineProperty(e, r, t) { return (r = accessibility_statement_toPropertyKey(r)) in e ? Object.defineProperty(e, r, { value: t, enumerable: !0, configurable: !0, writable: !0 }) : e[r] = t, e; }
function accessibility_statement_toPropertyKey(t) { var i = accessibility_statement_toPrimitive(t, "string"); return "symbol" == accessibility_statement_typeof(i) ? i : i + ""; }
function accessibility_statement_toPrimitive(t, r) { if ("object" != accessibility_statement_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != accessibility_statement_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }

var PageAccessibilityStatement = /*#__PURE__*/function (_BasePage) {
  function PageAccessibilityStatement(router) {
    accessibility_statement_classCallCheck(this, PageAccessibilityStatement);
    return accessibility_statement_callSuper(this, PageAccessibilityStatement, [router]);
  }
  accessibility_statement_inherits(PageAccessibilityStatement, _BasePage);
  return accessibility_statement_createClass(PageAccessibilityStatement, [{
    key: "initialize",
    value: function initialize() {
      this.sharedInitialize();
    }
  }, {
    key: "leave",
    value: function leave() {
      accessibility_statement_superPropGet(PageAccessibilityStatement, "leave", this, 3)([]);
    }
  }]);
}(BasePage);
accessibility_statement_defineProperty(PageAccessibilityStatement, "hash", hashPageAccessibilityStatement);

;// CONCATENATED MODULE: ./static/js/pages/legal/license.js
function license_typeof(o) { "@babel/helpers - typeof"; return license_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, license_typeof(o); }
function license_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function license_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, license_toPropertyKey(o.key), o); } }
function license_createClass(e, r, t) { return r && license_defineProperties(e.prototype, r), t && license_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function license_callSuper(t, o, e) { return o = license_getPrototypeOf(o), license_possibleConstructorReturn(t, license_isNativeReflectConstruct() ? Reflect.construct(o, e || [], license_getPrototypeOf(t).constructor) : o.apply(t, e)); }
function license_possibleConstructorReturn(t, e) { if (e && ("object" == license_typeof(e) || "function" == typeof e)) return e; if (void 0 !== e) throw new TypeError("Derived constructors may only return object or undefined"); return license_assertThisInitialized(t); }
function license_assertThisInitialized(e) { if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); return e; }
function license_isNativeReflectConstruct() { try { var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); } catch (t) {} return (license_isNativeReflectConstruct = function _isNativeReflectConstruct() { return !!t; })(); }
function license_superPropGet(t, e, o, r) { var p = license_get(license_getPrototypeOf(1 & r ? t.prototype : t), e, o); return 2 & r && "function" == typeof p ? function (t) { return p.apply(o, t); } : p; }
function license_get() { return license_get = "undefined" != typeof Reflect && Reflect.get ? Reflect.get.bind() : function (e, t, r) { var p = license_superPropBase(e, t); if (p) { var n = Object.getOwnPropertyDescriptor(p, t); return n.get ? n.get.call(arguments.length < 3 ? e : r) : n.value; } }, license_get.apply(null, arguments); }
function license_superPropBase(t, o) { for (; !{}.hasOwnProperty.call(t, o) && null !== (t = license_getPrototypeOf(t));); return t; }
function license_getPrototypeOf(t) { return license_getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function (t) { return t.__proto__ || Object.getPrototypeOf(t); }, license_getPrototypeOf(t); }
function license_inherits(t, e) { if ("function" != typeof e && null !== e) throw new TypeError("Super expression must either be null or a function"); t.prototype = Object.create(e && e.prototype, { constructor: { value: t, writable: !0, configurable: !0 } }), Object.defineProperty(t, "prototype", { writable: !1 }), e && license_setPrototypeOf(t, e); }
function license_setPrototypeOf(t, e) { return license_setPrototypeOf = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function (t, e) { return t.__proto__ = e, t; }, license_setPrototypeOf(t, e); }
function license_defineProperty(e, r, t) { return (r = license_toPropertyKey(r)) in e ? Object.defineProperty(e, r, { value: t, enumerable: !0, configurable: !0, writable: !0 }) : e[r] = t, e; }
function license_toPropertyKey(t) { var i = license_toPrimitive(t, "string"); return "symbol" == license_typeof(i) ? i : i + ""; }
function license_toPrimitive(t, r) { if ("object" != license_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != license_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }

var PageLicense = /*#__PURE__*/function (_BasePage) {
  function PageLicense(router) {
    license_classCallCheck(this, PageLicense);
    return license_callSuper(this, PageLicense, [router]);
  }
  license_inherits(PageLicense, _BasePage);
  return license_createClass(PageLicense, [{
    key: "initialize",
    value: function initialize() {
      this.sharedInitialize();
    }
  }, {
    key: "leave",
    value: function leave() {
      license_superPropGet(PageLicense, "leave", this, 3)([]);
    }
  }]);
}(BasePage);
license_defineProperty(PageLicense, "hash", hashPageLicense);

;// CONCATENATED MODULE: ./static/js/pages/store/basket.js
function basket_typeof(o) { "@babel/helpers - typeof"; return basket_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, basket_typeof(o); }
function basket_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function basket_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, basket_toPropertyKey(o.key), o); } }
function basket_createClass(e, r, t) { return r && basket_defineProperties(e.prototype, r), t && basket_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function basket_callSuper(t, o, e) { return o = basket_getPrototypeOf(o), basket_possibleConstructorReturn(t, basket_isNativeReflectConstruct() ? Reflect.construct(o, e || [], basket_getPrototypeOf(t).constructor) : o.apply(t, e)); }
function basket_possibleConstructorReturn(t, e) { if (e && ("object" == basket_typeof(e) || "function" == typeof e)) return e; if (void 0 !== e) throw new TypeError("Derived constructors may only return object or undefined"); return basket_assertThisInitialized(t); }
function basket_assertThisInitialized(e) { if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); return e; }
function basket_isNativeReflectConstruct() { try { var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); } catch (t) {} return (basket_isNativeReflectConstruct = function _isNativeReflectConstruct() { return !!t; })(); }
function basket_superPropGet(t, e, o, r) { var p = basket_get(basket_getPrototypeOf(1 & r ? t.prototype : t), e, o); return 2 & r && "function" == typeof p ? function (t) { return p.apply(o, t); } : p; }
function basket_get() { return basket_get = "undefined" != typeof Reflect && Reflect.get ? Reflect.get.bind() : function (e, t, r) { var p = basket_superPropBase(e, t); if (p) { var n = Object.getOwnPropertyDescriptor(p, t); return n.get ? n.get.call(arguments.length < 3 ? e : r) : n.value; } }, basket_get.apply(null, arguments); }
function basket_superPropBase(t, o) { for (; !{}.hasOwnProperty.call(t, o) && null !== (t = basket_getPrototypeOf(t));); return t; }
function basket_getPrototypeOf(t) { return basket_getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function (t) { return t.__proto__ || Object.getPrototypeOf(t); }, basket_getPrototypeOf(t); }
function basket_inherits(t, e) { if ("function" != typeof e && null !== e) throw new TypeError("Super expression must either be null or a function"); t.prototype = Object.create(e && e.prototype, { constructor: { value: t, writable: !0, configurable: !0 } }), Object.defineProperty(t, "prototype", { writable: !1 }), e && basket_setPrototypeOf(t, e); }
function basket_setPrototypeOf(t, e) { return basket_setPrototypeOf = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function (t, e) { return t.__proto__ = e, t; }, basket_setPrototypeOf(t, e); }
function basket_defineProperty(e, r, t) { return (r = basket_toPropertyKey(r)) in e ? Object.defineProperty(e, r, { value: t, enumerable: !0, configurable: !0, writable: !0 }) : e[r] = t, e; }
function basket_toPropertyKey(t) { var i = basket_toPrimitive(t, "string"); return "symbol" == basket_typeof(i) ? i : i + ""; }
function basket_toPrimitive(t, r) { if ("object" != basket_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != basket_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }



var PageStoreBasket = /*#__PURE__*/function (_BasePage) {
  function PageStoreBasket(router) {
    basket_classCallCheck(this, PageStoreBasket);
    return basket_callSuper(this, PageStoreBasket, [router]);
  }
  basket_inherits(PageStoreBasket, _BasePage);
  return basket_createClass(PageStoreBasket, [{
    key: "initialize",
    value: function initialize() {
      this.sharedInitialize();
      this.hookupStoreCardsInfo();
      this.hookupOverlaysStoreBasketInfo();
      this.hookupButtonCheckoutSession();
    }
  }, {
    key: "hookupStoreCardsInfo",
    value: function hookupStoreCardsInfo() {
      document.querySelectorAll(idContainerInfoDelivery).addEventListener("click", function (event) {
        if (_verbose) {
          console.log("delivery modal display method");
        }
        document.querySelectorAll(idOverlayInfoDelivery).css('display', 'block');
      });
      document.querySelectorAll(idContainerInfoBilling).addEventListener("click", function (event) {
        if (_verbose) {
          console.log("billing modal display method");
        }
        document.querySelectorAll(idOverlayInfoBilling).css('display', 'block');
      });
    }
  }, {
    key: "hookupOverlaysStoreBasketInfo",
    value: function hookupOverlaysStoreBasketInfo() {
      var elOverlay, elForm;

      // Delivery
      elOverlay = document.querySelectorAll(idOverlayInfoDelivery);
      elForm = elOverlay.querySelector('form');
      hookupOverlay(elOverlay);
      Events.initialiseEventHandler(elForm, flagInitialised, function () {
        elForm.submit(function (event) {
          elForm = document.querySelectorAll(elForm);
          event.preventDefault();
          if (_verbose) {
            console.log("delivery submit method");
          }
          ajaxData = {};
          ajaxData[keyInfoType] = keyInfoDelivery;
          ajaxData = convertFormBilling2JSON(ajaxData, idOverlayInfoDelivery);
          ajaxJSONData('info delivery', mapHashToController(hashStoreBasketInfo), ajaxData, loadInfoAddress, false);
          // document.querySelectorAll(idOverlayInfoDelivery).css('display', 'none');
        });
      });

      // Billing
      elOverlay = document.querySelectorAll(idOverlayInfoBilling);
      elForm = elOverlay.querySelector('form');
      hookupOverlay(elOverlay);
      Events.initialiseEventHandler(elForm, flagInitialised, function () {
        elForm.submit(function (event) {
          event.preventDefault();
          if (_verbose) {
            console.log("billing submit method");
          }
          ajaxData = {};
          ajaxData[keyInfoType] = keyInfoBilling;
          ajaxData = convertFormBilling2JSON(ajaxData, idOverlayInfoBilling); // formData; // form.serialize();

          ajaxJSONData('info billing', mapHashToController(hashStoreBasketInfo), ajaxData, loadInfoAddress, false);
          // document.querySelectorAll(idOverlayInfoBilling).css('display', 'none');
        });
      });
      var keys = [keyNameFull, keyPhoneNumber, keyPostcode, keyAddress1, keyCity, keyCounty];
      for (var k in keys) {
        elForm.querySelector('#' + keys[k]).removeAttr('required');
      }
    }
  }, {
    key: "loadInfoAddress",
    value: function loadInfoAddress(response) {
      if (_verbose) {
        console.log('response:');
        console.log(response.data);
      }
      var infoType = response.data[keyInfoType];
      var infoAddress = response.data[infoType];
      LocalStorage.setLocalStorage(infoType, infoAddress);

      // update webpage elements in background
      if (infoType == keyInfoBilling) {
        var container = document.querySelectorAll(idContainerInfoBilling);
        if (infoAddress[keyInfoIdentical]) {
          container.querySelector('div').innerHTML = "Same as delivery address";
        } else {
          container.querySelector('div').innerHTML = "<strong>" + infoAddress[keyNameFull] + '</strong> at <strong>' + infoAddress[keyPostcode] + "</strong>";
        }
        document.querySelectorAll(idOverlayInfoBilling).css('display', 'none');
        document.querySelectorAll(idOverlayInfoBilling).querySelector('form').classList.add(flagSubmitted);
      } else {
        var _container = document.querySelectorAll(idContainerInfoDelivery);
        _container.querySelector('div').innerHTML = "<strong>" + infoAddress[keyNameFull] + '</strong> at <strong>' + infoAddress[keyPostcode] + "</strong>";
        document.querySelectorAll(idOverlayInfoDelivery).css('display', 'none');
        document.querySelectorAll(idOverlayInfoDelivery).querySelector('form').classList.add(flagSubmitted);
      }
    }
  }, {
    key: "convertFormBilling2JSON",
    value: function convertFormBilling2JSON(ajaxData, idOverlayInfo) {
      var elOverlay, elForm, elOverlayDelivery, elFormDelivery;
      elOverlay = document.querySelectorAll(idOverlayInfo);
      elForm = elOverlay.querySelector('form');
      elOverlay = document.querySelectorAll(idOverlayInfoDelivery);
      elForm = elOverlay.querySelector('form');
      ajaxData[flagForm] = convertForm2JSON(elForm); // formData; // form.serialize();
      var keys = [keyNameFull, keyPhoneNumber, keyPostcode, keyAddress1, keyAddress2, keyCity, keyCounty];
      if (_verbose) {
        console.log('converting billing form to json\nform ID: ' + elForm.id);
        console.log('ajaxData:');
        console.log(ajaxData);
      }
      ajaxData[flagForm][keyInfoIdentical] = getElementValueCurrent(elForm.querySelector('#' + keyInfoIdentical));
      for (var k in keys) {
        if (idOverlayInfo == idOverlayInfoBilling && ajaxData[flagForm][keyInfoIdentical]) {
          ajaxData[flagForm][keys[k]] = getElementValueCurrent(elFormDelivery.querySelector('#' + keys[k]));
        } else {
          ajaxData[flagForm][keys[k]] = getElementValueCurrent(elForm.querySelector('#' + keys[k]));
        }
      }
      if (_verbose) {
        console.log('ajaxData:');
        console.log(ajaxData);
      }
      return ajaxData;
    }
  }, {
    key: "hookupButtonCheckoutSession",
    value: function hookupButtonCheckoutSession() {
      var btnCheckout = document.querySelectorAll(idButtonCheckout);
      btnCheckout.classList.remove(flagInitialised);
      Events.initialiseEventHandler(idButtonCheckout, flagInitialised, function () {
        btnCheckout.removeEventListener("click");
        btnCheckout.addEventListener("click", function (event) {
          //setupPageLocalStorageNext(hashPageStoreBasket);
          var basket = LocalStorage.getLocalStorage(keyBasket);
          // goToPage(hashPageStoreBasket);
          var ajaxData = {};
          ajaxData[keyBasket] = basket;
          ajaxData = convertFormBilling2JSON(ajaxData, idOverlayInfoDelivery);
          ajaxData = convertFormBilling2JSON(ajaxData, idOverlayInfoBilling);
          ajaxData[key_code_currency] = getCurrencySelected();
          // ajaxData[keyIsSubscription] = false; // only checkout one-time payment items for now

          ajaxJSONData('checkout session', mapHashToController(hashPageStoreCheckout), ajaxData, handleResponseCheckout, false);
        });
      });
    }
  }, {
    key: "handleResponseCheckout",
    value: function handleResponseCheckout(response) {
      // let tmpData = {};
      // tmpData[keyIdCheckout] = response.data[keyIdCheckout]
      // goToPage(hashPageStoreCheckoutSession, tmpData);
      window.location.href = response.data[keyUrlCheckout];
    }
  }, {
    key: "hookupButtonFormBillingCopy",
    value: function hookupButtonFormBillingCopy() {
      // let elButton = document.querySelectorAll(idButtonFormBillingCopy);

      Events.initialiseEventHandler(idButtonFormBillingCopy, flagInitialised, function () {
        document.querySelectorAll(idButtonFormBillingCopy).addEventListener("click", function (event) {
          var keys = [keyNameFull, keyPhoneNumber, keyPostcode, keyAddress1, keyAddress2, keyCity, keyCounty];
          var elFormBilling = document.querySelectorAll(idOverlayInfoBilling).querySelector('form');
          var elFormDelivery = document.querySelectorAll(idOverlayInfoDelivery).querySelector('form');
          for (var k in keys) {
            elFormBilling.querySelector('#' + keys[k]).value = getElementValueCurrent(elFormDelivery.querySelector('#' + keys[k]));
          }
        });
      });
    }
  }, {
    key: "leave",
    value: function leave() {
      basket_superPropGet(PageStoreBasket, "leave", this, 3)([]);
    }
  }]);
}(BasePage);
basket_defineProperty(PageStoreBasket, "hash", hashPageStoreBasket);

;// CONCATENATED MODULE: ./static/js/pages/store/home.js
function store_home_typeof(o) { "@babel/helpers - typeof"; return store_home_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, store_home_typeof(o); }
function store_home_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function store_home_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, store_home_toPropertyKey(o.key), o); } }
function store_home_createClass(e, r, t) { return r && store_home_defineProperties(e.prototype, r), t && store_home_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function store_home_callSuper(t, o, e) { return o = store_home_getPrototypeOf(o), store_home_possibleConstructorReturn(t, store_home_isNativeReflectConstruct() ? Reflect.construct(o, e || [], store_home_getPrototypeOf(t).constructor) : o.apply(t, e)); }
function store_home_possibleConstructorReturn(t, e) { if (e && ("object" == store_home_typeof(e) || "function" == typeof e)) return e; if (void 0 !== e) throw new TypeError("Derived constructors may only return object or undefined"); return store_home_assertThisInitialized(t); }
function store_home_assertThisInitialized(e) { if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); return e; }
function store_home_isNativeReflectConstruct() { try { var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); } catch (t) {} return (store_home_isNativeReflectConstruct = function _isNativeReflectConstruct() { return !!t; })(); }
function store_home_superPropGet(t, e, o, r) { var p = store_home_get(store_home_getPrototypeOf(1 & r ? t.prototype : t), e, o); return 2 & r && "function" == typeof p ? function (t) { return p.apply(o, t); } : p; }
function store_home_get() { return store_home_get = "undefined" != typeof Reflect && Reflect.get ? Reflect.get.bind() : function (e, t, r) { var p = store_home_superPropBase(e, t); if (p) { var n = Object.getOwnPropertyDescriptor(p, t); return n.get ? n.get.call(arguments.length < 3 ? e : r) : n.value; } }, store_home_get.apply(null, arguments); }
function store_home_superPropBase(t, o) { for (; !{}.hasOwnProperty.call(t, o) && null !== (t = store_home_getPrototypeOf(t));); return t; }
function store_home_getPrototypeOf(t) { return store_home_getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function (t) { return t.__proto__ || Object.getPrototypeOf(t); }, store_home_getPrototypeOf(t); }
function store_home_inherits(t, e) { if ("function" != typeof e && null !== e) throw new TypeError("Super expression must either be null or a function"); t.prototype = Object.create(e && e.prototype, { constructor: { value: t, writable: !0, configurable: !0 } }), Object.defineProperty(t, "prototype", { writable: !1 }), e && store_home_setPrototypeOf(t, e); }
function store_home_setPrototypeOf(t, e) { return store_home_setPrototypeOf = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function (t, e) { return t.__proto__ = e, t; }, store_home_setPrototypeOf(t, e); }
function store_home_defineProperty(e, r, t) { return (r = store_home_toPropertyKey(r)) in e ? Object.defineProperty(e, r, { value: t, enumerable: !0, configurable: !0, writable: !0 }) : e[r] = t, e; }
function store_home_toPropertyKey(t) { var i = store_home_toPrimitive(t, "string"); return "symbol" == store_home_typeof(i) ? i : i + ""; }
function store_home_toPrimitive(t, r) { if ("object" != store_home_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != store_home_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }

var PageStoreHome = /*#__PURE__*/function (_BasePage) {
  function PageStoreHome(router) {
    store_home_classCallCheck(this, PageStoreHome);
    return store_home_callSuper(this, PageStoreHome, [router]);
  }
  store_home_inherits(PageStoreHome, _BasePage);
  return store_home_createClass(PageStoreHome, [{
    key: "initialize",
    value: function initialize() {
      this.sharedInitialize();
      this.hookupFiltersStore();
      this.hookupStoreHome();
    }
  }, {
    key: "leave",
    value: function leave() {
      store_home_superPropGet(PageStoreHome, "leave", this, 3)([]);
    }
  }]);
}(BasePage);
store_home_defineProperty(PageStoreHome, "hash", hashPageStoreHome);

;// CONCATENATED MODULE: ./static/js/lib/business_objects/business_objects.js
function business_objects_typeof(o) { "@babel/helpers - typeof"; return business_objects_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, business_objects_typeof(o); }
function _createForOfIteratorHelper(r, e) { var t = "undefined" != typeof Symbol && r[Symbol.iterator] || r["@@iterator"]; if (!t) { if (Array.isArray(r) || (t = _unsupportedIterableToArray(r)) || e && r && "number" == typeof r.length) { t && (r = t); var _n = 0, F = function F() {}; return { s: F, n: function n() { return _n >= r.length ? { done: !0 } : { done: !1, value: r[_n++] }; }, e: function e(r) { throw r; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var o, a = !0, u = !1; return { s: function s() { t = t.call(r); }, n: function n() { var r = t.next(); return a = r.done, r; }, e: function e(r) { u = !0, o = r; }, f: function f() { try { a || null == t["return"] || t["return"](); } finally { if (u) throw o; } } }; }
function _unsupportedIterableToArray(r, a) { if (r) { if ("string" == typeof r) return _arrayLikeToArray(r, a); var t = {}.toString.call(r).slice(8, -1); return "Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t ? Array.from(r) : "Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t) ? _arrayLikeToArray(r, a) : void 0; } }
function _arrayLikeToArray(r, a) { (null == a || a > r.length) && (a = r.length); for (var e = 0, n = Array(a); e < a; e++) n[e] = r[e]; return n; }
function business_objects_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function business_objects_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, business_objects_toPropertyKey(o.key), o); } }
function business_objects_createClass(e, r, t) { return r && business_objects_defineProperties(e.prototype, r), t && business_objects_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function business_objects_toPropertyKey(t) { var i = business_objects_toPrimitive(t, "string"); return "symbol" == business_objects_typeof(i) ? i : i + ""; }
function business_objects_toPrimitive(t, r) { if ("object" != business_objects_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != business_objects_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }
var BusinessObjects = /*#__PURE__*/function () {
  function BusinessObjects() {
    business_objects_classCallCheck(this, BusinessObjects);
  }
  return business_objects_createClass(BusinessObjects, null, [{
    key: "getOptionJsonFromObjectJsonAndKeys",
    value: function getOptionJsonFromObjectJsonAndKeys(objectJson, keyText, keyValue) {
      var valueSelected = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : null;
      return {
        text: objectJson[keyText],
        value: objectJson[keyValue],
        selected: objectJson[keyValue] == valueSelected
      };
    }
  }, {
    key: "getOptionJsonFromObjectJson",
    value: function getOptionJsonFromObjectJson(objectJson) {
      var valueSelected = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : null;
      var keyText = objectJson[flagNameAttrOptionText];
      var keyValue = objectJson[flagNameAttrOptionValue];
      if (_verbose) {
        console.log({
          objectJson: objectJson,
          keyText: keyText,
          keyValue: keyValue
        });
      }
      ;
      return BusinessObjects.getOptionJsonFromObjectJsonAndKeys(objectJson, keyText, keyValue, valueSelected);
    }
    /*
    static getOptionJsonFromProductPermutation(permutation) {
        return {
            text: permutation
        };
    }
    */
  }, {
    key: "getObjectText",
    value: function getObjectText(objectJson) {
      return objectJson == null ? '' : objectJson[objectJson[flagNameAttrOptionText]];
    }
  }, {
    key: "getListObjectsFromIdDictAndCsv",
    value: function getListObjectsFromIdDictAndCsv(idDict, idCsv) {
      var listObjects = [];
      var ids = idCsv.split(',');
      var _iterator = _createForOfIteratorHelper(ids),
        _step;
      try {
        for (_iterator.s(); !(_step = _iterator.n()).done;) {
          var id = _step.value;
          listObjects.push(idDict[id]);
        }
      } catch (err) {
        _iterator.e(err);
      } finally {
        _iterator.f();
      }
      return listObjects;
    }
  }]);
}();

;// CONCATENATED MODULE: ./static/js/lib/business_objects/store/product_permutation.js
function product_permutation_typeof(o) { "@babel/helpers - typeof"; return product_permutation_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, product_permutation_typeof(o); }
function product_permutation_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function product_permutation_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, product_permutation_toPropertyKey(o.key), o); } }
function product_permutation_createClass(e, r, t) { return r && product_permutation_defineProperties(e.prototype, r), t && product_permutation_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function product_permutation_toPropertyKey(t) { var i = product_permutation_toPrimitive(t, "string"); return "symbol" == product_permutation_typeof(i) ? i : i + ""; }
function product_permutation_toPrimitive(t, r) { if ("object" != product_permutation_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != product_permutation_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }
var ProductPermutation = /*#__PURE__*/function () {
  function ProductPermutation() {
    product_permutation_classCallCheck(this, ProductPermutation);
  }
  return product_permutation_createClass(ProductPermutation, null, [{
    key: "getProductVariationsFromIdCsv",
    value: function getProductVariationsFromIdCsv(csvVariations) {
      var productVariations = [];
      if (!csvVariations) return productVariations;
      var variationPairs = csvVariations.split(',');
      if (variationPairs.length == 0) return productVariations;
      var parts;
      variationPairs.forEach(function (variationPair) {
        parts = variationPair.split(':');
        if (parts.length == 2) {
          var productVariationType = productVariationTypes[parts[0]];
          productVariationType[flagProductVariations].some(function (productVariation) {
            if (productVariation[attrIdProductVariation] == parts[1]) {
              productVariations.push([productVariationType, productVariation]);
              return true;
            }
            return false;
          });
        }
      });
      return productVariations;
    }
  }, {
    key: "getProductVariationsPreviewFromIdCsv",
    value: function getProductVariationsPreviewFromIdCsv(csvVariations) {
      var variationPairs = ProductPermutation.getProductVariationsFromIdCsv(csvVariations);
      var preview = '';
      if (variationPairs.length == 0) return preview;
      var variationType, variation;
      variationPairs.forEach(function (variationPair) {
        if (preview.length > 0) {
          preview += '\n';
        }
        variationType = variationPair[0];
        variation = variationPair[1];
        preview += variationType[flagName] + ': ' + variation[flagName];
      });
      return preview;
    }
  }, {
    key: "getProductVariationsIdCsvFromVariationTypeList",
    value: function getProductVariationsIdCsvFromVariationTypeList(variationTypeList) {
      var csvVariations = '';
      if (Validation.isEmpty(variationTypeList)) return csvVariations;
      variationTypeList.forEach(function (variationType) {
        if (csvVariations.length > 0) {
          csvVariations += ',';
        }
        csvVariations += variationType[attrIdProductVariationType] + ':' + variationType[flagProductVariations][0][attrIdProductVariation];
      });
      return csvVariations;
    }
  }]);
}();

;// CONCATENATED MODULE: ./static/js/lib/utils.js
function utils_typeof(o) { "@babel/helpers - typeof"; return utils_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, utils_typeof(o); }
function utils_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function utils_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, utils_toPropertyKey(o.key), o); } }
function utils_createClass(e, r, t) { return r && utils_defineProperties(e.prototype, r), t && utils_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function utils_toPropertyKey(t) { var i = utils_toPrimitive(t, "string"); return "symbol" == utils_typeof(i) ? i : i + ""; }
function utils_toPrimitive(t, r) { if ("object" != utils_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != utils_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }
// Utility functions
/*
function $(selector) {
    return document.querySelector(selector);
}

function $$(selector) {
    return document.querySelectorAll(selector);
}
*/
var Utils = /*#__PURE__*/function () {
  function Utils() {
    utils_classCallCheck(this, Utils);
  }
  return utils_createClass(Utils, null, [{
    key: "getListFromDict",
    value: function getListFromDict(dict) {
      var list = [];
      for (var key in dict) {
        list.push(dict[key]);
      }
      return list;
    }
  }]);
}();

;// CONCATENATED MODULE: ./static/js/components/common/temporary/overlay_error.js
function overlay_error_typeof(o) { "@babel/helpers - typeof"; return overlay_error_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, overlay_error_typeof(o); }
function overlay_error_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function overlay_error_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, overlay_error_toPropertyKey(o.key), o); } }
function overlay_error_createClass(e, r, t) { return r && overlay_error_defineProperties(e.prototype, r), t && overlay_error_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function overlay_error_toPropertyKey(t) { var i = overlay_error_toPrimitive(t, "string"); return "symbol" == overlay_error_typeof(i) ? i : i + ""; }
function overlay_error_toPrimitive(t, r) { if ("object" != overlay_error_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != overlay_error_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }

var OverlayError = /*#__PURE__*/function () {
  function OverlayError() {
    overlay_error_classCallCheck(this, OverlayError);
  }
  return overlay_error_createClass(OverlayError, null, [{
    key: "hookup",
    value: function hookup() {
      Events.initialiseEventHandler(idOverlayError + ' button.' + flagCancel, flagInitialised, function (buttonCancel) {
        buttonCancel.addEventListener('click', function () {
          var overlay = document.querySelector(idOverlayError);
          overlay.style.visibility = 'hidden';
        });
      });
    }
  }, {
    key: "show",
    value: function show(msgError) {
      var overlay = document.querySelector(idOverlayError);
      var labelError = overlay.querySelector(idLabelError);
      labelError.innerText = msgError;
      overlay.style.visibility = 'visible';
    }
  }]);
}();

;// CONCATENATED MODULE: ./static/js/pages/base_table.js
function base_table_typeof(o) { "@babel/helpers - typeof"; return base_table_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, base_table_typeof(o); }
function base_table_defineProperty(e, r, t) { return (r = base_table_toPropertyKey(r)) in e ? Object.defineProperty(e, r, { value: t, enumerable: !0, configurable: !0, writable: !0 }) : e[r] = t, e; }
function base_table_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function base_table_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, base_table_toPropertyKey(o.key), o); } }
function base_table_createClass(e, r, t) { return r && base_table_defineProperties(e.prototype, r), t && base_table_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function base_table_toPropertyKey(t) { var i = base_table_toPrimitive(t, "string"); return "symbol" == base_table_typeof(i) ? i : i + ""; }
function base_table_toPrimitive(t, r) { if ("object" != base_table_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != base_table_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }
function base_table_callSuper(t, o, e) { return o = base_table_getPrototypeOf(o), base_table_possibleConstructorReturn(t, base_table_isNativeReflectConstruct() ? Reflect.construct(o, e || [], base_table_getPrototypeOf(t).constructor) : o.apply(t, e)); }
function base_table_possibleConstructorReturn(t, e) { if (e && ("object" == base_table_typeof(e) || "function" == typeof e)) return e; if (void 0 !== e) throw new TypeError("Derived constructors may only return object or undefined"); return base_table_assertThisInitialized(t); }
function base_table_assertThisInitialized(e) { if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); return e; }
function base_table_isNativeReflectConstruct() { try { var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); } catch (t) {} return (base_table_isNativeReflectConstruct = function _isNativeReflectConstruct() { return !!t; })(); }
function base_table_superPropGet(t, e, o, r) { var p = base_table_get(base_table_getPrototypeOf(1 & r ? t.prototype : t), e, o); return 2 & r && "function" == typeof p ? function (t) { return p.apply(o, t); } : p; }
function base_table_get() { return base_table_get = "undefined" != typeof Reflect && Reflect.get ? Reflect.get.bind() : function (e, t, r) { var p = base_table_superPropBase(e, t); if (p) { var n = Object.getOwnPropertyDescriptor(p, t); return n.get ? n.get.call(arguments.length < 3 ? e : r) : n.value; } }, base_table_get.apply(null, arguments); }
function base_table_superPropBase(t, o) { for (; !{}.hasOwnProperty.call(t, o) && null !== (t = base_table_getPrototypeOf(t));); return t; }
function base_table_getPrototypeOf(t) { return base_table_getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function (t) { return t.__proto__ || Object.getPrototypeOf(t); }, base_table_getPrototypeOf(t); }
function base_table_inherits(t, e) { if ("function" != typeof e && null !== e) throw new TypeError("Super expression must either be null or a function"); t.prototype = Object.create(e && e.prototype, { constructor: { value: t, writable: !0, configurable: !0 } }), Object.defineProperty(t, "prototype", { writable: !1 }), e && base_table_setPrototypeOf(t, e); }
function base_table_setPrototypeOf(t, e) { return base_table_setPrototypeOf = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function (t, e) { return t.__proto__ = e, t; }, base_table_setPrototypeOf(t, e); }










var TableBasePage = /*#__PURE__*/function (_BasePage) {
  // static hash
  // static attrIdRowObject
  // callSaveTableContent

  function TableBasePage(router) {
    var _this;
    base_table_classCallCheck(this, TableBasePage);
    _this = base_table_callSuper(this, TableBasePage, [router]);
    _this.cursorYInitial = null;
    _this.rowInitial = null;
    _this.placeholder = null;
    _this.dragSrcEl = null;
    _this.dragSrcRow = null;
    _this.hookupTableCellDdls = _this.hookupTableCellDdls.bind(_this);
    return _this;
  }
  base_table_inherits(TableBasePage, _BasePage);
  return base_table_createClass(TableBasePage, [{
    key: "initialize",
    value: function initialize() {
      var isPopState = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : false;
      throw new Error("Must implement initialize() method.");
    }
  }, {
    key: "sharedInitialize",
    value: function sharedInitialize() {
      var _this2 = this;
      var isPopState = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : false;
      var isSinglePageApp = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : false;
      if (!isPopState) {
        base_table_superPropGet(TableBasePage, "sharedInitialize", this, 3)([]);
        this.hookupFilters();
        this.hookupButtonsSaveCancel();
        this.hookupTableMain();
        OverlayConfirm.hookup(function () {
          if (isSinglePageApp) {
            _this2.saveRecordsTableDirtySinglePageApp();
          } else {
            _this2.saveRecordsTableDirty();
          }
        });
      } else {
        var dataPage = this.getLocalStoragePage();
        var filters = dataPage[flagFormFilters];
        var formFilters = this.getFormFilters();
        var filtersDefault = DOM.convertForm2JSON(formFilters);
        if (!validation_Validation.areEqualDicts(filters, filtersDefault)) {
          this.callFilterTableContent();
        }
      }
    }
  }, {
    key: "hookupFilters",
    value: function hookupFilters() {
      if (this.constructor === TableBasePage) {
        throw new Error("Subclass of TableBasePage must implement method hookupFilters().");
      }
    }
  }, {
    key: "sharedHookupFilters",
    value: function sharedHookupFilters() {
      this.hookupButtonApplyFilters();
    }
  }, {
    key: "hookupFilterActive",
    value: function hookupFilterActive() {
      this.hookupFilter(flagActive);
    }
  }, {
    key: "hookupFilter",
    value: function hookupFilter(filterFlag) {
      var handler = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : function (event, filter) {
        return TableBasePage.isDirtyFilter(filter);
      };
      var filterSelector = idFormFilters + ' .' + filterFlag;
      this.hookupEventHandler("change", filterSelector, handler);
    }
  }, {
    key: "hookupFilterIsNotEmpty",
    value: function hookupFilterIsNotEmpty() {
      this.hookupFilter(flagIsNotEmpty);
    }
  }, {
    key: "hookupButtonApplyFilters",
    value: function hookupButtonApplyFilters() {
      var _this3 = this;
      this.hookupEventHandler("click", idButtonApplyFilters, function (event, button) {
        event.stopPropagation();
        _this3.callFilterTableContent();
      });
    }
    /*
    getAndLoadFilteredTableContent = () => {
        this.callFilterTableContent()
            .catch(error => console.error('Error:', error));
    }
    */
  }, {
    key: "getFormFilters",
    value: function getFormFilters() {
      return document.querySelector(idFormFilters);
    }
  }, {
    key: "callFilterTableContent",
    value: function callFilterTableContent() {
      var formFilters = this.getFormFilters();
      var filtersJson = DOM.convertForm2JSON(formFilters);
      this.leave();
      api_API.goToHash(this.constructor.hash, filtersJson);
    }
  }, {
    key: "callbackLoadTableContent",
    value: function callbackLoadTableContent(response) {
      var table = TableBasePage.getTableMain();
      var bodyTable = table.querySelector('tbody');
      bodyTable.querySelectorAll('tr').forEach(function (row) {
        row.remove();
      });
      var rowsJson = response.data[flagRows];
      if (!validation_Validation.isEmpty(rowsJson) && rowsJson.every(function (row) {
        return row.hasOwnProperty('display_order');
      })) {
        rowsJson = rowsJson.sort(function (a, b) {
          return a.display_order - b.display_order;
        });
      }
      rowsJson.forEach(this.loadRowTable.bind(this));
      this.hookupTableMain();
    }
  }, {
    key: "loadRowTable",
    value: function loadRowTable(rowJson) {
      throw new Error("Subclass of TableBasePage must implement method loadRowTable().");
    }
  }, {
    key: "getAndLoadFilteredTableContentSinglePageApp",
    value: function getAndLoadFilteredTableContentSinglePageApp() {
      var _this4 = this;
      this.callFilterTableContent().then(function (data) {
        if (_verbose) {
          console.log('Table data received:', data);
        }
        _this4.callbackLoadTableContent(data);
      })["catch"](function (error) {
        return console.error('Error:', error);
      });
    }
  }, {
    key: "hookupButtonsSaveCancel",
    value: function hookupButtonsSaveCancel() {
      this.hookupButtonSave();
      this.hookupButtonCancel();
      this.toggleShowButtonsSaveCancel(false);
    }
  }, {
    key: "saveRecordsTableDirty",
    value: function saveRecordsTableDirty() {
      var _this5 = this;
      var records = this.getTableRecords(true);
      if (records.length == 0) {
        OverlayError.show('No records to save');
        return;
      }
      var formElement = this.getFormFilters();
      var comment = DOM.getElementValueCurrent(document.querySelector(idTextareaConfirm));
      this.callSaveTableContent(records, formElement, comment).then(function (data) {
        if (data[flagStatus] == flagSuccess) {
          if (_verbose) {
            console.log('Records saved!');
            console.log('Data received:', data);
          }
          _this5.callFilterTableContent();
        } else {
          if (_verbose) {
            console.log("error: ", data[flagMessage]);
          }
          OverlayError.show(data[flagMessage]);
        }
      })["catch"](function (error) {
        return console.error('Error:', error);
      });
    }
  }, {
    key: "getTableRecords",
    value: function getTableRecords() {
      var _this6 = this;
      var dirtyOnly = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : false;
      var records = [];
      var record;
      document.querySelectorAll(idTableMain + ' > tbody > tr').forEach(function (row) {
        if (dirtyOnly && !DOM.hasDirtyChildrenContainer(row)) return;
        record = _this6.getJsonRow(row);
        records.push(record);
      });
      return records;
    }
  }, {
    key: "getJsonRow",
    value: function getJsonRow(row) {
      throw new Error("Subclass of TableBasePage must implement method getJsonRow().");
    }
  }, {
    key: "saveRecordsTableDirtySinglePageApp",
    value: function saveRecordsTableDirtySinglePageApp() {
      var _this7 = this;
      var records = this.getTableRecords(true);
      if (records.length == 0) {
        OverlayError.show('No records to save');
        return;
      }
      var formElement = this.getFormFilters();
      var comment = DOM.getElementValueCurrent(document.querySelector(idTextareaConfirm));
      this.callSaveTableContent(records, formElement, comment).then(function (data) {
        if (data[flagStatus] == flagSuccess) {
          if (_verbose) {
            console.log('Records saved!');
            console.log('Data received:', data);
          }
          _this7.callbackLoadTableContent(data);
        } else {
          if (_verbose) {
            console.log("error: ", data[flagMessage]);
          }
          OverlayError.show(data[flagMessage]);
        }
      })["catch"](function (error) {
        return console.error('Error:', error);
      });
    }
  }, {
    key: "hookupButtonCancel",
    value: function hookupButtonCancel() {
      var _this8 = this;
      Events.initialiseEventHandler(idFormFilters + ' button.' + flagCancel, flagInitialised, function (button) {
        button.addEventListener("click", function (event) {
          event.stopPropagation();
          _this8.callFilterTableContent();
        });
        button.classList.add(flagCollapsed);
      });
    }
  }, {
    key: "handleClickAddRowTable",
    value: function handleClickAddRowTable(event, button) {
      event.stopPropagation();
      _rowBlank.setAttribute(this.constructor.attrIdRowObject, -1 - _rowBlank.getAttribute(this.constructor.attrIdRowObject));
      var tbody = document.querySelector(idTableMain + ' tbody');
      var row = _rowBlank.cloneNode(true);
      row.classList.remove(flagInitialised);
      row.querySelectorAll('.' + flagInitialised).forEach(function (element) {
        element.classList.remove(flagInitialised);
      });
      var countRows = document.querySelectorAll(idTableMain + ' > tbody > tr').length;
      row.setAttribute(this.constructor.attrIdRowObject, -1 - countRows);
      this.initialiseRowNew(tbody, row);
      tbody.appendChild(row);
      this.hookupTableMain();
    }
  }, {
    key: "initialiseRowNew",
    value: function initialiseRowNew(tbody, row) {
      if (this.constructor === TableBasePage) {
        throw new Error("Subclass of TableBasePage must implement method initialiseRowNew().");
      }
      row.classList.remove(flagRowNew);
    }
  }, {
    key: "hookupTableMain",
    value: function hookupTableMain() {
      var _this9 = this;
      if (this.constructor === TableBasePage) {
        throw new Error("Must implement hookupTableMain() method.");
      }
      if (true) {
        // _rowBlank == null) {
        Events.initialiseEventHandler(idTableMain, flagInitialised, function (table) {
          _this9.cacheRowBlank();
        });
      }
    }
  }, {
    key: "cacheRowBlank",
    value: function cacheRowBlank() {
      var selectorRowNew = idTableMain + ' tbody tr.' + flagRowNew;
      var rowBlankTemp = document.querySelector(selectorRowNew);
      if (_verbose) {
        console.log("row blank temp: ", rowBlankTemp);
      }
      var countRows = document.querySelectorAll(idTableMain + ' > tbody > tr').length;
      _rowBlank = rowBlankTemp.cloneNode(true);
      document.querySelectorAll(selectorRowNew).forEach(function (row) {
        row.remove();
      });
      _rowBlank.setAttribute(this.constructor.attrIdRowObject, -1 - countRows);
    }
  }, {
    key: "initialiseSliderDisplayOrderRowNew",
    value: function initialiseSliderDisplayOrderRowNew(tbody, row) {
      // let tdSelector = ':scope > tr > td.' + flagDisplayOrder;
      // let tbody = document.querySelector('table' + (Validation.isEmpty(flagTable) ? '' : '.' + flagTable) + ' > tbody');
      var slidersDisplayOrder = tbody.querySelectorAll(':scope > tr > td.' + flagDisplayOrder + ' input.' + flagSlider);
      var maxDisplayOrder = 0;
      slidersDisplayOrder.forEach(function (slider) {
        maxDisplayOrder = Math.max(maxDisplayOrder, parseFloat(DOM.getElementValueCurrent(slider)));
      });
      var sliderDisplayOrder = row.querySelector('td.' + flagDisplayOrder + ' .' + flagSlider);
      DOM.setElementValuesCurrentAndPrevious(sliderDisplayOrder, maxDisplayOrder + 1);
    }
  }, {
    key: "hookupSlidersDisplayOrderTable",
    value: function hookupSlidersDisplayOrderTable() {
      var selectorDisplayOrder = idTableMain + ' tbody tr td.' + flagDisplayOrder + ' input.' + flagSlider + '.' + flagDisplayOrder;
      /*
      Events.initialiseEventHandler(selectorDisplayOrder, flagInitialised, (sliderDisplayOrder) => {
          /*
          sliderDisplayOrder.setAttribute('draggable', true);
          sliderDisplayOrder.addEventListener('dragstart', this.handleDragSliderStart.bind(this), false);
          sliderDisplayOrder.addEventListener('dragenter', this.handleDragSliderEnter.bind(this), false);
          sliderDisplayOrder.addEventListener('dragover', this.handleDragSliderOver.bind(this), false);
          sliderDisplayOrder.addEventListener('dragleave', this.handleDragSliderLeave.bind(this), false);
          sliderDisplayOrder.addEventListener('drop', this.handleDropSlider.bind(this), false);
          sliderDisplayOrder.addEventListener('dragend', this.handleDragSliderEnd.bind(this), false);
          *
          sliderDisplayOrder.addEventListener('change', (event) => {
              console.log("slider change event");
              this.handleChangeNestedElementCellTable(sliderDisplayOrder);
          });
      });
      */
      this.hookupChangeHandlerTableCells(selectorDisplayOrder);
    }
  }, {
    key: "hookupChangeHandlerTableCells",
    value: function hookupChangeHandlerTableCells(inputSelector) {
      var _this10 = this;
      var handler = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : function (event, element) {
        _this10.handleChangeNestedElementCellTable(event, element);
      };
      Events.initialiseEventHandler(inputSelector, flagInitialised, function (input) {
        input.addEventListener("change", function (event) {
          handler(event, input);
        });
        handler(null, input);
      });
      // this.hookupEventHandler("change", inputSelector, handler);
    }
    /*
    handleChangeElementCellTable(event, element) {
        let row = DOM.getRowFromElement(element);
        let td = DOM.getCellFromElement(element);
        let wasDirtyRow = DOM.hasDirtyChildrenContainer(row);
        let wasDirtyElement = element.classList.contains(flagDirty);
        let isDirtyElement = DOM.updateAndCheckIsElementDirty(element);
        if (isDirtyElement != wasDirtyElement) {
            DOM.handleDirtyElement(td, isDirtyElement);
            let isNowDirtyRow = DOM.hasDirtyChildrenContainer(row);
            if (isNowDirtyRow != wasDirtyRow) {
                DOM.handleDirtyElement(row, isNowDirtyRow);
                let rows = this.getTableRecords(true);
                let existsDirtyRecord = rows.length > 0;
                this.toggleShowButtonsSaveCancel(existsDirtyRecord);
            }
        }
    }
    handleChangeElementNestedCellTable(event, element, flagColumnList = [], orderNesting = 1) {
        let orderNestingTemp = orderNesting;
        let row, td, nestedRowSelector;
        while (orderNestingTemp > 0) {
            nestedRowSelector = idTableMain;
            for (let indexOrderNesting = 0; indexOrderNesting < orderNestingTemp; indexOrderNesting++) {
                nestedRowSelector += ' tbody tr';
            }
            row = DOM.getClosestParent(element, nestedRowSelector);
            td = row.querySelector('td.' + flag);
        }
        let row = DOM.getRowFromElement(element);
        let td = DOM.getCellFromElement(element);
        let wasDirtyRow = DOM.hasDirtyChildrenContainer(row);
        let wasDirtyElement = element.classList.contains(flagDirty);
        let isDirtyElement = DOM.updateAndCheckIsElementDirty(element);
        if (isDirtyElement != wasDirtyElement) {
            DOM.handleDirtyElement(td, isDirtyElement);
            let isNowDirtyRow = DOM.hasDirtyChildrenContainer(row);
            if (isNowDirtyRow != wasDirtyRow) {
                DOM.handleDirtyElement(row, isNowDirtyRow);
                let rows = this.getTableRecords(true);
                let existsDirtyRecord = rows.length > 0;
                this.toggleShowButtonsSaveCancel(existsDirtyRecord);
            }
        }
    }
    handleChangeElementSubtableCell(event, element, flagFieldSubtable) {
        let rowSubtable = element.closest(idTableMain + ' td.' + flagFieldSubtable + ' tbody tr');
        let rowTable = rowSubtable.closest(idTableMain + ' > tbody > tr');
        let td = DOM.getCellFromElement(element);
        // let tdSubtable = td.closest('td.' + flagFieldSubtable);
        let wasDirtyRowSubtable = DOM.hasDirtyChildrenContainer(rowSubtable);
        let wasDirtyRowTable = DOM.hasDirtyChildrenContainer(rowTable);
        let wasDirtyElement = element.classList.contains(flagDirty);
        let isDirtyElement = DOM.updateAndCheckIsElementDirty(element);
        console.log({isDirtyElement, wasDirtyElement});
        if (isDirtyElement != wasDirtyElement) {
            DOM.handleDirtyElement(td, isDirtyElement);
            let isNowDirtyRowSubtable = DOM.hasDirtyChildrenContainer(rowSubtable);
            console.log({isNowDirtyRowSubtable, wasDirtyRowSubtable});
            if (isNowDirtyRowSubtable != wasDirtyRowSubtable) {
                DOM.handleDirtyElement(rowSubtable, isNowDirtyRowSubtable);
                let isNowDirtyRowTable = DOM.hasDirtyChildrenContainer(rowTable);
                console.log({isNowDirtyRowTable, wasDirtyRowTable});
                if (isNowDirtyRowTable != wasDirtyRowTable) {
                    DOM.handleDirtyElement(rowTable, isNowDirtyRowTable);
                    let rows = this.getTableRecords(true);
                    let existsDirtyRecord = rows.length > 0;
                    this.toggleShowButtonsSaveCancel(existsDirtyRecord);
                }
            }
        }
    }
    */
  }, {
    key: "handleChangeNestedElementCellTable",
    value: function handleChangeNestedElementCellTable(event, element) {
      var wasDirtyParentRows = this.getAllIsDirtyRowsInParentTree(element);
      var wasDirtyElement = element.classList.contains(flagDirty);
      var isDirtyElement = DOM.updateAndCheckIsElementDirty(element);
      if (_verbose) {
        console.log({
          isDirtyElement: isDirtyElement,
          wasDirtyElement: wasDirtyElement,
          wasDirtyParentRows: wasDirtyParentRows
        });
      }
      var td = DOM.getCellFromElement(element);
      DOM.setElementAttributeValueCurrent(td, DOM.getElementAttributeValueCurrent(element));
      if (isDirtyElement != wasDirtyElement) {
        DOM.handleDirtyElement(td, isDirtyElement);
        this.updateAndToggleShowButtonsSaveCancel();
        this.cascadeChangedIsDirtyNestedElementCellTable(element, isDirtyElement, wasDirtyParentRows);
      }
    }
  }, {
    key: "getAllIsDirtyRowsInParentTree",
    value: function getAllIsDirtyRowsInParentTree(element) {
      var rows = [];
      var parent = element;
      var isDirty;
      while (parent) {
        if (parent.matches('tr')) {
          isDirty = parent.classList.contains(flagDirty);
          rows.push(isDirty);
        }
        parent = parent.parentElement;
      }
      return rows;
    }
  }, {
    key: "cascadeChangedIsDirtyNestedElementCellTable",
    value: function cascadeChangedIsDirtyNestedElementCellTable(element, isDirtyElement, wasDirtyParentRows) {
      if (validation_Validation.isEmpty(wasDirtyParentRows)) return;
      var td = DOM.getCellFromElement(element);
      var isDirtyTd = isDirtyElement || DOM.hasDirtyChildrenContainer(tr);
      DOM.handleDirtyElement(td, isDirtyTd);
      var tr = DOM.getRowFromElement(td);
      var isDirtyRow = isDirtyTd || DOM.hasDirtyChildrenContainer(tr);
      var wasDirtyRow = wasDirtyParentRows.shift();
      if (_verbose) {
        console.log({
          isDirtyRow: isDirtyRow,
          wasDirtyRow: wasDirtyRow
        });
      }
      if (isDirtyRow != wasDirtyRow) {
        DOM.handleDirtyElement(tr, isDirtyRow);
        this.updateAndToggleShowButtonsSaveCancel();
        this.cascadeChangedIsDirtyNestedElementCellTable(tr.parentElement, isDirtyRow, wasDirtyParentRows);
      }
    }
  }, {
    key: "hookupChangeHandlerTableCellsWhenNotCollapsed",
    value: function hookupChangeHandlerTableCellsWhenNotCollapsed(inputSelector) {
      var _this11 = this;
      var handler = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : function (event, element) {
        if (!element.classList.contains(flagCollapsed)) _this11.handleChangeNestedElementCellTable(event, element);
      };
      this.hookupEventHandler("change", inputSelector, handler);
    }
    /* ToDo: Fix this slider drag and drop functionality
    handleDragSliderStart(event) {
        this.dragSrcEl = event.target;
        event.dataTransfer.effectAllowed = flagMove;
        /*
        console.log("setting outer html: ", this.dragSrcEl.outerHTML);
        event.dataTransfer.setData('text/html', this.dragSrcEl.outerHTML);
        *
        this.dragSrcRow = DOM.getRowFromElement(this.dragSrcEl);
        this.dragSrcEl.classList.add(flagDragging);
    }
    handleDragSliderOver(event) {
        if (event.preventDefault) {
            event.preventDefault();
        }
        event.dataTransfer.dropEffect = flagMove;
        return false;
    }
    handleDragSliderEnter(event) {
        event.target.closest('tr').classList.add(flagDragOver);
    }
    handleDragSliderLeave(event) {
        event.target.closest('tr').classList.remove(flagDragOver);
    }
    handleDropSlider(event) {
        event.stopPropagation();
        let targetRow = DOM.getRowFromElement(event.target);
        if (this.dragSourceRow != targetRow) {
            targetRow.classList.remove(flagDragOver);
            this.dragSrcEl.classList.remove(flagDragging);
            let sourceRowClone = this.dragSrcRow.cloneNode(true);
            let targetRowClone = targetRow.cloneNode(true);
            console.log("sourceRowClone: ", sourceRowClone);
            console.log("targetRowClone: ", targetRowClone);
            let tbody = targetRow.closest('tbody');
            tbody.replaceChild(sourceRowClone, targetRow);
            tbody.replaceChild(targetRowClone, this.dragSrcRow);
            this.refreshDisplayOrders();
        }
        return false;
    }
    handleDragSliderEnd(event) {
        let table = TableBasePage.getTableMain();
        let rows = table.querySelectorAll('tr');
        rows.forEach(row => {
            row.classList.remove(flagDragOver);
            row.classList.remove(flagDragging);
        });
    }
    refreshDisplayOrders() {
        console.log("updating display order values");
        let rows = document.querySelectorAll(idTableMain + 'tbody tr.' + flagRow);
        rows.forEach((row, indexRow) => {
            sliderDisplayOrder = row.querySelector('td.' + flagDisplayOrder + ' .' + flagSlider);
            sliderDisplayOrder.setAttribute(attrValueCurrent, indexRow);
        });
    }
    */
  }, {
    key: "hookupTextareasCodeTable",
    value: function hookupTextareasCodeTable() {
      this.hookupChangeHandlerTableCells(idTableMain + ' tbody tr td.' + flagCode + ' textarea');
    }
  }, {
    key: "hookupTextareasNameTable",
    value: function hookupTextareasNameTable() {
      this.hookupChangeHandlerTableCells(idTableMain + ' tbody tr td.' + flagName + ' textarea');
    }
  }, {
    key: "hookupTextareasDescriptionTable",
    value: function hookupTextareasDescriptionTable() {
      this.hookupChangeHandlerTableCells(idTableMain + ' tbody tr td.' + flagDescription + ' textarea');
    }
  }, {
    key: "hookupFieldsActive",
    value: function hookupFieldsActive() {
      var _this12 = this;
      var flagTable = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : '';
      var handleClickRowNew = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : function (event, element) {
        _this12.handleClickAddRowTable(event, element);
      };
      var selectorButton = 'table' + (validation_Validation.isEmpty(flagTable) ? '' : '.' + flagTable) + ' > tbody > tr > td.' + flagActive + ' button';
      var selectorButtonDelete = selectorButton + '.' + flagDelete;
      var selectorButtonUndelete = selectorButton + ':not(.' + flagDelete + ')';
      console.log("hookupFieldsActive: ", selectorButtonDelete, selectorButtonUndelete);
      this.hookupButtonsRowDelete(selectorButtonDelete, selectorButtonUndelete);
      this.hookupButtonsRowUndelete(selectorButtonDelete, selectorButtonUndelete);
      this.hookupEventHandler("click", 'table' + (validation_Validation.isEmpty(flagTable) ? '' : '.' + flagTable) + ' > thead > tr > th.' + flagActive + ' button', function (event, button) {
        handleClickRowNew(event, button);
      });
    }
  }, {
    key: "hookupButtonsRowDelete",
    value: function hookupButtonsRowDelete(selectorButtonDelete, selectorButtonUndelete) {
      var _this13 = this;
      var changeHandler = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : function (event, element) {
        _this13.handleChangeNestedElementCellTable(event, element);
      };
      this.hookupEventHandler("click", selectorButtonDelete, function (event, element) {
        _this13.handleClickButtonRowDelete(event, element, selectorButtonDelete, selectorButtonUndelete, function (changeEvent, changeElement) {
          changeHandler(changeEvent, changeElement);
        });
      });
    }
  }, {
    key: "handleClickButtonRowDelete",
    value: function handleClickButtonRowDelete(event, element, selectorButtonDelete, selectorButtonUndelete) {
      var _this14 = this;
      var changeHandler = arguments.length > 4 && arguments[4] !== undefined ? arguments[4] : function (event, element) {
        _this14.handleChangeNestedElementCellTable(event, element);
      };
      var row = DOM.getRowFromElement(element);
      if (row.classList.contains(flagRowNew) && !DOM.hasDirtyChildrenContainer(row)) {
        row.parentNode.removeChild(row);
      }
      var buttonAdd = element.cloneNode(false);
      buttonAdd.classList.remove(flagInitialised);
      buttonAdd.classList.remove(flagDelete);
      buttonAdd.classList.add(flagAdd);
      buttonAdd.textContent = '+';
      element.replaceWith(buttonAdd);
      changeHandler(null, buttonAdd);
      this.hookupButtonsRowUndelete(selectorButtonDelete, selectorButtonUndelete, function (changeEvent, changeElement) {
        changeHandler(changeEvent, changeElement);
      });
      this.updateAndToggleShowButtonsSaveCancel();
    }
  }, {
    key: "hookupButtonsRowUndelete",
    value: function hookupButtonsRowUndelete(selectorButtonDelete, selectorButtonUndelete) {
      var _this15 = this;
      var changeHandler = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : function (event, element) {
        _this15.handleChangeNestedElementCellTable(event, element);
      };
      this.hookupEventHandler("click", selectorButtonUndelete, function (event, element) {
        _this15.handleClickButtonRowUndelete(event, element, selectorButtonDelete, selectorButtonUndelete, function (changeEvent, changeElement) {
          changeHandler(changeEvent, changeElement);
        });
      });
    }
  }, {
    key: "handleClickButtonRowUndelete",
    value: function handleClickButtonRowUndelete(event, element, selectorButtonDelete, selectorButtonUndelete) {
      var _this16 = this;
      var changeHandler = arguments.length > 4 && arguments[4] !== undefined ? arguments[4] : function (event, element) {
        _this16.handleChangeNestedElementCellTable(event, element);
      };
      var buttonDelete = element.cloneNode(false);
      buttonDelete.classList.remove(flagInitialised);
      buttonDelete.classList.remove(flagAdd);
      buttonDelete.classList.add(flagDelete);
      buttonDelete.textContent = 'x';
      element.replaceWith(buttonDelete);
      changeHandler(null, buttonDelete);
      this.hookupButtonsRowDelete(selectorButtonDelete, selectorButtonUndelete, function (changeEvent, changeElement) {
        changeHandler(changeEvent, changeElement);
      });
      this.updateAndToggleShowButtonsSaveCancel();
    }
  }, {
    key: "hookupTdsAccessLevel",
    value: function hookupTdsAccessLevel() {
      var cellSelector = idTableMain + ' tbody td.' + flagAccessLevel;
      this.hookupTableCellDdlPreviews(cellSelector, Utils.getListFromDict(accessLevels));
    }
  }, {
    key: "hookupTableCellDdlPreviews",
    value: function hookupTableCellDdlPreviews(cellSelector, optionList) {
      var _this17 = this;
      var ddlHookup = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : function (cellSelector) {
        _this17.hookupTableCellDdls(cellSelector);
      };
      var changeHandler = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : function (event, element) {
        _this17.handleChangeNestedElementCellTable(event, element);
      };
      this.hookupEventHandler("click", cellSelector, function (event, td) {
        _this17.handleClickTableCellDdlPreview(event, td, optionList, cellSelector, function (cellSelector) {
          ddlHookup(cellSelector, function (event, element) {
            changeHandler(event, element);
          });
        });
      });
      ddlHookup(cellSelector + ' select');
    }
  }, {
    key: "hookupTableCellDdls",
    value: function hookupTableCellDdls(ddlSelector) {
      var _this18 = this;
      var changeHandler = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : function (event, element) {
        _this18.handleChangeNestedElementCellTable(event, element);
      };
      this.hookupEventHandler("change", ddlSelector, function (event, element) {
        changeHandler(event, element);
      });
    }
  }, {
    key: "handleClickTableCellDdlPreview",
    value: function handleClickTableCellDdlPreview(event, td, optionObjectList, cellSelector) {
      var _this19 = this;
      var ddlHookup = arguments.length > 4 && arguments[4] !== undefined ? arguments[4] : function (cellSelector) {
        _this19.hookupTableCellDdls(cellSelector);
      };
      if (td.querySelector('select')) return;
      // td.removeEventListener("click", ddlHookup);
      var tdNew = td.cloneNode(true);
      td.parentNode.replaceChild(tdNew, td);
      var idSelected = DOM.getElementAttributeValueCurrent(tdNew);
      tdNew.innerHTML = '';
      var ddl = document.createElement('select');
      DOM.setElementValuesCurrentAndPrevious(ddl, idSelected);
      var optionJson, option;
      if (_verbose) {
        console.log("click table cell ddl preview");
        console.log({
          optionObjectList: optionObjectList,
          cellSelector: cellSelector
        });
      }
      option = DOM.createOption(null);
      ddl.appendChild(option);
      optionObjectList.forEach(function (optionObjectJson) {
        optionJson = BusinessObjects.getOptionJsonFromObjectJson(optionObjectJson, idSelected);
        option = DOM.createOption(optionJson);
        ddl.appendChild(option);
      });
      tdNew.appendChild(ddl);
      var ddlSelector = cellSelector + ' select';
      ddlHookup(ddlSelector);
    }
    /*
    handleChangeTableCellDdl(event, ddl) {
        let row = DOM.getRowFromElement(ddl);
        let td = DOM.getCellFromElement(ddl);
        console.log("td: ", td);
        let wasDirtyRow = DOM.hasDirtyChildrenContainer(row);
        let wasDirtyElement = ddl.classList.contains(flagDirty);
        let isDirtyElement = DOM.updateAndCheckIsElementDirty(ddl);
        console.log("isDirtyElement: ", isDirtyElement);
        console.log("wasDirtyElement: ", wasDirtyElement);
        if (isDirtyElement != wasDirtyElement) {
            DOM.handleDirtyElement(td, isDirtyElement);
            let optionSelected = ddl.options[ddl.selectedIndex];
            DOM.setElementAttributeValueCurrent(td, optionSelected.value);
            let isNowDirtyRow = DOM.hasDirtyChildrenContainer(row);
            console.log("isNowDirtyRow: ", isNowDirtyRow);
            console.log("wasDirtyRow: ", wasDirtyRow);
            if (isNowDirtyRow != wasDirtyRow) {
                DOM.handleDirtyElement(row, isNowDirtyRow);
                let rows = this.getTableRecords(true);
                let existsDirtyRecord = rows.length > 0;
                console.log("dirty records:", rows);
                console.log("existsDirtyRecord:", existsDirtyRecord);
                this.toggleShowButtonsSaveCancel(existsDirtyRecord);
            }
        }
    }
    */
  }, {
    key: "hookupTableCellDDlPreviewsWhenNotCollapsed",
    value: function hookupTableCellDDlPreviewsWhenNotCollapsed(cellSelector, optionList) {
      var _this20 = this;
      var ddlHookup = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : function (event, element) {
        _this20.hookupTableCellDdls(event, element);
      };
      this.hookupEventHandler("click", cellSelector, function (event, td) {
        var div = td.querySelector('div');
        if (!div || div.classList.contains(flagCollapsed)) return;
        _this20.handleClickTableCellDdlPreview(event, td, optionList, cellSelector, function (event, element) {
          ddlHookup(event, element);
        });
      });
    }
  }, {
    key: "hookupProductCategoryDdls",
    value: function hookupProductCategoryDdls(ddlSelector) {
      var _this21 = this;
      this.hookupChangeHandlerTableCells(ddlSelector, function (event, element) {
        _this21.handleChangeProductCategoryDdl(event, element);
      });
    }
  }, {
    key: "handleChangeProductCategoryDdl",
    value: function handleChangeProductCategoryDdl(event, ddlCategory) {
      this.handleChangeNestedElementCellTable(event, ddlCategory);
      var idProductCategorySelected = DOM.getElementAttributeValueCurrent(ddlCategory);
      var row = DOM.getRowFromElement(ddlCategory);
      var tdProduct = row.querySelector('td.' + flagProduct);
      tdProduct.dispatchEvent(new Event('click'));
      var ddlProduct = row.querySelector('td.' + flagProduct + ' select');
      ddlProduct.innerHTML = '';
      ddlProduct.appendChild(DOM.createOption(null));
      var optionJson, option;
      Utils.getListFromDict(products).forEach(function (product) {
        if (idProductCategorySelected != '0' && product[attrIdProductCategory] != idProductCategorySelected) return;
        optionJson = BusinessObjects.getOptionJsonFromObjectJson(product);
        option = DOM.createOption(optionJson);
        ddlProduct.appendChild(option);
      });
      this.handleChangeNestedElementCellTable(event, ddlProduct);
    }
  }, {
    key: "hookupFieldsProductPermutationVariation",
    value: function hookupFieldsProductPermutationVariation() {
      this.hookupPreviewsProductPermutationVariation();
      this.hookupDdlsProductPermutationVariationType();
      this.hookupDdlsProductPermutationVariation();
      this.hookupButtonsProductPermutationVariationAddDelete();
    }
  }, {
    key: "hookupPreviewsProductPermutationVariation",
    value: function hookupPreviewsProductPermutationVariation() {
      var _this22 = this;
      this.hookupEventHandler("click", idTableMain + ' td.' + flagProductVariations, function (event, element) {
        return _this22.handleClickProductPermutationVariationsPreview(event, element);
      });
    }
  }, {
    key: "handleClickProductPermutationVariationsPreview",
    value: function handleClickProductPermutationVariationsPreview(event, element) {
      var _this23 = this;
      var tblVariations = element.querySelector('table.' + flagProductVariations);
      if (!validation_Validation.isEmpty(tblVariations)) return;
      this.toggleColumnCollapsed(flagProductVariations, false);
      var permutationVariations = this.getElementProductVariations(element);
      tblVariations = document.createElement("table");
      tblVariations.classList.add(flagProductVariations);
      var thead = document.createElement("thead");
      var tr = document.createElement("tr");
      var thVariationType = document.createElement("th");
      thVariationType.classList.add(flagProductVariationType);
      thVariationType.textContent = 'Type';
      var thNameVariation = document.createElement("th");
      thNameVariation.classList.add(flagProductVariation);
      thNameVariation.textContent = 'Name';
      var buttonAdd = document.createElement("button");
      buttonAdd.classList.add(flagAdd);
      buttonAdd.textContent = '+';
      var thAddDelete = document.createElement("th");
      thAddDelete.classList.add(flagAdd);
      thAddDelete.appendChild(buttonAdd);
      tr.appendChild(thVariationType);
      tr.appendChild(thNameVariation);
      tr.appendChild(thAddDelete);
      thead.appendChild(tr);
      tblVariations.appendChild(thead);
      var tbody = document.createElement("tbody");
      if (!validation_Validation.isEmpty(permutationVariations)) {
        permutationVariations.forEach(function (permutationVariation, index) {
          _this23.addProductPermutationVariationRow(tbody, permutationVariation);
        });
      }
      tblVariations.appendChild(tbody);
      if (_verbose) {
        console.log("click product permutation variations preview");
        console.log('variations:', permutationVariations);
        console.log("tblVariations: ", tblVariations);
      }
      var cellParent = element.closest(idTableMain + ' tbody tr td.' + flagProductVariations);
      cellParent.innerHTML = '';
      cellParent.appendChild(tblVariations);
      this.hookupFieldsProductPermutationVariation();
    }
  }, {
    key: "toggleColumnCollapsed",
    value: function toggleColumnCollapsed(flagColumn, isCollapsed) {
      this.toggleColumnHasClassnameFlag(flagColumn, isCollapsed, flagCollapsed);
    }
  }, {
    key: "toggleColumnHeaderCollapsed",
    value: function toggleColumnHeaderCollapsed(flagColumn, isCollapsed) {
      this.toggleColumnHasClassnameFlag(flagColumn, isCollapsed, flagCollapsed);
    }
  }, {
    key: "getElementProductVariations",
    value: function getElementProductVariations(element) {
      var permutationVariations = element.getAttribute(attrValueCurrent);
      var objVariations = [];
      var parts, new_variation, new_variation_type;
      if (!validation_Validation.isEmpty(permutationVariations)) {
        permutationVariations = permutationVariations.split(',');
        permutationVariations.forEach(function (variation) {
          parts = variation.split(':');
          if (parts.length == 2) {
            if (_verbose) {
              console.log("parts: ", parts);
            }
            new_variation_type = productVariationTypes[parts[0].trim()];
            new_variation = productVariations[parts[1].trim()];
            objVariations.push(base_table_defineProperty(base_table_defineProperty({}, flagProductVariationType, new_variation_type), flagProductVariation, new_variation));
          } else {
            if (_verbose) {
              console.log("error: invalid variation: ", variation);
            }
          }
        });
      }
      return objVariations;
    }
  }, {
    key: "addProductPermutationVariationRow",
    value: function addProductPermutationVariationRow(tbody, permutationVariation) {
      if (_verbose) {
        console.log("permutationVariation: ", permutationVariation);
      }
      var productVariationType, optionProductVariationTypeJson, optionProductVariationType, productVariation, optionProductVariationJson, optionProductVariation;
      /*
      if (Validation.isEmpty(variations)) {
          return;
      }
      */
      var productVariationKeys = Object.keys(productVariations);
      var productVariationTypeKeys = Object.keys(productVariationTypes);
      var ddlsProductVariationType = tbody.querySelectorAll('select.' + flagProductVariationType);
      var productVariationTypeKeysSelected = new Set();
      var valueSelected;
      var doFilterProductVariationKeys = permutationVariation[attrIdProductVariationType] != 0;
      ddlsProductVariationType.forEach(function (ddlProductVariationType) {
        valueSelected = DOM.getElementValueCurrent(ddlProductVariationType);
        productVariationTypeKeysSelected.add(valueSelected);
      });
      productVariationTypeKeys = productVariationTypeKeys.filter(function (typeKey) {
        return !productVariationTypeKeysSelected.has(typeKey);
      });
      if (productVariationTypeKeys.length == 0) return;
      if (doFilterProductVariationKeys) {
        productVariationKeys = productVariationKeys.filter(function (variationKey) {
          return !productVariationTypeKeysSelected.has(productVariations[variationKey][attrIdProductVariationType]);
        });
      }
      var permutationVariationJson = permutationVariation[flagProductVariation];
      var permutationVariationTypeJson = permutationVariation[flagProductVariationType];
      var tdVariationType = document.createElement("td");
      tdVariationType.classList.add(flagProductVariationType);
      DOM.setElementAttributesValuesCurrentAndPrevious(tdVariationType, permutationVariationTypeJson[attrIdProductVariationType]);
      var ddlVariationType = document.createElement("select");
      ddlVariationType.classList.add(flagProductVariationType);
      DOM.setElementAttributesValuesCurrentAndPrevious(ddlVariationType, permutationVariationTypeJson[attrIdProductVariationType]);
      optionProductVariationType = DOM.createOption(null);
      if (_verbose) {
        console.log("optionProductVariationType: ", optionProductVariationType);
      }
      ddlVariationType.appendChild(optionProductVariationType);
      productVariationTypeKeys.forEach(function (productVariationTypeKey) {
        /*
        optionProductVariationType = document.createElement('option');
        optionProductVariationType.value = optionVariationType.value;
        optionProductVariationType.text = optionVariationType.text;
        */
        productVariationType = productVariationTypes[productVariationTypeKey];
        optionProductVariationTypeJson = BusinessObjects.getOptionJsonFromObjectJson(productVariationType, permutationVariationTypeJson[attrIdProductVariationType]);
        optionProductVariationType = DOM.createOption(optionProductVariationTypeJson);
        if (_verbose) {
          console.log("optionProductVariationType: ", optionProductVariationType);
        }
        ddlVariationType.appendChild(optionProductVariationType);
      });
      var tdVariation = document.createElement("td");
      tdVariation.classList.add(flagProductVariation);
      DOM.setElementAttributesValuesCurrentAndPrevious(tdVariation, permutationVariationJson[attrIdProductVariation]);
      var ddlVariation = document.createElement("select");
      ddlVariation.classList.add(flagProductVariation);
      DOM.setElementAttributesValuesCurrentAndPrevious(ddlVariation, permutationVariationJson[attrIdProductVariation]);
      optionProductVariation = DOM.createOption(null);
      if (_verbose) {
        console.log("optionProductVariation: ", optionProductVariation);
      }
      ddlVariation.appendChild(optionProductVariation);
      productVariationKeys.forEach(function (productVariationKey) {
        productVariation = productVariations[productVariationKey];
        optionProductVariationJson = BusinessObjects.getOptionJsonFromObjectJson(productVariation, permutationVariationJson[attrIdProductVariation]);
        optionProductVariation = DOM.createOption(optionProductVariationJson);
        if (_verbose) {
          console.log("optionProductVariation: ", optionProductVariation);
        }
        ddlVariation.appendChild(optionProductVariation);
      });
      var tdDelete = document.createElement("td");
      tdDelete.classList.add(flagDelete);
      var buttonDelete = document.createElement("button");
      buttonDelete.classList.add(flagActive);
      buttonDelete.classList.add(flagDelete);
      buttonDelete.textContent = 'x';
      DOM.setElementAttributesValuesCurrentAndPrevious(buttonDelete, true);
      var tr = document.createElement("tr");
      tr.classList.add(flagProductVariation);
      tdVariationType.appendChild(ddlVariationType);
      tr.appendChild(tdVariationType);
      tdVariation.appendChild(ddlVariation);
      tr.appendChild(tdVariation);
      tdDelete.appendChild(buttonDelete);
      tr.appendChild(tdDelete);
      tbody.appendChild(tr);
    }
  }, {
    key: "hookupDdlsProductPermutationVariationType",
    value: function hookupDdlsProductPermutationVariationType() {
      var _this24 = this;
      this.hookupTableCellDdls(idTableMain + ' td.' + flagProductVariations + ' td.' + flagProductVariationType + ' select', function (event, ddlVariationType) {
        _this24.handleChangeProductVariationInput(event, ddlVariationType);
        var idVariationTypeSelected = DOM.getElementValueCurrent(ddlVariationType);
        var row = DOM.getRowFromElement(ddlVariationType);
        var tdVariation = row.querySelector('td.' + flagProductVariation);
        tdVariation.dispatchEvent(new Event('click'));
        var ddlVariation = row.querySelector('td.' + flagProductVariation + ' select');
        ddlVariation.innerHTML = '';
        ddlVariation.appendChild(DOM.createOption(null));
        var optionJson, option;
        var variationType = productVariationTypes[idVariationTypeSelected];
        if (variationType == null) variationType = base_table_defineProperty({}, flagProductVariations, []);
        variationType[flagProductVariations].forEach(function (variation) {
          optionJson = BusinessObjects.getOptionJsonFromObjectJson(variation);
          option = DOM.createOption(optionJson);
          ddlVariation.appendChild(option);
        });
        _this24.handleChangeProductVariationInput(event, ddlVariation);
      });
    }
  }, {
    key: "handleChangeProductVariationInput",
    value: function handleChangeProductVariationInput(event, element) {
      this.handleChangeNestedElementCellTable(event, element);
      this.updateProductPermutationVariations(element);
    }
  }, {
    key: "hookupDdlsProductPermutationVariation",
    value: function hookupDdlsProductPermutationVariation() {
      var _this25 = this;
      this.hookupTableCellDdls(idTableMain + ' td.' + flagProductVariations + ' td.' + flagProductVariation + ' select', function (event, ddlVariation) {
        _this25.handleChangeProductVariationInput(event, ddlVariation);
      });
    }
  }, {
    key: "hookupButtonsProductPermutationVariationAddDelete",
    value: function hookupButtonsProductPermutationVariationAddDelete() {
      var _this26 = this;
      var selectorButton = idTableMain + ' td.' + flagProductVariations + ' tr.' + flagProductVariation + ' button';
      var selectorButtonDelete = selectorButton + '.' + flagDelete;
      var selectorButtonUndelete = selectorButton + '.' + flagAdd;
      this.hookupButtonsRowDelete(selectorButtonDelete, selectorButtonUndelete, function (event, element) {
        _this26.handleChangeProductVariationInput(event, element);
      });
      this.hookupButtonsRowUndelete(selectorButtonDelete, selectorButtonUndelete, function (event, element) {
        _this26.handleChangeProductVariationInput(event, element);
      });
      this.hookupButtonsProductPermutationVariationAdd();
    }
  }, {
    key: "hookupButtonsProductPermutationVariationAdd",
    value: function hookupButtonsProductPermutationVariationAdd() {
      var _this27 = this;
      this.hookupEventHandler("click", idTableMain + ' td.' + flagProductVariations + ' button.' + flagAdd, function (event, element) {
        _this27.handleClickButtonProductPermutationVariationAdd(event, element);
      });
    }
  }, {
    key: "handleClickButtonProductPermutationVariationAdd",
    value: function handleClickButtonProductPermutationVariationAdd(event, element) {
      var variationsCell = element.closest('td.' + flagProductVariations);
      var tbody = variationsCell.querySelector('tbody');
      var permutationVariation = TableBasePage.createOptionUnselectedProductVariation();
      this.addProductPermutationVariationRow(tbody, permutationVariation);
      this.hookupFieldsProductPermutationVariation();
    }
  }, {
    key: "updateProductPermutationVariations",
    value: function updateProductPermutationVariations(element) {
      var variationsCell = element.closest('td.' + flagProductVariations);
      var variationPairsString = this.getProductPermutationVariationsText(variationsCell);
      DOM.setElementAttributeValueCurrent(variationsCell, variationPairsString);
      this.handleChangeNestedElementCellTable(null, variationsCell);
    }
  }, {
    key: "getProductPermutationVariationsText",
    value: function getProductPermutationVariationsText(variationsTd) {
      var rows = variationsTd.querySelectorAll(':scope tbody tr:has(button.' + flagDelete + ')');
      var variationPairsString = '';
      var ddlVariationType, ddlVariation, idVariationType, idVariation;
      rows.forEach(function (row, index) {
        ddlVariationType = row.querySelector(':scope td select.' + flagProductVariationType);
        ddlVariation = row.querySelector(':scope td select.' + flagProductVariation);
        idVariationType = DOM.getElementValueCurrent(ddlVariationType);
        idVariation = DOM.getElementValueCurrent(ddlVariation);
        if (variationPairsString != '') variationPairsString += ',';
        variationPairsString += idVariationType + ':' + idVariation;
      });
      return variationPairsString;
    }
  }, {
    key: "hookupCurrencyFields",
    value: function hookupCurrencyFields() {
      this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagCurrency, Utils.getListFromDict(currencies));
    }
  }, {
    key: "createTdActive",
    value: function createTdActive(isActive) {
      var tdActive = document.createElement("td");
      tdActive.classList.add(flagActive);
      var buttonActive = document.createElement("button");
      buttonActive.classList.add(flagActive);
      buttonActive.classList.add(isActive ? flagDelete : flagAdd);
      buttonActive.textContent = isActive ? 'x' : '+';
      DOM.setElementAttributesValuesCurrentAndPrevious(buttonActive, isActive);
      tdActive.appendChild(buttonActive);
      return tdActive;
    }
  }, {
    key: "leave",
    value: function leave() {
      if (this.constructor === TableBasePage) {
        throw new Error("Must implement leave() method.");
      }
      base_table_superPropGet(TableBasePage, "leave", this, 3)([]);
      var formFilters = this.getFormFilters();
      var dataPage = {};
      dataPage[flagFormFilters] = DOM.convertForm2JSON(formFilters);
      this.setLocalStoragePage(dataPage);
      // _rowBlank = null;
    }
  }, {
    key: "toggleColumnHasClassnameFlag",
    value: function toggleColumnHasClassnameFlag(columnFlag, isRequiredFlag, classnameFlag) {
      var table = TableBasePage.getTableMain();
      var columnTh = table.querySelector('th.' + columnFlag);
      var columnThHasFlag = columnTh.classList.contains(classnameFlag);
      if (isRequiredFlag == columnThHasFlag) return;
      DOM.toggleElementHasClassnameFlag(columnTh, isRequiredFlag, classnameFlag);
      /*
      let columnTds = table.querySelectorAll('td.' + columnFlag);
      columnTds.forEach((columnTd) => {
          DOM.toggleElementHasClassnameFlag(columnTd, isRequiredFlag, classnameFlag);
      });
      */
    }
  }, {
    key: "toggleColumnHeaderHasClassnameFlag",
    value: function toggleColumnHeaderHasClassnameFlag(columnFlag, isRequiredFlag, classnameFlag) {
      var table = TableBasePage.getTableMain();
      var columnTh = table.querySelector('th.' + columnFlag);
      DOM.toggleElementHasClassnameFlag(columnTh, isRequiredFlag, classnameFlag);
    }
  }, {
    key: "updateAndToggleShowButtonsSaveCancel",
    value: function updateAndToggleShowButtonsSaveCancel() {
      var records = this.getTableRecords(true);
      var existsDirtyRecord = records.length > 0;
      this.toggleShowButtonsSaveCancel(existsDirtyRecord);
    }
  }], [{
    key: "isDirtyFilter",
    value: function isDirtyFilter(filter) {
      var isDirty = DOM.updateAndCheckIsElementDirty(filter);
      if (isDirty) {
        var tbody = document.querySelector(idTableMain + ' tbody');
        tbody.querySelectorAll('tr').remove();
        tbody.appendChild(document.createElement('<div>Press "Apply Filters" to refresh the table.</div>'));
      }
      return isDirty;
    }
  }, {
    key: "getTableMain",
    value: function getTableMain() {
      return document.querySelector(idTableMain);
    }
  }, {
    key: "createOptionUnselectedProductVariation",
    value: function createOptionUnselectedProductVariation() {
      return base_table_defineProperty(base_table_defineProperty({}, flagProductVariationType, base_table_defineProperty(base_table_defineProperty(base_table_defineProperty(base_table_defineProperty({}, flagNameAttrOptionText, [flagName]), flagNameAttrOptionValue, [attrIdProductVariationType]), flagName, 'Select Variation Type'), attrIdProductVariationType, 0)), flagProductVariation, base_table_defineProperty(base_table_defineProperty(base_table_defineProperty(base_table_defineProperty({}, flagNameAttrOptionText, [flagName]), flagNameAttrOptionValue, [attrIdProductVariation]), flagName, 'Select Variation'), attrIdProductVariation, 0));
    }
  }]);
}(BasePage);
/*  Example of a subclass of TableBasePage 
import { TableBasePage } from "./page_table_base.js";
import API from "../api.js";
import DOM from "../dom.js";

export class PageStoreProductCategories extends TableBasePage {
    static hash = hashPageStoreProductCategories;
    static attrIdRowObject = attrIdProductCategory;
    callSaveTableContent = API.saveCategories;

    constructor() {}
    initialize() {}
    hookupFilters() {}
    loadRowTable(rowJson) {}
    getJsonRow(row) {}
    initialiseRowNew(tbody, row) {}
    hookupTableMain() {}
    isDirtyRow(row) {}
    leave() {}
}
*/

;// CONCATENATED MODULE: ./static/js/pages/store/mixin.js
function mixin_typeof(o) { "@babel/helpers - typeof"; return mixin_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, mixin_typeof(o); }
function mixin_createForOfIteratorHelper(r, e) { var t = "undefined" != typeof Symbol && r[Symbol.iterator] || r["@@iterator"]; if (!t) { if (Array.isArray(r) || (t = mixin_unsupportedIterableToArray(r)) || e && r && "number" == typeof r.length) { t && (r = t); var _n = 0, F = function F() {}; return { s: F, n: function n() { return _n >= r.length ? { done: !0 } : { done: !1, value: r[_n++] }; }, e: function e(r) { throw r; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var o, a = !0, u = !1; return { s: function s() { t = t.call(r); }, n: function n() { var r = t.next(); return a = r.done, r; }, e: function e(r) { u = !0, o = r; }, f: function f() { try { a || null == t["return"] || t["return"](); } finally { if (u) throw o; } } }; }
function mixin_unsupportedIterableToArray(r, a) { if (r) { if ("string" == typeof r) return mixin_arrayLikeToArray(r, a); var t = {}.toString.call(r).slice(8, -1); return "Object" === t && r.constructor && (t = r.constructor.name), "Map" === t || "Set" === t ? Array.from(r) : "Arguments" === t || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(t) ? mixin_arrayLikeToArray(r, a) : void 0; } }
function mixin_arrayLikeToArray(r, a) { (null == a || a > r.length) && (a = r.length); for (var e = 0, n = Array(a); e < a; e++) n[e] = r[e]; return n; }
function mixin_ownKeys(e, r) { var t = Object.keys(e); if (Object.getOwnPropertySymbols) { var o = Object.getOwnPropertySymbols(e); r && (o = o.filter(function (r) { return Object.getOwnPropertyDescriptor(e, r).enumerable; })), t.push.apply(t, o); } return t; }
function mixin_objectSpread(e) { for (var r = 1; r < arguments.length; r++) { var t = null != arguments[r] ? arguments[r] : {}; r % 2 ? mixin_ownKeys(Object(t), !0).forEach(function (r) { mixin_defineProperty(e, r, t[r]); }) : Object.getOwnPropertyDescriptors ? Object.defineProperties(e, Object.getOwnPropertyDescriptors(t)) : mixin_ownKeys(Object(t)).forEach(function (r) { Object.defineProperty(e, r, Object.getOwnPropertyDescriptor(t, r)); }); } return e; }
function mixin_defineProperty(e, r, t) { return (r = mixin_toPropertyKey(r)) in e ? Object.defineProperty(e, r, { value: t, enumerable: !0, configurable: !0, writable: !0 }) : e[r] = t, e; }
function mixin_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function mixin_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, mixin_toPropertyKey(o.key), o); } }
function mixin_createClass(e, r, t) { return r && mixin_defineProperties(e.prototype, r), t && mixin_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function mixin_toPropertyKey(t) { var i = mixin_toPrimitive(t, "string"); return "symbol" == mixin_typeof(i) ? i : i + ""; }
function mixin_toPrimitive(t, r) { if ("object" != mixin_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != mixin_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }



// import BasePage from "../base.js";


var StoreMixinPage = /*#__PURE__*/function () {
  function StoreMixinPage(pageCurrent) {
    mixin_classCallCheck(this, StoreMixinPage);
    this.page = pageCurrent;
  }
  return mixin_createClass(StoreMixinPage, [{
    key: "initialize",
    value: function initialize() {
      console.log('hookup store start for ', this.page.hash);
      this.hookupFilters();
      this.hookupLocalStorageStore();
      this.hookupBasket();
      this.hookupButtonsAddToBasket();
    }
  }, {
    key: "hookupFilters",
    value: function hookupFilters() {
      this.hookupFilterCurrency();
      this.hookupFilterDeliveryRegion();
      this.hookupFilterIsIncludedVAT();
    }
  }, {
    key: "hookupFilterCurrency",
    value: function hookupFilterCurrency() {
      /*
      let elForm = document.querySelectorAll(idFormCurrency);
      let elSelector = document.querySelectorAll(elForm.querySelector('select')[0]);
      Events.initialiseEventHandler(elSelector, flagInitialised, function(){
          elForm = document.querySelectorAll(idFormCurrency);
          elSelector.addEventListener("change", function(event) {
              ajaxData = {};
              ajaxData[flagForm] = convertForm2JSON(elForm);
              console.log('sending data to currency selector controller: '); console.log(ajaxData);
              ajaxJSONData('select currency', mapHashToController(hashStoreSelectCurrency), ajaxData, function() { window.location.reload() }, false);
               let optionSelected = elSelector.options[elSelector.selectedIndex]
              let textSelected = optionSelected.getAttribute(attrDataShort)
              
          });
      });
      console.log("form currency initialised")
      */

      var dropdownCurrency = document.querySelectorAll(idCurrency)[0];
      // dropdownCurrency.options.map(function(option) {
      var option, indexHyphen, textOption;
      for (var indexOption = 0; indexOption < dropdownCurrency.options.length; indexOption++) {
        option = document.querySelectorAll(dropdownCurrency.options[indexOption]);
        textOption = option.text();
        indexHyphen = textOption.indexOf('-');
        option.setAttribute(attrTextExpanded, textOption);
        option.setAttribute(attrTextCollapsed, textOption.substring(0, indexHyphen - 1));
        option.classList.add(flagCollapsed);
      }
      handleSelectCollapse(dropdownCurrency);
      Events.initialiseEventHandler(dropdownCurrency, flagInitialised, function () {
        dropdownCurrency = document.querySelectorAll(dropdownCurrency);
        dropdownCurrency.addEventListener("focus", function () {
          handleSelectExpand(dropdownCurrency);
        });
        dropdownCurrency.addEventListener("blur", function () {
          handleSelectCollapse(dropdownCurrency);
        });
        dropdownCurrency.addEventListener("change", function () {
          var selectedCurrency = dropdownCurrency.val();
          if (_verbose) {
            console.log("selected currency: ", selectedCurrency);
          }
          var basket = LocalStorage.getLocalStorage(keyBasket);
          basket[keyIdCurrency] = selectedCurrency;
          // LocalStorage.setLocalStorage(keyIdCurrency, selectedCurrency);
          LocalStorage.setLocalStorage(keyBasket, basket);
          var ajaxData = {};
          ajaxData[keyBasket] = basket;
          ajaxJSONData('update currency', mapHashToController(hashPageCurrent), ajaxData, loadPageBody, false);
        });
      });
    }
  }, {
    key: "hookupFilterDeliveryRegion",
    value: function hookupFilterDeliveryRegion() {
      /*
      let elForm = document.querySelectorAll(idFormDeliveryRegion);
      let elSelector = document.querySelectorAll(elForm.querySelector('select')[0]);
      Events.initialiseEventHandler(elSelector, flagInitialised, function(){
          elForm = document.querySelectorAll(idFormDeliveryRegion);
          elSelector.addEventListener("change", function(event) {
              ajaxData = {};
              ajaxData[flagForm] = convertForm2JSON(elForm);
              console.log('sending data to delivery region selector controller: '); console.log(ajaxData);
              ajaxJSONData('select delivery region', mapHashToController(hashStoreSelectDeliveryRegion), ajaxData, function() { window.location.reload() }, false);
          });
          console.log("form delivery region initialised")
      });
      */

      var dropdownRegion = document.querySelectorAll(idRegionDelivery)[0];
      var option, indexHyphen, textOption;
      for (var indexOption = 0; indexOption < dropdownRegion.options.length; indexOption++) {
        option = document.querySelectorAll(dropdownRegion.options[indexOption]);
        textOption = option.text();
        indexHyphen = textOption.indexOf('-');
        option.setAttribute(attrTextExpanded, textOption);
        option.setAttribute(attrTextCollapsed, textOption.substring(0, indexHyphen - 1));
        option.classList.add(flagCollapsed);
      }
      handleSelectCollapse(dropdownRegion);
      Events.initialiseEventHandler(dropdownRegion, flagInitialised, function () {
        dropdownRegion = document.querySelectorAll(dropdownRegion);
        dropdownRegion.addEventListener("focus", function () {
          if (_verbose) {
            console.log("dropdown region focused");
          }
          handleSelectExpand(dropdownRegion);
        });
        dropdownRegion.addEventListener("blur", function () {
          if (_verbose) {
            console.log("dropdown region blurred");
          }
          handleSelectCollapse(dropdownRegion);
        });
        dropdownRegion.addEventListener("change", function () {
          handleSelectCollapse(dropdownRegion);
          var selectedRegion = dropdownRegion.val();
          if (_verbose) {
            console.log("selected region: ", selectedRegion);
          }
          var basket = LocalStorage.getLocalStorage(keyBasket);
          basket[keyIdRegionDelivery] = selectedRegion;
          // LocalStorage.setLocalStorage(keyIdRegionDelivery, selectedRegion);
          LocalStorage.setLocalStorage(keyBasket, basket);
          var ajaxData = {};
          ajaxData[keyIdRegionDelivery] = selectedRegion;
          ajaxJSONData('update region', mapHashToController(hashStoreSetRegion), ajaxData, null, false);
        });
      });
    }
  }, {
    key: "hookupFilterIsIncludedVAT",
    value: function hookupFilterIsIncludedVAT() {
      var elForm = document.querySelectorAll(idFormIsIncludedVAT);
      var elSelector = document.querySelectorAll(elForm.querySelector('input[type="checkbox"]')[0]);
      Events.initialiseEventHandler(elSelector, flagInitialised, function () {
        elForm = document.querySelectorAll(idFormIsIncludedVAT);
        elSelector.addEventListener("change", function (event) {
          ajaxData = {};
          ajaxData[flagForm] = convertForm2JSON(elForm);
          if (_verbose) {
            console.log('sending data to include VAT controller: ');
            console.log(ajaxData);
          }
          ajaxJSONData('set include VAT', mapHashToController(hashStoreSetIsIncludedVAT), ajaxData, function () {
            window.location.reload();
          }, false);
        });
        if (_verbose) {
          console.log("form is included VAT initialised");
        }
      });
    }
  }, {
    key: "hookupLocalStorage",
    value: function hookupLocalStorage() {
      // setupPageLocalStorage(hashPageCurrent);
      // let lsPage = getPageLocalStorage(hashPageCurrent);
      // let d = {}
      // d[keyBasket] = LocalStorage.getLocalStorage(keyBasket); // (keyBasket in lsPage) ? lsPage[keyBasket] : {'items': []};
      // console.log('d:'); console.log(d);
      var basketLocalStorage = LocalStorage.getLocalStorage(keyBasket);
      if (!StoreMixinPage.validateBasket(basketLocalStorage)) {
        if (_verbose) {
          console.log('locally-stored basket not valid');
        }
        basketLocalStorage = StoreMixinPage.makeNewBasket();
      }
      var basketServer = StoreMixinPage.validateBasket(userBasket) ? userBasket : basketLocalStorage;
      var basket = StoreMixinPage.areEqualBaskets(basketLocalStorage, basketServer) ? basketServer : StoreMixinPage.mergeBaskets(basketLocalStorage, basketServer);
      if (!StoreMixinPage.areEqualBaskets(basketLocalStorage, basket)) {
        LocalStorage.setLocalStorage(keyBasket, basket);
      }
      if (!StoreMixinPage.areEqualBaskets(basketServer, basket)) {
        /*
        let ajaxData = {}
        ajaxData[keyBasket] = basket;
        // console.log("hookupLocalStorageStore\nhashStoreBasketLoad: " + hashStoreBasketLoad + "\n");
        // ajaxData[keyIsIncludedVAT] = LocalStorage.getLocalStorage(keyIsIncludedVAT);
        console.log('ajax:' + ajaxData);
        ajaxJSONData(keyBasket, mapHashToController(hashStoreBasketLoad), ajaxData, loadBasket, false);
        */
        API.saveStoreBasket(basket);
      }
      userBasket = basket;
    }
  }, {
    key: "hookupBasket",
    value: function hookupBasket() {
      // const containerBasket = document.querySelectorAll(idContainerBasket);
      this.toggleShowButtonCheckout(); // containerBasket
      this.hookupButtonCheckout();
      this.hookupBasketItemPlusAndMinusButtons();
      this.hookupBasketAddInputs();
      this.hookupBasketEditInputs();
      this.hookupDeleteBasketItemButtons();
    }
  }, {
    key: "toggleShowButtonCheckout",
    value: function toggleShowButtonCheckout() {
      if (_verbose) {
        console.log("toggling checkout button");
      }
      var buttonCheckout = document.querySelectorAll(idButtonCheckout);
      var labelBasketEmpty = document.querySelectorAll(idLabelBasketEmpty);
      if (userBasket['items'].length == 0) {
        buttonCheckout.style.display = "none";
        labelBasketEmpty.style.display = "";
      } else {
        buttonCheckout.style.display = "";
        labelBasketEmpty.style.display = "none";
      }
    }
  }, {
    key: "hookupButtonCheckout",
    value: function hookupButtonCheckout() {
      if (_verbose) {
        console.log("hooking up checkout button");
      }
      var buttonCheckout = document.querySelectorAll(idButtonCheckout);
      // let lsPage = getPageLocalStorage(hashPageCurrent);
      Events.initialiseEventHandler(buttonCheckout, flagInitialised, function () {
        buttonCheckout.addEventListener("click", function () {
          /*
          //setupPageLocalStorageNext(hashPageStoreBasket);
          let basket = LocalStorage.getLocalStorage(keyBasket);
          // goToPage(hashPageStoreBasket);
          let ajaxData = {};
          ajaxData[keyBasket] = basket;
           ajaxJSONData('checkout', mapHashToController(hashPageStoreBasket), ajaxData, null, false);
          */
          this.router.navigateToHash(hashPageStoreBasket);
        });
      });
    }
  }, {
    key: "hookupBasketItemPlusAndMinusButtons",
    value: function hookupBasketItemPlusAndMinusButtons() {
      var minVal = 1;
      var basket = document.querySelector(idFormBasket);
      // Basket Add
      // Increment
      basket.querySelectorAll('div.btn-increment[' + attrFormType + '=' + typeFormBasketAdd + ']').each(function () {
        var elButton = this;
        Events.initialiseEventHandler(elButton, flagInitialised, function () {
          elButton.addEventListener("click", function (event) {
            event.preventDefault();
            event.stopPropagation();
            var elInput = document.querySelectorAll(getFormProductSelector(typeFormBasketAdd, elButton)).querySelector('input[type="number"]');
            // console.log('input selector ='); console.log('form[' + attrFormType + '=' + elButton.getAttribute(attrFormType) + '][' + attrIdProduct + '=' + elButton.getAttribute(attrIdProduct) + ']');
            var newVal = parseInt(DOM.getElementValueCurrent(elInput));
            if (isNaN(newVal)) newVal = minVal;
            newVal += 1;
            elInput.val(newVal);
          });
        });
      });
      // Decrement
      basket.querySelectorAll('div.btn-decrement[' + attrFormType + '=' + typeFormBasketAdd + ']').each(function () {
        var elButton = this;
        Events.initialiseEventHandler(elButton, flagInitialised, function () {
          elButton.addEventListener("click", function (event) {
            event.preventDefault();
            event.stopPropagation();
            // let product = document.querySelectorAll('.card.subcard[' + attrIdProduct +'=' + elButton.getAttribute(attrIdProduct) + ']');
            var elInput = document.querySelectorAll(getFormProductSelector(typeFormBasketAdd, elButton)).querySelector('input[type="number"]');
            var newVal = parseInt(DOM.getElementValueCurrent(elInput));
            if (isNaN(newVal)) newVal = minVal;
            newVal = Math.max(minVal, newVal - 1);
            elInput.val(newVal);
          });
        });
      });

      // Basket Edit
      // Increment
      basket.querySelectorAll('div.btn-increment[' + attrFormType + '=' + typeFormBasketEdit + ']').each(function () {
        var elButton = this;
        Events.initialiseEventHandler(elButton, flagInitialised, function () {
          elButton.addEventListener("click", function (event) {
            event.stopPropagation();
            // basketItem = document.querySelectorAll('.card.subcard[' + attrIdProduct +'=' + elButton.getAttribute(attrIdProduct) + ']');
            var elInput = document.querySelectorAll(getFormProductSelector(typeFormBasketEdit, elButton)).querySelector('input[type="number"]');
            // console.log('input selector ='); console.log('form[' + attrFormType + '=' + elButton.getAttribute(attrFormType) + '][' + attrIdProduct + '=' + elButton.getAttribute(attrIdProduct) + ']');
            var newVal = parseInt(DOM.getElementValueCurrent(elInput));
            if (isNaN(newVal)) newVal = minVal;
            newVal += 1;
            elInput.val(newVal);
            elInput.trigger("change");
          });
        });
      });
      // Decrement
      basket.querySelectorAll('div.btn-decrement[' + attrFormType + '=' + typeFormBasketEdit + ']').each(function () {
        var elButton = this;
        Events.initialiseEventHandler(elButton, flagInitialised, function () {
          elButton.addEventListener("click", function (event) {
            event.stopPropagation();
            var elInput = document.querySelectorAll(getFormProductSelector(typeFormBasketEdit, elButton)).querySelector('input[type="number"]');
            var newVal = parseInt(DOM.getElementValueCurrent(elInput));
            if (isNaN(newVal)) newVal = minVal;
            newVal = Math.max(minVal, newVal - 1);
            elInput.val(newVal);
            elInput.trigger("change");
          });
        });
      });
    }
  }, {
    key: "hookupBasketAddForms",
    value: function hookupBasketAddForms() {
      var basketAddFormSelector = 'form[' + attrFormType + '=' + typeFormBasketAdd + ']';
      Events.initialiseEventHandler(basketAddFormSelector, flagInitialised, function (basketAddForm) {
        var quantityInput = basketAddForm.querySelector('input[type="number"]');
        quantityInput.addEventListener("change", function (event) {
          var newVal = parseInt(quantityInput.value);
          if (isNaN(newVal) || newVal < 0) {
            quantityInput.value = 0;
          }
        });
        var buttonSubmit = basketAddForm.querySelector('button'); // [type="submit"]
        buttonSubmit.addEventListener("click", function (event) {
          event.preventDefault();
          event.stopPropagation();
          var newBasketItem = {};
          newBasketItem[keyIdProductPermutation] = basketAddForm.getAttribute(attrIdPermutation);
          newBasketItem[keyQuantity] = quantityInput.value;
          API.storeAddToBasket(newBasketItem);
        });
      });
    }
  }, {
    key: "hookupBasketEditForms",
    value: function hookupBasketEditForms() {
      var basketEditFormSelector = 'form[' + attrFormType + '=' + typeFormBasketEdit + ']';
      Events.initialiseEventHandler(basketEditFormSelector, flagInitialised, function (basketEditForm) {
        var quantityInput = basketEditForm.querySelector('input[type="number"]');
        quantityInput.addEventListener("change", function (event) {
          var newVal = parseInt(quantityInput.value);
          if (isNaN(newVal) || newVal < 0) {
            quantityInput.value = 0;
          }
          if (quantityInput.value != basketEditForm.getAttribute(attrQuantity)) {
            var newBasketItem = {};
            newBasketItem[keyIdProductPermutation] = basketEditForm.getAttribute(attrIdPermutation);
            newBasketItem[keyQuantity] = quantityInput.value;
            API.storeSaveBasket(newBasketItem);
          }
        });
        var deleteButton = basketEditForm.querySelector('button'); // [type="button"]
        deleteButton.addEventListener("click", function (event) {
          event.preventDefault();
          event.stopPropagation();
          API.storeDeleteBasketItem(basketEditForm.getAttribute(attrIdPermutation));
        });
      });
    }
  }, {
    key: "loadBasket",
    value: function loadBasket(response) {
      userBasket = response.data[keyBasket];
      var basketForm = document.querySelectorAll(idFormBasket);
      /*
      basketForm.replaceChildren();
      let items = userBasket[keyItems];
      let basketItem;
      items.forEach(item => {
          basketItem = document.createElement('div');
          basketForm.appendChild(basketItem);
      });
      */
      var htmlBlock = response.data[keyHtmlBlock];
      basketForm.innerHTML = htmlBlock;
      this.hookupBasket();
    }
  }, {
    key: "getCurrencySelected",
    value: function getCurrencySelected() {
      var elementSelectorCurrency = document.querySelectorAll(idSelectorCurrency);
      var selectedCurrency = elementSelectorCurrency.val();
      if (_verbose) {
        console.log("selected currency: ", selectedCurrency);
      }
      return selectedCurrency;
    }
  }, {
    key: "hookupStoreCardsProduct",
    value: function hookupStoreCardsProduct() {
      var d; // , lsShared;
      var selectorCardProduct = '.card.subcard';
      Events.initialiseEventHandler(selectorCardProduct, flagInitialised, function (cardProduct) {
        if (_verbose) {
          console.log("initialising product card: ", cardProduct);
        }
        cardProduct.addEventListener("click", function (event) {
          // d = { keyIdProduct: product.getAttribute(attrIdProduct) }
          var elemClicked = event.target;
          if (elemClicked.id != 'submit') {
            // disable for submit buttons
            if (_verbose) {
              console.log("product click: " + cardProduct.getAttribute(attrIdProduct));
              console.log("permutation click: " + cardProduct.getAttribute(attrIdPermutation));
            }
            var d = {};
            d[keyIdProduct] = cardProduct.getAttribute(attrIdProduct);
            d[keyIdPermutation] = cardProduct.getAttribute(attrIdPermutation);
            // send quantity requested
            goToPage(hashPageStoreProduct, d);
          }
        });
        if (_verbose) {
          console.log("click method added for product ID: " + cardProduct.getAttribute(attrIdProduct) + ', permutation ID: ', cardProduct.getAttribute(attrIdPermutation));
        }
      });
    }
  }, {
    key: "leave",
    value: function leave() {}

    /*
    getFormProductSelector(typeForm, elementInForm) {
        idPermutation = elementInForm.getAttribute(attrIdPermutation);
        console.log('idPermutation: ', idPermutation);
        hasPermutation = !Validation.isEmpty(idPermutation);
        console.log('has permutation: ', hasPermutation);
        selectorIdPermutation = hasPermutation ? '[' + attrIdPermutation + '=' + idPermutation + ']' : '';
        return 'form[' + attrFormType + '="' + typeForm + '"][' + attrIdProduct + '=' + elementInForm.getAttribute(attrIdProduct) + ']' + selectorIdPermutation;
    }
        
    addMetadataBasketToJSON(jsonData) {
        jsonData[keyIdCurrency] = LocalStorage.getLocalStorage(keyIdCurrency);
        jsonData[keyIdRegionDelivery] = LocalStorage.getLocalStorage(keyIdRegionDelivery);
        jsonData[keyIsIncludedVAT] = LocalStorage.getLocalStorage(keyIsIncludedVAT);
        return jsonData;
    }
    */

    /*
    loadFiltersFromLocalStorage(pageHash, parameters_dict) {
        
        let lsOld = getPageLocalStorage(pageHashCurrent);
        pageHashCurrent = pageHash;
        clearPageLocalStorage(pageHashCurrent);
        setupPageLocalStorage(pageHashCurrent);
        let lsNew = getPageLocalStorage(pageHashCurrent);
        lsNew[keyBasket] = (keyBasket in lsOld) ? lsOld[keyBasket] : {'items': []};
        setPageLocalStorage(pageHashCurrent, lsNew);
        
        goToPage(pageHash, parameters_dict);
    }
    */
  }], [{
    key: "validateBasket",
    value: function validateBasket(basket) {
      return validation_Validation.isEmpty(basket) && validation_Validation.dictHasKey(basket, keyItems) && validation_Validation.dictHasKey(basket, keyIsIncludedVAT) && validation_Validation.dictHasKey(basket, keyIdCurrency) && validation_Validation.dictHasKey(basket, keyIdRegionDelivery);
    }
  }, {
    key: "makeNewBasket",
    value: function makeNewBasket() {
      return mixin_defineProperty(mixin_defineProperty(mixin_defineProperty(mixin_defineProperty({}, keyItems, []), keyIsIncludedVAT, true), keyIdCurrency, 1), keyIdRegionDelivery, 1);
    }
  }, {
    key: "areEqualBaskets",
    value: function areEqualBaskets(basket1, basket2) {
      return JSON.stringify(basket1) === JSON.stringify(basket2);
    }
  }, {
    key: "mergeBaskets",
    value: function mergeBaskets(basketPrimary, basketSecondary) {
      var basket = mixin_objectSpread(mixin_objectSpread({}, basketSecondary), basketPrimary);
      var items = {};
      var _iterator = mixin_createForOfIteratorHelper(basketSecondary[keyItems]),
        _step;
      try {
        for (_iterator.s(); !(_step = _iterator.n()).done;) {
          var item = _step.value;
          items[item[keyIdPermutation]] = item.Quantity;
        }
      } catch (err) {
        _iterator.e(err);
      } finally {
        _iterator.f();
      }
      var _iterator2 = mixin_createForOfIteratorHelper(basketPrimary[keyItems]),
        _step2;
      try {
        for (_iterator2.s(); !(_step2 = _iterator2.n()).done;) {
          var _item = _step2.value;
          items[_item[keyIdPermutation]] = items[_item[keyIdPermutation]] ? items[_item[keyIdPermutation]] + _item.Quantity : _item.Quantity;
        }
      } catch (err) {
        _iterator2.e(err);
      } finally {
        _iterator2.f();
      }
      basket[keyItems] = Object.values(items);
      return basket;
    }
  }]);
}();

;// CONCATENATED MODULE: ./static/js/pages/store/mixin_table.js
function mixin_table_typeof(o) { "@babel/helpers - typeof"; return mixin_table_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, mixin_table_typeof(o); }
function mixin_table_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function mixin_table_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, mixin_table_toPropertyKey(o.key), o); } }
function mixin_table_createClass(e, r, t) { return r && mixin_table_defineProperties(e.prototype, r), t && mixin_table_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function mixin_table_toPropertyKey(t) { var i = mixin_table_toPrimitive(t, "string"); return "symbol" == mixin_table_typeof(i) ? i : i + ""; }
function mixin_table_toPrimitive(t, r) { if ("object" != mixin_table_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != mixin_table_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }
function mixin_table_callSuper(t, o, e) { return o = mixin_table_getPrototypeOf(o), mixin_table_possibleConstructorReturn(t, mixin_table_isNativeReflectConstruct() ? Reflect.construct(o, e || [], mixin_table_getPrototypeOf(t).constructor) : o.apply(t, e)); }
function mixin_table_possibleConstructorReturn(t, e) { if (e && ("object" == mixin_table_typeof(e) || "function" == typeof e)) return e; if (void 0 !== e) throw new TypeError("Derived constructors may only return object or undefined"); return mixin_table_assertThisInitialized(t); }
function mixin_table_assertThisInitialized(e) { if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); return e; }
function mixin_table_isNativeReflectConstruct() { try { var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); } catch (t) {} return (mixin_table_isNativeReflectConstruct = function _isNativeReflectConstruct() { return !!t; })(); }
function mixin_table_superPropGet(t, e, o, r) { var p = mixin_table_get(mixin_table_getPrototypeOf(1 & r ? t.prototype : t), e, o); return 2 & r && "function" == typeof p ? function (t) { return p.apply(o, t); } : p; }
function mixin_table_get() { return mixin_table_get = "undefined" != typeof Reflect && Reflect.get ? Reflect.get.bind() : function (e, t, r) { var p = mixin_table_superPropBase(e, t); if (p) { var n = Object.getOwnPropertyDescriptor(p, t); return n.get ? n.get.call(arguments.length < 3 ? e : r) : n.value; } }, mixin_table_get.apply(null, arguments); }
function mixin_table_superPropBase(t, o) { for (; !{}.hasOwnProperty.call(t, o) && null !== (t = mixin_table_getPrototypeOf(t));); return t; }
function mixin_table_getPrototypeOf(t) { return mixin_table_getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function (t) { return t.__proto__ || Object.getPrototypeOf(t); }, mixin_table_getPrototypeOf(t); }
function mixin_table_inherits(t, e) { if ("function" != typeof e && null !== e) throw new TypeError("Super expression must either be null or a function"); t.prototype = Object.create(e && e.prototype, { constructor: { value: t, writable: !0, configurable: !0 } }), Object.defineProperty(t, "prototype", { writable: !1 }), e && mixin_table_setPrototypeOf(t, e); }
function mixin_table_setPrototypeOf(t, e) { return mixin_table_setPrototypeOf = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function (t, e) { return t.__proto__ = e, t; }, mixin_table_setPrototypeOf(t, e); }



// import BasePage from "../base.js";



var StoreTableMixinPage = /*#__PURE__*/function (_StoreMixinPage) {
  function StoreTableMixinPage(pageCurrent) {
    mixin_table_classCallCheck(this, StoreTableMixinPage);
    return mixin_table_callSuper(this, StoreTableMixinPage, [pageCurrent]);
  }
  mixin_table_inherits(StoreTableMixinPage, _StoreMixinPage);
  return mixin_table_createClass(StoreTableMixinPage, [{
    key: "initialize",
    value: function initialize() {
      mixin_table_superPropGet(StoreTableMixinPage, "initialize", this, 3)([]);
      this.hookupFilters();
      this.hookupTable();
    }
  }, {
    key: "hookupFilters",
    value: function hookupFilters() {
      // Implement filter-specific functionality here
    }
  }, {
    key: "hookupTable",
    value: function hookupTable() {
      // Implement table-specific functionality here
    }
  }]);
}(StoreMixinPage);

;// CONCATENATED MODULE: ./static/js/pages/store/manufacturing_purchase_orders.js
function manufacturing_purchase_orders_typeof(o) { "@babel/helpers - typeof"; return manufacturing_purchase_orders_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, manufacturing_purchase_orders_typeof(o); }
function manufacturing_purchase_orders_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function manufacturing_purchase_orders_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, manufacturing_purchase_orders_toPropertyKey(o.key), o); } }
function manufacturing_purchase_orders_createClass(e, r, t) { return r && manufacturing_purchase_orders_defineProperties(e.prototype, r), t && manufacturing_purchase_orders_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function manufacturing_purchase_orders_callSuper(t, o, e) { return o = manufacturing_purchase_orders_getPrototypeOf(o), manufacturing_purchase_orders_possibleConstructorReturn(t, manufacturing_purchase_orders_isNativeReflectConstruct() ? Reflect.construct(o, e || [], manufacturing_purchase_orders_getPrototypeOf(t).constructor) : o.apply(t, e)); }
function manufacturing_purchase_orders_possibleConstructorReturn(t, e) { if (e && ("object" == manufacturing_purchase_orders_typeof(e) || "function" == typeof e)) return e; if (void 0 !== e) throw new TypeError("Derived constructors may only return object or undefined"); return manufacturing_purchase_orders_assertThisInitialized(t); }
function manufacturing_purchase_orders_assertThisInitialized(e) { if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); return e; }
function manufacturing_purchase_orders_isNativeReflectConstruct() { try { var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); } catch (t) {} return (manufacturing_purchase_orders_isNativeReflectConstruct = function _isNativeReflectConstruct() { return !!t; })(); }
function manufacturing_purchase_orders_superPropGet(t, e, o, r) { var p = manufacturing_purchase_orders_get(manufacturing_purchase_orders_getPrototypeOf(1 & r ? t.prototype : t), e, o); return 2 & r && "function" == typeof p ? function (t) { return p.apply(o, t); } : p; }
function manufacturing_purchase_orders_get() { return manufacturing_purchase_orders_get = "undefined" != typeof Reflect && Reflect.get ? Reflect.get.bind() : function (e, t, r) { var p = manufacturing_purchase_orders_superPropBase(e, t); if (p) { var n = Object.getOwnPropertyDescriptor(p, t); return n.get ? n.get.call(arguments.length < 3 ? e : r) : n.value; } }, manufacturing_purchase_orders_get.apply(null, arguments); }
function manufacturing_purchase_orders_superPropBase(t, o) { for (; !{}.hasOwnProperty.call(t, o) && null !== (t = manufacturing_purchase_orders_getPrototypeOf(t));); return t; }
function manufacturing_purchase_orders_getPrototypeOf(t) { return manufacturing_purchase_orders_getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function (t) { return t.__proto__ || Object.getPrototypeOf(t); }, manufacturing_purchase_orders_getPrototypeOf(t); }
function manufacturing_purchase_orders_inherits(t, e) { if ("function" != typeof e && null !== e) throw new TypeError("Super expression must either be null or a function"); t.prototype = Object.create(e && e.prototype, { constructor: { value: t, writable: !0, configurable: !0 } }), Object.defineProperty(t, "prototype", { writable: !1 }), e && manufacturing_purchase_orders_setPrototypeOf(t, e); }
function manufacturing_purchase_orders_setPrototypeOf(t, e) { return manufacturing_purchase_orders_setPrototypeOf = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function (t, e) { return t.__proto__ = e, t; }, manufacturing_purchase_orders_setPrototypeOf(t, e); }
function manufacturing_purchase_orders_defineProperty(e, r, t) { return (r = manufacturing_purchase_orders_toPropertyKey(r)) in e ? Object.defineProperty(e, r, { value: t, enumerable: !0, configurable: !0, writable: !0 }) : e[r] = t, e; }
function manufacturing_purchase_orders_toPropertyKey(t) { var i = manufacturing_purchase_orders_toPrimitive(t, "string"); return "symbol" == manufacturing_purchase_orders_typeof(i) ? i : i + ""; }
function manufacturing_purchase_orders_toPrimitive(t, r) { if ("object" != manufacturing_purchase_orders_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != manufacturing_purchase_orders_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }









var PageStoreManufacturingPurchaseOrders = /*#__PURE__*/function (_TableBasePage) {
  function PageStoreManufacturingPurchaseOrders(router) {
    var _this;
    manufacturing_purchase_orders_classCallCheck(this, PageStoreManufacturingPurchaseOrders);
    _this = manufacturing_purchase_orders_callSuper(this, PageStoreManufacturingPurchaseOrders, [router]);
    manufacturing_purchase_orders_defineProperty(_this, "callSaveTableContent", api_API.saveManufacturingPurchaseOrders);
    _this.storeMixin = new StoreTableMixinPage(_this);
    return _this;
  }
  manufacturing_purchase_orders_inherits(PageStoreManufacturingPurchaseOrders, _TableBasePage);
  return manufacturing_purchase_orders_createClass(PageStoreManufacturingPurchaseOrders, [{
    key: "initialize",
    value: function initialize() {
      this.sharedInitialize();
    }
  }, {
    key: "hookupFilters",
    value: function hookupFilters() {
      this.sharedHookupFilters();
      this.hookupFilterActive();
    }
  }, {
    key: "loadRowTable",
    value: function loadRowTable(rowJson) {}
  }, {
    key: "getJsonRow",
    value: function getJsonRow(row) {
      var _this2 = this;
      if (row == null) return;
      var tdCurrency = row.querySelector('td.' + flagCurrency);
      var inputCostTotalLocalVatExcl = row.querySelector('td.' + flagCostTotalLocalVatExcl + ' input');
      var inputCostTotalLocalVatIncl = row.querySelector('td.' + flagCostTotalLocalVatIncl + ' input');
      var inputPriceTotalLocalVatExcl = row.querySelector('td.' + flagPriceTotalLocalVatExcl + ' input');
      var inputPriceTotalLocalVatIncl = row.querySelector('td.' + flagPriceTotalLocalVatIncl + ' input');
      var trsPurchaseOrderItem = row.querySelectorAll('tr.' + flagOrderItems);
      var buttonActive = row.querySelector(':scope > td.' + flagActive + ' button');
      var jsonRow = {};
      jsonRow[attrIdManufacturingPurchaseOrder] = row.getAttribute(attrIdManufacturingPurchaseOrder);
      jsonRow[attrIdCurrency] = DOM.getElementAttributeValueCurrent(tdCurrency);
      jsonRow[flagCostTotalLocalVatExcl] = DOM.getElementAttributeValueCurrent(inputCostTotalLocalVatExcl);
      jsonRow[flagCostTotalLocalVatIncl] = DOM.getElementAttributeValueCurrent(inputCostTotalLocalVatIncl);
      jsonRow[flagPriceTotalLocalVatExcl] = DOM.getElementAttributeValueCurrent(inputPriceTotalLocalVatExcl);
      jsonRow[flagPriceTotalLocalVatIncl] = DOM.getElementAttributeValueCurrent(inputPriceTotalLocalVatIncl);
      var orderItems = [];
      if (trsPurchaseOrderItem != null) {
        trsPurchaseOrderItem.forEach(function (tr) {
          orderItems.push(_this2.getJsonRowOrderItem(tr));
        });
      }
      jsonRow[flagOrderItems] = orderItems;
      jsonRow[flagActive] = buttonActive.classList.contains(flagDelete);
      return jsonRow;
    }
  }, {
    key: "getJsonRowOrderItem",
    value: function getJsonRowOrderItem(tr) {
      var inputDisplayOrder = tr.querySelector('td.' + flagDisplayOrder + ' input');
      var tdCategory = tr.querySelector('td.' + flagProductCategory);
      var tdProduct = tr.querySelector('td.' + flagProduct);
      var tdVariations = tr.querySelector('td.' + flagProductVariations);
      var tdUnitQuantity = tr.querySelector('td.' + flagUnitMeasurementQuantity);
      var inputQuantityUsed = tr.querySelector('td.' + flagQuantityUsed + ' input');
      var inputQuantityProduced = tr.querySelector('td.' + flagQuantityProduced + ' input');
      var tdUnitMeasurementLatencyManufacture = tr.querySelector('td.' + flagUnitMeasurementLatencyManufacture);
      var inputLatencyManufacture = tr.querySelector('td.' + flagLatencyManufacture + ' input');
      var buttonActive = tr.querySelector(':scope > td.' + flagActive + ' button');
      var jsonRow = {};
      jsonRow[attrIdManufacturingPurchaseOrder] = tr.getAttribute(attrIdManufacturingPurchaseOrder);
      jsonRow[attrIdManufacturingPurchaseOrderProductLink] = tr.getAttribute(attrIdManufacturingPurchaseOrderProductLink);
      jsonRow[flagDisplayOrder] = DOM.getElementAttributeValueCurrent(inputDisplayOrder);
      jsonRow[attrIdProductCategory] = DOM.getElementAttributeValueCurrent(tdCategory);
      jsonRow[attrIdProduct] = DOM.getElementAttributeValueCurrent(tdProduct);
      jsonRow[flagProductVariations] = DOM.getElementAttributeValueCurrent(tdVariations);
      jsonRow[attrIdUnitMeasurementQuantity] = DOM.getElementAttributeValueCurrent(tdUnitQuantity);
      jsonRow[flagQuantityUsed] = DOM.getElementAttributeValueCurrent(inputQuantityUsed);
      jsonRow[flagQuantityProduced] = DOM.getElementAttributeValueCurrent(inputQuantityProduced);
      jsonRow[attrIdUnitMeasurementLatencyManufacture] = DOM.getElementAttributeValueCurrent(tdUnitMeasurementLatencyManufacture);
      jsonRow[flagLatencyManufacture] = DOM.getElementAttributeValueCurrent(inputLatencyManufacture);
      jsonRow[flagActive] = buttonActive.classList.contains(flagDelete);
      return jsonRow;
    }
  }, {
    key: "initialiseRowNew",
    value: function initialiseRowNew(tbody, row) {
      manufacturing_purchase_orders_superPropGet(PageStoreManufacturingPurchaseOrders, "initialiseRowNew", this, 3)([tbody, row]);
    }
  }, {
    key: "hookupTableMain",
    value: function hookupTableMain() {
      manufacturing_purchase_orders_superPropGet(PageStoreManufacturingPurchaseOrders, "hookupTableMain", this, 3)([]);
      this.hookupCurrencyFields();
      this.hookupCostAndPriceInputs();
      this.hookupOrderItemsFields();
      this.hookupFieldsActive();
    }
  }, {
    key: "hookupCostAndPriceInputs",
    value: function hookupCostAndPriceInputs() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagCostTotalLocalVatExcl + ' input');
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagCostTotalLocalVatIncl + ' input');
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagPriceTotalLocalVatExcl + ' input');
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagPriceTotalLocalVatIncl + ' input');
    }
  }, {
    key: "hookupOrderItemsFields",
    value: function hookupOrderItemsFields() {
      this.hookupOrderItemsPreviews();
      this.hookupFieldsOrderItemDisplayOrder();
      this.hookupFieldsOrderItemProductCategory();
      this.hookupFieldsOrderItemProduct();
      this.hookupFieldsOrderItemProductVariations();
      this.hookupFieldsOrderItemUnitQuantity();
      this.hookupFieldsOrderItemQuantityUsed();
      this.hookupFieldsOrderItemQuantityProduced();
      this.hookupFieldsOrderItemUnitMeasurementLatencyManufacture();
      this.hookupFieldsOrderItemLatencyManufacture();
      this.hookupFieldsOrderItemActive();
      this.hookupFieldsOrderItemAddDelete();
      this.hookupButtonsOrderItemAdd();
    }
  }, {
    key: "hookupOrderItemsPreviews",
    value: function hookupOrderItemsPreviews() {
      var _this3 = this;
      this.hookupEventHandler("click", idTableMain + ' td.' + flagOrderItems, function (event, td) {
        if (!td.classList.contains(flagCollapsed)) return;
        _this3.handleClickOrderItemsPreview(event, td);
      });
    }
  }, {
    key: "handleClickOrderItemsPreview",
    value: function handleClickOrderItemsPreview(event, element) {
      var _this4 = this;
      if (_verbose) {
        console.log("click order items preview");
      }
      this.toggleColumnHeaderCollapsed(flagOrderItems, false);
      element.classList.remove(flagCollapsed);
      var row = DOM.getRowFromElement(element);
      var idManufacturingPurchaseOrder = row.getAttribute(attrIdManufacturingPurchaseOrder);
      var manufacturingPurchaseOrder = idManufacturingPurchaseOrder > 0 ? manufacturingPurchaseOrders[idManufacturingPurchaseOrder] : manufacturing_purchase_orders_defineProperty({}, flagOrderItems, []);
      var tblOrderItems = document.createElement("table");
      tblOrderItems.classList.add(flagOrderItems);
      var thead = document.createElement("thead");
      var tr = document.createElement("tr");
      var thDisplayOrder = document.createElement("th");
      thDisplayOrder.classList.add(flagDisplayOrder);
      thDisplayOrder.textContent = 'Display Order';
      var thCategory = document.createElement("th");
      thCategory.classList.add(flagProductCategory);
      thCategory.textContent = 'Category';
      var thProduct = document.createElement("th");
      thProduct.classList.add(flagProduct);
      thProduct.textContent = 'Product';
      var thVariations = document.createElement("th");
      thVariations.classList.add(flagProductVariations);
      thVariations.classList.add(flagCollapsed);
      thVariations.textContent = 'Variations';
      var thUnitQuantity = document.createElement("th");
      thUnitQuantity.classList.add(flagUnitMeasurementQuantity);
      thUnitQuantity.textContent = 'Unit Quantity';
      var thQuantityUsed = document.createElement("th");
      thQuantityUsed.classList.add(flagQuantityUsed);
      thQuantityUsed.textContent = 'Quantity Used';
      var thQuantityProduced = document.createElement("th");
      thQuantityProduced.classList.add(flagQuantityProduced);
      thQuantityProduced.textContent = 'Quantity Produced';
      /*
      let thCostTotalLocalVatExcl = document.createElement("th");
      thCostTotalLocalVatExcl.classList.add(flagCostTotalLocalVatExcl);
      thCostTotalLocalVatExcl.textContent = 'Cost Total Local VAT Excl';
      let thCostTotalLocalVatIncl = document.createElement("th");
      thCostTotalLocalVatIncl.classList.add(flagCostTotalLocalVatIncl);
      thCostTotalLocalVatIncl.textContent = 'Cost Total Local VAT Incl';
      let thCostUnitLocalVatExcl = document.createElement("th");
      thCostUnitLocalVatExcl.classList.add(flagCostUnitLocalVatExcl);
      thCostUnitLocalVatExcl.textContent = 'Cost Unit Local VAT Excl';
      let thCostUnitLocalVatIncl = document.createElement("th");
      thCostUnitLocalVatIncl.classList.add(flagCostUnitLocalVatIncl);
      thCostUnitLocalVatIncl.textContent = 'Cost Unit Local VAT Incl';
      */
      var thUnitMeasurementLatencyManufacture = document.createElement("th");
      thUnitMeasurementLatencyManufacture.classList.add(flagUnitMeasurementLatencyManufacture);
      thUnitMeasurementLatencyManufacture.textContent = 'Unit Measurement Latency Manufacture';
      var thLatencyManufacture = document.createElement("th");
      thLatencyManufacture.classList.add(flagLatencyManufacture);
      thLatencyManufacture.textContent = 'Latency Manufacture';
      var thActive = document.createElement("th");
      thActive.classList.add(flagActive);
      thActive.textContent = 'Active';
      var thAddDelete = document.createElement("th");
      thAddDelete.classList.add(flagAdd);
      var buttonAdd = document.createElement("button");
      buttonAdd.classList.add(flagAdd);
      buttonAdd.textContent = '+';
      thAddDelete.appendChild(buttonAdd);
      tr.appendChild(thDisplayOrder);
      tr.appendChild(thCategory);
      tr.appendChild(thProduct);
      tr.appendChild(thVariations);
      tr.appendChild(thUnitQuantity);
      tr.appendChild(thQuantityUsed);
      tr.appendChild(thQuantityProduced);
      /*
      tr.appendChild(thCostTotalLocalVatExcl);
      tr.appendChild(thCostTotalLocalVatIncl);
      tr.appendChild(thCostUnitLocalVatExcl);
      tr.appendChild(thCostUnitLocalVatIncl);
      */
      tr.appendChild(thUnitMeasurementLatencyManufacture);
      tr.appendChild(thLatencyManufacture);
      tr.appendChild(thActive);
      tr.appendChild(thAddDelete);
      thead.appendChild(tr);
      tblOrderItems.appendChild(thead);
      var tbody = document.createElement("tbody");
      manufacturingPurchaseOrder[flagOrderItems].forEach(function (orderItem, index) {
        _this4.addRowManufacturingPurchaseOrderItem(tbody, orderItem);
      });
      tblOrderItems.appendChild(tbody);
      var cell = DOM.getCellFromElement(element);
      var cellNew = cell.cloneNode(false);
      cellNew.appendChild(tblOrderItems);
      row.replaceChild(cellNew, cell);
      if (_verbose) {
        console.log("tblOrderItems: ", tblOrderItems);
      }
      this.hookupOrderItemsFields();
    }
  }, {
    key: "addRowManufacturingPurchaseOrderItem",
    value: function addRowManufacturingPurchaseOrderItem(tbody, orderItem) {
      //  productVariationTypeOptions, productVariationOptions, productCategoryOptions, productOptions, unitMeasurementOptions, 
      if (_verbose) {
        console.log("addRowManufacturingPurchaseOrderItem: ", orderItem);
      }
      var tdDisplayOrder = document.createElement("td");
      tdDisplayOrder.classList.add(flagDisplayOrder);
      var inputDisplayOrder = document.createElement("input");
      inputDisplayOrder.classList.add(flagDisplayOrder);
      inputDisplayOrder.type = 'number';
      inputDisplayOrder.step = 1;
      DOM.setElementValuesCurrentAndPrevious(inputDisplayOrder, orderItem[flagDisplayOrder]);
      tdDisplayOrder.appendChild(inputDisplayOrder);
      var tdCategory = document.createElement("td");
      tdCategory.classList.add(flagProductCategory);
      DOM.setElementAttributesValuesCurrentAndPrevious(tdCategory, orderItem[attrIdProductCategory]);
      var divCategory = document.createElement("div");
      divCategory.classList.add(flagProductCategory);
      // DOM.setElementAttributesValuesCurrentAndPrevious(divCategory, orderItem[attrIdProductCategory]);
      var productCategory = productCategories[orderItem[attrIdProductCategory]];
      divCategory.textContent = BusinessObjects.getObjectText(productCategory);
      tdCategory.appendChild(divCategory);
      var tdProduct = document.createElement("td");
      tdProduct.classList.add(flagProduct);
      DOM.setElementAttributesValuesCurrentAndPrevious(tdProduct, orderItem[attrIdProductCategory]);
      var divProduct = document.createElement("div");
      divProduct.classList.add(flagProduct);
      // DOM.setElementAttributesValuesCurrentAndPrevious(divProduct, orderItem[attrIdProduct]);
      var product = products[orderItem[attrIdProduct]];
      divProduct.textContent = BusinessObjects.getObjectText(product);
      tdProduct.appendChild(divProduct);
      var tdVariations = document.createElement("td");
      tdVariations.classList.add(flagProductVariations);
      tdVariations.classList.add(flagCollapsed);
      DOM.setElementAttributesValuesCurrentAndPrevious(tdVariations, orderItem[attrIdProductCategory]);
      var divVariations = document.createElement("div");
      divVariations.classList.add(flagProductVariations);
      // DOM.setElementAttributesValuesCurrentAndPrevious(divVariations, orderItem[attrIdProductVariation]);
      var variationsText = ProductPermutation.getProductVariationsPreviewFromIdCsv(orderItem[flagProductVariations]);
      divVariations.textContent = variationsText;
      tdVariations.appendChild(divVariations);
      var tdUnitQuantity = document.createElement("td");
      tdUnitQuantity.classList.add(flagUnitMeasurementQuantity);
      DOM.setElementAttributesValuesCurrentAndPrevious(tdUnitQuantity, orderItem[attrIdProductCategory]);
      var divUnitQuantity = document.createElement("div");
      divUnitQuantity.classList.add(flagUnitMeasurementQuantity);
      // DOM.setElementValuesCurrentAndPrevious(divUnitQuantity, orderItem[flagUnitMeasurementQuantity]);
      var unitQuantity = unitMeasurements[orderItem[attrIdUnitMeasurementQuantity]];
      divUnitQuantity.textContent = BusinessObjects.getObjectText(unitQuantity);
      tdUnitQuantity.appendChild(divUnitQuantity);
      var tdQuantityUsed = document.createElement("td");
      tdQuantityUsed.classList.add(flagQuantityUsed);
      var inputQuantityUsed = document.createElement("input");
      inputQuantityUsed.classList.add(flagQuantityUsed);
      inputQuantityUsed.type = 'number';
      DOM.setElementValuesCurrentAndPrevious(inputQuantityUsed, orderItem[flagQuantityUsed]);
      tdQuantityUsed.appendChild(inputQuantityUsed);
      var tdQuantityProduced = document.createElement("td");
      tdQuantityProduced.classList.add(flagQuantityProduced);
      var inputQuantityProduced = document.createElement("input");
      inputQuantityProduced.classList.add(flagQuantityProduced);
      inputQuantityProduced.type = 'number';
      DOM.setElementValuesCurrentAndPrevious(inputQuantityProduced, orderItem[flagQuantityProduced]);
      tdQuantityProduced.appendChild(inputQuantityProduced);

      /*
      let tdCostTotalLocalVatExcl = document.createElement("td");
      tdCostTotalLocalVatExcl.classList.add(flagCostTotalLocalVatExcl);
      let inputCostTotalLocalVatExcl = document.createElement("input");
      inputCostTotalLocalVatExcl.classList.add(flagCostTotalLocalVatExcl);
      inputCostTotalLocalVatExcl.type = 'number';
      inputCostTotalLocalVatExcl.step = 0.01;
      DOM.setElementAttributesValuesCurrentAndPrevious(inputCostTotalLocalVatExcl, orderItem[flagCostTotalLocalVatExcl]);
      tdCostTotalLocalVatExcl.appendChild(inputCostTotalLocalVatExcl);
       let tdCostTotalLocalVatIncl = document.createElement("td");
      tdCostTotalLocalVatIncl.classList.add(flagCostTotalLocalVatIncl);
      let inputCostTotalLocalVatIncl = document.createElement("input");
      inputCostTotalLocalVatIncl.classList.add(flagCostTotalLocalVatIncl);
      inputCostTotalLocalVatIncl.type = 'number';
      inputCostTotalLocalVatIncl.step = 0.01;
      DOM.setElementAttributesValuesCurrentAndPrevious(inputCostTotalLocalVatIncl, orderItem[flagCostTotalLocalVatIncl]);
      tdCostTotalLocalVatIncl.appendChild(inputCostTotalLocalVatIncl);
       let tdCostUnitLocalVatExcl = document.createElement("td");
      tdCostUnitLocalVatExcl.classList.add(flagCostUnitLocalVatExcl);
      let divCostUnitLocalVatExcl = document.createElement("div");
      divCostUnitLocalVatExcl.classList.add(flagCostUnitLocalVatExcl);
      DOM.setElementValuesCurrentAndPrevious(divCostUnitLocalVatExcl, orderItem[flagCostUnitLocalVatExcl]);
      tdCostUnitLocalVatExcl.appendChild(divCostUnitLocalVatExcl);
       let tdCostUnitLocalVatIncl = document.createElement("td");
      tdCostUnitLocalVatIncl.classList.add(flagCostUnitLocalVatIncl);
      let divCostUnitLocalVatIncl = document.createElement("div");
      divCostUnitLocalVatIncl.classList.add(flagCostUnitLocalVatIncl);
      DOM.setElementValuesCurrentAndPrevious(divCostUnitLocalVatIncl, orderItem[flagCostUnitLocalVatIncl]);
      tdCostUnitLocalVatIncl.appendChild(divCostUnitLocalVatIncl);
      */

      var tdUnitMeasurementLatencyManufacture = document.createElement("td");
      tdUnitMeasurementLatencyManufacture.classList.add(flagUnitMeasurementLatencyManufacture);
      DOM.setElementAttributesValuesCurrentAndPrevious(tdUnitMeasurementLatencyManufacture, orderItem[attrIdUnitMeasurementLatencyManufacture]);
      var divUnitMeasurementLatencyManufacture = document.createElement("div");
      divUnitMeasurementLatencyManufacture.classList.add(flagUnitMeasurementLatencyManufacture);
      // DOM.setElementValuesCurrentAndPrevious(divUnitMeasurementLatencyManufacture, orderItem[flagUnitMeasurementLatencyManufacture]);
      var unitMeasurementLatencyManufacture = unitMeasurementsTime[orderItem[attrIdUnitMeasurementLatencyManufacture]];
      divUnitMeasurementLatencyManufacture.textContent = BusinessObjects.getObjectText(unitMeasurementLatencyManufacture);
      tdUnitMeasurementLatencyManufacture.appendChild(divUnitMeasurementLatencyManufacture);
      var tdLatencyManufacture = document.createElement("td");
      tdLatencyManufacture.classList.add(flagLatencyManufacture);
      var inputLatencyManufacture = document.createElement("input");
      inputLatencyManufacture.classList.add(flagLatencyManufacture);
      inputLatencyManufacture.type = 'number';
      inputLatencyManufacture.step = 1;
      DOM.setElementValuesCurrentAndPrevious(inputLatencyManufacture, orderItem[flagLatencyManufacture]);
      tdLatencyManufacture.appendChild(inputLatencyManufacture);
      var tdActive = this.createTdActive(orderItem[flagActive]);
      var tr = document.createElement("tr");
      tr.classList.add(flagOrderItems);
      tr.setAttribute(attrIdManufacturingPurchaseOrder, orderItem[attrIdManufacturingPurchaseOrder]);
      tr.setAttribute(attrIdManufacturingPurchaseOrderProductLink, orderItem[attrIdManufacturingPurchaseOrderProductLink]);
      tr.appendChild(tdDisplayOrder);
      tr.appendChild(tdCategory);
      tr.appendChild(tdProduct);
      tr.appendChild(tdVariations);
      tr.appendChild(tdUnitQuantity);
      tr.appendChild(tdQuantityUsed);
      tr.appendChild(tdQuantityProduced);
      /*
      tr.appendChild(tdCostTotalLocalVatExcl);
      tr.appendChild(tdCostTotalLocalVatIncl);
      tr.appendChild(tdCostUnitLocalVatExcl);
      tr.appendChild(tdCostUnitLocalVatIncl);
      */
      tr.appendChild(tdUnitMeasurementLatencyManufacture);
      tr.appendChild(tdLatencyManufacture);
      tr.appendChild(tdActive);
      tbody.appendChild(tr);
    }
  }, {
    key: "hookupFieldsOrderItemDisplayOrder",
    value: function hookupFieldsOrderItemDisplayOrder() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagOrderItems + ' td.' + flagDisplayOrder + ' input');
    }
  }, {
    key: "hookupFieldsOrderItemProductCategory",
    value: function hookupFieldsOrderItemProductCategory() {
      var _this5 = this;
      this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagOrderItems + ' td.' + flagProductCategory, Utils.getListFromDict(productCategories), function (cellSelector) {
        _this5.hookupProductCategoryDdls(cellSelector);
      });
    }
  }, {
    key: "hookupFieldsOrderItemProduct",
    value: function hookupFieldsOrderItemProduct() {
      this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagOrderItems + ' td.' + flagProduct, Utils.getListFromDict(products));
    }
  }, {
    key: "hookupFieldsOrderItemProductVariations",
    value: function hookupFieldsOrderItemProductVariations() {
      var _this6 = this;
      this.hookupEventHandler("click", idTableMain + ' td.' + flagOrderItems + ' td.' + flagProductVariations, function (event, element) {
        return _this6.handleClickProductPermutationVariationsPreview(event, element);
      });
    }
  }, {
    key: "hookupFieldsOrderItemUnitQuantity",
    value: function hookupFieldsOrderItemUnitQuantity() {
      this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagOrderItems + ' td.' + flagUnitMeasurementQuantity, Utils.getListFromDict(unitMeasurements));
    }
  }, {
    key: "hookupFieldsOrderItemQuantityUsed",
    value: function hookupFieldsOrderItemQuantityUsed() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagOrderItems + ' td.' + flagQuantityUsed + ' input');
    }
  }, {
    key: "hookupFieldsOrderItemQuantityProduced",
    value: function hookupFieldsOrderItemQuantityProduced() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagOrderItems + ' td.' + flagQuantityProduced + ' input');
    }
    /*
    hookupFieldsOrderItemPriceTotalLocalVatExcl() {
        this.hookupChangeHandlerTableCells(
            idTableMain + ' td.' + flagOrderItems + ' td.' + flagPriceTotalLocalVatExcl + ' input'
            , (event, element) => { 
                this.handleChangeNestedElementCellTable(event, element);
                this.updateFieldsPriceUnitLocalVatExcl(element);
            }
        );
    }
    hookupFieldsOrderItemPriceTotalLocalVatIncl() {
        this.hookupChangeHandlerTableCells(
            idTableMain + ' td.' + flagOrderItems + ' td.' + flagPriceTotalLocalVatIncl + ' input' 
            , (event, element) => { 
                this.handleChangeNestedElementCellTable(event, element);
                this.updateFieldsPriceUnitLocalVatIncl(element);
            }
        );
    }
    updateFieldsPriceUnitLocalVatExcl(elementChanged) {
        let row = elementChanged.closest('tr.' + flagOrderItems);
        let inputPriceTotalLocalVatExcl = row.querySelector('td.' + flagPriceTotalLocalVatExcl + ' input');
        let priceTotalLocalVatExcl = DOM.getElementValueCurrent(inputPriceTotalLocalVatExcl);
        let inputQuantityUsed = row.querySelector('td.' + flagQuantityUsed + ' input');
        let quantityUsed = DOM.getElementValueCurrent(inputQuantityUsed);
         let divPriceUnitLocalVatExcl = row.querySelector('td.' + flagPriceUnitLocalVatExcl + ' div');
        let priceUnitLocalVatExcl = quantityUsed == 0 ? 0 : priceTotalLocalVatExcl / quantityUsed;
        DOM.setElementValuesCurrentAndPrevious(divPriceUnitLocalVatExcl, priceUnitLocalVatExcl);
         let rowManufacturingPurchaseOrder = row.closest(idTableMain + ' > tbody > tr');
        let divPriceGrandTotalLocalVatExcl = rowManufacturingPurchaseOrder.querySelector('td.' + flagPriceTotalLocalVatExcl + ' div');
        let inputsPriceTotalLocalVatExcl = rowManufacturingPurchaseOrder.querySelectorAll('td.' + flagOrderItems + ' td.' + flagPriceTotalLocalVatExcl + ' input');
        let priceGrandTotalLocalVatExcl = Array.from(inputsPriceTotalLocalVatExcl).reduce((acc, input) => acc + Number(DOM.getElementValueCurrent(input)), 0);
        DOM.setElementValueCurrent(divPriceGrandTotalLocalVatExcl, priceGrandTotalLocalVatExcl);
    }
    updateFieldsPriceUnitLocalVatIncl(elementChanged) {
        let row = elementChanged.closest('tr.' + flagOrderItems);
        let inputPriceTotalLocalVatIncl = row.querySelector('td.' + flagPriceTotalLocalVatIncl + ' input');
        let priceTotalLocalVatIncl = DOM.getElementValueCurrent(inputPriceTotalLocalVatIncl);
        let inputQuantityUsed = row.querySelector('td.' + flagQuantityUsed + ' input');
        let quantityUsed = DOM.getElementValueCurrent(inputQuantityUsed);
         let divPriceUnitLocalVatIncl = row.querySelector('td.' + flagPriceUnitLocalVatIncl + ' div');
        let priceUnitLocalVatIncl = quantityUsed == 0 ? 0 : priceTotalLocalVatIncl / quantityUsed;
        DOM.setElementValuesCurrentAndPrevious(divPriceUnitLocalVatIncl, priceUnitLocalVatIncl);
         let rowManufacturingPurchaseOrder = row.closest(idTableMain + ' > tbody > tr');
        let divPriceGrandTotalLocalVatIncl = rowManufacturingPurchaseOrder.querySelector('td.' + flagPriceTotalLocalVatIncl + ' div');
        let inputsPriceTotalLocalVatIncl = rowManufacturingPurchaseOrder.querySelectorAll('td.' + flagOrderItems + ' td.' + flagPriceTotalLocalVatIncl + ' input');
        let priceGrandTotalLocalVatIncl = Array.from(inputsPriceTotalLocalVatIncl).reduce((acc, input) => acc + Number(DOM.getElementValueCurrent(input)), 0);
        DOM.setElementValueCurrent(divPriceGrandTotalLocalVatIncl, priceGrandTotalLocalVatIncl);
    }
    hookupFieldsOrderItemPriceUnitLocalVatExcl() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagOrderItems + ' td.' + flagPriceUnitLocalVatExcl + ' input');
    }
    hookupFieldsOrderItemPriceUnitLocalVatIncl() {
        this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagOrderItems + ' td.' + flagPriceUnitLocalVatIncl + ' input');
    }
    */
  }, {
    key: "hookupFieldsOrderItemUnitMeasurementLatencyManufacture",
    value: function hookupFieldsOrderItemUnitMeasurementLatencyManufacture() {
      this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagOrderItems + ' td.' + flagUnitMeasurementLatencyManufacture, Utils.getListFromDict(unitMeasurementsTime));
    }
  }, {
    key: "hookupFieldsOrderItemLatencyManufacture",
    value: function hookupFieldsOrderItemLatencyManufacture() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagOrderItems + ' td.' + flagLatencyManufacture + ' input');
    }
  }, {
    key: "hookupFieldsOrderItemActive",
    value: function hookupFieldsOrderItemActive() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagOrderItems + ' input.' + flagActive);
    }
  }, {
    key: "hookupFieldsOrderItemAddDelete",
    value: function hookupFieldsOrderItemAddDelete() {
      var selectorButton = idTableMain + ' td.' + flagOrderItems + ' td.' + flagOrderItems + ' button';
      var selectorButtonDelete = selectorButton + '.' + flagDelete;
      var selectorButtonUndelete = selectorButton + '.' + flagAdd;
      this.hookupButtonsRowDelete(selectorButtonDelete, selectorButtonUndelete);
      this.hookupButtonsRowUndelete(selectorButtonDelete, selectorButtonUndelete);
      this.hookupButtonsOrderItemAdd();
    }
  }, {
    key: "hookupButtonsOrderItemAdd",
    value: function hookupButtonsOrderItemAdd() {
      var _this7 = this;
      this.hookupEventHandler("click", idTableMain + ' td.' + flagOrderItems + ' th button.' + flagAdd, function (event, element) {
        var _manufacturingPurchas;
        var row = element.closest(idTableMain + ' > tbody > tr');
        var idManufacturingPurchaseOrder = row.getAttribute(attrIdManufacturingPurchaseOrder);
        // let hasActiveOrderItem = row.querySelectorAll('td.' + flagOrderItems + ' input.' + flagActive + ':checked').length > 0;
        var countManufacturingOrderItems = row.querySelectorAll('td.' + flagOrderItems + ' td.' + flagManufacturingPurchaseOrder).length;
        var manufacturingPurchaseOrderItem = (_manufacturingPurchas = {}, manufacturing_purchase_orders_defineProperty(manufacturing_purchase_orders_defineProperty(manufacturing_purchase_orders_defineProperty(manufacturing_purchase_orders_defineProperty(manufacturing_purchase_orders_defineProperty(manufacturing_purchase_orders_defineProperty(manufacturing_purchase_orders_defineProperty(manufacturing_purchase_orders_defineProperty(manufacturing_purchase_orders_defineProperty(manufacturing_purchase_orders_defineProperty(_manufacturingPurchas, attrIdManufacturingPurchaseOrder, idManufacturingPurchaseOrder), attrIdManufacturingPurchaseOrderProductLink, -1 - countManufacturingOrderItems), attrIdProductCategory, 0), attrIdProduct, 0), flagProductVariations, ''), attrIdUnitMeasurementQuantity, 0), flagQuantityUsed, ''), flagQuantityProduced, ''), attrIdUnitMeasurementLatencyManufacture, 0), flagLatencyManufacture, ''), manufacturing_purchase_orders_defineProperty(manufacturing_purchase_orders_defineProperty(_manufacturingPurchas, flagDisplayOrder, countManufacturingOrderItems + 1), flagActive, true));
        var tbody = row.querySelector('td.' + flagOrderItems + ' table tbody');
        _this7.addRowManufacturingPurchaseOrderItem(tbody, manufacturingPurchaseOrderItem);
        /*
        if (!hasActiveOrderItem) {
            let tdOrderItem = row.querySelector('td.' + flagOrderItems);
            // tdOrderItem.setAttribute(attrIdManufacturingOrderItem, manufacturingPurchaseOrderItem[attrIdManufacturingOrderItem]);
            DOM.setElementAttributeValueCurrent(tdOrderItem, manufacturingPurchaseOrderItem[attrIdManufacturingOrderItem]);
        }
        */
        _this7.hookupOrderItemsFields();
      });
    }
  }, {
    key: "leave",
    value: function leave() {
      manufacturing_purchase_orders_superPropGet(PageStoreManufacturingPurchaseOrders, "leave", this, 3)([]);
    }
  }]);
}(TableBasePage);
manufacturing_purchase_orders_defineProperty(PageStoreManufacturingPurchaseOrders, "hash", hashPageStoreManufacturingPurchaseOrders);
manufacturing_purchase_orders_defineProperty(PageStoreManufacturingPurchaseOrders, "attrIdRowObject", attrIdManufacturingPurchaseOrder);

;// CONCATENATED MODULE: ./static/js/pages/store/product_categories.js
function product_categories_typeof(o) { "@babel/helpers - typeof"; return product_categories_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, product_categories_typeof(o); }
function product_categories_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function product_categories_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, product_categories_toPropertyKey(o.key), o); } }
function product_categories_createClass(e, r, t) { return r && product_categories_defineProperties(e.prototype, r), t && product_categories_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function product_categories_callSuper(t, o, e) { return o = product_categories_getPrototypeOf(o), product_categories_possibleConstructorReturn(t, product_categories_isNativeReflectConstruct() ? Reflect.construct(o, e || [], product_categories_getPrototypeOf(t).constructor) : o.apply(t, e)); }
function product_categories_possibleConstructorReturn(t, e) { if (e && ("object" == product_categories_typeof(e) || "function" == typeof e)) return e; if (void 0 !== e) throw new TypeError("Derived constructors may only return object or undefined"); return product_categories_assertThisInitialized(t); }
function product_categories_assertThisInitialized(e) { if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); return e; }
function product_categories_isNativeReflectConstruct() { try { var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); } catch (t) {} return (product_categories_isNativeReflectConstruct = function _isNativeReflectConstruct() { return !!t; })(); }
function product_categories_superPropGet(t, e, o, r) { var p = product_categories_get(product_categories_getPrototypeOf(1 & r ? t.prototype : t), e, o); return 2 & r && "function" == typeof p ? function (t) { return p.apply(o, t); } : p; }
function product_categories_get() { return product_categories_get = "undefined" != typeof Reflect && Reflect.get ? Reflect.get.bind() : function (e, t, r) { var p = product_categories_superPropBase(e, t); if (p) { var n = Object.getOwnPropertyDescriptor(p, t); return n.get ? n.get.call(arguments.length < 3 ? e : r) : n.value; } }, product_categories_get.apply(null, arguments); }
function product_categories_superPropBase(t, o) { for (; !{}.hasOwnProperty.call(t, o) && null !== (t = product_categories_getPrototypeOf(t));); return t; }
function product_categories_getPrototypeOf(t) { return product_categories_getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function (t) { return t.__proto__ || Object.getPrototypeOf(t); }, product_categories_getPrototypeOf(t); }
function product_categories_inherits(t, e) { if ("function" != typeof e && null !== e) throw new TypeError("Super expression must either be null or a function"); t.prototype = Object.create(e && e.prototype, { constructor: { value: t, writable: !0, configurable: !0 } }), Object.defineProperty(t, "prototype", { writable: !1 }), e && product_categories_setPrototypeOf(t, e); }
function product_categories_setPrototypeOf(t, e) { return product_categories_setPrototypeOf = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function (t, e) { return t.__proto__ = e, t; }, product_categories_setPrototypeOf(t, e); }
function product_categories_defineProperty(e, r, t) { return (r = product_categories_toPropertyKey(r)) in e ? Object.defineProperty(e, r, { value: t, enumerable: !0, configurable: !0, writable: !0 }) : e[r] = t, e; }
function product_categories_toPropertyKey(t) { var i = product_categories_toPrimitive(t, "string"); return "symbol" == product_categories_typeof(i) ? i : i + ""; }
function product_categories_toPrimitive(t, r) { if ("object" != product_categories_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != product_categories_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }





var PageStoreProductCategories = /*#__PURE__*/function (_TableBasePage) {
  function PageStoreProductCategories(router) {
    var _this;
    product_categories_classCallCheck(this, PageStoreProductCategories);
    _this = product_categories_callSuper(this, PageStoreProductCategories, [router]);
    product_categories_defineProperty(_this, "callSaveTableContent", api_API.saveCategories);
    _this.storeMixin = new StoreTableMixinPage(_this);
    return _this;
  }
  product_categories_inherits(PageStoreProductCategories, _TableBasePage);
  return product_categories_createClass(PageStoreProductCategories, [{
    key: "initialize",
    value: function initialize() {
      this.sharedInitialize();
    }
  }, {
    key: "hookupFilters",
    value: function hookupFilters() {
      this.sharedHookupFilters();
      this.hookupFilterIsNotEmpty();
      this.hookupFilterActive();
    }
  }, {
    key: "hookupFilterIsNotEmpty",
    value: function hookupFilterIsNotEmpty() {
      this.hookupEventHandler("change", idFormFilters + ' .' + flagIsNotEmpty, function (event, filter) {
        PageStoreProductCategories.isDirtyFilter(filter);
      });
    }
  }, {
    key: "loadRowTable",
    value: function loadRowTable(rowJson) {
      if (rowJson == null) return;
      if (_verbose) {
        console.log("applying data row: ", rowJson);
      }
      var row = _rowBlank.cloneNode(true);
      row.classList.remove(flagRowNew);
      row.classList.remove(flagInitialised);
      row.querySelectorAll('.' + flagInitialised).forEach(function (element) {
        element.classList.remove(flagInitialised);
      });
      var sliderDisplayOrder = row.querySelector('td.' + flagDisplayOrder + ' .' + flagSlider);
      var textareaCode = row.querySelector('td.' + flagCode + ' textarea');
      var textareaName = row.querySelector('td.' + flagName + ' textarea');
      var textareaDescription = row.querySelector('td.' + flagDescription + ' textarea');
      var tdAccessLevel = row.querySelector('td.' + flagAccessLevel);
      var divAccessLevel = tdAccessLevel.querySelector('div.' + flagAccessLevel);
      var inputActive = row.querySelector('td.' + flagActive + ' input[type="checkbox"]');
      DOM.setElementValuesCurrentAndPrevious(sliderDisplayOrder, rowJson[flagDisplayOrder]);
      DOM.setElementValuesCurrentAndPrevious(textareaCode, rowJson[flagCode]);
      DOM.setElementValuesCurrentAndPrevious(textareaName, rowJson[flagName]);
      DOM.setElementValuesCurrentAndPrevious(textareaDescription, rowJson[flagDescription]);
      tdAccessLevel.setAttribute(attrIdAccessLevel, rowJson[attrIdAccessLevel]);
      tdAccessLevel.setAttribute(flagAccessLevelRequired, rowJson[flagAccessLevelRequired]);
      divAccessLevel.setAttribute(attrIdAccessLevel, rowJson[attrIdAccessLevel]);
      DOM.setElementValuesCurrentAndPrevious(divAccessLevel, rowJson[attrIdAccessLevel]);
      divAccessLevel.textContent = rowJson[flagAccessLevelRequired];
      DOM.setElementValuesCurrentAndPrevious(inputActive, rowJson[flagActive]);
      row.setAttribute(rowJson[flagKeyPrimary], rowJson[rowJson[flagKeyPrimary]]);
      var table = TableBasePage.getTableMain();
      var bodyTable = table.querySelector('tbody');
      bodyTable.appendChild(row);
    }
  }, {
    key: "getJsonRow",
    value: function getJsonRow(row) {
      if (row == null) return;
      var sliderDisplayOrder = row.querySelector('td.' + flagDisplayOrder + ' .' + flagSlider);
      var textareaCode = row.querySelector('td.' + flagCode + ' textarea');
      var textareaName = row.querySelector('td.' + flagName + ' textarea');
      var textareaDescription = row.querySelector('td.' + flagDescription + ' textarea');
      var tdAccessLevel = row.querySelector('td.' + flagAccessLevel);
      var buttonActive = row.querySelector(':scope > td.' + flagActive + ' button');
      var jsonCategory = {};
      jsonCategory[attrIdProductCategory] = row.getAttribute(attrIdProductCategory);
      jsonCategory[flagCode] = DOM.getElementAttributeValueCurrent(textareaCode);
      jsonCategory[flagName] = DOM.getElementAttributeValueCurrent(textareaName);
      jsonCategory[flagDescription] = DOM.getElementAttributeValueCurrent(textareaDescription);
      // jsonCategory[flagAccessLevelRequired] = tdAccessLevel.getAttribute(flagAccessLevelRequired);
      jsonCategory[attrIdAccessLevel] = DOM.getElementAttributeValueCurrent(tdAccessLevel);
      jsonCategory[flagActive] = buttonActive.classList.contains(flagDelete);
      jsonCategory[flagDisplayOrder] = DOM.getElementAttributeValueCurrent(sliderDisplayOrder);
      return jsonCategory;
    }
  }, {
    key: "initialiseRowNew",
    value: function initialiseRowNew(tbody, row) {
      if (row == null) return;
      this.initialiseSliderDisplayOrderRowNew(tbody, row);
    }
  }, {
    key: "hookupTableMain",
    value: function hookupTableMain() {
      product_categories_superPropGet(PageStoreProductCategories, "hookupTableMain", this, 3)([]);
      this.hookupSlidersDisplayOrderTable();
      this.hookupTextareasCodeTable();
      this.hookupTextareasNameTable();
      this.hookupTextareasDescriptionTable();
      this.hookupTdsAccessLevel();
      this.hookupFieldsActive();
    }

    /*
    isDirtyRow(row) {
        if (row == null) return false;
        console.log("Product Category isDirtyRow");
        console.log("row: ", row);
        let sliderDisplayOrder = row.querySelector('td.' + flagDisplayOrder);
        let inputCode = row.querySelector('td.' + flagCode + ' textarea');
        let inputName = row.querySelector('td.' + flagName + ' textarea');
        let inputDescription = row.querySelector('td.' + flagDescription + ' textarea');
        let tdAccessLevel = row.querySelector('td.' + flagAccessLevel);
        let inputActive = row.querySelector('td.' + flagActive + ' input[type="checkbox"]');
        let isDirty = sliderDisplayOrder.classList.contains(flagDirty) || inputCode.classList.contains(flagDirty) || inputName.classList.contains(flagDirty) || 
            inputDescription.classList.contains(flagDirty) || tdAccessLevel.classList.contains(flagDirty) || inputActive.classList.contains(flagDirty);
        DOM.handleDirtyElement(row, isDirty);
        return isDirty;
    }
    */
  }, {
    key: "leave",
    value: function leave() {
      product_categories_superPropGet(PageStoreProductCategories, "leave", this, 3)([]);
    }

    /*
    getFiltersDefaults() {
        filters = {};
        filters.flagIsNotEmpty = true;
        filters.flagActive = true;
        return filters;
    }
    */
  }]);
}(TableBasePage);
product_categories_defineProperty(PageStoreProductCategories, "hash", hashPageStoreProductCategories);
product_categories_defineProperty(PageStoreProductCategories, "attrIdRowObject", attrIdProductCategory);

;// CONCATENATED MODULE: ./static/js/pages/store/product_permutations.js
function product_permutations_typeof(o) { "@babel/helpers - typeof"; return product_permutations_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, product_permutations_typeof(o); }
function product_permutations_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function product_permutations_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, product_permutations_toPropertyKey(o.key), o); } }
function product_permutations_createClass(e, r, t) { return r && product_permutations_defineProperties(e.prototype, r), t && product_permutations_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function product_permutations_callSuper(t, o, e) { return o = product_permutations_getPrototypeOf(o), product_permutations_possibleConstructorReturn(t, product_permutations_isNativeReflectConstruct() ? Reflect.construct(o, e || [], product_permutations_getPrototypeOf(t).constructor) : o.apply(t, e)); }
function product_permutations_possibleConstructorReturn(t, e) { if (e && ("object" == product_permutations_typeof(e) || "function" == typeof e)) return e; if (void 0 !== e) throw new TypeError("Derived constructors may only return object or undefined"); return product_permutations_assertThisInitialized(t); }
function product_permutations_assertThisInitialized(e) { if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); return e; }
function product_permutations_isNativeReflectConstruct() { try { var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); } catch (t) {} return (product_permutations_isNativeReflectConstruct = function _isNativeReflectConstruct() { return !!t; })(); }
function product_permutations_superPropGet(t, e, o, r) { var p = product_permutations_get(product_permutations_getPrototypeOf(1 & r ? t.prototype : t), e, o); return 2 & r && "function" == typeof p ? function (t) { return p.apply(o, t); } : p; }
function product_permutations_get() { return product_permutations_get = "undefined" != typeof Reflect && Reflect.get ? Reflect.get.bind() : function (e, t, r) { var p = product_permutations_superPropBase(e, t); if (p) { var n = Object.getOwnPropertyDescriptor(p, t); return n.get ? n.get.call(arguments.length < 3 ? e : r) : n.value; } }, product_permutations_get.apply(null, arguments); }
function product_permutations_superPropBase(t, o) { for (; !{}.hasOwnProperty.call(t, o) && null !== (t = product_permutations_getPrototypeOf(t));); return t; }
function product_permutations_getPrototypeOf(t) { return product_permutations_getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function (t) { return t.__proto__ || Object.getPrototypeOf(t); }, product_permutations_getPrototypeOf(t); }
function product_permutations_inherits(t, e) { if ("function" != typeof e && null !== e) throw new TypeError("Super expression must either be null or a function"); t.prototype = Object.create(e && e.prototype, { constructor: { value: t, writable: !0, configurable: !0 } }), Object.defineProperty(t, "prototype", { writable: !1 }), e && product_permutations_setPrototypeOf(t, e); }
function product_permutations_setPrototypeOf(t, e) { return product_permutations_setPrototypeOf = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function (t, e) { return t.__proto__ = e, t; }, product_permutations_setPrototypeOf(t, e); }
function product_permutations_defineProperty(e, r, t) { return (r = product_permutations_toPropertyKey(r)) in e ? Object.defineProperty(e, r, { value: t, enumerable: !0, configurable: !0, writable: !0 }) : e[r] = t, e; }
function product_permutations_toPropertyKey(t) { var i = product_permutations_toPrimitive(t, "string"); return "symbol" == product_permutations_typeof(i) ? i : i + ""; }
function product_permutations_toPrimitive(t, r) { if ("object" != product_permutations_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != product_permutations_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }








var PageStoreProductPermutations = /*#__PURE__*/function (_TableBasePage) {
  function PageStoreProductPermutations(router) {
    var _this;
    product_permutations_classCallCheck(this, PageStoreProductPermutations);
    _this = product_permutations_callSuper(this, PageStoreProductPermutations, [router]);
    product_permutations_defineProperty(_this, "callSaveTableContent", api_API.saveProductPermutations);
    _this.storeMixin = new StoreTableMixinPage(_this);
    return _this;
  }
  product_permutations_inherits(PageStoreProductPermutations, _TableBasePage);
  return product_permutations_createClass(PageStoreProductPermutations, [{
    key: "initialize",
    value: function initialize() {
      this.sharedInitialize();
    }
  }, {
    key: "hookupFilters",
    value: function hookupFilters() {
      this.sharedHookupFilters();
      this.hookupFilterProductCategory();
      this.hookupFilterProduct();
      this.hookupFilterOutOfStock();
      this.hookupFilterMinStock();
      this.hookupFilterMaxStock();
    }
  }, {
    key: "hookupFilterProductCategory",
    value: function hookupFilterProductCategory() {
      this.hookupFilter(flagProductCategory, function (event, filterCategory) {
        // loadPermutations();
        // let wasDirtyFilter = filterCategory.classList.contains(flagDirty);
        PageStoreProductPermutations.isDirtyFilter(filterCategory);
        var isDirtyFilter = filterCategory.classList.contains(flagDirty);
        var idProductCategory = DOM.getElementValueCurrent(filterCategory);
        var products = productCategories[idProductCategory];
        var filterProduct = document.querySelector(idFormFilters + ' .' + flagProduct);
        var idProductPrevious = filterProduct.getAttribute(attrValuePrevious);
        filterProduct.innerHTML = '';
        var optionJson, option;
        option = DOM.createOption(null);
        filterProduct.appendChild(option);
        products.forEach(function (product) {
          optionJson = BusinessObjects.getOptionJsonFromObjectJson(product, idProductPrevious);
          option = DOM.createOption(optionJson);
          filterProduct.appendChild(option);
        });
        filterProduct.dispatchEvent(new Event('change'));
      });
    }
  }, {
    key: "hookupFilterProduct",
    value: function hookupFilterProduct() {
      this.hookupFilter(flagProduct);
    }
  }, {
    key: "hookupFilterOutOfStock",
    value: function hookupFilterOutOfStock() {
      this.hookupFilter(flagIsOutOfStock);
    }
  }, {
    key: "hookupFilterMinStock",
    value: function hookupFilterMinStock() {
      this.hookupFilter(flagQuantityMin);
    }
  }, {
    key: "hookupFilterMaxStock",
    value: function hookupFilterMaxStock() {
      this.hookupFilter(flagQuantityMax);
    }
  }, {
    key: "loadRowTable",
    value: function loadRowTable(rowJson) {
      if (rowJson == null) return;
      if (_verbose) {
        console.log("applying data row: ", rowJson);
      }
      /*
      let tableMain = TableBasePage.getTableMain();
      let row = _rowBlank.cloneNode(true);
      row.classList.remove(flagRowNew);
      let dllCategory = row.querySelector('td.' + flagProductCategory + ' select');
      dllCategory.value = rowJson[attrIdProductCategory];
      let ddlProduct = row.querySelector('td.' + flagProduct + ' select');
      let optionJson, option;
      listProducts.forEach(function(product) {
          if (product[attrIdProductCategory] != rowJson[attrIdProductCategory]) return;
          optionJson = BusinessObjects.getOptionJsonFromObjectJson(product);
          option = DOM.createOption(optionJson, rowJson[attrIdProduct]);
          ddlProduct.appendChild(option);
      });
      ddlProduct.value = rowJson[attrIdProduct];
      row.querySelector('td.' + flagProductVariations + ' textarea').value = rowJson[flagProductVariations];
      let tdProductVariations = row.querySelector('td.' + flagProductVariations);
      let textareaProductVariations = tdProductVariations.querySelector('textarea');
      DOM.setElementValuesCurrentAndPrevious(textareaProductVariations, rowJson[flagProductVariations]);
      let thProductVariations = row.querySelector('td.' + flagProductVariations);
      if (!thProductVariations.classList.contains(flagCollapsed)) tdProductVariations.classList.remove(flagCollapsed);
      let inputDescription = row.querySelector('td.' + flagDescription + ' textarea');
      DOM.setElementValuesCurrentAndPrevious(inputDescription, rowJson[flagDescription]);
      let inputCostLocal = row.querySelector('td.' + flagCostLocal + ' input');
      DOM.setElementValuesCurrentAndPrevious(inputCostLocal, rowJson[flagCostLocal]);
      let tdCurrencyCost = row.querySelector('td.' + flagCurrencyCost);
      DOM.setElementAttributesValuesCurrentAndPrevious(tdCurrencyCost, rowJson[flagCurrencyCost]);
      let ddlCurrencyCost = tdCurrencyCost.querySelector('select');
      DOM.setElementValuesCurrentAndPrevious(ddlCurrencyCost, rowJson[flagCurrencyCost]);
      let inputProfitLocalMin = row.querySelector('td.' + flagProfitLocalMin + ' input');
      DOM.setElementValuesCurrentAndPrevious(inputProfitLocalMin, rowJson[flagProfitLocalMin]);
      let inputLatencyManufactureDays = row.querySelector('td.' + flagLatencyManufacture + ' input');
      DOM.setElementValuesCurrentAndPrevious(inputLatencyManufactureDays, rowJson[flagLatencyManufacture]);
      let inputQuantityStock = row.querySelector('td.' + flagQuantityStock + ' input');
      DOM.setElementValuesCurrentAndPrevious(inputQuantityStock, rowJson[flagQuantityStock]);
      let inputQuantityMin = row.querySelector('td.' + flagQuantityMin + ' input');
      DOM.setElementValuesCurrentAndPrevious(inputQuantityMin, rowJson[flagQuantityMin]);
      let inputQuantityMax = row.querySelector('td.' + flagQuantityMax + ' input');
      DOM.setElementValuesCurrentAndPrevious(inputQuantityMax, rowJson[flagQuantityMax]);
      let inputQuantityStep = row.querySelector('td.' + flagCountUnitMeasurementPerQuantityStep + ' input');
      DOM.setElementValuesCurrentAndPrevious(inputQuantityStep, rowJson[flagCountUnitMeasurementPerQuantityStep]);
         row.querySelector('td.' + flagQuantityStock + ' input').value = rowJson[flagQuantityStock];
      row.querySelector('td.' + flagQuantityMin + ' input').value = rowJson[flagQuantityMin];
      row.querySelector('td.' + flagQuantityMax + ' input').value = rowJson[flagQuantityMax];
      row.querySelector('td.' + flagCostLocal).innerHTML = rowJson[flagCostLocal];
      row.setAttribute(attrIdProductCategory, rowJson[flagProductCategory]);
      row.setAttribute(attrIdProduct, rowJson[flagProduct]);
      row.setAttribute(attrIdProductPermutation, rowJson[attrIdProductPermutation]);
      let tbody = tableMain.querySelector('tbody');
      tbody.appendChild(row);
      */
    }
  }, {
    key: "getJsonRow",
    value: function getJsonRow(row) {
      if (row == null) return;
      var tdProductCategory = row.querySelector('td.' + flagProductCategory);
      var tdProduct = row.querySelector('td.' + flagProduct);
      var tdProductVariations = row.querySelector('td.' + flagProductVariations);
      var inputDescription = row.querySelector('td.' + flagDescription + ' textarea');
      // let inputCostLocalVatExcl = row.querySelector('td.' + flagCostUnitLocalVatExcl + ' input');
      // let inputCostLocalVatIncl = row.querySelector('td.' + flagCostUnitLocalVatIncl + ' input');
      var tdCurrencyCost = row.querySelector('td.' + flagCurrencyCost);
      var inputProfitLocalMin = row.querySelector('td.' + flagProfitLocalMin + ' input');
      var inputLatencyManufactureDays = row.querySelector('td.' + flagLatencyManufacture + ' input');
      var inputQuantityStock = row.querySelector('td.' + flagQuantityStock + ' input');
      var inputQuantityMin = row.querySelector('td.' + flagQuantityMin + ' input');
      var inputQuantityMax = row.querySelector('td.' + flagQuantityMax + ' input');
      var inputQuantityStep = row.querySelector('td.' + flagCountUnitMeasurementPerQuantityStep + ' input');
      var tdUnitMeasurementQuantity = row.querySelector('td.' + flagUnitMeasurementQuantity);
      var checkboxIsSubscription = row.querySelector('td.' + flagIsSubscription + ' input');
      var inputCountIntervalRecurrence = row.querySelector('td.' + flagCountUnitMeasurementIntervalRecurrence + ' input');
      var tdUnitMeasurementIntervalRecurrence = row.querySelector('td.' + flagUnitMeasurementIntervalRecurrence);
      var inputIdStripeProduct = row.querySelector('td.' + flagIdStripeProduct + ' input');
      var checkboxDoesExpireFasterOnceUnsealed = row.querySelector('td.' + flagDoesExpireFasterOnceUnsealed + ' input');
      var inputCountIntervalExpirationUnsealed = row.querySelector('td.' + flagCountUnitMeasurementIntervalExpirationUnsealed + ' input');
      var tdUnitMeasurementIntervalExpirationUnsealed = row.querySelector('td.' + flagUnitMeasurementIntervalExpirationUnsealed);
      var buttonActive = row.querySelector(':scope > td.' + flagActive + ' button');
      var jsonRow = {};
      jsonRow[attrIdProductPermutation] = row.getAttribute(attrIdProductPermutation);
      jsonRow[attrIdProductCategory] = tdProductCategory.getAttribute(attrValueCurrent);
      jsonRow[attrIdProduct] = tdProduct.getAttribute(attrValueCurrent);
      jsonRow[flagProductVariations] = tdProductVariations.getAttribute(attrValueCurrent);
      jsonRow[flagHasVariations] = jsonRow[flagProductVariations] != '';
      jsonRow[flagDescription] = inputDescription.getAttribute(attrValueCurrent);
      // jsonRow[flagCostUnitLocalVatExcl] = inputCostLocalVatExcl.getAttribute(attrValueCurrent);
      // jsonRow[flagCostUnitLocalVatIncl] = inputCostLocalVatIncl.getAttribute(attrValueCurrent);
      jsonRow[flagCurrencyCost] = tdCurrencyCost.getAttribute(attrValueCurrent);
      jsonRow[flagProfitLocalMin] = inputProfitLocalMin.getAttribute(attrValueCurrent);
      jsonRow[flagLatencyManufacture] = inputLatencyManufactureDays.getAttribute(attrValueCurrent);
      jsonRow[flagQuantityStock] = inputQuantityStock.getAttribute(attrValueCurrent);
      jsonRow[flagQuantityMin] = inputQuantityMin.getAttribute(attrValueCurrent);
      jsonRow[flagQuantityMax] = inputQuantityMax.getAttribute(attrValueCurrent);
      jsonRow[flagCountUnitMeasurementPerQuantityStep] = inputQuantityStep.getAttribute(attrValueCurrent);
      jsonRow[flagUnitMeasurementQuantity] = tdUnitMeasurementQuantity.getAttribute(attrValueCurrent);
      jsonRow[flagIsSubscription] = checkboxIsSubscription.getAttribute(attrValueCurrent);
      jsonRow[flagCountUnitMeasurementIntervalRecurrence] = inputCountIntervalRecurrence.getAttribute(attrValueCurrent);
      jsonRow[flagUnitMeasurementIntervalRecurrence] = tdUnitMeasurementIntervalRecurrence.getAttribute(attrValueCurrent);
      jsonRow[flagIdStripeProduct] = inputIdStripeProduct.getAttribute(attrValueCurrent);
      jsonRow[flagDoesExpireFasterOnceUnsealed] = checkboxDoesExpireFasterOnceUnsealed.getAttribute(attrValueCurrent);
      jsonRow[flagCountUnitMeasurementIntervalExpirationUnsealed] = inputCountIntervalExpirationUnsealed.getAttribute(attrValueCurrent);
      jsonRow[flagUnitMeasurementIntervalExpirationUnsealed] = tdUnitMeasurementIntervalExpirationUnsealed.getAttribute(attrValueCurrent);
      jsonRow[flagActive] = buttonActive.classList.contains(flagDelete);
      return jsonRow;
    }
  }, {
    key: "initialiseRowNew",
    value: function initialiseRowNew(tbody, row) {
      this.initialiseRowNewDdlsProductCategoryAndProduct(row);
      var checkboxIsSubscription = row.querySelector('td.' + flagIsSubscription + ' input');
      var checkboxDoesExpireFasterOnceUnsealed = row.querySelector('td.' + flagDoesExpireFasterOnceUnsealed + ' input');
      this.handleChangeCheckboxDoesExpireFasterOnceUnsealed(null, checkboxDoesExpireFasterOnceUnsealed);
      this.handleChangeCheckboxIsSubscription(null, checkboxIsSubscription);
    }
  }, {
    key: "initialiseRowNewDdlsProductCategoryAndProduct",
    value: function initialiseRowNewDdlsProductCategoryAndProduct(row) {
      var ddlCategoryFilter = document.querySelector(idFormFilters + ' #' + attrIdProductCategory);
      var idProductCategoryFilter = DOM.getElementValueCurrent(ddlCategoryFilter);
      var hasCategoryFilter = !(validation_Validation.isEmpty(idProductCategoryFilter) || idProductCategoryFilter == '0');
      var ddlProductFilter = document.querySelector(idFormFilters + ' #' + attrIdProduct);
      var idProductFilter = DOM.getElementValueCurrent(ddlProductFilter);
      var hasProductFilter = !(validation_Validation.isEmpty(idProductFilter) || idProductFilter == '0');
      if (_verbose) {
        console.log("initialiseRowNew: ", row);
        console.log({
          ddlCategoryFilter: ddlCategoryFilter,
          idProductCategoryFilter: idProductCategoryFilter,
          hasCategoryFilter: hasCategoryFilter,
          ddlProductFilter: ddlProductFilter,
          idProductFilter: idProductFilter,
          hasProductFilter: hasProductFilter
        });
      }
      if (!hasCategoryFilter && !hasProductFilter) return;
      if (hasCategoryFilter) {
        var ddlCategory = row.querySelector('td.' + flagProductCategory + ' select');
        DOM.setElementValuesCurrentAndPrevious(ddlCategory, idProductCategoryFilter);
        this.handleChangeProductCategoryDdl(null, ddlCategory);
      }
      if (hasProductFilter) {
        var ddlProduct = row.querySelector('td.' + flagProduct + ' select');
        DOM.setElementValuesCurrentAndPrevious(ddlProduct, idProductFilter);
      }
    }
  }, {
    key: "hookupTableMain",
    value: function hookupTableMain() {
      product_permutations_superPropGet(PageStoreProductPermutations, "hookupTableMain", this, 3)([]);
      this.hookupFieldsProductCategory();
      this.hookupProductFields();
      this.hookupFieldsProductPermutationVariation();
      this.hookupDescriptionTextareas();
      this.hookupCostFields();
      this.hookupProfitFields();
      this.hookupLatencyManufactureInputs();
      this.hookupQuantityFields();
      this.hookupSubscriptionFields();
      this.hookupIdStripeProductInputs();
      this.hookupExpirationFields();
      this.hookupFieldsActive();
    }
  }, {
    key: "hookupFieldsProductCategory",
    value: function hookupFieldsProductCategory() {
      var _this2 = this;
      this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagProductCategory, Utils.getListFromDict(productCategories), function (cellSelector) {
        _this2.hookupProductCategoryDdls(cellSelector);
      });
    }
  }, {
    key: "hookupProductFields",
    value: function hookupProductFields() {
      this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagProduct, Utils.getListFromDict(products));
    }
  }, {
    key: "hookupDescriptionTextareas",
    value: function hookupDescriptionTextareas() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagDescription + ' textarea');
    }
  }, {
    key: "hookupCostFields",
    value: function hookupCostFields() {
      this.hookupCurrencyCostFields();
      this.hookupCostInputs();
    }
  }, {
    key: "hookupCurrencyCostFields",
    value: function hookupCurrencyCostFields() {
      this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagCurrencyCost, Utils.getListFromDict(currencies));
    }
  }, {
    key: "hookupCostInputs",
    value: function hookupCostInputs() {
      /*
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagCostUnitLocalVatExcl + ' input');
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagCostUnitLocalVatIncl + ' input');
      */
    }
  }, {
    key: "hookupProfitFields",
    value: function hookupProfitFields() {
      // this.hookupCurrencyProfitFields();
      this.hookupProfitInputs();
    }
    /*
    hookupCurrencyProfitFields(){
        this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagCurrency, Utils.getListFromDict(currencies));
    }
    */
  }, {
    key: "hookupProfitInputs",
    value: function hookupProfitInputs() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagProfitLocalMin + ' input');
    }
  }, {
    key: "hookupLatencyManufactureInputs",
    value: function hookupLatencyManufactureInputs() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagLatencyManufacture + ' input');
    }
  }, {
    key: "hookupQuantityFields",
    value: function hookupQuantityFields() {
      this.hookupQuantityMinInputs();
      this.hookupQuantityMaxInputs();
      this.hookupQuantityStockInputs();
      this.hookupCountUnitMeasurementPerQuantityStepInputs();
      this.hookupUnitMeasurementQuantityFields();
    }
  }, {
    key: "hookupQuantityMinInputs",
    value: function hookupQuantityMinInputs() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagQuantityMin + ' input');
    }
  }, {
    key: "hookupQuantityMaxInputs",
    value: function hookupQuantityMaxInputs() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagQuantityMax + ' input');
    }
  }, {
    key: "hookupQuantityStockInputs",
    value: function hookupQuantityStockInputs() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagQuantityStock + ' input');
    }
  }, {
    key: "hookupCountUnitMeasurementPerQuantityStepInputs",
    value: function hookupCountUnitMeasurementPerQuantityStepInputs() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagCountUnitMeasurementPerQuantityStep + ' input');
    }
  }, {
    key: "hookupUnitMeasurementQuantityFields",
    value: function hookupUnitMeasurementQuantityFields() {
      this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagUnitMeasurementQuantity, Utils.getListFromDict(unitMeasurements));
    }
  }, {
    key: "hookupSubscriptionFields",
    value: function hookupSubscriptionFields() {
      this.hookupIsSubscriptionFields();
      this.hookupIntervalRecurrenceFields();
      this.hookupCountIntervalRecurrenceInputs();
    }
  }, {
    key: "hookupIsSubscriptionFields",
    value: function hookupIsSubscriptionFields() {
      var _this3 = this;
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagIsSubscription + ' input', function (event, element) {
        _this3.handleChangeCheckboxIsSubscription(event, element);
      });
    }
  }, {
    key: "handleChangeCheckboxIsSubscription",
    value: function handleChangeCheckboxIsSubscription(event, element) {
      this.handleChangeNestedElementCellTable(event, element);
      var isSubscription = DOM.getElementValueCurrent(element);
      var row = DOM.getRowFromElement(element);
      var inputCountIntervalRecurrence = row.querySelector('td.' + flagCountUnitMeasurementIntervalRecurrence + ' input');
      var divOrDdlIntervalRecurrence = row.querySelector('td.' + flagUnitMeasurementIntervalRecurrence + ' .' + flagUnitMeasurementIntervalRecurrence);
      if (isSubscription) {
        inputCountIntervalRecurrence.classList.remove(flagCollapsed);
        divOrDdlIntervalRecurrence.classList.remove(flagCollapsed);
        var tdUnitMeasurementIntervalRecurrence = divOrDdlIntervalRecurrence.closest('td');
        tdUnitMeasurementIntervalRecurrence.dispatchEvent(new Event('click'));
      } else {
        inputCountIntervalRecurrence.classList.add(flagCollapsed);
        divOrDdlIntervalRecurrence.classList.add(flagCollapsed);
      }
    }
  }, {
    key: "hookupIntervalRecurrenceFields",
    value: function hookupIntervalRecurrenceFields() {
      this.hookupTableCellDDlPreviewsWhenNotCollapsed(idTableMain + ' td.' + flagUnitMeasurementIntervalRecurrence, Utils.getListFromDict(unitMeasurementsTime));
    }
  }, {
    key: "hookupCountIntervalRecurrenceInputs",
    value: function hookupCountIntervalRecurrenceInputs() {
      this.hookupChangeHandlerTableCellsWhenNotCollapsed(idTableMain + ' td.' + flagCountUnitMeasurementIntervalRecurrence + ' input');
    }
  }, {
    key: "hookupIdStripeProductInputs",
    value: function hookupIdStripeProductInputs() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagIdStripeProduct + ' input');
    }
  }, {
    key: "hookupExpirationFields",
    value: function hookupExpirationFields() {
      this.hookupDoesExpireFasterOnceUnsealedCheckboxes();
      this.hookupIntervalExpirationUnsealedFields();
      this.hookupCountIntervalExpirationUnsealedInputs();
    }
  }, {
    key: "hookupDoesExpireFasterOnceUnsealedCheckboxes",
    value: function hookupDoesExpireFasterOnceUnsealedCheckboxes() {
      var _this4 = this;
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagDoesExpireFasterOnceUnsealed + ' input', function (event, element) {
        _this4.handleChangeCheckboxDoesExpireFasterOnceUnsealed(event, element);
      });
    }
  }, {
    key: "handleChangeCheckboxDoesExpireFasterOnceUnsealed",
    value: function handleChangeCheckboxDoesExpireFasterOnceUnsealed(event, element) {
      this.handleChangeNestedElementCellTable(event, element);
      var doesExpireFasterOnceUnsealed = DOM.getElementValueCurrent(element);
      var row = DOM.getRowFromElement(element);
      var inputCountIntervalExpirationUnsealed = row.querySelector('td.' + flagCountUnitMeasurementIntervalExpirationUnsealed + ' input');
      var divOrDdlIntervalExpirationUnsealed = row.querySelector('td.' + flagUnitMeasurementIntervalExpirationUnsealed + ' .' + flagUnitMeasurementIntervalExpirationUnsealed);
      if (doesExpireFasterOnceUnsealed) {
        inputCountIntervalExpirationUnsealed.classList.remove(flagCollapsed);
        divOrDdlIntervalExpirationUnsealed.classList.remove(flagCollapsed);
        var tdUnitMeasurementIntervalExpirationUnsealed = divOrDdlIntervalExpirationUnsealed.closest('td');
        tdUnitMeasurementIntervalExpirationUnsealed.dispatchEvent(new Event('click'));
        this.hook;
      } else {
        inputCountIntervalExpirationUnsealed.classList.add(flagCollapsed);
        divOrDdlIntervalExpirationUnsealed.classList.add(flagCollapsed);
      }
    }
  }, {
    key: "hookupIntervalExpirationUnsealedFields",
    value: function hookupIntervalExpirationUnsealedFields() {
      this.hookupTableCellDDlPreviewsWhenNotCollapsed(idTableMain + ' td.' + flagUnitMeasurementIntervalExpirationUnsealed, Utils.getListFromDict(unitMeasurementsTime));
    }
  }, {
    key: "hookupCountIntervalExpirationUnsealedInputs",
    value: function hookupCountIntervalExpirationUnsealedInputs() {
      this.hookupChangeHandlerTableCellsWhenNotCollapsed(idTableMain + ' td.' + flagCountUnitMeasurementIntervalExpirationUnsealed + ' input');
    }
  }, {
    key: "leave",
    value: function leave() {
      product_permutations_superPropGet(PageStoreProductPermutations, "leave", this, 3)([]);
    }
  }]);
}(TableBasePage);
product_permutations_defineProperty(PageStoreProductPermutations, "hash", hashPageStoreProductPermutations);
product_permutations_defineProperty(PageStoreProductPermutations, "attrIdRowObject", attrIdProductPermutation);

;// CONCATENATED MODULE: ./static/js/pages/store/products.js
function products_typeof(o) { "@babel/helpers - typeof"; return products_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, products_typeof(o); }
function products_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function products_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, products_toPropertyKey(o.key), o); } }
function products_createClass(e, r, t) { return r && products_defineProperties(e.prototype, r), t && products_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function products_callSuper(t, o, e) { return o = products_getPrototypeOf(o), products_possibleConstructorReturn(t, products_isNativeReflectConstruct() ? Reflect.construct(o, e || [], products_getPrototypeOf(t).constructor) : o.apply(t, e)); }
function products_possibleConstructorReturn(t, e) { if (e && ("object" == products_typeof(e) || "function" == typeof e)) return e; if (void 0 !== e) throw new TypeError("Derived constructors may only return object or undefined"); return products_assertThisInitialized(t); }
function products_assertThisInitialized(e) { if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); return e; }
function products_isNativeReflectConstruct() { try { var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); } catch (t) {} return (products_isNativeReflectConstruct = function _isNativeReflectConstruct() { return !!t; })(); }
function products_superPropGet(t, e, o, r) { var p = products_get(products_getPrototypeOf(1 & r ? t.prototype : t), e, o); return 2 & r && "function" == typeof p ? function (t) { return p.apply(o, t); } : p; }
function products_get() { return products_get = "undefined" != typeof Reflect && Reflect.get ? Reflect.get.bind() : function (e, t, r) { var p = products_superPropBase(e, t); if (p) { var n = Object.getOwnPropertyDescriptor(p, t); return n.get ? n.get.call(arguments.length < 3 ? e : r) : n.value; } }, products_get.apply(null, arguments); }
function products_superPropBase(t, o) { for (; !{}.hasOwnProperty.call(t, o) && null !== (t = products_getPrototypeOf(t));); return t; }
function products_getPrototypeOf(t) { return products_getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function (t) { return t.__proto__ || Object.getPrototypeOf(t); }, products_getPrototypeOf(t); }
function products_inherits(t, e) { if ("function" != typeof e && null !== e) throw new TypeError("Super expression must either be null or a function"); t.prototype = Object.create(e && e.prototype, { constructor: { value: t, writable: !0, configurable: !0 } }), Object.defineProperty(t, "prototype", { writable: !1 }), e && products_setPrototypeOf(t, e); }
function products_setPrototypeOf(t, e) { return products_setPrototypeOf = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function (t, e) { return t.__proto__ = e, t; }, products_setPrototypeOf(t, e); }
function products_defineProperty(e, r, t) { return (r = products_toPropertyKey(r)) in e ? Object.defineProperty(e, r, { value: t, enumerable: !0, configurable: !0, writable: !0 }) : e[r] = t, e; }
function products_toPropertyKey(t) { var i = products_toPrimitive(t, "string"); return "symbol" == products_typeof(i) ? i : i + ""; }
function products_toPrimitive(t, r) { if ("object" != products_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != products_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }






var PageStoreProducts = /*#__PURE__*/function (_TableBasePage) {
  function PageStoreProducts(router) {
    var _this;
    products_classCallCheck(this, PageStoreProducts);
    _this = products_callSuper(this, PageStoreProducts, [router]);
    products_defineProperty(_this, "callSaveTableContent", api_API.saveProducts);
    _this.storeMixin = new StoreTableMixinPage(_this);
    return _this;
  }
  products_inherits(PageStoreProducts, _TableBasePage);
  return products_createClass(PageStoreProducts, [{
    key: "initialize",
    value: function initialize() {
      this.sharedInitialize();
    }
  }, {
    key: "hookupFilters",
    value: function hookupFilters() {
      this.sharedHookupFilters();
      this.hookupFilterProductCategory();
      this.hookupFilterIsNotEmpty();
      this.hookupFilterActive();
    }
  }, {
    key: "hookupFilterProductCategory",
    value: function hookupFilterProductCategory() {
      this.hookupFilter(flagProductCategory);
    }
  }, {
    key: "loadRowTable",
    value: function loadRowTable(rowJson) {
      return;
      if (rowJson == null) return;
      var row = _rowBlank.cloneNode(true);
      row.classList.remove(flagRowNew);
      row.classList.remove(flagInitialised);
      row.querySelectorAll('.' + flagInitialised).forEach(function (element) {
        element.classList.remove(flagInitialised);
      });
      var sliderDisplayOrder = row.querySelector('td.' + flagDisplayOrder + ' .' + flagSlider);
      var tdProductCategory = row.querySelector('td.' + flagProductCategory);
      var divProductCategory = tdProductCategory.querySelector('div.' + flagProductCategory);
      var textareaName = row.querySelector('td.' + flagName + ' textarea');
      var tdAccessLevel = row.querySelector('td.' + flagAccessLevel);
      var divAccessLevel = tdAccessLevel.querySelector('div.' + flagAccessLevel);
      var inputActive = row.querySelector('td.' + flagActive + ' input[type="checkbox"]');
      DOM.setElementValuesCurrentAndPrevious(sliderDisplayOrder, rowJson[flagDisplayOrder]);
      DOM.setElementValuesCurrentAndPrevious(textareaCode, rowJson[flagCode]);
      DOM.setElementValuesCurrentAndPrevious(textareaName, rowJson[flagName]);
      DOM.setElementValuesCurrentAndPrevious(textareaDescription, rowJson[flagDescription]);
      tdAccessLevel.setAttribute(attrIdAccessLevel, rowJson[attrIdAccessLevel]);
      tdAccessLevel.setAttribute(flagAccessLevelRequired, rowJson[flagAccessLevelRequired]);
      divAccessLevel.setAttribute(attrIdAccessLevel, rowJson[attrIdAccessLevel]);
      DOM.setElementValuesCurrentAndPrevious(divAccessLevel, rowJson[attrIdAccessLevel]);
      divAccessLevel.textContent = rowJson[flagAccessLevelRequired];
      DOM.setElementValuesCurrentAndPrevious(inputActive, rowJson[flagActive]);
      row.setAttribute(rowJson[flagKeyPrimary], rowJson[rowJson[flagKeyPrimary]]);
      var table = TableBasePage.getTableMain();
      var bodyTable = table.querySelector('tbody');
      bodyTable.appendChild(row);
    }
  }, {
    key: "getJsonRow",
    value: function getJsonRow(row) {
      if (row == null) return;
      var sliderDisplayOrder = row.querySelector('td.' + flagDisplayOrder + ' .' + flagSlider);
      var tdProductCategory = row.querySelector('td.' + flagProductCategory);
      var textareaName = row.querySelector('td.' + flagName + ' textarea');
      // let tdProductVariations = row.querySelector('td.' + flagProductVariations);
      var inputHasVariations = row.querySelector('td.' + flagHasVariations + ' input[type="checkbox"]');
      var tdAccessLevel = row.querySelector('td.' + flagAccessLevel);
      var buttonActive = row.querySelector(':scope > td.' + flagActive + ' button');
      var jsonProduct = {};
      jsonProduct[attrIdProduct] = row.getAttribute(attrIdProduct);
      jsonProduct[attrIdProductCategory] = DOM.getElementAttributeValueCurrent(tdProductCategory);
      jsonProduct[flagName] = DOM.getElementAttributeValueCurrent(textareaName);
      // jsonRow[flagProductVariations] = DOM.getElementAttributeValueCurrent(tdProductVariations);
      // jsonRow[flagHasVariations] = jsonRow[flagProductVariations] != '';
      jsonProduct[flagHasVariations] = DOM.getElementAttributeValueCurrent(inputHasVariations);
      // jsonProduct[flagAccessLevelRequired] = tdAccessLevel.getAttribute(flagAccessLevelRequired);
      jsonProduct[attrIdAccessLevel] = DOM.getElementAttributeValueCurrent(tdAccessLevel);
      jsonProduct[flagActive] = buttonActive.classList.contains(flagDelete);
      jsonProduct[flagDisplayOrder] = DOM.getElementAttributeValueCurrent(sliderDisplayOrder);
      return jsonProduct;
    }
  }, {
    key: "initialiseRowNew",
    value: function initialiseRowNew(tbody, row) {
      if (row == null) return;
      this.initialiseSliderDisplayOrderRowNew(tbody, row);
    }
  }, {
    key: "hookupTableMain",
    value: function hookupTableMain() {
      products_superPropGet(PageStoreProducts, "hookupTableMain", this, 3)([]);
      this.hookupSlidersDisplayOrderTable();
      this.hookupTdsProductCategory();
      this.hookupTextareasNameTable();
      this.hookupInputsHasVariationsTable();
      this.hookupTdsAccessLevel();
      this.hookupFieldsActive();
    }
  }, {
    key: "hookupTdsProductCategory",
    value: function hookupTdsProductCategory() {
      var cellSelector = idTableMain + ' tbody td.' + flagProductCategory;
      this.hookupTableCellDdlPreviews(cellSelector, Utils.getListFromDict(productCategories));
    }
  }, {
    key: "hookupInputsHasVariationsTable",
    value: function hookupInputsHasVariationsTable() {
      var cellSelector = idTableMain + ' tbody td.' + flagHasVariations + ' input[type="checkbox"]';
      this.hookupChangeHandlerTableCells(cellSelector);
    }

    /*
    isDirtyRow(row) {
        if (row == null) return false;
        console.log("Product Product isDirtyRow");
        console.log("row: ", row);
        let sliderDisplayOrder = row.querySelector('td.' + flagDisplayOrder);
        let inputCode = row.querySelector('td.' + flagCode + ' textarea');
        let inputName = row.querySelector('td.' + flagName + ' textarea');
        let inputDescription = row.querySelector('td.' + flagDescription + ' textarea');
        let tdAccessLevel = row.querySelector('td.' + flagAccessLevel);
        let inputActive = row.querySelector('td.' + flagActive + ' input[type="checkbox"]');
        let isDirty = sliderDisplayOrder.classList.contains(flagDirty) || inputCode.classList.contains(flagDirty) || inputName.classList.contains(flagDirty) || 
            inputDescription.classList.contains(flagDirty) || tdAccessLevel.classList.contains(flagDirty) || inputActive.classList.contains(flagDirty);
        DOM.handleDirtyElement(row, isDirty);
        return isDirty;
    }
    */
  }, {
    key: "leave",
    value: function leave() {
      products_superPropGet(PageStoreProducts, "leave", this, 3)([]);
    }

    /*
    getFiltersDefaults() {
        filters = {};
        filters.flagIsNotEmpty = true;
        filters.flagActive = true;
        return filters;
    }
    */
  }]);
}(TableBasePage);
products_defineProperty(PageStoreProducts, "hash", hashPageStoreProducts);
products_defineProperty(PageStoreProducts, "attrIdRowObject", attrIdProduct);

;// CONCATENATED MODULE: ./static/js/pages/store/product_variations.js
function product_variations_typeof(o) { "@babel/helpers - typeof"; return product_variations_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, product_variations_typeof(o); }
function product_variations_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function product_variations_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, product_variations_toPropertyKey(o.key), o); } }
function product_variations_createClass(e, r, t) { return r && product_variations_defineProperties(e.prototype, r), t && product_variations_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function product_variations_callSuper(t, o, e) { return o = product_variations_getPrototypeOf(o), product_variations_possibleConstructorReturn(t, product_variations_isNativeReflectConstruct() ? Reflect.construct(o, e || [], product_variations_getPrototypeOf(t).constructor) : o.apply(t, e)); }
function product_variations_possibleConstructorReturn(t, e) { if (e && ("object" == product_variations_typeof(e) || "function" == typeof e)) return e; if (void 0 !== e) throw new TypeError("Derived constructors may only return object or undefined"); return product_variations_assertThisInitialized(t); }
function product_variations_assertThisInitialized(e) { if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); return e; }
function product_variations_isNativeReflectConstruct() { try { var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); } catch (t) {} return (product_variations_isNativeReflectConstruct = function _isNativeReflectConstruct() { return !!t; })(); }
function product_variations_superPropGet(t, e, o, r) { var p = product_variations_get(product_variations_getPrototypeOf(1 & r ? t.prototype : t), e, o); return 2 & r && "function" == typeof p ? function (t) { return p.apply(o, t); } : p; }
function product_variations_get() { return product_variations_get = "undefined" != typeof Reflect && Reflect.get ? Reflect.get.bind() : function (e, t, r) { var p = product_variations_superPropBase(e, t); if (p) { var n = Object.getOwnPropertyDescriptor(p, t); return n.get ? n.get.call(arguments.length < 3 ? e : r) : n.value; } }, product_variations_get.apply(null, arguments); }
function product_variations_superPropBase(t, o) { for (; !{}.hasOwnProperty.call(t, o) && null !== (t = product_variations_getPrototypeOf(t));); return t; }
function product_variations_getPrototypeOf(t) { return product_variations_getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function (t) { return t.__proto__ || Object.getPrototypeOf(t); }, product_variations_getPrototypeOf(t); }
function product_variations_inherits(t, e) { if ("function" != typeof e && null !== e) throw new TypeError("Super expression must either be null or a function"); t.prototype = Object.create(e && e.prototype, { constructor: { value: t, writable: !0, configurable: !0 } }), Object.defineProperty(t, "prototype", { writable: !1 }), e && product_variations_setPrototypeOf(t, e); }
function product_variations_setPrototypeOf(t, e) { return product_variations_setPrototypeOf = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function (t, e) { return t.__proto__ = e, t; }, product_variations_setPrototypeOf(t, e); }
function product_variations_defineProperty(e, r, t) { return (r = product_variations_toPropertyKey(r)) in e ? Object.defineProperty(e, r, { value: t, enumerable: !0, configurable: !0, writable: !0 }) : e[r] = t, e; }
function product_variations_toPropertyKey(t) { var i = product_variations_toPrimitive(t, "string"); return "symbol" == product_variations_typeof(i) ? i : i + ""; }
function product_variations_toPrimitive(t, r) { if ("object" != product_variations_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != product_variations_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }








var PageStoreProductVariations = /*#__PURE__*/function (_TableBasePage) {
  function PageStoreProductVariations(router) {
    var _this;
    product_variations_classCallCheck(this, PageStoreProductVariations);
    _this = product_variations_callSuper(this, PageStoreProductVariations, [router]);
    product_variations_defineProperty(_this, "callSaveTableContent", api_API.saveProductVariations);
    _this.storeMixin = new StoreTableMixinPage(_this);
    return _this;
  }
  product_variations_inherits(PageStoreProductVariations, _TableBasePage);
  return product_variations_createClass(PageStoreProductVariations, [{
    key: "initialize",
    value: function initialize() {
      this.sharedInitialize();
    }
  }, {
    key: "hookupFilters",
    value: function hookupFilters() {
      this.sharedHookupFilters();
      this.hookupFilterActive();
      this.hookupFilterIsNotEmpty();
    }
  }, {
    key: "loadRowTable",
    value: function loadRowTable(rowJson) {}
  }, {
    key: "getJsonRow",
    value: function getJsonRow(row) {
      var _this2 = this;
      if (row == null) return;
      var inputDisplayOrder = row.querySelector('td.' + flagDisplayOrder + ' input');
      var textareaCode = row.querySelector('td.' + flagCode + ' textarea');
      var textareaName = row.querySelector('td.' + flagName + ' textarea');
      var textareaNamePlural = row.querySelector('td.' + flagNamePlural + ' textarea');
      var tdProductVariations = row.querySelector('td.' + flagProductVariations);
      var buttonActive = row.querySelector(':scope > td.' + flagActive + ' button');
      var jsonRow = {};
      jsonRow[attrIdProductVariationType] = row.getAttribute(attrIdProductVariationType);
      if (validation_Validation.isEmpty(jsonRow[attrIdProductVariationType])) jsonRow[attrIdProductVariationType] = -1;
      jsonRow[flagDisplayOrder] = DOM.getElementAttributeValueCurrent(inputDisplayOrder);
      jsonRow[flagCode] = DOM.getElementAttributeValueCurrent(textareaCode);
      jsonRow[flagName] = DOM.getElementAttributeValueCurrent(textareaName);
      jsonRow[flagNamePlural] = DOM.getElementAttributeValueCurrent(textareaNamePlural);
      var variations = [];
      if (tdProductVariations.classList.contains(flagDirty)) {
        var trsProductVariation = tdProductVariations.querySelectorAll('tr.' + flagProductVariation + '.' + flagDirty);
        if (trsProductVariation != null) {
          trsProductVariation.forEach(function (tr, indexRow) {
            variations.push(_this2.getJsonRowProductVariation(tr, indexRow));
          });
        }
      } else {
        // variations = BusinessObjects.getListObjectsFromIdDictAndCsv(productVariationTypes, DOM.getElementAttributeValueCurrent(tdProductVariations));
      }
      jsonRow[flagProductVariations] = variations;
      jsonRow[flagActive] = buttonActive.classList.contains(flagDelete);
      return jsonRow;
    }
  }, {
    key: "getJsonRowProductVariation",
    value: function getJsonRowProductVariation(tr, indexRow) {
      var inputDisplayOrder = tr.querySelector('td.' + flagDisplayOrder + ' input');
      var textareaCode = tr.querySelector('td.' + flagCode + ' textarea');
      var textareaName = tr.querySelector('td.' + flagName + ' textarea');
      // let checkboxActive = tr.querySelector('td.' + flagActive + ' input');
      var buttonActive = tr.querySelector(':scope > td.' + flagActive + ' button');
      var jsonRow = {};
      jsonRow[attrIdProductVariation] = tr.getAttribute(attrIdProductVariation);
      if (validation_Validation.isEmpty(jsonRow[attrIdProductVariation])) jsonRow[attrIdProductVariation] = -1 - indexRow;
      jsonRow[attrIdProductVariationType] = tr.getAttribute(attrIdProductVariationType);
      jsonRow[flagDisplayOrder] = DOM.getElementAttributeValueCurrent(inputDisplayOrder);
      jsonRow[flagCode] = DOM.getElementAttributeValueCurrent(textareaCode);
      jsonRow[flagName] = DOM.getElementAttributeValueCurrent(textareaName);
      jsonRow[flagActive] = buttonActive.classList.contains(flagDelete);
      return jsonRow;
    }
  }, {
    key: "initialiseRowNew",
    value: function initialiseRowNew(tbody, row) {
      product_variations_superPropGet(PageStoreProductVariations, "initialiseRowNew", this, 3)([tbody, row]);
      this.initialiseSliderDisplayOrderRowNew(tbody, row);
    }
  }, {
    key: "hookupTableMain",
    value: function hookupTableMain() {
      product_variations_superPropGet(PageStoreProductVariations, "hookupTableMain", this, 3)([]);
      this.hookupSlidersDisplayOrderTable();
      this.hookupTextareasCodeTable();
      this.hookupTextareasNameTable();
      this.hookupTextareasNamePluralTable();
      this.hookupFieldsProductVariation();
      this.hookupFieldsActive();
    }
  }, {
    key: "hookupTextareasNamePluralTable",
    value: function hookupTextareasNamePluralTable() {
      this.hookupChangeHandlerTableCells(idTableMain + ' tbody tr td.' + flagNamePlural + ' textarea');
    }
  }, {
    key: "hookupFieldsProductVariation",
    value: function hookupFieldsProductVariation() {
      this.hookupProductVariationsPreviews();
      this.hookupFieldsProductVariationDisplayOrder();
      this.hookupFieldsProductVariationCode();
      this.hookupFieldsProductVariationName();
      this.hookupFieldsProductVariationActive();
    }
  }, {
    key: "hookupProductVariationsPreviews",
    value: function hookupProductVariationsPreviews() {
      var _this3 = this;
      this.hookupEventHandler("click", idTableMain + ' td.' + flagProductVariations + ' div', function (event, element) {
        var td = DOM.getCellFromElement(element);
        if (!td.classList.contains(flagCollapsed)) return;
        _this3.handleClickProductVariationsPreview(event, element);
      });
    }
  }, {
    key: "handleClickProductVariationsPreview",
    value: function handleClickProductVariationsPreview(event, element) {
      var _this4 = this;
      if (_verbose) {
        console.log("click order items preview");
      }
      var row = DOM.getRowFromElement(element);
      var idProductVariationType = row.getAttribute(attrIdProductVariationType);
      var productVariationType = productVariationTypes[idProductVariationType];
      if (productVariationType == null) productVariationType = product_variations_defineProperty({}, flagProductVariations, []);
      var tblProductVariations = document.createElement("table");
      tblProductVariations.classList.add(flagProductVariations);
      var thead = document.createElement("thead");
      var tr = document.createElement("tr");
      var thDisplayOrder = document.createElement("th");
      thDisplayOrder.classList.add(flagDisplayOrder);
      thDisplayOrder.textContent = 'Display Order';
      var thCode = document.createElement("th");
      thCode.classList.add(flagCode);
      thCode.textContent = 'Code';
      var thName = document.createElement("th");
      thName.classList.add(flagName);
      thName.textContent = 'Name';
      var thActive = document.createElement("th");
      thActive.classList.add(flagActive);
      // thActive.textContent = 'Active';
      var buttonAdd = document.createElement("button");
      buttonAdd.classList.add(flagActive);
      buttonAdd.classList.add(flagAdd);
      buttonAdd.textContent = '+';
      thActive.appendChild(buttonAdd);
      tr.appendChild(thDisplayOrder);
      tr.appendChild(thCode);
      tr.appendChild(thName);
      tr.appendChild(thActive);
      thead.appendChild(tr);
      tblProductVariations.appendChild(thead);
      var tbody = document.createElement("tbody");
      productVariationType[flagProductVariations].forEach(function (productVariation, index) {
        _this4.addRowProductVariation(tbody, productVariation);
      });
      tblProductVariations.appendChild(tbody);
      var cell = DOM.getCellFromElement(element);
      var cellNew = cell.cloneNode(false);
      cellNew.appendChild(tblProductVariations);
      cellNew.classList.remove(flagCollapsed);
      row.replaceChild(cellNew, cell);
      if (_verbose) {
        console.log("tblProductVariations: ", tblProductVariations);
      }
      this.toggleColumnHeaderCollapsed(flagProductVariations, false);
      this.hookupFieldsProductVariation();
    }
  }, {
    key: "addRowProductVariation",
    value: function addRowProductVariation(tbody, productVariation) {
      if (_verbose) {
        console.log("addRowProductVariation: ", productVariation);
      }
      var tdDisplayOrder = document.createElement("td");
      tdDisplayOrder.classList.add(flagDisplayOrder);
      var inputDisplayOrder = document.createElement("input");
      inputDisplayOrder.classList.add(flagDisplayOrder);
      inputDisplayOrder.type = 'number';
      inputDisplayOrder.step = 1;
      DOM.setElementValuesCurrentAndPrevious(inputDisplayOrder, productVariation[flagDisplayOrder]);
      tdDisplayOrder.appendChild(inputDisplayOrder);
      var tdCode = document.createElement("td");
      tdCode.classList.add(flagCode);
      var textareaCode = document.createElement("textarea");
      textareaCode.classList.add(flagCode);
      DOM.setElementValuesCurrentAndPrevious(textareaCode, productVariation[flagCode]);
      tdCode.appendChild(textareaCode);
      var tdName = document.createElement("td");
      tdName.classList.add(flagName);
      var textareaName = document.createElement("textarea");
      textareaName.classList.add(flagName);
      DOM.setElementValuesCurrentAndPrevious(textareaName, productVariation[flagName]);
      tdName.appendChild(textareaName);
      var tdActive = this.createTdActive(productVariation[flagActive]);
      var tr = document.createElement("tr");
      tr.classList.add(flagProductVariation);
      tr.setAttribute(attrIdProductVariationType, productVariation[attrIdProductVariationType]);
      tr.setAttribute(attrIdProductVariation, productVariation[attrIdProductVariation]);
      tr.appendChild(tdDisplayOrder);
      tr.appendChild(tdCode);
      tr.appendChild(tdName);
      tr.appendChild(tdActive);
      tbody.appendChild(tr);
    }
  }, {
    key: "hookupFieldsProductVariationDisplayOrder",
    value: function hookupFieldsProductVariationDisplayOrder() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagProductVariations + ' td.' + flagDisplayOrder + ' input');
    }
  }, {
    key: "hookupFieldsProductVariationCode",
    value: function hookupFieldsProductVariationCode() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagProductVariations + ' textarea.' + flagCode);
    }
  }, {
    key: "hookupFieldsProductVariationName",
    value: function hookupFieldsProductVariationName() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagProductVariations + ' textarea.' + flagName);
    }
  }, {
    key: "hookupFieldsProductVariationActive",
    value: function hookupFieldsProductVariationActive() {
      var _this5 = this;
      this.hookupFieldsActive(flagProductVariations, function (event, element) {
        _this5.hookupButtonsProductVariationAdd(event, element);
      });
    }
  }, {
    key: "hookupButtonsProductVariationAdd",
    value: function hookupButtonsProductVariationAdd(event, element) {
      var row = element.closest(idTableMain + ' > tbody > tr');
      var idProductVariationType = row.getAttribute(attrIdProductVariationType);
      var idProductVariation = row.getAttribute(attrIdProductVariation);
      var countProductVariations = row.querySelectorAll('td.' + flagProductVariations + ' tr').length;
      var productVariation = product_variations_defineProperty(product_variations_defineProperty(product_variations_defineProperty(product_variations_defineProperty(product_variations_defineProperty(product_variations_defineProperty({}, attrIdProductVariationType, idProductVariationType), attrIdProductVariation, idProductVariation), flagCode, ''), flagName, ''), flagDisplayOrder, countProductVariations), flagActive, true);
      var tbody = row.querySelector('td.' + flagProductVariations + ' table tbody');
      this.addRowProductVariation(tbody, productVariation);
      this.hookupFieldsProductVariation();
    }
  }, {
    key: "leave",
    value: function leave() {
      product_variations_superPropGet(PageStoreProductVariations, "leave", this, 3)([]);
    }
  }]);
}(TableBasePage);
product_variations_defineProperty(PageStoreProductVariations, "hash", hashPageStoreProductVariations);
product_variations_defineProperty(PageStoreProductVariations, "attrIdRowObject", attrIdProductVariationType);

;// CONCATENATED MODULE: ./static/js/pages/store/stock_items.js
function stock_items_typeof(o) { "@babel/helpers - typeof"; return stock_items_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, stock_items_typeof(o); }
function stock_items_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function stock_items_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, stock_items_toPropertyKey(o.key), o); } }
function stock_items_createClass(e, r, t) { return r && stock_items_defineProperties(e.prototype, r), t && stock_items_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function stock_items_callSuper(t, o, e) { return o = stock_items_getPrototypeOf(o), stock_items_possibleConstructorReturn(t, stock_items_isNativeReflectConstruct() ? Reflect.construct(o, e || [], stock_items_getPrototypeOf(t).constructor) : o.apply(t, e)); }
function stock_items_possibleConstructorReturn(t, e) { if (e && ("object" == stock_items_typeof(e) || "function" == typeof e)) return e; if (void 0 !== e) throw new TypeError("Derived constructors may only return object or undefined"); return stock_items_assertThisInitialized(t); }
function stock_items_assertThisInitialized(e) { if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); return e; }
function stock_items_isNativeReflectConstruct() { try { var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); } catch (t) {} return (stock_items_isNativeReflectConstruct = function _isNativeReflectConstruct() { return !!t; })(); }
function stock_items_superPropGet(t, e, o, r) { var p = stock_items_get(stock_items_getPrototypeOf(1 & r ? t.prototype : t), e, o); return 2 & r && "function" == typeof p ? function (t) { return p.apply(o, t); } : p; }
function stock_items_get() { return stock_items_get = "undefined" != typeof Reflect && Reflect.get ? Reflect.get.bind() : function (e, t, r) { var p = stock_items_superPropBase(e, t); if (p) { var n = Object.getOwnPropertyDescriptor(p, t); return n.get ? n.get.call(arguments.length < 3 ? e : r) : n.value; } }, stock_items_get.apply(null, arguments); }
function stock_items_superPropBase(t, o) { for (; !{}.hasOwnProperty.call(t, o) && null !== (t = stock_items_getPrototypeOf(t));); return t; }
function stock_items_getPrototypeOf(t) { return stock_items_getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function (t) { return t.__proto__ || Object.getPrototypeOf(t); }, stock_items_getPrototypeOf(t); }
function stock_items_inherits(t, e) { if ("function" != typeof e && null !== e) throw new TypeError("Super expression must either be null or a function"); t.prototype = Object.create(e && e.prototype, { constructor: { value: t, writable: !0, configurable: !0 } }), Object.defineProperty(t, "prototype", { writable: !1 }), e && stock_items_setPrototypeOf(t, e); }
function stock_items_setPrototypeOf(t, e) { return stock_items_setPrototypeOf = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function (t, e) { return t.__proto__ = e, t; }, stock_items_setPrototypeOf(t, e); }
function stock_items_defineProperty(e, r, t) { return (r = stock_items_toPropertyKey(r)) in e ? Object.defineProperty(e, r, { value: t, enumerable: !0, configurable: !0, writable: !0 }) : e[r] = t, e; }
function stock_items_toPropertyKey(t) { var i = stock_items_toPrimitive(t, "string"); return "symbol" == stock_items_typeof(i) ? i : i + ""; }
function stock_items_toPrimitive(t, r) { if ("object" != stock_items_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != stock_items_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }








var PageStoreStockItems = /*#__PURE__*/function (_TableBasePage) {
  function PageStoreStockItems(router) {
    var _this;
    stock_items_classCallCheck(this, PageStoreStockItems);
    _this = stock_items_callSuper(this, PageStoreStockItems, [router]);
    stock_items_defineProperty(_this, "callSaveTableContent", api_API.saveStockItems);
    _this.storeMixin = new StoreTableMixinPage(_this);
    return _this;
  }
  stock_items_inherits(PageStoreStockItems, _TableBasePage);
  return stock_items_createClass(PageStoreStockItems, [{
    key: "initialize",
    value: function initialize() {
      this.sharedInitialize();
    }
  }, {
    key: "hookupFilters",
    value: function hookupFilters() {
      this.sharedHookupFilters();
      this.hookupFilterProductCategory();
      this.hookupFilterProduct();
      this.hookupFilterOutOfStock();
      this.hookupFilterMinStock();
      this.hookupFilterMaxStock();
    }
  }, {
    key: "hookupFilterProductCategory",
    value: function hookupFilterProductCategory() {
      this.hookupFilter(flagProductCategory, function (event, filterCategory) {
        // loadPermutations();
        // let wasDirtyFilter = filterCategory.classList.contains(flagDirty);
        PageStoreStockItems.isDirtyFilter(filterCategory);
        var isDirtyFilter = filterCategory.classList.contains(flagDirty);
        var idProductCategory = DOM.getElementValueCurrent(filterCategory);
        var products = productCategories[idProductCategory];
        var filterProduct = document.querySelector(idFormFilters + ' .' + flagProduct);
        var idProductPrevious = filterProduct.getAttribute(attrValuePrevious);
        filterProduct.innerHTML = '';
        var optionJson, option;
        option = DOM.createOption(null);
        filterProduct.appendChild(option);
        products.forEach(function (product) {
          optionJson = BusinessObjects.getOptionJsonFromObjectJson(product, idProductPrevious);
          option = DOM.createOption(optionJson);
          filterProduct.appendChild(option);
        });
        filterProduct.dispatchEvent(new Event('change'));
      });
    }
  }, {
    key: "hookupFilterProduct",
    value: function hookupFilterProduct() {
      this.hookupFilter(flagProduct);
    }
  }, {
    key: "hookupFilterOutOfStock",
    value: function hookupFilterOutOfStock() {
      this.hookupFilter(flagIsOutOfStock);
    }
  }, {
    key: "hookupFilterMinStock",
    value: function hookupFilterMinStock() {
      this.hookupFilter(flagQuantityMin);
    }
  }, {
    key: "hookupFilterMaxStock",
    value: function hookupFilterMaxStock() {
      this.hookupFilter(flagQuantityMax);
    }
  }, {
    key: "loadRowTable",
    value: function loadRowTable(rowJson) {}
  }, {
    key: "getJsonRow",
    value: function getJsonRow(row) {
      if (row == null) return;
      var tdProductCategory = row.querySelector('td.' + flagProductCategory);
      var tdProduct = row.querySelector('td.' + flagProduct);
      var tdProductVariations = row.querySelector('td.' + flagProductVariations);
      var tdCurrencyCost = row.querySelector('td.' + flagCurrencyCost);
      var inputCostLocalVatExcl = row.querySelector('td.' + flagCostUnitLocalVatExcl + ' input');
      var inputCostLocalVatIncl = row.querySelector('td.' + flagCostUnitLocalVatIncl + ' input');
      var inputDatePurchased = row.querySelector('td.' + flagDatePurchased + ' input');
      var inputDateReceived = row.querySelector('td.' + flagDateReceived + ' input');
      var tdStorageLocation = row.querySelector('td.' + flagStorageLocation);
      var inputIsSealed = row.querySelector('td.' + flagIsSealed + ' input');
      var inputDateUnsealed = row.querySelector('td.' + flagDateUnsealed + ' input');
      var inputDateExpiration = row.querySelector('td.' + flagDateExpiration + ' input');
      var inputIsConsumed = row.querySelector('td.' + flagIsConsumed + ' input');
      var inputDateConsumed = row.querySelector('td.' + flagDateConsumed + ' input');
      var buttonActive = row.querySelector(':scope > td.' + flagActive + ' button');
      var jsonRow = {};
      jsonRow[attrIdStockItem] = row.getAttribute(attrIdStockItem);
      jsonRow[attrIdProductPermutation] = tdProductVariations.getAttribute(attrIdProductPermutation);
      jsonRow[attrIdProductCategory] = DOM.getElementAttributeValueCurrent(tdProductCategory);
      jsonRow[attrIdProduct] = DOM.getElementAttributeValueCurrent(tdProduct);
      jsonRow[flagProductVariations] = DOM.getElementAttributeValueCurrent(tdProductVariations);
      jsonRow[flagHasVariations] = jsonRow[flagProductVariations] != '';
      jsonRow[flagCurrencyCost] = DOM.getElementAttributeValueCurrent(tdCurrencyCost);
      jsonRow[flagCostUnitLocalVatExcl] = DOM.getElementAttributeValueCurrent(inputCostLocalVatExcl);
      jsonRow[flagCostUnitLocalVatIncl] = DOM.getElementAttributeValueCurrent(inputCostLocalVatIncl);
      jsonRow[flagDatePurchased] = DOM.getElementAttributeValueCurrent(inputDatePurchased);
      jsonRow[flagDateReceived] = DOM.getElementAttributeValueCurrent(inputDateReceived);
      jsonRow[attrIdStorageLocation] = DOM.getElementAttributeValueCurrent(tdStorageLocation);
      jsonRow[flagIsSealed] = DOM.getElementAttributeValueCurrent(inputIsSealed);
      jsonRow[flagDateUnsealed] = DOM.getElementAttributeValueCurrent(inputDateUnsealed);
      jsonRow[flagDateExpiration] = DOM.getElementAttributeValueCurrent(inputDateExpiration);
      jsonRow[flagIsConsumed] = DOM.getElementAttributeValueCurrent(inputIsConsumed);
      jsonRow[flagDateConsumed] = DOM.getElementAttributeValueCurrent(inputDateConsumed);
      jsonRow[flagActive] = buttonActive.classList.contains(flagDelete);
      return jsonRow;
    }
  }, {
    key: "initialiseRowNew",
    value: function initialiseRowNew(tbody, row) {
      stock_items_superPropGet(PageStoreStockItems, "initialiseRowNew", this, 3)([tbody, row]);
      var ddlCategoryFilter = document.querySelector(idFormFilters + ' #' + attrIdProductCategory);
      var idProductCategoryFilter = DOM.getElementValueCurrent(ddlCategoryFilter);
      var hasCategoryFilter = !(validation_Validation.isEmpty(idProductCategoryFilter) || idProductCategoryFilter == '0');
      var ddlProductFilter = document.querySelector(idFormFilters + ' #' + attrIdProduct);
      var idProductFilter = DOM.getElementValueCurrent(ddlProductFilter);
      var hasProductFilter = !(validation_Validation.isEmpty(idProductFilter) || idProductFilter == '0');
      if (_verbose) {
        console.log("initialiseRowNew: ", row);
        console.log({
          ddlCategoryFilter: ddlCategoryFilter,
          idProductCategoryFilter: idProductCategoryFilter,
          hasCategoryFilter: hasCategoryFilter,
          ddlProductFilter: ddlProductFilter,
          idProductFilter: idProductFilter,
          hasProductFilter: hasProductFilter
        });
      }
      if (!hasCategoryFilter && !hasProductFilter) return;
      if (hasCategoryFilter) {
        var ddlCategory = row.querySelector('td.' + flagProductCategory + ' select');
        DOM.setElementValuesCurrentAndPrevious(ddlCategory, idProductCategoryFilter);
        this.handleChangeProductCategoryDdl(null, ddlCategory);
      }
      if (hasProductFilter) {
        var ddlProduct = row.querySelector('td.' + flagProduct + ' select');
        DOM.setElementValuesCurrentAndPrevious(ddlProduct, idProductFilter);
      }
    }
  }, {
    key: "hookupTableMain",
    value: function hookupTableMain() {
      stock_items_superPropGet(PageStoreStockItems, "hookupTableMain", this, 3)([]);
      this.hookupProductCategoryFields();
      this.hookupProductFields();
      this.hookupFieldsProductPermutationVariation();
      this.hookupCurrencyCostFields();
      this.hookupCostInputs();
      this.hookupOrderDateInputs();
      this.hookupStorageLocationFields();
      this.hookupSealingInputs();
      this.hookupExpirationDateInputs();
      this.hookupConsumationInputs();
      this.hookupFieldsActive();
    }
  }, {
    key: "hookupProductCategoryFields",
    value: function hookupProductCategoryFields() {
      var _this2 = this;
      this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagProductCategory, Utils.getListFromDict(productCategories), function (event, element) {
        _this2.hookupProductCategoryDdls(event, element);
      });
    }
  }, {
    key: "hookupProductFields",
    value: function hookupProductFields() {
      this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagProduct, Utils.getListFromDict(products));
    }

    /*
    handleClickProductPermutationVariationsPreview(event, element) {
        let row = DOM.getRowFromElement(element);
        let tdProduct = row.querySelector('td.' + flagProduct);
        let idProduct = DOM.getElementValueCurrent(tdProduct);
        let product = products[idProduct];
        if (!product[flagHasVariations]) return;
        super.handleClickProductPermutationVariationsPreview(event, element);
    }
    */
  }, {
    key: "handleClickButtonProductPermutationVariationsAdd",
    value: function handleClickButtonProductPermutationVariationsAdd(event, element) {
      var row = DOM.getRowFromElement(element);
      var tbody = row.querySelector('tbody');
      var permutationVariation = PageStoreStockItems.createOptionUnselectedProductVariation();
      this.addProductPermutationVariationRow(tbody, permutationVariation);
    }
  }, {
    key: "hookupCurrencyCostFields",
    value: function hookupCurrencyCostFields() {
      this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagCurrencyCost, Utils.getListFromDict(currencies));
    }
  }, {
    key: "hookupCostInputs",
    value: function hookupCostInputs() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagCostUnitLocalVatExcl + ' input');
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagCostUnitLocalVatIncl + ' input');
    }
  }, {
    key: "hookupOrderDateInputs",
    value: function hookupOrderDateInputs() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagDatePurchased + ' input');
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagDateReceived + ' input');
    }
  }, {
    key: "hookupStorageLocationFields",
    value: function hookupStorageLocationFields() {
      var _this3 = this;
      this.hookupEventHandler("click", idTableMain + ' td.' + flagStorageLocation + ' div', function (event, element) {
        return _this3.handleClickStorageLocationPreview(event, element);
      });
    }
  }, {
    key: "handleClickStorageLocationPreview",
    value: function handleClickStorageLocationPreview(event, element) {
      var _this4 = this;
      this.toggleColumnCollapsed(flagStorageLocation, false);
      var idPlant = element.getAttribute(attrIdPlant);
      var idStorageLocation = element.getAttribute(attrIdStorageLocation);
      var tblStorageLocation = document.createElement("table");
      tblStorageLocation.classList.add(flagStorageLocation);
      var thead = document.createElement("thead");
      var thPlant = document.createElement("th");
      thPlant.textContent = 'Plant';
      var thLocation = document.createElement("th");
      thLocation.textContent = 'Location';
      var trHead = document.createElement("tr");
      trHead.appendChild(thPlant);
      trHead.appendChild(thLocation);
      thead.appendChild(trHead);
      tblStorageLocation.appendChild(thead);
      var tbody = document.createElement("tbody");
      var plant, optionPlantJson, optionPlant, storageLocation, optionStorageLocationJson, optionStorageLocation;
      var plantKeys = Object.keys(plants);
      var storageLocationKeys = Object.keys(storageLocations);
      debugger;
      var plantJson = idPlant != null ? plants[idPlant] : stock_items_defineProperty({}, attrIdPlant, null);
      var storageLocationJson = idStorageLocation != null ? storageLocations[idStorageLocation] : stock_items_defineProperty({}, attrIdStorageLocation, null);
      var tdPlant = document.createElement("td");
      tdPlant.classList.add(flagPlant);
      DOM.setElementAttributesValuesCurrentAndPrevious(tdPlant, plantJson[attrIdPlant]);
      var ddlPlant = document.createElement("select");
      ddlPlant.classList.add(flagPlant);
      DOM.setElementAttributesValuesCurrentAndPrevious(ddlPlant, plantJson[attrIdPlant]);
      optionPlant = DOM.createOption(null);
      if (_verbose) {
        console.log("optionPlant: ", optionPlant);
      }
      ddlPlant.appendChild(optionPlant);
      plantKeys.forEach(function (plantKey) {
        plant = plants[plantKey];
        optionPlantJson = BusinessObjects.getOptionJsonFromObjectJson(plant,
        // objectJson
        plantJson[attrIdPlant] // valueSelected
        );
        optionPlant = DOM.createOption(optionPlantJson);
        if (_verbose) {
          console.log("optionPlant: ", optionPlant);
        }
        ddlPlant.appendChild(optionPlant);
      });
      var tdStorageLocation = document.createElement("td");
      tdStorageLocation.classList.add(flagStorageLocation);
      DOM.setElementAttributesValuesCurrentAndPrevious(tdStorageLocation, storageLocationJson[attrIdStorageLocation]);
      var ddlStorageLocation = document.createElement("select");
      ddlStorageLocation.classList.add(flagStorageLocation);
      DOM.setElementAttributesValuesCurrentAndPrevious(ddlStorageLocation, storageLocationJson[attrIdStorageLocation]);
      optionStorageLocation = DOM.createOption(null);
      if (_verbose) {
        console.log("optionStorageLocation: ", optionStorageLocation);
      }
      ddlStorageLocation.appendChild(optionStorageLocation);
      storageLocationKeys.forEach(function (StorageLocationKey) {
        storageLocation = storageLocations[StorageLocationKey];
        optionStorageLocationJson = BusinessObjects.getOptionJsonFromObjectJson(storageLocation,
        // objectJson
        storageLocationJson[attrIdStorageLocation] // valueSelected
        );
        optionStorageLocation = DOM.createOption(optionStorageLocationJson);
        if (_verbose) {
          console.log("optionStorageLocation: ", optionStorageLocation);
        }
        ddlStorageLocation.appendChild(optionStorageLocation);
      });
      var trBody = document.createElement("tr");
      tdPlant.appendChild(ddlPlant);
      trBody.appendChild(tdPlant);
      tdStorageLocation.appendChild(ddlStorageLocation);
      trBody.appendChild(tdStorageLocation);
      tbody.appendChild(trBody);
      tblStorageLocation.appendChild(tbody);
      var tdParent = DOM.getCellFromElement(element);
      tdParent.innerHTML = '';
      tdParent.appendChild(tblStorageLocation);
      if (_verbose) {
        console.log("tblStorageLocation: ", tblStorageLocation);
      }
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagPlant + ' select', function (event, element) {
        _this4.handleChangeStoragePlantDdl(event, element);
      });
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagStorageLocation + ' select', function (event, element) {
        _this4.handleChangeStorageLocationDdl(event, element);
      });
    }
  }, {
    key: "handleChangeStoragePlantDdl",
    value: function handleChangeStoragePlantDdl(event, ddlPlant) {
      this.handleChangeNestedElementCellTable(event, ddlPlant);
      var row = DOM.getRowFromElement(ddlPlant);
      var ddlStorageLocation = row.querySelector('td.' + flagStorageLocation + ' select');
      ddlStorageLocation.innerHTML = '';
      ddlStorageLocation.appendChild(DOM.createOption(null));
      var idPlant = DOM.getElementValueCurrent(ddlPlant);
      var storageLocations = plants[idPlant][flagStorageLocations];
      var optionJson, option;
      storageLocations.forEach(function (storageLocation) {
        optionJson = BusinessObjects.getOptionJsonFromObjectJson(storageLocation);
        option = DOM.createOption(optionJson);
        ddlStorageLocation.appendChild(option);
      });
      this.handleChangeNestedElementCellTable(event, ddlStorageLocation);
    }
  }, {
    key: "handleChangeStorageLocationDdl",
    value: function handleChangeStorageLocationDdl(event, ddlStorageLocation) {
      this.handleChangeNestedElementCellTable(event, ddlStorageLocation);
    }
  }, {
    key: "hookupSealingInputs",
    value: function hookupSealingInputs() {
      this.hookupIsSealedFields();
      this.hookupDateUnsealedInputs();
    }
  }, {
    key: "hookupIsSealedFields",
    value: function hookupIsSealedFields() {
      var _this5 = this;
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagIsSealed + ' input', function (event, element) {
        _this5.handleChangeNestedElementCellTable(event, element);
        var isSealed = DOM.getElementValueCurrent(element);
        var row = DOM.getRowFromElement(element);
        var inputDateUnsealed = row.querySelector('td.' + flagDateUnsealed + ' input');
        if (isSealed) {
          inputDateUnsealed.classList.add(flagCollapsed);
        } else {
          inputDateUnsealed.classList.remove(flagCollapsed);
        }
      });
    }
  }, {
    key: "hookupDateUnsealedInputs",
    value: function hookupDateUnsealedInputs() {
      this.hookupChangeHandlerTableCellsWhenNotCollapsed("change", idTableMain + ' td.' + flagDateUnsealed + ' input');
    }
  }, {
    key: "hookupExpirationDateInputs",
    value: function hookupExpirationDateInputs() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagDateExpiration + ' input');
    }
  }, {
    key: "hookupConsumationInputs",
    value: function hookupConsumationInputs() {
      this.hookupIsConsumedFields();
      this.hookupDateConsumedInputs();
    }
  }, {
    key: "hookupIsConsumedFields",
    value: function hookupIsConsumedFields() {
      var _this6 = this;
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagIsConsumed + ' input', function (event, element) {
        _this6.handleChangeNestedElementCellTable(event, element);
        var isConsumed = DOM.getElementValueCurrent(element);
        var row = DOM.getRowFromElement(element);
        var inputDateConsumed = row.querySelector('td.' + flagDateConsumed + ' input');
        if (isConsumed) {
          inputDateConsumed.classList.remove(flagCollapsed);
        } else {
          inputDateConsumed.classList.add(flagCollapsed);
        }
      });
    }
  }, {
    key: "hookupDateConsumedInputs",
    value: function hookupDateConsumedInputs() {
      this.hookupChangeHandlerTableCellsWhenNotCollapsed("change", idTableMain + ' td.' + flagDateConsumed + ' input');
    }
  }, {
    key: "leave",
    value: function leave() {
      stock_items_superPropGet(PageStoreStockItems, "leave", this, 3)([]);
    }
  }]);
}(TableBasePage);
stock_items_defineProperty(PageStoreStockItems, "hash", hashPageStoreStockItems);
stock_items_defineProperty(PageStoreStockItems, "attrIdRowObject", attrIdStockItem);

;// CONCATENATED MODULE: ./static/js/pages/store/suppliers.js
function suppliers_typeof(o) { "@babel/helpers - typeof"; return suppliers_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, suppliers_typeof(o); }
function suppliers_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function suppliers_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, suppliers_toPropertyKey(o.key), o); } }
function suppliers_createClass(e, r, t) { return r && suppliers_defineProperties(e.prototype, r), t && suppliers_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function suppliers_callSuper(t, o, e) { return o = suppliers_getPrototypeOf(o), suppliers_possibleConstructorReturn(t, suppliers_isNativeReflectConstruct() ? Reflect.construct(o, e || [], suppliers_getPrototypeOf(t).constructor) : o.apply(t, e)); }
function suppliers_possibleConstructorReturn(t, e) { if (e && ("object" == suppliers_typeof(e) || "function" == typeof e)) return e; if (void 0 !== e) throw new TypeError("Derived constructors may only return object or undefined"); return suppliers_assertThisInitialized(t); }
function suppliers_assertThisInitialized(e) { if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); return e; }
function suppliers_isNativeReflectConstruct() { try { var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); } catch (t) {} return (suppliers_isNativeReflectConstruct = function _isNativeReflectConstruct() { return !!t; })(); }
function suppliers_superPropGet(t, e, o, r) { var p = suppliers_get(suppliers_getPrototypeOf(1 & r ? t.prototype : t), e, o); return 2 & r && "function" == typeof p ? function (t) { return p.apply(o, t); } : p; }
function suppliers_get() { return suppliers_get = "undefined" != typeof Reflect && Reflect.get ? Reflect.get.bind() : function (e, t, r) { var p = suppliers_superPropBase(e, t); if (p) { var n = Object.getOwnPropertyDescriptor(p, t); return n.get ? n.get.call(arguments.length < 3 ? e : r) : n.value; } }, suppliers_get.apply(null, arguments); }
function suppliers_superPropBase(t, o) { for (; !{}.hasOwnProperty.call(t, o) && null !== (t = suppliers_getPrototypeOf(t));); return t; }
function suppliers_getPrototypeOf(t) { return suppliers_getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function (t) { return t.__proto__ || Object.getPrototypeOf(t); }, suppliers_getPrototypeOf(t); }
function suppliers_inherits(t, e) { if ("function" != typeof e && null !== e) throw new TypeError("Super expression must either be null or a function"); t.prototype = Object.create(e && e.prototype, { constructor: { value: t, writable: !0, configurable: !0 } }), Object.defineProperty(t, "prototype", { writable: !1 }), e && suppliers_setPrototypeOf(t, e); }
function suppliers_setPrototypeOf(t, e) { return suppliers_setPrototypeOf = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function (t, e) { return t.__proto__ = e, t; }, suppliers_setPrototypeOf(t, e); }
function suppliers_defineProperty(e, r, t) { return (r = suppliers_toPropertyKey(r)) in e ? Object.defineProperty(e, r, { value: t, enumerable: !0, configurable: !0, writable: !0 }) : e[r] = t, e; }
function suppliers_toPropertyKey(t) { var i = suppliers_toPrimitive(t, "string"); return "symbol" == suppliers_typeof(i) ? i : i + ""; }
function suppliers_toPrimitive(t, r) { if ("object" != suppliers_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != suppliers_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }








var PageStoreSuppliers = /*#__PURE__*/function (_TableBasePage) {
  function PageStoreSuppliers(router) {
    var _this;
    suppliers_classCallCheck(this, PageStoreSuppliers);
    _this = suppliers_callSuper(this, PageStoreSuppliers, [router]);
    suppliers_defineProperty(_this, "callSaveTableContent", api_API.saveSuppliers);
    _this.storeMixin = new StoreTableMixinPage(_this);
    return _this;
  }
  suppliers_inherits(PageStoreSuppliers, _TableBasePage);
  return suppliers_createClass(PageStoreSuppliers, [{
    key: "initialize",
    value: function initialize() {
      this.sharedInitialize();
    }
  }, {
    key: "hookupFilters",
    value: function hookupFilters() {
      this.sharedHookupFilters();
      this.hookupFilterActive();
    }
  }, {
    key: "loadRowTable",
    value: function loadRowTable(rowJson) {}
  }, {
    key: "getJsonRow",
    value: function getJsonRow(row) {
      if (row == null) return;
      var textareaNameCompany = row.querySelector('td.' + flagNameCompany + ' textarea');
      var textareaNameContact = row.querySelector('td.' + flagNameContact + ' textarea');
      var textareaDepartmentContact = row.querySelector('td.' + flagDepartmentContact + ' textarea');
      var tdAddress = row.querySelector('td.' + flagAddress);
      var textareaPhoneNumber = row.querySelector('td.' + flagPhoneNumber + ' textarea');
      var textareaFax = row.querySelector('td.' + flagFax + ' textarea');
      var textareaEmail = row.querySelector('td.' + flagEmail + ' textarea');
      var textareaWebsite = row.querySelector('td.' + flagWebsite + ' textarea');
      var tdCurrency = row.querySelector('td.' + flagCurrency);
      var buttonActive = row.querySelector(':scope > td.' + flagActive + ' button');
      var jsonRow = {};
      jsonRow[attrIdSupplier] = row.getAttribute(attrIdSupplier);
      jsonRow[flagNameCompany] = DOM.getElementAttributeValueCurrent(textareaNameCompany);
      jsonRow[flagNameContact] = DOM.getElementAttributeValueCurrent(textareaNameContact);
      jsonRow[flagDepartmentContact] = DOM.getElementAttributeValueCurrent(textareaDepartmentContact);
      jsonRow[attrIdSupplierAddress] = DOM.getElementAttributeValueCurrent(tdAddress);
      jsonRow[flagSupplierAddress] = this.getSupplierAddressesFromRow(row);
      jsonRow[flagPhoneNumber] = DOM.getElementAttributeValueCurrent(textareaPhoneNumber);
      jsonRow[flagFax] = DOM.getElementAttributeValueCurrent(textareaFax);
      jsonRow[flagEmail] = DOM.getElementAttributeValueCurrent(textareaEmail);
      jsonRow[flagWebsite] = DOM.getElementAttributeValueCurrent(textareaWebsite);
      jsonRow[attrIdCurrency] = DOM.getElementAttributeValueCurrent(tdCurrency);
      jsonRow[flagActive] = buttonActive.classList.contains(flagDelete);
      return jsonRow;
    }
  }, {
    key: "getSupplierAddressesFromRow",
    value: function getSupplierAddressesFromRow(row) {
      var supplierAddresses = [];
      var trs = row.querySelectorAll('td.' + flagAddress + ' tbody tr');
      var address, inputPostcode, inputAddressLine1, inputAddressLine2, inputCity, inputCounty, ddlRegion, inputActive;
      trs.forEach(function (tr) {
        inputPostcode = tr.querySelector('td.' + flagPostcode + ' textarea');
        inputAddressLine1 = tr.querySelector('td.' + flagAddressLine1 + ' textarea');
        inputAddressLine2 = tr.querySelector('td.' + flagAddressLine2 + ' textarea');
        inputCity = tr.querySelector('td.' + flagCity + ' textarea');
        inputCounty = tr.querySelector('td.' + flagCounty + ' textarea');
        ddlRegion = tr.querySelector('td.' + flagRegion + ' select');
        inputActive = tr.querySelector('td.' + flagActive + ' input');
        address = suppliers_defineProperty(suppliers_defineProperty(suppliers_defineProperty(suppliers_defineProperty(suppliers_defineProperty(suppliers_defineProperty(suppliers_defineProperty(suppliers_defineProperty(suppliers_defineProperty({}, attrIdSupplierAddress, tr.getAttribute(attrIdSupplierAddress)), attrIdSupplier, row.getAttribute(attrIdSupplier)), flagPostcode, DOM.getElementAttributeValueCurrent(inputPostcode)), flagAddressLine1, DOM.getElementAttributeValueCurrent(inputAddressLine1)), flagAddressLine2, DOM.getElementAttributeValueCurrent(inputAddressLine2)), flagCity, DOM.getElementAttributeValueCurrent(inputCity)), flagCounty, DOM.getElementAttributeValueCurrent(inputCounty)), attrIdRegion, DOM.getElementAttributeValueCurrent(ddlRegion)), flagActive, DOM.getElementAttributeValueCurrent(inputActive));
        supplierAddresses.push(address);
      });
      return supplierAddresses;
    }
  }, {
    key: "initialiseRowNew",
    value: function initialiseRowNew(tbody, row) {
      suppliers_superPropGet(PageStoreSuppliers, "initialiseRowNew", this, 3)([tbody, row]);
    }
  }, {
    key: "hookupTableMain",
    value: function hookupTableMain() {
      suppliers_superPropGet(PageStoreSuppliers, "hookupTableMain", this, 3)([]);
      this.hookupNameCompanyInputs();
      this.hookupNameContactInputs();
      this.hookupDepartmentContactInputs();
      this.hookupAddressFields();
      this.hookupPhoneNumberInputs();
      this.hookupFaxInputs();
      this.hookupEmailInputs();
      this.hookupWebsiteInputs();
      this.hookupCurrencyFields();
      this.hookupFieldsActive();
    }
  }, {
    key: "hookupNameCompanyInputs",
    value: function hookupNameCompanyInputs() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagNameCompany + ' textarea');
    }
  }, {
    key: "hookupNameContactInputs",
    value: function hookupNameContactInputs() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagNameContact + ' textarea');
    }
  }, {
    key: "hookupDepartmentContactInputs",
    value: function hookupDepartmentContactInputs() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagDepartmentContact + ' textarea');
    }
  }, {
    key: "hookupAddressFields",
    value: function hookupAddressFields() {
      this.hookupAddressPreviews();
      this.hookupAddressPostcodeInputs();
      this.hookupAddressLine1Inputs();
      this.hookupAddressLine2Inputs();
      this.hookupAddressCityInputs();
      this.hookupAddressCountyInputs();
      this.hookupAddressRegionDdls();
      this.hookupAddressActiveCheckboxes();
      this.hookupAddressDeleteButtons();
      this.hookupAddressUndeleteButtons();
      this.hookupAddressAddButtons();
    }
  }, {
    key: "hookupAddressPreviews",
    value: function hookupAddressPreviews() {
      var _this2 = this;
      this.hookupEventHandler("click", idTableMain + ' td.' + flagAddress, function (event, td) {
        if (!td.classList.contains(flagCollapsed)) return;
        _this2.handleClickAddressPreview(event, td);
      });
    }
  }, {
    key: "handleClickAddressPreview",
    value: function handleClickAddressPreview(event, element) {
      var _this3 = this;
      if (_verbose) {
        console.log("click address preview");
      }
      this.toggleColumnHeaderCollapsed(flagAddress, false);
      element.classList.remove(flagCollapsed);
      var row = DOM.getRowFromElement(element);
      var idSupplier = row.getAttribute(attrIdSupplier);
      var supplierAddressList = idSupplier > 0 ? supplierAddresses[idSupplier] : [];
      var tblAddresses = document.createElement("table");
      tblAddresses.classList.add(flagAddress);
      var thead = document.createElement("thead");
      var tr = document.createElement("tr");
      var thPostcode = document.createElement("th");
      thPostcode.classList.add(flagPostcode);
      thPostcode.textContent = 'Postcode';
      var thAddressLine1 = document.createElement("th");
      thAddressLine1.classList.add(flagAddressLine1);
      thAddressLine1.textContent = 'Address Line 1';
      var thAddressLine2 = document.createElement("th");
      thAddressLine2.classList.add(flagAddressLine2);
      thAddressLine2.textContent = 'Address Line 2';
      var thCity = document.createElement("th");
      thCity.classList.add(flagCity);
      thCity.textContent = 'City';
      var thCounty = document.createElement("th");
      thCounty.classList.add(flagCounty);
      thCounty.textContent = 'County';
      var thRegion = document.createElement("th");
      thRegion.classList.add(flagRegion);
      thRegion.textContent = 'Region';
      var thActive = document.createElement("th");
      thActive.classList.add(flagActive);
      thActive.textContent = 'Active';
      var thAddDelete = document.createElement("th");
      thAddDelete.classList.add(flagAdd);
      var buttonAdd = document.createElement("button");
      buttonAdd.classList.add(flagAdd);
      buttonAdd.textContent = '+';
      thAddDelete.appendChild(buttonAdd);
      tr.appendChild(thPostcode);
      tr.appendChild(thAddressLine1);
      tr.appendChild(thAddressLine2);
      tr.appendChild(thCity);
      tr.appendChild(thCounty);
      tr.appendChild(thRegion);
      tr.appendChild(thActive);
      tr.appendChild(thAddDelete);
      thead.appendChild(tr);
      tblAddresses.appendChild(thead);
      var tbody = document.createElement("tbody");
      var regionOptions = Utils.getListFromDict(regions);
      supplierAddressList.forEach(function (supplierAddress, index) {
        _this3.addRowSupplierAddress(tbody, supplierAddress, regionOptions);
      });
      tblAddresses.appendChild(tbody);
      var cell = DOM.getCellFromElement(element);
      var cellNew = cell.cloneNode(false);
      cellNew.appendChild(tblAddresses);
      row.replaceChild(cellNew, cell);
      if (_verbose) {
        console.log("tblAddresses: ", tblAddresses);
      }
      this.hookupAddressFields();
    }
  }, {
    key: "addRowSupplierAddress",
    value: function addRowSupplierAddress(tbody, supplierAddress, regionOptions) {
      if (_verbose) {
        console.log("addRowSupplierAddress: ", supplierAddress);
      }
      var tdPostcode = document.createElement("td");
      tdPostcode.classList.add(flagPostcode);
      var textareaPostcode = document.createElement("textarea");
      textareaPostcode.classList.add(flagPostcode);
      DOM.setElementValuesCurrentAndPrevious(textareaPostcode, supplierAddress[flagPostcode]);
      tdPostcode.appendChild(textareaPostcode);
      var tdAddressLine1 = document.createElement("td");
      tdAddressLine1.classList.add(flagAddressLine1);
      var textareaAddressLine1 = document.createElement("textarea");
      textareaAddressLine1.classList.add(flagAddressLine1);
      DOM.setElementValuesCurrentAndPrevious(textareaAddressLine1, supplierAddress[flagAddressLine1]);
      tdAddressLine1.appendChild(textareaAddressLine1);
      var tdAddressLine2 = document.createElement("td");
      tdAddressLine2.classList.add(flagAddressLine2);
      var textareaAddressLine2 = document.createElement("textarea");
      textareaAddressLine2.classList.add(flagAddressLine2);
      DOM.setElementValuesCurrentAndPrevious(textareaAddressLine2, supplierAddress[flagAddressLine2]);
      tdAddressLine2.appendChild(textareaAddressLine2);
      var tdCity = document.createElement("td");
      tdCity.classList.add(flagCity);
      var textareaCity = document.createElement("textarea");
      textareaCity.classList.add(flagCity);
      DOM.setElementValuesCurrentAndPrevious(textareaCity, supplierAddress[flagCity]);
      tdCity.appendChild(textareaCity);
      var tdCounty = document.createElement("td");
      tdCounty.classList.add(flagCounty);
      var textareaCounty = document.createElement("textarea");
      textareaCounty.classList.add(flagCounty);
      DOM.setElementValuesCurrentAndPrevious(textareaCounty, supplierAddress[flagCounty]);
      tdCounty.appendChild(textareaCounty);
      var region = supplierAddress[flagRegion];
      if (!region) region = suppliers_defineProperty({}, attrIdRegion, '');
      var tdRegion = document.createElement("td");
      tdRegion.classList.add(flagRegion);
      DOM.setElementAttributesValuesCurrentAndPrevious(tdRegion, region[attrIdRegion]);
      var ddlRegion = document.createElement("select");
      ddlRegion.classList.add(flagRegion);
      var optionJson, option;
      option = DOM.createOption(null);
      ddlRegion.appendChild(option);
      regionOptions.forEach(function (regionOption) {
        optionJson = BusinessObjects.getOptionJsonFromObjectJson(regionOption);
        option = DOM.createOption(optionJson);
        ddlRegion.appendChild(option);
      });
      DOM.setElementValuesCurrentAndPrevious(ddlRegion, region[attrIdRegion]);
      tdRegion.appendChild(ddlRegion);
      var tdActive = this.createTdActive(supplierAddress[flagActive]);
      var tr = document.createElement("tr");
      tr.setAttribute(attrIdSupplierAddress, supplierAddress[attrIdSupplierAddress]);
      tr.setAttribute(attrIdSupplier, supplierAddress[attrIdSupplier]);
      tr.appendChild(tdPostcode);
      tr.appendChild(tdAddressLine1);
      tr.appendChild(tdAddressLine2);
      tr.appendChild(tdCity);
      tr.appendChild(tdCounty);
      tr.appendChild(tdRegion);
      tr.appendChild(tdActive);
      tbody.appendChild(tr);
    }
  }, {
    key: "hookupAddressPostcodeInputs",
    value: function hookupAddressPostcodeInputs() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagAddress + ' textarea.' + flagPostcode);
    }
  }, {
    key: "hookupAddressLine1Inputs",
    value: function hookupAddressLine1Inputs() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagAddress + ' textarea.' + flagAddressLine1);
    }
  }, {
    key: "hookupAddressLine2Inputs",
    value: function hookupAddressLine2Inputs() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagAddress + ' textarea.' + flagAddressLine2);
    }
  }, {
    key: "hookupAddressCityInputs",
    value: function hookupAddressCityInputs() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagAddress + ' textarea.' + flagCity);
    }
  }, {
    key: "hookupAddressCountyInputs",
    value: function hookupAddressCountyInputs() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagAddress + ' textarea.' + flagCounty);
    }
  }, {
    key: "hookupAddressRegionDdls",
    value: function hookupAddressRegionDdls() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagAddress + ' select.' + flagRegion);
    }
  }, {
    key: "hookupAddressActiveCheckboxes",
    value: function hookupAddressActiveCheckboxes() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagAddress + ' input.' + flagActive, function (event, element) {
        var rowSupplierAddress = element.closest('tr');
        var idAddress = rowSupplierAddress.getAttribute(attrIdSupplierAddress);
        DOM.setElementAttributeValueCurrent(rowSupplierAddress, idAddress);
        var rowSupplier = rowSupplierAddress.closest(idTableMain + ' > tbody > tr');
        var checkboxesActive = rowSupplier.querySelectorAll('td.' + flagAddress + ' input.' + flagActive);
        var isActive = element.checked;
        if (isActive) {
          checkboxesActive.forEach(function (checkbox) {
            if (checkbox == element) return;
            DOM.setElementValueCurrent(checkbox, false);
          });
        }
        /*
        else if (checkboxesActive.length > 0) {
            DOM.setElementValueCurrent(checkboxesActive[0], false);
        }
        */
      });
    }
  }, {
    key: "hookupFieldsAddressAddDelete",
    value: function hookupFieldsAddressAddDelete() {
      var selectorButton = idTableMain + ' td.' + flagAddress + ' button';
      var selectorButtonDelete = selectorButton + '.' + flagDelete;
      var selectorButtonUndelete = selectorButton + '.' + flagAdd;
      this.hookupButtonsRowDelete(selectorButtonDelete, selectorButtonUndelete);
      this.hookupButtonsRowUndelete(selectorButtonDelete, selectorButtonUndelete);
    }
  }, {
    key: "hookupAddressDeleteButtons",
    value: function hookupAddressDeleteButtons() {
      var _this4 = this;
      this.hookupEventHandler("click", idTableMain + ' td.' + flagAddress + ' button.' + flagDelete, function (event, element) {
        var row = DOM.getRowFromElement(element);
        row.classList.add(flagDelete);
        var buttonAdd = document.createElement("button");
        buttonAdd.classList.add(flagAdd);
        buttonAdd.textContent = '+';
        element.replaceWith(buttonAdd);
        _this4.hookupAddressUndeleteButtons();
      });
    }
  }, {
    key: "hookupAddressUndeleteButtons",
    value: function hookupAddressUndeleteButtons() {
      var _this5 = this;
      this.hookupEventHandler("click", idTableMain + ' td.' + flagAddress + ' td button.' + flagAdd, function (event, element) {
        var row = DOM.getRowFromElement(element);
        row.classList.remove(flagDelete);
        var buttonDelete = document.createElement("button");
        buttonDelete.classList.add(flagDelete);
        buttonDelete.textContent = 'x';
        element.replaceWith(buttonDelete);
        _this5.hookupAddressDeleteButtons();
      });
    }
  }, {
    key: "hookupAddressAddButtons",
    value: function hookupAddressAddButtons() {
      var _this6 = this;
      this.hookupEventHandler("click", idTableMain + ' td.' + flagAddress + ' th button.' + flagAdd, function (event, element) {
        var row = element.closest(idTableMain + ' > tbody > tr');
        var idSupplier = row.getAttribute(attrIdSupplier);
        var hasActiveAddress = row.querySelectorAll('td.' + flagAddress + ' input.' + flagActive + ':checked').length > 0;
        var countSupplierAddresses = row.querySelectorAll('td.' + flagAddress + ' td.' + flagAddress).length;
        var supplierAddress = suppliers_defineProperty(suppliers_defineProperty(suppliers_defineProperty(suppliers_defineProperty(suppliers_defineProperty(suppliers_defineProperty(suppliers_defineProperty(suppliers_defineProperty(suppliers_defineProperty({}, attrIdSupplier, idSupplier), attrIdSupplierAddress, -1 - countSupplierAddresses), flagPostcode, ''), flagAddressLine1, ''), flagAddressLine2, ''), flagCity, ''), flagCounty, ''), attrIdRegion, ''), flagActive, !hasActiveAddress);
        var tbody = row.querySelector('td.' + flagAddress + ' table tbody');
        _this6.addRowSupplierAddress(tbody, supplierAddress, Utils.getListFromDict(regions));
        if (!hasActiveAddress) {
          var tdAddress = row.querySelector('td.' + flagAddress);
          // tdAddress.setAttribute(attrIdSupplierAddress, supplierAddress[attrIdSupplierAddress]);
          DOM.setElementAttributeValueCurrent(tdAddress, supplierAddress[attrIdSupplierAddress]);
        }
        _this6.hookupAddressFields();
      });
    }
  }, {
    key: "hookupPhoneNumberInputs",
    value: function hookupPhoneNumberInputs() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagPhoneNumber + ' textarea');
    }
  }, {
    key: "hookupFaxInputs",
    value: function hookupFaxInputs() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagFax + ' textarea');
    }
  }, {
    key: "hookupEmailInputs",
    value: function hookupEmailInputs() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagEmail + ' textarea');
    }
  }, {
    key: "hookupWebsiteInputs",
    value: function hookupWebsiteInputs() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagWebsite + ' textarea');
    }
  }, {
    key: "leave",
    value: function leave() {
      suppliers_superPropGet(PageStoreSuppliers, "leave", this, 3)([]);
    }
  }]);
}(TableBasePage);
suppliers_defineProperty(PageStoreSuppliers, "hash", hashPageStoreSuppliers);
suppliers_defineProperty(PageStoreSuppliers, "attrIdRowObject", attrIdSupplier);

;// CONCATENATED MODULE: ./static/js/pages/store/supplier_purchase_orders.js
function supplier_purchase_orders_typeof(o) { "@babel/helpers - typeof"; return supplier_purchase_orders_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, supplier_purchase_orders_typeof(o); }
function supplier_purchase_orders_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function supplier_purchase_orders_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, supplier_purchase_orders_toPropertyKey(o.key), o); } }
function supplier_purchase_orders_createClass(e, r, t) { return r && supplier_purchase_orders_defineProperties(e.prototype, r), t && supplier_purchase_orders_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function supplier_purchase_orders_callSuper(t, o, e) { return o = supplier_purchase_orders_getPrototypeOf(o), supplier_purchase_orders_possibleConstructorReturn(t, supplier_purchase_orders_isNativeReflectConstruct() ? Reflect.construct(o, e || [], supplier_purchase_orders_getPrototypeOf(t).constructor) : o.apply(t, e)); }
function supplier_purchase_orders_possibleConstructorReturn(t, e) { if (e && ("object" == supplier_purchase_orders_typeof(e) || "function" == typeof e)) return e; if (void 0 !== e) throw new TypeError("Derived constructors may only return object or undefined"); return supplier_purchase_orders_assertThisInitialized(t); }
function supplier_purchase_orders_assertThisInitialized(e) { if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); return e; }
function supplier_purchase_orders_isNativeReflectConstruct() { try { var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); } catch (t) {} return (supplier_purchase_orders_isNativeReflectConstruct = function _isNativeReflectConstruct() { return !!t; })(); }
function supplier_purchase_orders_superPropGet(t, e, o, r) { var p = supplier_purchase_orders_get(supplier_purchase_orders_getPrototypeOf(1 & r ? t.prototype : t), e, o); return 2 & r && "function" == typeof p ? function (t) { return p.apply(o, t); } : p; }
function supplier_purchase_orders_get() { return supplier_purchase_orders_get = "undefined" != typeof Reflect && Reflect.get ? Reflect.get.bind() : function (e, t, r) { var p = supplier_purchase_orders_superPropBase(e, t); if (p) { var n = Object.getOwnPropertyDescriptor(p, t); return n.get ? n.get.call(arguments.length < 3 ? e : r) : n.value; } }, supplier_purchase_orders_get.apply(null, arguments); }
function supplier_purchase_orders_superPropBase(t, o) { for (; !{}.hasOwnProperty.call(t, o) && null !== (t = supplier_purchase_orders_getPrototypeOf(t));); return t; }
function supplier_purchase_orders_getPrototypeOf(t) { return supplier_purchase_orders_getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function (t) { return t.__proto__ || Object.getPrototypeOf(t); }, supplier_purchase_orders_getPrototypeOf(t); }
function supplier_purchase_orders_inherits(t, e) { if ("function" != typeof e && null !== e) throw new TypeError("Super expression must either be null or a function"); t.prototype = Object.create(e && e.prototype, { constructor: { value: t, writable: !0, configurable: !0 } }), Object.defineProperty(t, "prototype", { writable: !1 }), e && supplier_purchase_orders_setPrototypeOf(t, e); }
function supplier_purchase_orders_setPrototypeOf(t, e) { return supplier_purchase_orders_setPrototypeOf = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function (t, e) { return t.__proto__ = e, t; }, supplier_purchase_orders_setPrototypeOf(t, e); }
function supplier_purchase_orders_defineProperty(e, r, t) { return (r = supplier_purchase_orders_toPropertyKey(r)) in e ? Object.defineProperty(e, r, { value: t, enumerable: !0, configurable: !0, writable: !0 }) : e[r] = t, e; }
function supplier_purchase_orders_toPropertyKey(t) { var i = supplier_purchase_orders_toPrimitive(t, "string"); return "symbol" == supplier_purchase_orders_typeof(i) ? i : i + ""; }
function supplier_purchase_orders_toPrimitive(t, r) { if ("object" != supplier_purchase_orders_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != supplier_purchase_orders_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }









var PageStoreSupplierPurchaseOrders = /*#__PURE__*/function (_TableBasePage) {
  function PageStoreSupplierPurchaseOrders(router) {
    var _this;
    supplier_purchase_orders_classCallCheck(this, PageStoreSupplierPurchaseOrders);
    _this = supplier_purchase_orders_callSuper(this, PageStoreSupplierPurchaseOrders, [router]);
    supplier_purchase_orders_defineProperty(_this, "callSaveTableContent", api_API.saveSupplierPurchaseOrders);
    _this.storeMixin = new StoreTableMixinPage(_this);
    return _this;
  }
  supplier_purchase_orders_inherits(PageStoreSupplierPurchaseOrders, _TableBasePage);
  return supplier_purchase_orders_createClass(PageStoreSupplierPurchaseOrders, [{
    key: "initialize",
    value: function initialize() {
      this.sharedInitialize();
    }
  }, {
    key: "hookupFilters",
    value: function hookupFilters() {
      this.sharedHookupFilters();
      this.hookupFilterActive();
    }
  }, {
    key: "loadRowTable",
    value: function loadRowTable(rowJson) {}
  }, {
    key: "getJsonRow",
    value: function getJsonRow(row) {
      var _this2 = this;
      if (row == null) return;
      var tdSupplier = row.querySelector('td.' + flagSupplier);
      var tdCurrency = row.querySelector('td.' + flagCurrency);
      var inputCostTotalLocalVatExcl = row.querySelector('td.' + flagCostTotalLocalVatExcl + ' input');
      var inputCostTotalLocalVatIncl = row.querySelector('td.' + flagCostTotalLocalVatIncl + ' input');
      var trsPurchaseOrderItem = row.querySelectorAll('tr.' + flagOrderItems);
      var buttonActive = tr.querySelector(':scope > td.' + flagActive + ' button');
      var jsonRow = {};
      jsonRow[attrIdSupplierPurchaseOrder] = row.getAttribute(attrIdSupplierPurchaseOrder);
      jsonRow[attrIdSupplier] = DOM.getElementAttributeValueCurrent(tdSupplier);
      jsonRow[attrIdCurrency] = DOM.getElementAttributeValueCurrent(tdCurrency);
      jsonRow[flagCostTotalLocalVatExcl] = DOM.getElementAttributeValueCurrent(inputCostTotalLocalVatExcl);
      jsonRow[flagCostTotalLocalVatIncl] = DOM.getElementAttributeValueCurrent(inputCostTotalLocalVatIncl);
      // jsonRow[flagOrderItems] = DOM.getElementAttributeValueCurrent(tdItems);
      var orderItems = [];
      if (trsPurchaseOrderItem != null) {
        trsPurchaseOrderItem.forEach(function (tr) {
          orderItems.push(_this2.getJsonRowOrderItem(tr));
        });
      }
      jsonRow[flagOrderItems] = orderItems;
      jsonRow[flagActive] = buttonActive.classList.contains(flagDelete);
      return jsonRow;
    }
  }, {
    key: "getJsonRowOrderItem",
    value: function getJsonRowOrderItem(tr) {
      var inputDisplayOrder = tr.querySelector('td.' + flagDisplayOrder + ' input');
      var tdCategory = tr.querySelector('td.' + flagProductCategory);
      var tdProduct = tr.querySelector('td.' + flagProduct);
      var tdVariations = tr.querySelector('td.' + flagProductVariations);
      var tdUnitQuantity = tr.querySelector('td.' + flagUnitMeasurementQuantity);
      var inputQuantityOrdered = tr.querySelector('td.' + flagQuantityOrdered + ' input');
      var inputQuantityReceived = tr.querySelector('td.' + flagQuantityReceived + ' input');
      var inputCostTotalLocalVatExcl = tr.querySelector('td.' + flagCostTotalLocalVatExcl + ' input');
      var inputCostTotalLocalVatIncl = tr.querySelector('td.' + flagCostTotalLocalVatIncl + ' input');
      var inputLatencyDeliveryDays = tr.querySelector('td.' + flagLatencyDeliveryDays + ' input');
      var buttonActive = tr.querySelector(':scope > td.' + flagActive + ' button');
      var jsonRow = {};
      jsonRow[attrIdSupplierPurchaseOrder] = tr.getAttribute(attrIdSupplierPurchaseOrder);
      jsonRow[attrIdSupplierPurchaseOrderProductLink] = tr.getAttribute(attrIdSupplierPurchaseOrderProductLink);
      jsonRow[flagDisplayOrder] = DOM.getElementAttributeValueCurrent(inputDisplayOrder);
      jsonRow[attrIdProductCategory] = DOM.getElementAttributeValueCurrent(tdCategory);
      jsonRow[attrIdProduct] = DOM.getElementAttributeValueCurrent(tdProduct);
      jsonRow[flagProductVariations] = DOM.getElementAttributeValueCurrent(tdVariations);
      jsonRow[attrIdUnitMeasurementQuantity] = DOM.getElementAttributeValueCurrent(tdUnitQuantity);
      jsonRow[flagQuantityOrdered] = DOM.getElementAttributeValueCurrent(inputQuantityOrdered);
      jsonRow[flagQuantityReceived] = DOM.getElementAttributeValueCurrent(inputQuantityReceived);
      jsonRow[flagCostTotalLocalVatExcl] = DOM.getElementAttributeValueCurrent(inputCostTotalLocalVatExcl);
      jsonRow[flagCostTotalLocalVatIncl] = DOM.getElementAttributeValueCurrent(inputCostTotalLocalVatIncl);
      jsonRow[flagLatencyDeliveryDays] = DOM.getElementAttributeValueCurrent(inputLatencyDeliveryDays);
      jsonRow[flagActive] = buttonActive.classList.contains(flagDelete);
      return jsonRow;
    }
  }, {
    key: "initialiseRowNew",
    value: function initialiseRowNew(tbody, row) {
      supplier_purchase_orders_superPropGet(PageStoreSupplierPurchaseOrders, "initialiseRowNew", this, 3)([tbody, row]);
    }
  }, {
    key: "hookupTableMain",
    value: function hookupTableMain() {
      supplier_purchase_orders_superPropGet(PageStoreSupplierPurchaseOrders, "hookupTableMain", this, 3)([]);
      this.hookupSupplierFields();
      this.hookupCurrencyFields();
      this.hookupCostInputs();
      this.hookupOrderItemsFields();
      this.hookupFieldsActive();
    }
  }, {
    key: "hookupSupplierFields",
    value: function hookupSupplierFields() {
      this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagSupplier, Utils.getListFromDict(suppliers));
    }
  }, {
    key: "hookupCostInputs",
    value: function hookupCostInputs() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagCostTotalLocalVatExcl + ' input');
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagCostTotalLocalVatIncl + ' input');
    }
  }, {
    key: "hookupOrderItemsFields",
    value: function hookupOrderItemsFields() {
      this.hookupOrderItemsPreviews();
      this.hookupFieldsOrderItemDisplayOrder();
      this.hookupFieldsOrderItemProductCategory();
      this.hookupFieldsOrderItemProduct();
      // this.hookupFieldsOrderItemProductVariations();
      this.hookupFieldsProductPermutationVariation();
      this.hookupFieldsOrderItemUnitQuantity();
      this.hookupFieldsOrderItemQuantityOrdered();
      this.hookupFieldsOrderItemQuantityReceived();
      this.hookupFieldsOrderItemCostTotalLocalVatExcl();
      this.hookupFieldsOrderItemCostTotalLocalVatIncl();
      this.hookupFieldsOrderItemLatencyDeliveryDays();
      this.hookupFieldsOrderItemActive();
      this.hookupFieldsOrderItemAddDelete();
    }
  }, {
    key: "hookupOrderItemsPreviews",
    value: function hookupOrderItemsPreviews() {
      var _this3 = this;
      this.hookupEventHandler("click", idTableMain + ' > tbody > tr > td.' + flagOrderItems + ' > div', function (event, div) {
        var td = DOM.getCellFromElement(div);
        if (!td.classList.contains(flagCollapsed)) return;
        _this3.handleClickOrderItemsPreview(event, div);
      });
    }
  }, {
    key: "handleClickOrderItemsPreview",
    value: function handleClickOrderItemsPreview(event, element) {
      var _this4 = this;
      if (_verbose) {
        console.log("click order items preview");
      }
      this.toggleColumnHeaderCollapsed(flagOrderItems, false);
      /*
      let td = DOM.getCellFromElement(element);
      td.classList.remove(flagCollapsed);
      */

      var row = DOM.getRowFromElement(element);
      var idSupplierPurchaseOrder = row.getAttribute(attrIdSupplierPurchaseOrder);
      // if (idSupplierPurchaseOrder == null || idSupplierPurchaseOrder < 1) return;
      var supplierPurchaseOrder = supplierPurchaseOrders[idSupplierPurchaseOrder];
      if (supplierPurchaseOrder == null) supplierPurchaseOrder = supplier_purchase_orders_defineProperty({}, flagOrderItems, []);
      var tblOrderItems = document.createElement("table");
      tblOrderItems.classList.add(flagOrderItems);
      var thead = document.createElement("thead");
      var tr = document.createElement("tr");
      var thDisplayOrder = document.createElement("th");
      thDisplayOrder.classList.add(flagDisplayOrder);
      thDisplayOrder.textContent = 'Display Order';
      var thCategory = document.createElement("th");
      thCategory.classList.add(flagProductCategory);
      thCategory.textContent = 'Category';
      var thProduct = document.createElement("th");
      thProduct.classList.add(flagProduct);
      thProduct.textContent = 'Product';
      var thVariations = document.createElement("th");
      thVariations.classList.add(flagProductVariations);
      thVariations.classList.add(flagCollapsed);
      thVariations.textContent = 'Variations';
      var thUnitQuantity = document.createElement("th");
      thUnitQuantity.classList.add(flagUnitMeasurementQuantity);
      thUnitQuantity.textContent = 'Unit Quantity';
      var thQuantityOrdered = document.createElement("th");
      thQuantityOrdered.classList.add(flagQuantityOrdered);
      thQuantityOrdered.textContent = 'Quantity Ordered';
      var thQuantityReceived = document.createElement("th");
      thQuantityReceived.classList.add(flagQuantityReceived);
      thQuantityReceived.textContent = 'Quantity Received';
      var thCostTotalLocalVatExcl = document.createElement("th");
      thCostTotalLocalVatExcl.classList.add(flagCostTotalLocalVatExcl);
      thCostTotalLocalVatExcl.textContent = 'Cost Total Local VAT Excl';
      var thCostTotalLocalVatIncl = document.createElement("th");
      thCostTotalLocalVatIncl.classList.add(flagCostTotalLocalVatIncl);
      thCostTotalLocalVatIncl.textContent = 'Cost Total Local VAT Incl';
      var thCostUnitLocalVatExcl = document.createElement("th");
      thCostUnitLocalVatExcl.classList.add(flagCostUnitLocalVatExcl);
      thCostUnitLocalVatExcl.textContent = 'Cost Unit Local VAT Excl';
      var thCostUnitLocalVatIncl = document.createElement("th");
      thCostUnitLocalVatIncl.classList.add(flagCostUnitLocalVatIncl);
      thCostUnitLocalVatIncl.textContent = 'Cost Unit Local VAT Incl';
      var thLatencyDeliveryDays = document.createElement("th");
      thLatencyDeliveryDays.classList.add(flagLatencyDeliveryDays);
      thLatencyDeliveryDays.textContent = 'Latency Delivery (Days)';
      var thActive = document.createElement("th");
      thActive.classList.add(flagActive);
      thActive.textContent = 'Active';
      var thAddDelete = document.createElement("th");
      thAddDelete.classList.add(flagAdd);
      var buttonAdd = document.createElement("button");
      buttonAdd.classList.add(flagAdd);
      buttonAdd.textContent = '+';
      thAddDelete.appendChild(buttonAdd);
      tr.appendChild(thDisplayOrder);
      tr.appendChild(thCategory);
      tr.appendChild(thProduct);
      tr.appendChild(thVariations);
      tr.appendChild(thUnitQuantity);
      tr.appendChild(thQuantityOrdered);
      tr.appendChild(thQuantityReceived);
      tr.appendChild(thCostTotalLocalVatExcl);
      tr.appendChild(thCostTotalLocalVatIncl);
      tr.appendChild(thCostUnitLocalVatExcl);
      tr.appendChild(thCostUnitLocalVatIncl);
      tr.appendChild(thLatencyDeliveryDays);
      tr.appendChild(thActive);
      tr.appendChild(thAddDelete);
      thead.appendChild(tr);
      tblOrderItems.appendChild(thead);
      var tbody = document.createElement("tbody");
      supplierPurchaseOrder[flagOrderItems].forEach(function (orderItem, index) {
        _this4.addRowSupplierPurchaseOrderItem(tbody, orderItem);
      });
      tblOrderItems.appendChild(tbody);
      var cell = DOM.getCellFromElement(element);
      var cellNew = cell.cloneNode(false);
      cellNew.appendChild(tblOrderItems);
      cellNew.classList.remove(flagCollapsed);
      row.replaceChild(cellNew, cell);
      if (_verbose) {
        console.log("tblOrderItems: ", tblOrderItems);
      }
      this.hookupOrderItemsFields();
    }
  }, {
    key: "addRowSupplierPurchaseOrderItem",
    value: function addRowSupplierPurchaseOrderItem(tbody, orderItem) {
      //  productVariationTypeOptions, productVariationOptions, productCategoryOptions, productOptions, unitMeasurementOptions, 
      if (_verbose) {
        console.log("addRowSupplierPurchaseOrderItem: ", orderItem);
      }
      var tdDisplayOrder = document.createElement("td");
      tdDisplayOrder.classList.add(flagDisplayOrder);
      var inputDisplayOrder = document.createElement("input");
      inputDisplayOrder.classList.add(flagDisplayOrder);
      inputDisplayOrder.type = 'number';
      inputDisplayOrder.step = 1;
      DOM.setElementValuesCurrentAndPrevious(inputDisplayOrder, orderItem[flagDisplayOrder]);
      tdDisplayOrder.appendChild(inputDisplayOrder);
      var tdCategory = document.createElement("td");
      tdCategory.classList.add(flagProductCategory);
      DOM.setElementAttributesValuesCurrentAndPrevious(tdCategory, orderItem[attrIdProductCategory]);
      var divCategory = document.createElement("div");
      divCategory.classList.add(flagProductCategory);
      DOM.setElementAttributesValuesCurrentAndPrevious(divCategory, orderItem[attrIdProductCategory]);
      // divCategory.textContent = orderItem[flagProductCategory];
      var productCategory = productCategories[orderItem[attrIdProductCategory]];
      divCategory.textContent = BusinessObjects.getObjectText(productCategory);
      tdCategory.appendChild(divCategory);
      var tdProduct = document.createElement("td");
      tdProduct.classList.add(flagProduct);
      DOM.setElementAttributesValuesCurrentAndPrevious(tdProduct, orderItem[attrIdProduct]);
      var divProduct = document.createElement("div");
      divProduct.classList.add(flagProduct);
      DOM.setElementAttributesValuesCurrentAndPrevious(divProduct, orderItem[attrIdProduct]);
      // divProduct.textContent = orderItem[flagProduct];
      var product = products[orderItem[attrIdProduct]];
      divProduct.textContent = BusinessObjects.getObjectText(product);
      tdProduct.appendChild(divProduct);
      var tdVariations = document.createElement("td");
      tdVariations.classList.add(flagProductVariations);
      tdVariations.classList.add(flagCollapsed);
      DOM.setElementAttributesValuesCurrentAndPrevious(tdVariations, orderItem[flagProductVariations]);
      var divVariations = document.createElement("div");
      divVariations.classList.add(flagProductVariations);
      DOM.setElementAttributesValuesCurrentAndPrevious(divVariations, orderItem[flagProductVariations]);
      // divVariations.textContent = orderItem[flagProductVariations];
      var variationsText = ProductPermutation.getProductVariationsPreviewFromIdCsv(orderItem[flagProductVariations]);
      divVariations.textContent = variationsText;
      tdVariations.appendChild(divVariations);
      var tdUnitQuantity = document.createElement("td");
      tdUnitQuantity.classList.add(flagUnitMeasurementQuantity);
      DOM.setElementAttributesValuesCurrentAndPrevious(tdUnitQuantity, orderItem[attrIdUnitMeasurementQuantity]);
      var divUnitQuantity = document.createElement("div");
      divUnitQuantity.classList.add(flagUnitMeasurementQuantity);
      DOM.setElementAttributesValuesCurrentAndPrevious(divUnitQuantity, orderItem[attrIdUnitMeasurementQuantity]);
      var unitQuantity = unitMeasurements[orderItem[attrIdUnitMeasurementQuantity]];
      divUnitQuantity.textContent = BusinessObjects.getObjectText(unitQuantity);
      tdUnitQuantity.appendChild(divUnitQuantity);
      var tdQuantityOrdered = document.createElement("td");
      tdQuantityOrdered.classList.add(flagQuantityOrdered);
      var inputQuantityOrdered = document.createElement("input");
      inputQuantityOrdered.classList.add(flagQuantityOrdered);
      inputQuantityOrdered.type = 'number';
      DOM.setElementValuesCurrentAndPrevious(inputQuantityOrdered, orderItem[flagQuantityOrdered]);
      tdQuantityOrdered.appendChild(inputQuantityOrdered);
      var tdQuantityReceived = document.createElement("td");
      tdQuantityReceived.classList.add(flagQuantityReceived);
      var inputQuantityReceived = document.createElement("input");
      inputQuantityReceived.classList.add(flagQuantityReceived);
      inputQuantityReceived.type = 'number';
      DOM.setElementValuesCurrentAndPrevious(inputQuantityReceived, orderItem[flagQuantityReceived]);
      tdQuantityReceived.appendChild(inputQuantityReceived);
      var tdCostTotalLocalVatExcl = document.createElement("td");
      tdCostTotalLocalVatExcl.classList.add(flagCostTotalLocalVatExcl);
      var inputCostTotalLocalVatExcl = document.createElement("input");
      inputCostTotalLocalVatExcl.classList.add(flagCostTotalLocalVatExcl);
      inputCostTotalLocalVatExcl.type = 'number';
      inputCostTotalLocalVatExcl.step = 0.01;
      DOM.setElementValuesCurrentAndPrevious(inputCostTotalLocalVatExcl, orderItem[flagCostTotalLocalVatExcl]);
      tdCostTotalLocalVatExcl.appendChild(inputCostTotalLocalVatExcl);
      var tdCostTotalLocalVatIncl = document.createElement("td");
      tdCostTotalLocalVatIncl.classList.add(flagCostTotalLocalVatIncl);
      var inputCostTotalLocalVatIncl = document.createElement("input");
      inputCostTotalLocalVatIncl.classList.add(flagCostTotalLocalVatIncl);
      inputCostTotalLocalVatIncl.type = 'number';
      inputCostTotalLocalVatIncl.step = 0.01;
      DOM.setElementValuesCurrentAndPrevious(inputCostTotalLocalVatIncl, orderItem[flagCostTotalLocalVatIncl]);
      tdCostTotalLocalVatIncl.appendChild(inputCostTotalLocalVatIncl);
      var tdCostUnitLocalVatExcl = document.createElement("td");
      tdCostUnitLocalVatExcl.classList.add(flagCostUnitLocalVatExcl);
      var divCostUnitLocalVatExcl = document.createElement("div");
      divCostUnitLocalVatExcl.classList.add(flagCostUnitLocalVatExcl);
      DOM.setElementValuesCurrentAndPrevious(divCostUnitLocalVatExcl, validation_Validation.toFixedOrDefault(orderItem[flagCostUnitLocalVatExcl], 3, null));
      tdCostUnitLocalVatExcl.appendChild(divCostUnitLocalVatExcl);
      var tdCostUnitLocalVatIncl = document.createElement("td");
      tdCostUnitLocalVatIncl.classList.add(flagCostUnitLocalVatIncl);
      var divCostUnitLocalVatIncl = document.createElement("div");
      divCostUnitLocalVatIncl.classList.add(flagCostUnitLocalVatIncl);
      DOM.setElementValuesCurrentAndPrevious(divCostUnitLocalVatIncl, validation_Validation.toFixedOrDefault(orderItem[flagCostUnitLocalVatIncl], 3, null));
      tdCostUnitLocalVatIncl.appendChild(divCostUnitLocalVatIncl);
      var tdLatencyDeliveryDays = document.createElement("td");
      tdLatencyDeliveryDays.classList.add(flagLatencyDeliveryDays);
      var inputLatencyDeliveryDays = document.createElement("input");
      inputLatencyDeliveryDays.classList.add(flagLatencyDeliveryDays);
      inputLatencyDeliveryDays.type = 'number';
      inputLatencyDeliveryDays.step = 1;
      DOM.setElementValuesCurrentAndPrevious(inputLatencyDeliveryDays, orderItem[flagLatencyDeliveryDays]);
      tdLatencyDeliveryDays.appendChild(inputLatencyDeliveryDays);
      var tdActive = this.createTdActive(orderItem[flagActive]);
      var tr = document.createElement("tr");
      tr.classList.add(flagOrderItems);
      tr.setAttribute(attrIdSupplierPurchaseOrder, orderItem[attrIdSupplierPurchaseOrder]);
      tr.setAttribute(attrIdSupplierPurchaseOrderProductLink, orderItem[attrIdSupplierPurchaseOrderProductLink]);
      tr.appendChild(tdDisplayOrder);
      tr.appendChild(tdCategory);
      tr.appendChild(tdProduct);
      tr.appendChild(tdVariations);
      tr.appendChild(tdUnitQuantity);
      tr.appendChild(tdQuantityOrdered);
      tr.appendChild(tdQuantityReceived);
      tr.appendChild(tdCostTotalLocalVatExcl);
      tr.appendChild(tdCostTotalLocalVatIncl);
      tr.appendChild(tdCostUnitLocalVatExcl);
      tr.appendChild(tdCostUnitLocalVatIncl);
      tr.appendChild(tdLatencyDeliveryDays);
      tr.appendChild(tdActive);
      tbody.appendChild(tr);
    }
  }, {
    key: "hookupFieldsOrderItemDisplayOrder",
    value: function hookupFieldsOrderItemDisplayOrder() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagOrderItems + ' td.' + flagDisplayOrder + ' input');
    }
  }, {
    key: "hookupFieldsOrderItemProductCategory",
    value: function hookupFieldsOrderItemProductCategory() {
      var _this5 = this;
      this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagOrderItems + ' td.' + flagProductCategory, Utils.getListFromDict(productCategories), function (cellSelector) {
        _this5.hookupProductCategoryDdls(cellSelector);
      });
    }
  }, {
    key: "hookupFieldsOrderItemProduct",
    value: function hookupFieldsOrderItemProduct() {
      this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagOrderItems + ' td.' + flagProduct, Utils.getListFromDict(products));
    }
    /*
    hookupFieldsOrderItemProductVariations() {
        this.hookupEventHandler("click", idTableMain + ' td.' + flagOrderItems + ' td.' + flagProductVariations, (event, element) => this.handleClickProductPermutationVariationsPreview(event, element));
    }
    hookupDdlsProductPermutationVariation() {
        this.hookupTableCellDdls(idTableMain + ' td.' + flagProductVariations + ' td.' + flagProductVariation);
    }
    hookupDdlsProductPermutationVariationType() {
        this.hookupTableCellDdls(idTableMain + ' td.' + flagProductVariations + ' td.' + flagProductVariationType);
    }
    */
  }, {
    key: "hookupFieldsOrderItemUnitQuantity",
    value: function hookupFieldsOrderItemUnitQuantity() {
      this.hookupTableCellDdlPreviews(idTableMain + ' td.' + flagOrderItems + ' td.' + flagUnitMeasurementQuantity, Utils.getListFromDict(unitMeasurements));
    }
  }, {
    key: "hookupFieldsOrderItemQuantityOrdered",
    value: function hookupFieldsOrderItemQuantityOrdered() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagOrderItems + ' td.' + flagQuantityOrdered + ' input');
    }
  }, {
    key: "hookupFieldsOrderItemQuantityReceived",
    value: function hookupFieldsOrderItemQuantityReceived() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagOrderItems + ' td.' + flagQuantityReceived + ' input');
    }
  }, {
    key: "hookupFieldsOrderItemCostTotalLocalVatExcl",
    value: function hookupFieldsOrderItemCostTotalLocalVatExcl() {
      var _this6 = this;
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagOrderItems + ' td.' + flagCostTotalLocalVatExcl + ' input', function (event, element) {
        _this6.handleChangeNestedElementCellTable(event, element); //  flagCostTotalLocalVatExcl);
        _this6.updateFieldsCostUnitLocalVatExcl(element);
      });
    }
  }, {
    key: "hookupFieldsOrderItemCostTotalLocalVatIncl",
    value: function hookupFieldsOrderItemCostTotalLocalVatIncl() {
      var _this7 = this;
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagOrderItems + ' td.' + flagCostTotalLocalVatIncl + ' input', function (event, element) {
        _this7.handleChangeNestedElementCellTable(event, element); //  flagCostTotalLocalVatIncl);
        _this7.updateFieldsCostUnitLocalVatIncl(element);
      });
    }
  }, {
    key: "updateFieldsCostUnitLocalVatExcl",
    value: function updateFieldsCostUnitLocalVatExcl(elementChanged) {
      var row = elementChanged.closest('tr.' + flagOrderItems);
      var inputCostTotalLocalVatExcl = row.querySelector('td.' + flagCostTotalLocalVatExcl + ' input');
      var costTotalLocalVatExcl = DOM.getElementValueCurrent(inputCostTotalLocalVatExcl);
      var inputQuantityOrdered = row.querySelector('td.' + flagQuantityOrdered + ' input');
      var quantityOrdered = DOM.getElementValueCurrent(inputQuantityOrdered);
      var divCostUnitLocalVatExcl = row.querySelector('td.' + flagCostUnitLocalVatExcl + ' div');
      var costUnitLocalVatExcl = quantityOrdered == 0 ? 0 : costTotalLocalVatExcl / quantityOrdered;
      DOM.setElementValuesCurrentAndPrevious(divCostUnitLocalVatExcl, costUnitLocalVatExcl.toFixed(3));
      var rowSupplierPurchaseOrder = row.closest(idTableMain + ' > tbody > tr');
      var divCostGrandTotalLocalVatExcl = rowSupplierPurchaseOrder.querySelector('td.' + flagCostTotalLocalVatExcl + ' div');
      var inputsCostTotalLocalVatExcl = rowSupplierPurchaseOrder.querySelectorAll('td.' + flagOrderItems + ' td.' + flagCostTotalLocalVatExcl + ' input');
      var costGrandTotalLocalVatExcl = Array.from(inputsCostTotalLocalVatExcl).reduce(function (acc, input) {
        return acc + Number(DOM.getElementValueCurrent(input));
      }, 0);
      DOM.setElementValueCurrent(divCostGrandTotalLocalVatExcl, costGrandTotalLocalVatExcl);
    }
  }, {
    key: "updateFieldsCostUnitLocalVatIncl",
    value: function updateFieldsCostUnitLocalVatIncl(elementChanged) {
      var row = elementChanged.closest('tr.' + flagOrderItems);
      var inputCostTotalLocalVatIncl = row.querySelector('td.' + flagCostTotalLocalVatIncl + ' input');
      var costTotalLocalVatIncl = DOM.getElementValueCurrent(inputCostTotalLocalVatIncl);
      var inputQuantityOrdered = row.querySelector('td.' + flagQuantityOrdered + ' input');
      var quantityOrdered = DOM.getElementValueCurrent(inputQuantityOrdered);
      var divCostUnitLocalVatIncl = row.querySelector('td.' + flagCostUnitLocalVatIncl + ' div');
      var costUnitLocalVatIncl = quantityOrdered == 0 ? 0 : costTotalLocalVatIncl / quantityOrdered;
      DOM.setElementValuesCurrentAndPrevious(divCostUnitLocalVatIncl, costUnitLocalVatIncl.toFixed(3));
      var rowSupplierPurchaseOrder = row.closest(idTableMain + ' > tbody > tr');
      var divCostGrandTotalLocalVatIncl = rowSupplierPurchaseOrder.querySelector('td.' + flagCostTotalLocalVatIncl + ' div');
      var inputsCostTotalLocalVatIncl = rowSupplierPurchaseOrder.querySelectorAll('td.' + flagOrderItems + ' td.' + flagCostTotalLocalVatIncl + ' input');
      var costGrandTotalLocalVatIncl = Array.from(inputsCostTotalLocalVatIncl).reduce(function (acc, input) {
        return acc + Number(DOM.getElementValueCurrent(input));
      }, 0);
      DOM.setElementValueCurrent(divCostGrandTotalLocalVatIncl, costGrandTotalLocalVatIncl);
    }
  }, {
    key: "hookupFieldsOrderItemLatencyDeliveryDays",
    value: function hookupFieldsOrderItemLatencyDeliveryDays() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagOrderItems + ' td.' + flagLatencyDeliveryDays + ' input');
    }
  }, {
    key: "hookupFieldsOrderItemActive",
    value: function hookupFieldsOrderItemActive() {
      this.hookupChangeHandlerTableCells(idTableMain + ' td.' + flagOrderItems + ' input.' + flagActive);
    }
  }, {
    key: "hookupFieldsOrderItemAddDelete",
    value: function hookupFieldsOrderItemAddDelete() {
      var selectorButton = idTableMain + ' td.' + flagOrderItems + ' td.' + flagOrderItems + ' button';
      var selectorButtonDelete = selectorButton + '.' + flagDelete;
      var selectorButtonUndelete = selectorButton + '.' + flagAdd;
      this.hookupButtonsRowDelete(selectorButtonDelete, selectorButtonUndelete);
      this.hookupButtonsRowUndelete(selectorButtonDelete, selectorButtonUndelete);
      this.hookupButtonsOrderItemAdd();
    }
  }, {
    key: "hookupButtonsOrderItemAdd",
    value: function hookupButtonsOrderItemAdd() {
      var _this8 = this;
      this.hookupEventHandler("click", idTableMain + ' td.' + flagOrderItems + ' th button.' + flagAdd, function (event, element) {
        var _supplierOrderItem;
        var row = element.closest(idTableMain + ' > tbody > tr');
        var idSupplierPurchaseOrder = row.getAttribute(attrIdSupplierPurchaseOrder);
        // let hasActiveOrderItem = row.querySelectorAll('td.' + flagOrderItems + ' input.' + flagActive + ':checked').length > 0;
        var countSupplierOrderItems = row.querySelectorAll('td.' + flagOrderItems + ' td.' + flagSupplierPurchaseOrder).length;
        var supplierOrderItem = (_supplierOrderItem = {}, supplier_purchase_orders_defineProperty(supplier_purchase_orders_defineProperty(supplier_purchase_orders_defineProperty(supplier_purchase_orders_defineProperty(supplier_purchase_orders_defineProperty(supplier_purchase_orders_defineProperty(supplier_purchase_orders_defineProperty(supplier_purchase_orders_defineProperty(supplier_purchase_orders_defineProperty(supplier_purchase_orders_defineProperty(_supplierOrderItem, attrIdSupplierPurchaseOrder, idSupplierPurchaseOrder), attrIdSupplierPurchaseOrderProductLink, -1 - countSupplierOrderItems), attrIdProductCategory, 0), attrIdProduct, 0), flagProductVariations, ''), attrIdUnitMeasurementQuantity, 0), flagQuantityOrdered, ''), flagQuantityReceived, ''), flagCostTotalLocalVatExcl, ''), flagCostTotalLocalVatIncl, ''), supplier_purchase_orders_defineProperty(supplier_purchase_orders_defineProperty(supplier_purchase_orders_defineProperty(supplier_purchase_orders_defineProperty(supplier_purchase_orders_defineProperty(_supplierOrderItem, flagCostUnitLocalVatExcl, ''), flagCostUnitLocalVatIncl, ''), flagLatencyDeliveryDays, ''), flagDisplayOrder, countSupplierOrderItems + 1), flagActive, true));
        var tbody = row.querySelector('td.' + flagOrderItems + ' table tbody');
        _this8.addRowSupplierPurchaseOrderItem(tbody, supplierOrderItem);
        /*
        if (!hasActiveOrderItem) {
            let tdOrderItem = row.querySelector('td.' + flagOrderItems);
            // tdOrderItem.setAttribute(attrIdSupplierOrderItem, supplierOrderItem[attrIdSupplierOrderItem]);
            DOM.setElementAttributeValueCurrent(tdOrderItem, supplierOrderItem[attrIdSupplierPurchaseOrderProductLink]);
        }
        */
        _this8.hookupOrderItemsFields();
      });
    }
  }, {
    key: "leave",
    value: function leave() {
      supplier_purchase_orders_superPropGet(PageStoreSupplierPurchaseOrders, "leave", this, 3)([]);
    }
  }]);
}(TableBasePage);
supplier_purchase_orders_defineProperty(PageStoreSupplierPurchaseOrders, "hash", hashPageStoreSupplierPurchaseOrders);
supplier_purchase_orders_defineProperty(PageStoreSupplierPurchaseOrders, "attrIdRowObject", attrIdSupplierPurchaseOrder);

;// CONCATENATED MODULE: ./static/js/pages/legal/privacy_policy.js
function privacy_policy_typeof(o) { "@babel/helpers - typeof"; return privacy_policy_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, privacy_policy_typeof(o); }
function privacy_policy_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function privacy_policy_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, privacy_policy_toPropertyKey(o.key), o); } }
function privacy_policy_createClass(e, r, t) { return r && privacy_policy_defineProperties(e.prototype, r), t && privacy_policy_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function privacy_policy_callSuper(t, o, e) { return o = privacy_policy_getPrototypeOf(o), privacy_policy_possibleConstructorReturn(t, privacy_policy_isNativeReflectConstruct() ? Reflect.construct(o, e || [], privacy_policy_getPrototypeOf(t).constructor) : o.apply(t, e)); }
function privacy_policy_possibleConstructorReturn(t, e) { if (e && ("object" == privacy_policy_typeof(e) || "function" == typeof e)) return e; if (void 0 !== e) throw new TypeError("Derived constructors may only return object or undefined"); return privacy_policy_assertThisInitialized(t); }
function privacy_policy_assertThisInitialized(e) { if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); return e; }
function privacy_policy_isNativeReflectConstruct() { try { var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); } catch (t) {} return (privacy_policy_isNativeReflectConstruct = function _isNativeReflectConstruct() { return !!t; })(); }
function privacy_policy_superPropGet(t, e, o, r) { var p = privacy_policy_get(privacy_policy_getPrototypeOf(1 & r ? t.prototype : t), e, o); return 2 & r && "function" == typeof p ? function (t) { return p.apply(o, t); } : p; }
function privacy_policy_get() { return privacy_policy_get = "undefined" != typeof Reflect && Reflect.get ? Reflect.get.bind() : function (e, t, r) { var p = privacy_policy_superPropBase(e, t); if (p) { var n = Object.getOwnPropertyDescriptor(p, t); return n.get ? n.get.call(arguments.length < 3 ? e : r) : n.value; } }, privacy_policy_get.apply(null, arguments); }
function privacy_policy_superPropBase(t, o) { for (; !{}.hasOwnProperty.call(t, o) && null !== (t = privacy_policy_getPrototypeOf(t));); return t; }
function privacy_policy_getPrototypeOf(t) { return privacy_policy_getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function (t) { return t.__proto__ || Object.getPrototypeOf(t); }, privacy_policy_getPrototypeOf(t); }
function privacy_policy_inherits(t, e) { if ("function" != typeof e && null !== e) throw new TypeError("Super expression must either be null or a function"); t.prototype = Object.create(e && e.prototype, { constructor: { value: t, writable: !0, configurable: !0 } }), Object.defineProperty(t, "prototype", { writable: !1 }), e && privacy_policy_setPrototypeOf(t, e); }
function privacy_policy_setPrototypeOf(t, e) { return privacy_policy_setPrototypeOf = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function (t, e) { return t.__proto__ = e, t; }, privacy_policy_setPrototypeOf(t, e); }
function privacy_policy_defineProperty(e, r, t) { return (r = privacy_policy_toPropertyKey(r)) in e ? Object.defineProperty(e, r, { value: t, enumerable: !0, configurable: !0, writable: !0 }) : e[r] = t, e; }
function privacy_policy_toPropertyKey(t) { var i = privacy_policy_toPrimitive(t, "string"); return "symbol" == privacy_policy_typeof(i) ? i : i + ""; }
function privacy_policy_toPrimitive(t, r) { if ("object" != privacy_policy_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != privacy_policy_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }

var PagePrivacyPolicy = /*#__PURE__*/function (_BasePage) {
  function PagePrivacyPolicy(router) {
    privacy_policy_classCallCheck(this, PagePrivacyPolicy);
    return privacy_policy_callSuper(this, PagePrivacyPolicy, [router]);
  }
  privacy_policy_inherits(PagePrivacyPolicy, _BasePage);
  return privacy_policy_createClass(PagePrivacyPolicy, [{
    key: "initialize",
    value: function initialize() {
      this.sharedInitialize();
    }
  }, {
    key: "leave",
    value: function leave() {
      privacy_policy_superPropGet(PagePrivacyPolicy, "leave", this, 3)([]);
    }
  }]);
}(BasePage);
privacy_policy_defineProperty(PagePrivacyPolicy, "hash", hashPagePrivacyPolicy);

;// CONCATENATED MODULE: ./static/js/pages/legal/retention_schedule.js
function retention_schedule_typeof(o) { "@babel/helpers - typeof"; return retention_schedule_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, retention_schedule_typeof(o); }
function retention_schedule_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function retention_schedule_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, retention_schedule_toPropertyKey(o.key), o); } }
function retention_schedule_createClass(e, r, t) { return r && retention_schedule_defineProperties(e.prototype, r), t && retention_schedule_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function retention_schedule_callSuper(t, o, e) { return o = retention_schedule_getPrototypeOf(o), retention_schedule_possibleConstructorReturn(t, retention_schedule_isNativeReflectConstruct() ? Reflect.construct(o, e || [], retention_schedule_getPrototypeOf(t).constructor) : o.apply(t, e)); }
function retention_schedule_possibleConstructorReturn(t, e) { if (e && ("object" == retention_schedule_typeof(e) || "function" == typeof e)) return e; if (void 0 !== e) throw new TypeError("Derived constructors may only return object or undefined"); return retention_schedule_assertThisInitialized(t); }
function retention_schedule_assertThisInitialized(e) { if (void 0 === e) throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); return e; }
function retention_schedule_isNativeReflectConstruct() { try { var t = !Boolean.prototype.valueOf.call(Reflect.construct(Boolean, [], function () {})); } catch (t) {} return (retention_schedule_isNativeReflectConstruct = function _isNativeReflectConstruct() { return !!t; })(); }
function retention_schedule_superPropGet(t, e, o, r) { var p = retention_schedule_get(retention_schedule_getPrototypeOf(1 & r ? t.prototype : t), e, o); return 2 & r && "function" == typeof p ? function (t) { return p.apply(o, t); } : p; }
function retention_schedule_get() { return retention_schedule_get = "undefined" != typeof Reflect && Reflect.get ? Reflect.get.bind() : function (e, t, r) { var p = retention_schedule_superPropBase(e, t); if (p) { var n = Object.getOwnPropertyDescriptor(p, t); return n.get ? n.get.call(arguments.length < 3 ? e : r) : n.value; } }, retention_schedule_get.apply(null, arguments); }
function retention_schedule_superPropBase(t, o) { for (; !{}.hasOwnProperty.call(t, o) && null !== (t = retention_schedule_getPrototypeOf(t));); return t; }
function retention_schedule_getPrototypeOf(t) { return retention_schedule_getPrototypeOf = Object.setPrototypeOf ? Object.getPrototypeOf.bind() : function (t) { return t.__proto__ || Object.getPrototypeOf(t); }, retention_schedule_getPrototypeOf(t); }
function retention_schedule_inherits(t, e) { if ("function" != typeof e && null !== e) throw new TypeError("Super expression must either be null or a function"); t.prototype = Object.create(e && e.prototype, { constructor: { value: t, writable: !0, configurable: !0 } }), Object.defineProperty(t, "prototype", { writable: !1 }), e && retention_schedule_setPrototypeOf(t, e); }
function retention_schedule_setPrototypeOf(t, e) { return retention_schedule_setPrototypeOf = Object.setPrototypeOf ? Object.setPrototypeOf.bind() : function (t, e) { return t.__proto__ = e, t; }, retention_schedule_setPrototypeOf(t, e); }
function retention_schedule_defineProperty(e, r, t) { return (r = retention_schedule_toPropertyKey(r)) in e ? Object.defineProperty(e, r, { value: t, enumerable: !0, configurable: !0, writable: !0 }) : e[r] = t, e; }
function retention_schedule_toPropertyKey(t) { var i = retention_schedule_toPrimitive(t, "string"); return "symbol" == retention_schedule_typeof(i) ? i : i + ""; }
function retention_schedule_toPrimitive(t, r) { if ("object" != retention_schedule_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != retention_schedule_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }

var PageRetentionSchedule = /*#__PURE__*/function (_BasePage) {
  function PageRetentionSchedule(router) {
    retention_schedule_classCallCheck(this, PageRetentionSchedule);
    return retention_schedule_callSuper(this, PageRetentionSchedule, [router]);
  }
  retention_schedule_inherits(PageRetentionSchedule, _BasePage);
  return retention_schedule_createClass(PageRetentionSchedule, [{
    key: "initialize",
    value: function initialize() {
      this.sharedInitialize();
    }
  }, {
    key: "leave",
    value: function leave() {
      retention_schedule_superPropGet(PageRetentionSchedule, "leave", this, 3)([]);
    }
  }]);
}(BasePage);
retention_schedule_defineProperty(PageRetentionSchedule, "hash", hashPageDataRetentionSchedule);

;// CONCATENATED MODULE: ./static/js/router.js
function router_typeof(o) { "@babel/helpers - typeof"; return router_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, router_typeof(o); }
function router_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function router_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, router_toPropertyKey(o.key), o); } }
function router_createClass(e, r, t) { return r && router_defineProperties(e.prototype, r), t && router_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function router_toPropertyKey(t) { var i = router_toPrimitive(t, "string"); return "symbol" == router_typeof(i) ? i : i + ""; }
function router_toPrimitive(t, r) { if ("object" != router_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != router_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }
// Pages
// Core




// Legal



// Store





// import PageStoreProductPrices from './pages/store/product_prices.js';





// User
// import PageUserLogin from './pages/user/login.js';
// import PageUserLogout from './pages/user/logout.js';
// import PageUserAccount from './pages/user/account.js';





var Router = /*#__PURE__*/function () {
  function Router() {
    var _this = this;
    router_classCallCheck(this, Router);
    // Pages
    this.pages = {};
    // Core
    this.pages[hashPageHome] = {
      name: 'PageHome',
      module: PageAdminHome
    }; //  importModule: () => import(/* webpackChunkName: "page_core_home" */ './pages/core/home.js') , pathModule: './pages/core/home.js'
    this.pages[hashPageContact] = {
      name: 'PageContact',
      module: PageContact
    }; // pathModule: './pages/core/contact.js' };
    this.pages[hashPageServices] = {
      name: 'PageServices',
      module: PageServices
    }; // pathModule: './pages/core/services.js' };
    this.pages[hashPageAdminHome] = {
      name: 'PageAdminHome',
      module: PageAdminHome
    }; // pathModule: './pages/core/admin_home.js' };
    // Legal
    this.pages[hashPageAccessibilityStatement] = {
      name: 'PageAccessibilityStatement',
      module: PageAccessibilityStatement
    }; // pathModule: '../../static/js/pages/legal/accessibility_statement.js' }; // , page: PageAccessibilityStatement
    this.pages[hashPageDataRetentionSchedule] = {
      name: 'PageDataRetentionSchedule',
      module: PageRetentionSchedule
    }; // pathModule: './pages/legal/data_retention_schedule.js' };
    this.pages[hashPageLicense] = {
      name: 'PageLicense',
      module: PageLicense
    }; // pathModule: './pages/legal/license.js' };
    this.pages[hashPagePrivacyPolicy] = {
      name: 'PagePrivacyPolicy',
      module: PagePrivacyPolicy
    }; // pathModule: './pages/legal/privacy_policy.js' }; // importModule: () => {return import(/* webpackChunkName: "page_privacy_policy" */ './pages/legal/privacy_policy.js'); }
    // Store
    this.pages[hashPageStoreManufacturingPurchaseOrders] = {
      name: 'PageManufacturingPurchaseOrders',
      module: PageStoreManufacturingPurchaseOrders
    }; // pathModule
    this.pages[hashPageStoreProductCategories] = {
      name: 'PageStoreProductCategories',
      module: PageStoreProductCategories
    }; // pathModule: './pages/store/product_categories.js' };
    this.pages[hashPageStoreProductPermutations] = {
      name: 'PageStoreProductPermutations',
      module: PageStoreProductPermutations
    }; // pathModule: './pages/store/product_permutations.js' };
    // this.pages[hashPageStoreProductPrices] = { name: 'PageStoreProductPrices', module: PageStoreProductPrices }; // pathModule: './pages/store/product_prices.js' };
    this.pages[hashPageStoreProducts] = {
      name: 'PageStoreProducts',
      module: PageStoreProducts
    }; // pathModule: './pages/store/products.js' };
    this.pages[hashPageStoreProductVariations] = {
      name: 'PageStoreProductVariations',
      module: PageStoreProductVariations
    }; // pathModule: './pages/store/product_variations.js' };
    this.pages[hashPageStoreStockItems] = {
      name: 'PageStoreStockItems',
      module: PageStoreStockItems
    };
    this.pages[hashPageStoreSuppliers] = {
      name: 'PageStoreSuppliers',
      module: PageStoreSuppliers
    };
    this.pages[hashPageStoreSupplierPurchaseOrders] = {
      name: 'PageSupplierPurchaseOrders',
      module: PageStoreSupplierPurchaseOrders
    };
    // User
    // this.pages[hashPageUserLogin] = { name: 'PageUserLogin', module: PageUserLogin }; // pathModule: './pages/user/login.js' };
    // this.pages[hashPageUserLogout] = { name: 'PageUserLogout', module: PageUserLogout }; // pathModule: './pages/user/logout.js' };
    // this.pages[hashPageUserAccount] = { name: 'PageUserAccount', module: PageUserAccount }; // pathModule: './pages/user/account.js' };

    // Routes
    this.routes = {};
    // Core
    this.routes[hashPageHome] = function () {
      var isPopState = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : false;
      return _this.navigateToHash(hashPageHome, isPopState);
    };
    this.routes[hashPageContact] = function () {
      var isPopState = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : false;
      return _this.navigateToHash(hashPageContact, isPopState);
    };
    this.routes[hashPageServices] = function () {
      var isPopState = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : false;
      return _this.navigateToHash(hashPageServices, isPopState);
    };
    this.routes[hashPageAdminHome] = function () {
      var isPopState = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : false;
      return _this.navigateToHash(hashPageAdminHome, isPopState);
    };
    // Legal
    this.routes[hashPageAccessibilityStatement] = function () {
      var isPopState = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : false;
      return _this.navigateToHash(hashPageAccessibilityStatement, isPopState);
    };
    this.routes[hashPageDataRetentionSchedule] = function () {
      var isPopState = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : false;
      return _this.navigateToHash(hashPageDataRetentionSchedule, isPopState);
    };
    this.routes[hashPageLicense] = function () {
      var isPopState = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : false;
      return _this.navigateToHash(hashPageLicense, isPopState);
    };
    this.routes[hashPagePrivacyPolicy] = function () {
      var isPopState = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : false;
      return _this.navigateToHash(hashPagePrivacyPolicy, isPopState);
    };
    // Store
    this.routes[hashPageStoreManufacturingPurchaseOrders] = function () {
      var isPopState = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : false;
      return _this.navigateToHash(hashPageStoreManufacturingPurchaseOrders, isPopState);
    };
    this.routes[hashPageStoreProductCategories] = function () {
      var isPopState = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : false;
      return _this.navigateToHash(hashPageStoreProductCategories, isPopState);
    };
    this.routes[hashPageStoreProductPermutations] = function () {
      var isPopState = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : false;
      return _this.navigateToHash(hashPageStoreProductPermutations, isPopState);
    };
    // this.routes[hashPageStoreProductPrices] = (isPopState = false) => this.navigateToHash(hashPageStoreProductPrices, isPopState);
    this.routes[hashPageStoreProducts] = function () {
      var isPopState = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : false;
      return _this.navigateToHash(hashPageStoreProducts, isPopState);
    };
    this.routes[hashPageStoreProductVariations] = function () {
      var isPopState = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : false;
      return _this.navigateToHash(hashPageStoreProductVariations, isPopState);
    };
    this.routes[hashPageStoreStockItems] = function () {
      var isPopState = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : false;
      return _this.navigateToHash(hashPageStoreStockItems, isPopState);
    };
    this.routes[hashPageStoreSuppliers] = function () {
      var isPopState = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : false;
      return _this.navigateToHash(hashPageStoreSuppliers, isPopState);
    };
    this.routes[hashPageStoreSupplierPurchaseOrders] = function () {
      var isPopState = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : false;
      return _this.navigateToHash(hashPageStoreSupplierPurchaseOrders, isPopState);
    };
    // User
    // this.routes[hashPageUserLogin] = (isPopState = false) => this.navigateToHash(hashPageUserLogin, isPopState);
    // this.routes[hashPageUserLogout] = (isPopState = false) => this.navigateToHash(hashPageUserLogout, isPopState);
    // this.routes[hashPageUserAccount] = (isPopState = false) => this.navigateToHash(hashPageUserAccount, isPopState);
    this.initialize();
  }
  return router_createClass(Router, [{
    key: "loadPage",
    value: function loadPage(hashPage) {
      var _this2 = this;
      var isPopState = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : false;
      var PageClass = this.getClassPageFromHash(hashPage);
      this.currentPage = new PageClass(this);
      this.currentPage.initialize(isPopState);
      window.addEventListener('beforeunload', function () {
        return _this2.currentPage.leave();
      });
    }
  }, {
    key: "getClassPageFromHash",
    value: function getClassPageFromHash(hashPage) {
      var pageJson = this.pages[hashPage];
      try {
        /*
        const module = await pagesContext(pageJson.pathModule);
        console.log("module: ", module);
        return module[pageJson.name];
        */
        // const module = await import(pageJson.pathModule); //  pageJson.page;
        // const module = () => import(pageJson.pathModule);
        var module = pageJson.module; // importModule;
        return module; // [pageJson.name];
      } catch (error) {
        if (_verbose) {
          console.log("this.pages: ", this.pages);
        }
        ;
        console.error('Page not found:', hashPage);
        throw error;
      }
    }
  }, {
    key: "initialize",
    value: function initialize() {
      /*
      let pages = Router.getPages();
      for (const key of Object.keys(pages)) {
          let page = pages[key];
          this.addRoute(page.hash, page.initialize);
      }
      */
      window.addEventListener('popstate', this.handlePopState.bind(this)); // page accessed by history navigation
    }
  }, {
    key: "handlePopState",
    value: function handlePopState(event) {
      this.loadPageCurrent();
    }
  }, {
    key: "loadPageCurrent",
    value: function loadPageCurrent() {
      var hashPageCurrent = DOM.getHashPageCurrent();
      this.loadPage(hashPageCurrent);
    }
  }, {
    key: "navigateToHash",
    value: function navigateToHash(hash) {
      var data = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : null;
      var params = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : null;
      var isPopState = arguments.length > 3 && arguments[3] !== undefined ? arguments[3] : false;
      // this.beforeLeave();
      /*
      if (this.routes[hash]) {
          this.routes[hash](isPopState);
      } else {
          console.error(`Hash ${hash} not found`);
      }
      */
      var url = api_API.getUrlFromHash(hash, params);
      // if (!isPopState) 
      history.pushState({
        data: data,
        params: params
      }, '', hash);
      api_API.goToUrl(url, data);
    }
    /* beforeunload listener
    async beforeLeave() {
        const ClassPageCurrent = await this.getClassPageFromHash(DOM.getHashPageCurrent());
        const pageCurrent = new ClassPageCurrent(this);
        pageCurrent.leave();
    }
    */
  }, {
    key: "navigateToUrl",
    value: function navigateToUrl(url) {
      var data = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : null;
      var appendHistory = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : true;
      // this.beforeLeave();
      if (appendHistory) history.pushState(data, '', url);
      url = api_API.parameteriseUrl(url, data);
      api_API.goToUrl(url);
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
  }], [{
    key: "loadPageBodyFromResponse",
    value: function loadPageBodyFromResponse(response) {
      DOM.loadPageBody(response.data);
    }
  }]);
}();

var router = new Router();

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
;// CONCATENATED MODULE: ./static/js/app.js


function app_typeof(o) { "@babel/helpers - typeof"; return app_typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (o) { return typeof o; } : function (o) { return o && "function" == typeof Symbol && o.constructor === Symbol && o !== Symbol.prototype ? "symbol" : typeof o; }, app_typeof(o); }
function app_classCallCheck(a, n) { if (!(a instanceof n)) throw new TypeError("Cannot call a class as a function"); }
function app_defineProperties(e, r) { for (var t = 0; t < r.length; t++) { var o = r[t]; o.enumerable = o.enumerable || !1, o.configurable = !0, "value" in o && (o.writable = !0), Object.defineProperty(e, app_toPropertyKey(o.key), o); } }
function app_createClass(e, r, t) { return r && app_defineProperties(e.prototype, r), t && app_defineProperties(e, t), Object.defineProperty(e, "prototype", { writable: !1 }), e; }
function app_toPropertyKey(t) { var i = app_toPrimitive(t, "string"); return "symbol" == app_typeof(i) ? i : i + ""; }
function app_toPrimitive(t, r) { if ("object" != app_typeof(t) || !t) return t; var e = t[Symbol.toPrimitive]; if (void 0 !== e) { var i = e.call(t, r || "default"); if ("object" != app_typeof(i)) return i; throw new TypeError("@@toPrimitive must return a primitive value."); } return ("string" === r ? String : Number)(t); }


var App = /*#__PURE__*/function () {
  function App() {
    app_classCallCheck(this, App);
    this.dom = new DOM();
    this.router = new Router();
  }
  return app_createClass(App, [{
    key: "initialize",
    value: function initialize() {
      this.setupEventListeners();
      this.start();
    }
  }, {
    key: "setupEventListeners",
    value: function setupEventListeners() {
      // document.addEventListener('click', this.handleGlobalClick.bind(this));
    }
  }, {
    key: "handleGlobalClick",
    value: function handleGlobalClick(event) {}
  }, {
    key: "start",
    value: function start() {
      this.initPageCurrent();
    }
  }, {
    key: "initPageCurrent",
    value: function initPageCurrent() {
      this.router.loadPageCurrent();
    }
  }]);
}();
var app = new App();
function domReady(fn) {
  if (document.readyState !== 'loading') {
    fn();
  } else {
    document.addEventListener('DOMContentLoaded', fn);
  }
}
domReady(function () {
  app.initialize();
});
window.app = app;
/* harmony default export */ const js_app = ((/* unused pure expression or super */ null && (app)));
})();

// This entry need to be wrapped in an IIFE because it need to be isolated against other entry modules.
(() => {
// extracted by mini-css-extract-plugin

})();

// This entry need to be wrapped in an IIFE because it need to be isolated against other entry modules.
(() => {
// extracted by mini-css-extract-plugin

})();

// This entry need to be wrapped in an IIFE because it need to be isolated against other entry modules.
(() => {
// extracted by mini-css-extract-plugin

})();

// This entry need to be wrapped in an IIFE because it need to be isolated against other entry modules.
(() => {
// extracted by mini-css-extract-plugin

})();

// This entry need to be wrapped in an IIFE because it need to be isolated against other entry modules.
(() => {
// extracted by mini-css-extract-plugin

})();

// This entry need to be wrapped in an IIFE because it need to be isolated against other entry modules.
(() => {
// extracted by mini-css-extract-plugin

})();

// This entry need to be wrapped in an IIFE because it need to be isolated against other entry modules.
(() => {
// extracted by mini-css-extract-plugin

})();

// This entry need to be wrapped in an IIFE because it need to be isolated against other entry modules.
(() => {
// extracted by mini-css-extract-plugin

})();

// This entry need to be wrapped in an IIFE because it need to be isolated against other entry modules.
(() => {
// extracted by mini-css-extract-plugin

})();

// This entry need to be wrapped in an IIFE because it need to be isolated against other entry modules.
(() => {
// extracted by mini-css-extract-plugin

})();

// This entry need to be wrapped in an IIFE because it need to be isolated against other entry modules.
(() => {
// extracted by mini-css-extract-plugin

})();

// This entry need to be wrapped in an IIFE because it need to be isolated against other entry modules.
(() => {
// extracted by mini-css-extract-plugin

})();

// This entry need to be wrapped in an IIFE because it need to be isolated against other entry modules.
(() => {
// extracted by mini-css-extract-plugin

})();

// This entry need to be wrapped in an IIFE because it need to be isolated against other entry modules.
(() => {
// extracted by mini-css-extract-plugin

})();

// This entry need to be wrapped in an IIFE because it need to be isolated against other entry modules.
(() => {
// extracted by mini-css-extract-plugin

})();

// This entry need to be wrapped in an IIFE because it need to be isolated against other entry modules.
(() => {
// extracted by mini-css-extract-plugin

})();

// This entry need to be wrapped in an IIFE because it need to be isolated against other entry modules.
(() => {
// extracted by mini-css-extract-plugin

})();

// This entry need to be wrapped in an IIFE because it need to be isolated against other entry modules.
(() => {
// extracted by mini-css-extract-plugin

})();

// This entry need to be wrapped in an IIFE because it need to be isolated against other entry modules.
(() => {
// extracted by mini-css-extract-plugin

})();

/******/ })()
;
//# sourceMappingURL=main.bundle.js.map