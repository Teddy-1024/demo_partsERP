
import Validation from "./lib/validation";

function mapHashToController(hash) {
    if (hash == null) return mapHashToController(hashPageHome);

    url = _pathHost; // + '/';
    console.log("url: " + url + "\nhash: " + hash);
    return url + hash;

    switch (hash) {
        case hashPageErrorNoPermission:
            url += 'error';
            break;
        case hashPageStoreHome:
            url += 'store/home';
            break;
        case hashPageStoreProduct:
            url += 'store/product';
            break;
        case hashStoreBasketLoad:
            url += 'store/basket_load';
            break;
        case hashStoreBasketAdd:
            url += 'store/product';
            break;
        default:
            url += '';
    }

    return url;
}

/*
function goToPage(pageHash, parameters) {
    window.location.href = "{{ url_for(" + pageHash + (parameters == '' ? '' : ',' + parameters) + ") }}"; // getPageRoute(pageHash, parameters);
}
*/
function goToPage(pageHash, parametersJSON) {
    // window.location.href = "{{ url_for(" + pageHash + (parameters == '' ? '' : ',' + parameters) + ") }}"; // getPageRoute(pageHash, parameters);
    // ajaxJSONData(pageHash, mapHashToController(pageHash), parameters, null, false);
    url = mapHashToController(pageHash);

    
    if (!Validation.isEmpty(parametersJSON)) {
        url += '%3F'; // '?';
        let firstParameter = true;
        for (var p in parametersJSON) {
            // url += p + '=' + parametersJSON[p];
            if (!firstParameter) {
                url += '&';
            } else {
                firstParameter = false;
            }
            url += parametersJSON[p];
        }
    }
    
    leavePage();

    window.location.href = url;
    // ajaxJSONData(pageHash, url, parametersJSON, loadPageBody, false);
}
function leavePage() {}

function goToUrl(parameterisedUrl) {
    
    leavePage();

    window.location.href = parameterisedUrl;
}

function htmlEncode(value) {
    return document.createElement('<div/>').text(value).innerHTML;
}

var _domParser = null;
function htmlDecode(value) {
    if (_domParser == null) _domParser = DOMParser(); // https://www.w3docs.com/snippets/javascript/how-to-html-encode-a-string.html
    return _domParser.parseFromString(value, 'text/html').documentElement.textContent;
}

function convertForm2JSON(elemForm) {
    
    formData = {}

    formDataTmp = elemForm.serializeArray();

    $.each(formDataTmp, function(index, field) {
        formData[field.name] = field.value;
        /*
        console.log('field name: ' + field.name);
        console.log('field value: ' + field.value);
        console.log('field currentval: ' + getElementCurrentValue(field));
        */
    });
    
    return formData;
}

function loadPageBody(response) {

    let pageBody = document.querySelectorAll(idPageBody);

    console.log('ajax:');
    console.log(response.data);

    pageBody.innerHTML = response.data['html_block'];
}


