!function(o){"use strict";function a(e){return this.each(function(){var t=o(this),a=t.data("bs.tab");a||t.data("bs.tab",a=new n(this)),"string"==typeof e&&a[e]()})}var n=function(t){this.element=o(t)};n.VERSION="3.2.0",n.prototype.show=function(){var t=this.element,a=t.closest("ul:not(.dropdown-menu)"),e=t.data("target");if(e||(e=(e=t.attr("href"))&&e.replace(/.*(?=#[^\s]*$)/,"")),!t.parent("li").hasClass("active")){var n=a.find(".active:last a")[0],s=o.Event("show.bs.tab",{relatedTarget:n});if(t.trigger(s),!s.isDefaultPrevented()){var i=o(e);this.activate(t.closest("li"),a),this.activate(i,i.parent(),function(){t.trigger({type:"shown.bs.tab",relatedTarget:n})})}}},n.prototype.activate=function(t,a,e){function n(){s.removeClass("active").find("> .dropdown-menu > .active").removeClass("active"),t.addClass("active"),i?(t[0].offsetWidth,t.addClass("in")):t.removeClass("fade"),t.parent(".dropdown-menu")&&t.closest("li.dropdown").addClass("active"),e&&e()}var s=a.find("> .active"),i=e&&o.support.transition&&s.hasClass("fade");i?s.one("bsTransitionEnd",n).emulateTransitionEnd(150):n(),s.removeClass("in")};var t=o.fn.tab;o.fn.tab=a,o.fn.tab.Constructor=n,o.fn.tab.noConflict=function(){return o.fn.tab=t,this},o(document).on("click.bs.tab.data-api",'[data-toggle="tab"], [data-toggle="pill"]',function(t){t.preventDefault(),a.call(o(this),"show")})}(jQuery);