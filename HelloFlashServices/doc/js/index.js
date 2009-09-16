

var DEFAULT_LOCATION = "main.html";

/*
If the frame docFrame does not already shows a page,
the url passed as parameter is used to load content.
*/
function init() {
    var q = window.location.search;
    var url = q.substring(1, q.length);
    if (url != "") {
        docFrame.document.location = url;
        return;
    }
    //
    docFrame.document.location = DEFAULT_LOCATION;
}
$(document).ready(function() {
	init();
});
/*
Tells the toc frame to update and highlight the link that corresponds to the shown page.
*/
function setCurrentPage(inPageClassName) {
	tocFrame.update(inPageClassName);
}


