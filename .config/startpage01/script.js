function renderTime() {
	var date = new Date();
	var year = date.getFullYear(); 
	var day = date.getDay();
	var month = date.getMonth();
	var dayM = date.getDate();

	var dayArray = new Array("dom", "seg", "ter", "qua", "qui", "sex", "sáb");

	var h = date.getHours();
	var m = date.getMinutes();
	var s = date.getSeconds();

	if (h == 24) {
		h = 0;
	}

	if (h < 10) {
		h = "0" + h;
	}

	if (m < 10) {
		m = "0" + m;
	}

	if (s < 10) {
		s = "0" + s;
	}

	var msg;
	if (h < 6) {
		msg = "(You should be sleeping :/)";
	} else {
		msg = "";
	}

	var dateDisplay = document.getElementById("dateDisplay")
	dateDisplay.textContent = "" + dayM + "/" + (month+1) + "/" + year + " (" + dayArray[day] + ")";

	var dateDisplay = document.getElementById("clockDisplay")
	clockDisplay.textContent = "" + h + ":" + m + ":" + s + " " + msg; 

	setTimeout("renderTime()", 1000);
}
renderTime();
