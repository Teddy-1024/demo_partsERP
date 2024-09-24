
function videoPlay(elemVideo) {
    if (!_loading) { // elemVideo.paused && 
        elemVideo.play();
        if (_verbose) { console.log("Playing video element: " + elemVideo.name)};
    }
}

function videoPause(elemVideo) {
    elemVideo.pause();
    if (_verbose) { console.log("Pausing video element: " + elemVideo.name)};
}

