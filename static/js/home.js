var _loading = true; 

function hookupPageHome() {
    hookupVideos();
    
    let btnContact = $($("button.button-contact")[0]);
    initialiseEventHandler(btnContact, flagInitialised, function() {
        btnContact.on("click", function(event) {
            event.stopPropagation();
            goToPage(hashPageContact);
        });
    });
    
    _loading = false;
}
