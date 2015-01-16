var hidden_s = true;
var hidden_f = true;
var trName_s = "item_hidden_s";
var trName_f = "item_hidden_f";
var display_show = "block";
var display_hidden = "none";
var spanId_s = "showMore_but_s";
var spanId_f = "showMore_but_f";
var but_show = "[收起]";
var but_hide = "[展开]";

function showMore_s() {
	var tr_display;
	var but_txt;
	if (hidden_s) {
		tr_display =display_show;
		but_txt = but_show;
	} else {
		tr_display = display_hidden;
		but_txt = but_hide;
	}
	var trList=getElementsByName_iefix("li", trName_s);
	for (var i = 0; i < trList.length; i++) {
		trList[i].style.display = tr_display;
	}
	var but = document.getElementById(spanId_s);
	if (but != null) {
		but.innerHTML = but_txt;
	}
	hidden_s = !hidden_s;
}

function showMore_f() {
	var tr_display;
	var but_txt;
	if (hidden_f) {
		tr_display =display_show;
		but_txt = but_show;
	} else {
		tr_display = display_hidden;
		but_txt = but_hide;
	}
	var trList=getElementsByName_iefix("li", trName_f);
	for (var i = 0; i < trList.length; i++) {
		trList[i].style.display = tr_display;
	}
	var but = document.getElementById(spanId_f);
	if (but != null) {
		but.innerHTML = but_txt;
	}
	hidden_f = !hidden_f;
}