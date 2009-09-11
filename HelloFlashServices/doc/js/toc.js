

var currentHilight = null;

function setCurrentDocPageId (inId) {
	var id = inId.replace(/^page_/, "");
	if (currentHilight) {
		if (currentHilight.id == id) return;
		$(currentHilight).removeClass("current");
	}
	var el = document.getElementById(id);
	if (el) {
		currentHilight = el;
		$(currentHilight).addClass("current");
	}
}


