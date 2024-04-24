var _loading = true; 

function hookupPageContact() {
    _loading = false;
}

function stylePageContact() {
    let elementEmail = $(idEmail);
    let elementName = $(idName);
    let elementMessage = $(idMessage);

    elementEmail.css({
        width: "50%"
    });
    elementName.css({
        width: "40%"
    });
    elementMessage.css({
        width: "66%"
    });
}