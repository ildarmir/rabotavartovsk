// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
$(document).ready(function(){
	$( "#articles" ).accordion({
		event: "mouseover"
	});
	
	$( "#tabs" ).tabs();	
});
//Open close element
function Expand (options) {
	this._elem = options.elem;	
	this._openClassName = options.openClassName || "open";
}

Expand.prototype = {
	open : function () {
		
		removeClass(this._elem, "close")
		addClass(this._elem, this._openClassName);	
	},
	close : function () {

		addClass(this._elem, "close");	
		removeClass(this._elem, this._openClassName)
		
	},
	check : function () {
		if (this._elem) {

		    if (hasClass(this._elem, this._openClassName)){
		    	// alert("da");
		      this.close();
		    }
		    else {
		    	// alert("uu");
		      this.open();
		    }
		}
    }
}




function addClass(el, cls) { 
  var c = el.className.split(' ');
  for (var i=0; i<c.length; i++) {
    if (c[i] == cls) return;
  }
  c.push(cls);
  el.className = c.join(' ');
}

function removeClass(el, cls) {
  var c = el.className.split(' ');
  for (var i=0; i<c.length; i++) {
    if (c[i] == cls) c.splice(i--, 1);
  }

  el.className = c.join(' ');
}

function hasClass(el, cls) {
  for (var c = el.className.split(' '),i=c.length-1; i>=0; i--) {
    if (c[i] == cls) return true;
  }
  return false;
}
