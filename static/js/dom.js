// Module for DOM manipulation
export default class DOM {
    static updateElement(id, data) {
        const element = document.getElementById(id);
        if (element) {
            element.textContent = data;
        }
    }

    // Add more DOM manipulation methods as needed
    
    static convertForm2JSON(elementForm) {
        formData = {}
        formDataTmp = elementForm.serializeArray();
        formDataTmp.forEach((value, key) => {
            formData[key] = value;
            /*
            console.log('key: ' + key);
            console.log('value: ' + value);
            */
        });
        return formData;
    }
    
    static loadPageBody(contentNew) {
        let pageBody = document.querySelector(idPageBody);
        pageBody.innerHTML = contentNew;
    }

    static getHashPageCurrent() {
        return document.body.dataset.page;
    }
}
