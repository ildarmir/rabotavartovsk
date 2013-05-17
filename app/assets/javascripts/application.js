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




    $('#myTab li').click(function (e) {
       // alert("da");
        e.preventDefault();

         $("#myTab li[class='active']").removeClass("active");
         $(this).addClass("active");
         divTabOld = $(this).children("a").eq(0).attr("href");
            $(".tab-content .active").removeClass("active");
        $(".tab-content " + divTabOld).addClass("active");
//        var oldA = "#myTab li[class='active']";
//        $(oldA).removeClass("active");
//
//        $(this).parent("li").addClass("active");
//        var divTabActive = $(this).attr("href");
//        var divTabOld = $(oldA).children("a").eq(0).attr("href");
//        console.log(divTabOld + " " + divTabActive);
//        $(divTabActive).show();
//        $(divTabOld).hide();
    })


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
//Filter vacancy and resume - depend from input inputed chars
function InputFilter (opts) {
    this.filterElem = opts.elem;
    this.filtered = document.querySelectorAll(opts.filtered);
}

InputFilter.prototype.filter = function () {
    for (var i = 0; i < this.filtered.length; i++) {
        if (this.filtered [i].innerHTML.toLowerCase().indexOf(this.filterElem.value.toLowerCase()) == -1) {
            this.filtered [i].parentNode.style.display = 'none';
        }
        else {
            this.filtered [i].parentNode.style.display = 'table-row';
        }
    }
}
