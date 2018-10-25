!function(t){"function"==typeof define&&define.amd?define(["jquery"],t):t(jQuery)}(function(t){return t.ui=t.ui||{},t.ui.version="1.12.1"}),function(t){"function"==typeof define&&define.amd?define(["jquery","./version"],t):t(jQuery)}(function(t){return t.ui.ie=!!/msie [\w.]+/.exec(navigator.userAgent.toLowerCase())}),function(t){"function"==typeof define&&define.amd?define(["jquery","./version"],t):t(jQuery)}(function(c){var n,i=0,a=Array.prototype.slice;return c.cleanData=(n=c.cleanData,function(t){var e,i,s;for(s=0;null!=(i=t[s]);s++)try{(e=c._data(i,"events"))&&e.remove&&c(i).triggerHandler("remove")}catch(o){}n(t)}),c.widget=function(t,i,e){var s,o,n,r={},a=t.split(".")[0],l=a+"-"+(t=t.split(".")[1]);return e||(e=i,i=c.Widget),c.isArray(e)&&(e=c.extend.apply(null,[{}].concat(e))),c.expr[":"][l.toLowerCase()]=function(t){return!!c.data(t,l)},c[a]=c[a]||{},s=c[a][t],o=c[a][t]=function(t,e){if(!this._createWidget)return new o(t,e);arguments.length&&this._createWidget(t,e)},c.extend(o,s,{version:e.version,_proto:c.extend({},e),_childConstructors:[]}),(n=new i).options=c.widget.extend({},n.options),c.each(e,function(e,n){c.isFunction(n)?r[e]=function(){function s(){return i.prototype[e].apply(this,arguments)}function o(t){return i.prototype[e].apply(this,t)}return function(){var t,e=this._super,i=this._superApply;return this._super=s,this._superApply=o,t=n.apply(this,arguments),this._super=e,this._superApply=i,t}}():r[e]=n}),o.prototype=c.widget.extend(n,{widgetEventPrefix:s&&n.widgetEventPrefix||t},r,{constructor:o,namespace:a,widgetName:t,widgetFullName:l}),s?(c.each(s._childConstructors,function(t,e){var i=e.prototype;c.widget(i.namespace+"."+i.widgetName,o,e._proto)}),delete s._childConstructors):i._childConstructors.push(o),c.widget.bridge(t,o),o},c.widget.extend=function(t){for(var e,i,s=a.call(arguments,1),o=0,n=s.length;o<n;o++)for(e in s[o])i=s[o][e],s[o].hasOwnProperty(e)&&i!==undefined&&(c.isPlainObject(i)?t[e]=c.isPlainObject(t[e])?c.widget.extend({},t[e],i):c.widget.extend({},i):t[e]=i);return t},c.widget.bridge=function(n,e){var r=e.prototype.widgetFullName||n;c.fn[n]=function(i){var t="string"==typeof i,s=a.call(arguments,1),o=this;return t?this.length||"instance"!==i?this.each(function(){var t,e=c.data(this,r);return"instance"===i?(o=e,!1):e?c.isFunction(e[i])&&"_"!==i.charAt(0)?(t=e[i].apply(e,s))!==e&&t!==undefined?(o=t&&t.jquery?o.pushStack(t.get()):t,!1):void 0:c.error("no such method '"+i+"' for "+n+" widget instance"):c.error("cannot call methods on "+n+" prior to initialization; attempted to call method '"+i+"'")}):o=undefined:(s.length&&(i=c.widget.extend.apply(null,[i].concat(s))),this.each(function(){var t=c.data(this,r);t?(t.option(i||{}),t._init&&t._init()):c.data(this,r,new e(i,this))})),o}},c.Widget=function(){},c.Widget._childConstructors=[],c.Widget.prototype={widgetName:"widget",widgetEventPrefix:"",defaultElement:"<div>",options:{classes:{},disabled:!1,create:null},_createWidget:function(t,e){e=c(e||this.defaultElement||this)[0],this.element=c(e),this.uuid=i++,this.eventNamespace="."+this.widgetName+this.uuid,this.bindings=c(),this.hoverable=c(),this.focusable=c(),this.classesElementLookup={},e!==this&&(c.data(e,this.widgetFullName,this),this._on(!0,this.element,{remove:function(t){t.target===e&&this.destroy()}}),this.document=c(e.style?e.ownerDocument:e.document||e),this.window=c(this.document[0].defaultView||this.document[0].parentWindow)),this.options=c.widget.extend({},this.options,this._getCreateOptions(),t),this._create(),this.options.disabled&&this._setOptionDisabled(this.options.disabled),this._trigger("create",null,this._getCreateEventData()),this._init()},_getCreateOptions:function(){return{}},_getCreateEventData:c.noop,_create:c.noop,_init:c.noop,destroy:function(){var i=this;this._destroy(),c.each(this.classesElementLookup,function(t,e){i._removeClass(e,t)}),this.element.off(this.eventNamespace).removeData(this.widgetFullName),this.widget().off(this.eventNamespace).removeAttr("aria-disabled"),this.bindings.off(this.eventNamespace)},_destroy:c.noop,widget:function(){return this.element},option:function(t,e){var i,s,o,n=t;if(0===arguments.length)return c.widget.extend({},this.options);if("string"==typeof t)if(n={},t=(i=t.split(".")).shift(),i.length){for(s=n[t]=c.widget.extend({},this.options[t]),o=0;o<i.length-1;o++)s[i[o]]=s[i[o]]||{},s=s[i[o]];if(t=i.pop(),1===arguments.length)return s[t]===undefined?null:s[t];s[t]=e}else{if(1===arguments.length)return this.options[t]===undefined?null:this.options[t];n[t]=e}return this._setOptions(n),this},_setOptions:function(t){var e;for(e in t)this._setOption(e,t[e]);return this},_setOption:function(t,e){return"classes"===t&&this._setOptionClasses(e),this.options[t]=e,"disabled"===t&&this._setOptionDisabled(e),this},_setOptionClasses:function(t){var e,i,s;for(e in t)s=this.classesElementLookup[e],t[e]!==this.options.classes[e]&&s&&s.length&&(i=c(s.get()),this._removeClass(s,e),i.addClass(this._classes({element:i,keys:e,classes:t,add:!0})))},_setOptionDisabled:function(t){this._toggleClass(this.widget(),this.widgetFullName+"-disabled",null,!!t),t&&(this._removeClass(this.hoverable,null,"ui-state-hover"),this._removeClass(this.focusable,null,"ui-state-focus"))},enable:function(){return this._setOptions({disabled:!1})},disable:function(){return this._setOptions({disabled:!0})},_classes:function(o){function t(t,e){var i,s;for(s=0;s<t.length;s++)i=r.classesElementLookup[t[s]]||c(),i=o.add?c(c.unique(i.get().concat(o.element.get()))):c(i.not(o.element).get()),r.classesElementLookup[t[s]]=i,n.push(t[s]),e&&o.classes[t[s]]&&n.push(o.classes[t[s]])}var n=[],r=this;return o=c.extend({element:this.element,classes:this.options.classes||{}},o),this._on(o.element,{remove:"_untrackClassesElement"}),o.keys&&t(o.keys.match(/\S+/g)||[],!0),o.extra&&t(o.extra.match(/\S+/g)||[]),n.join(" ")},_untrackClassesElement:function(i){var s=this;c.each(s.classesElementLookup,function(t,e){-1!==c.inArray(i.target,e)&&(s.classesElementLookup[t]=c(e.not(i.target).get()))})},_removeClass:function(t,e,i){return this._toggleClass(t,e,i,!1)},_addClass:function(t,e,i){return this._toggleClass(t,e,i,!0)},_toggleClass:function(t,e,i,s){s="boolean"==typeof s?s:i;var o="string"==typeof t||null===t,n={extra:o?e:i,keys:o?t:e,element:o?this.element:t,add:s};return n.element.toggleClass(this._classes(n),s),this},_on:function(r,a,t){var l,h=this;"boolean"!=typeof r&&(t=a,a=r,r=!1),t?(a=l=c(a),this.bindings=this.bindings.add(a)):(t=a,a=this.element,l=this.widget()),c.each(t,function(t,e){function i(){if(r||!0!==h.options.disabled&&!c(this).hasClass("ui-state-disabled"))return("string"==typeof e?h[e]:e).apply(h,arguments)}"string"!=typeof e&&(i.guid=e.guid=e.guid||i.guid||c.guid++);var s=t.match(/^([\w:-]*)\s*(.*)$/),o=s[1]+h.eventNamespace,n=s[2];n?l.on(o,n,i):a.on(o,i)})},_off:function(t,e){e=(e||"").split(" ").join(this.eventNamespace+" ")+this.eventNamespace,t.off(e).off(e),this.bindings=c(this.bindings.not(t).get()),this.focusable=c(this.focusable.not(t).get()),this.hoverable=c(this.hoverable.not(t).get())},_delay:function(t,e){function i(){return("string"==typeof t?s[t]:t).apply(s,arguments)}var s=this;return setTimeout(i,e||0)},_hoverable:function(t){this.hoverable=this.hoverable.add(t),this._on(t,{mouseenter:function(t){this._addClass(c(t.currentTarget),null,"ui-state-hover")},mouseleave:function(t){this._removeClass(c(t.currentTarget),null,"ui-state-hover")}})},_focusable:function(t){this.focusable=this.focusable.add(t),this._on(t,{focusin:function(t){this._addClass(c(t.currentTarget),null,"ui-state-focus")},focusout:function(t){this._removeClass(c(t.currentTarget),null,"ui-state-focus")}})},_trigger:function(t,e,i){var s,o,n=this.options[t];if(i=i||{},(e=c.Event(e)).type=(t===this.widgetEventPrefix?t:this.widgetEventPrefix+t).toLowerCase(),e.target=this.element[0],o=e.originalEvent)for(s in o)s in e||(e[s]=o[s]);return this.element.trigger(e,i),!(c.isFunction(n)&&!1===n.apply(this.element[0],[e].concat(i))||e.isDefaultPrevented())}},c.each({show:"fadeIn",hide:"fadeOut"},function(n,r){c.Widget.prototype["_"+n]=function(e,t,i){var s;"string"==typeof t&&(t={effect:t});var o=t?!0===t||"number"==typeof t?r:t.effect||r:n;"number"==typeof(t=t||{})&&(t={duration:t}),s=!c.isEmptyObject(t),t.complete=i,t.delay&&e.delay(t.delay),s&&c.effects&&c.effects.effect[o]?e[n](t):o!==n&&e[o]?e[o](t.duration,t.easing,i):e.queue(function(t){c(this)[n](),i&&i.call(e[0]),t()})}}),c.widget}),function(t){"function"==typeof define&&define.amd?define(["jquery","../ie","../version","../widget"],t):t(jQuery)}(function(o){var n=!1;return o(document).on("mouseup",function(){n=!1}),o.widget("ui.mouse",{version:"1.12.1",options:{cancel:"input, textarea, button, select, option",distance:1,delay:0},_mouseInit:function(){var e=this;this.element.on("mousedown."+this.widgetName,function(t){return e._mouseDown(t)}).on("click."+this.widgetName,function(t){if(!0===o.data(t.target,e.widgetName+".preventClickEvent"))return o.removeData(t.target,e.widgetName+".preventClickEvent"),t.stopImmediatePropagation(),!1}),this.started=!1},_mouseDestroy:function(){this.element.off("."+this.widgetName),this._mouseMoveDelegate&&this.document.off("mousemove."+this.widgetName,this._mouseMoveDelegate).off("mouseup."+this.widgetName,this._mouseUpDelegate)},_mouseDown:function(t){if(!n){this._mouseMoved=!1,this._mouseStarted&&this._mouseUp(t),this._mouseDownEvent=t;var e=this,i=1===t.which,s=!("string"!=typeof this.options.cancel||!t.target.nodeName)&&o(t.target).closest(this.options.cancel).length;return!(i&&!s&&this._mouseCapture(t))||(this.mouseDelayMet=!this.options.delay,this.mouseDelayMet||(this._mouseDelayTimer=setTimeout(function(){e.mouseDelayMet=!0},this.options.delay)),this._mouseDistanceMet(t)&&this._mouseDelayMet(t)&&(this._mouseStarted=!1!==this._mouseStart(t),!this._mouseStarted)?(t.preventDefault(),!0):(!0===o.data(t.target,this.widgetName+".preventClickEvent")&&o.removeData(t.target,this.widgetName+".preventClickEvent"),this._mouseMoveDelegate=function(t){return e._mouseMove(t)},this._mouseUpDelegate=function(t){return e._mouseUp(t)},this.document.on("mousemove."+this.widgetName,this._mouseMoveDelegate).on("mouseup."+this.widgetName,this._mouseUpDelegate),t.preventDefault(),n=!0))}},_mouseMove:function(t){if(this._mouseMoved){if(o.ui.ie&&(!document.documentMode||document.documentMode<9)&&!t.button)return this._mouseUp(t);if(!t.which)if(t.originalEvent.altKey||t.originalEvent.ctrlKey||t.originalEvent.metaKey||t.originalEvent.shiftKey)this.ignoreMissingWhich=!0;else if(!this.ignoreMissingWhich)return this._mouseUp(t)}return(t.which||t.button)&&(this._mouseMoved=!0),this._mouseStarted?(this._mouseDrag(t),t.preventDefault()):(this._mouseDistanceMet(t)&&this._mouseDelayMet(t)&&(this._mouseStarted=!1!==this._mouseStart(this._mouseDownEvent,t),this._mouseStarted?this._mouseDrag(t):this._mouseUp(t)),!this._mouseStarted)},_mouseUp:function(t){this.document.off("mousemove."+this.widgetName,this._mouseMoveDelegate).off("mouseup."+this.widgetName,this._mouseUpDelegate),this._mouseStarted&&(this._mouseStarted=!1,t.target===this._mouseDownEvent.target&&o.data(t.target,this.widgetName+".preventClickEvent",!0),this._mouseStop(t)),this._mouseDelayTimer&&(clearTimeout(this._mouseDelayTimer),delete this._mouseDelayTimer),this.ignoreMissingWhich=!1,n=!1,t.preventDefault()},_mouseDistanceMet:function(t){return Math.max(Math.abs(this._mouseDownEvent.pageX-t.pageX),Math.abs(this._mouseDownEvent.pageY-t.pageY))>=this.options.distance},_mouseDelayMet:function(){return this.mouseDelayMet},_mouseStart:function(){},_mouseDrag:function(){},_mouseStop:function(){},_mouseCapture:function(){return!0}})}),function(t){"function"==typeof define&&define.amd?define(["jquery","./version"],t):t(jQuery)}(function(s){return s.extend(s.expr[":"],{data:s.expr.createPseudo?s.expr.createPseudo(function(e){return function(t){return!!s.data(t,e)}}):function(t,e,i){return!!s.data(t,i[3])}})}),function(t){"function"==typeof define&&define.amd?define(["jquery","./version"],t):t(jQuery)}(function(n){return n.ui.plugin={add:function(t,e,i){var s,o=n.ui[t].prototype;for(s in i)o.plugins[s]=o.plugins[s]||[],o.plugins[s].push([e,i[s]])},call:function(t,e,i,s){var o,n=t.plugins[e];if(n&&(s||t.element[0].parentNode&&11!==t.element[0].parentNode.nodeType))for(o=0;o<n.length;o++)t.options[n[o][0]]&&n[o][1].apply(t.element,i)}}}),function(t){"function"==typeof define&&define.amd?define(["jquery","./version"],t):t(jQuery)}(function(t){return t.ui.safeActiveElement=function(t){var e;try{e=t.activeElement}catch(i){e=t.body}return e||(e=t.body),e.nodeName||(e=t.body),e}}),function(t){"function"==typeof define&&define.amd?define(["jquery","./version"],t):t(jQuery)}(function(e){return e.ui.safeBlur=function(t){t&&"body"!==t.nodeName.toLowerCase()&&e(t).trigger("blur")}}),function(t){"function"==typeof define&&define.amd?define(["jquery","./version"],t):t(jQuery)}(function(n){return n.fn.scrollParent=function(t){var e=this.css("position"),i="absolute"===e,s=t?/(auto|scroll|hidden)/:/(auto|scroll)/,o=this.parents().filter(function(){var t=n(this);return(!i||"static"!==t.css("position"))&&s.test(t.css("overflow")+t.css("overflow-y")+t.css("overflow-x"))}).eq(0);return"fixed"!==e&&o.length?o:n(this[0].ownerDocument||document)}}),function(t){"function"==typeof define&&define.amd?define(["jquery","./mouse","../data","../plugin","../safe-active-element","../safe-blur","../scroll-parent","../version","../widget"],t):t(jQuery)}(function(y){return y.widget("ui.draggable",y.ui.mouse,{version:"1.12.1",widgetEventPrefix:"drag",options:{addClasses:!0,appendTo:"parent",axis:!1,connectToSortable:!1,containment:!1,cursor:"auto",cursorAt:!1,grid:!1,handle:!1,helper:"original",iframeFix:!1,opacity:!1,refreshPositions:!1,revert:!1,revertDuration:500,scope:"default",scroll:!0,scrollSensitivity:20,scrollSpeed:20,snap:!1,snapMode:"both",snapTolerance:20,stack:!1,zIndex:!1,drag:null,start:null,stop:null},_create:function(){"original"===this.options.helper&&this._setPositionRelative(),this.options.addClasses&&this._addClass("ui-draggable"),this._setHandleClassName(),this._mouseInit()},_setOption:function(t,e){this._super(t,e),"handle"===t&&(this._removeHandleClassName(),this._setHandleClassName())},_destroy:function(){(this.helper||this.element).is(".ui-draggable-dragging")?this.destroyOnClear=!0:(this._removeHandleClassName(),this._mouseDestroy())},_mouseCapture:function(t){var e=this.options;return!(this.helper||e.disabled||0<y(t.target).closest(".ui-resizable-handle").length)&&(this.handle=this._getHandle(t),!!this.handle&&(this._blurActiveElement(t),this._blockFrames(!0===e.iframeFix?"iframe":e.iframeFix),!0))},_blockFrames:function(t){this.iframeBlocks=this.document.find(t).map(function(){var t=y(this);return y("<div>").css("position","absolute").appendTo(t.parent()).outerWidth(t.outerWidth()).outerHeight(t.outerHeight()).offset(t.offset())[0]})},_unblockFrames:function(){this.iframeBlocks&&(this.iframeBlocks.remove(),delete this.iframeBlocks)},_blurActiveElement:function(t){var e=y.ui.safeActiveElement(this.document[0]);y(t.target).closest(e).length||y.ui.safeBlur(e)},_mouseStart:function(t){var e=this.options;return this.helper=this._createHelper(t),this._addClass(this.helper,"ui-draggable-dragging"),this._cacheHelperProportions(),y.ui.ddmanager&&(y.ui.ddmanager.current=this),this._cacheMargins(),this.cssPosition=this.helper.css("position"),this.scrollParent=this.helper.scrollParent(!0),this.offsetParent=this.helper.offsetParent(),this.hasFixedAncestor=0<this.helper.parents().filter(function(){return"fixed"===y(this).css("position")}).length,this.positionAbs=this.element.offset(),this._refreshOffsets(t),this.originalPosition=this.position=this._generatePosition(t,!1),this.originalPageX=t.pageX,this.originalPageY=t.pageY,e.cursorAt&&this._adjustOffsetFromHelper(e.cursorAt),this._setContainment(),!1===this._trigger("start",t)?(this._clear(),!1):(this._cacheHelperProportions(),y.ui.ddmanager&&!e.dropBehaviour&&y.ui.ddmanager.prepareOffsets(this,t),this._mouseDrag(t,!0),y.ui.ddmanager&&y.ui.ddmanager.dragStart(this,t),!0)},_refreshOffsets:function(t){this.offset={top:this.positionAbs.top-this.margins.top,left:this.positionAbs.left-this.margins.left,scroll:!1,parent:this._getParentOffset(),relative:this._getRelativeOffset()},this.offset.click={left:t.pageX-this.offset.left,top:t.pageY-this.offset.top}},_mouseDrag:function(t,e){if(this.hasFixedAncestor&&(this.offset.parent=this._getParentOffset()),this.position=this._generatePosition(t,!0),this.positionAbs=this._convertPositionTo("absolute"),!e){var i=this._uiHash();if(!1===this._trigger("drag",t,i))return this._mouseUp(new y.Event("mouseup",t)),!1;this.position=i.position}return this.helper[0].style.left=this.position.left+"px",this.helper[0].style.top=this.position.top+"px",y.ui.ddmanager&&y.ui.ddmanager.drag(this,t),!1},_mouseStop:function(t){var e=this,i=!1;return y.ui.ddmanager&&!this.options.dropBehaviour&&(i=y.ui.ddmanager.drop(this,t)),this.dropped&&(i=this.dropped,this.dropped=!1),"invalid"===this.options.revert&&!i||"valid"===this.options.revert&&i||!0===this.options.revert||y.isFunction(this.options.revert)&&this.options.revert.call(this.element,i)?y(this.helper).animate(this.originalPosition,parseInt(this.options.revertDuration,10),function(){!1!==e._trigger("stop",t)&&e._clear()}):!1!==this._trigger("stop",t)&&this._clear(),!1},_mouseUp:function(t){return this._unblockFrames(),y.ui.ddmanager&&y.ui.ddmanager.dragStop(this,t),this.handleElement.is(t.target)&&this.element.trigger("focus"),y.ui.mouse.prototype._mouseUp.call(this,t)},cancel:function(){return this.helper.is(".ui-draggable-dragging")?this._mouseUp(new y.Event("mouseup",{target:this.element[0]})):this._clear(),this},_getHandle:function(t){return!this.options.handle||!!y(t.target).closest(this.element.find(this.options.handle)).length},_setHandleClassName:function(){this.handleElement=this.options.handle?this.element.find(this.options.handle):this.element,this._addClass(this.handleElement,"ui-draggable-handle")},_removeHandleClassName:function(){this._removeClass(this.handleElement,"ui-draggable-handle")},_createHelper:function(t){var e=this.options,i=y.isFunction(e.helper),s=i?y(e.helper.apply(this.element[0],[t])):"clone"===e.helper?this.element.clone().removeAttr("id"):this.element;return s.parents("body").length||s.appendTo("parent"===e.appendTo?this.element[0].parentNode:e.appendTo),i&&s[0]===this.element[0]&&this._setPositionRelative(),s[0]===this.element[0]||/(fixed|absolute)/.test(s.css("position"))||s.css("position","absolute"),s},_setPositionRelative:function(){/^(?:r|a|f)/.test(this.element.css("position"))||(this.element[0].style.position="relative")},_adjustOffsetFromHelper:function(t){"string"==typeof t&&(t=t.split(" ")),y.isArray(t)&&(t={left:+t[0],top:+t[1]||0}),"left"in t&&(this.offset.click.left=t.left+this.margins.left),"right"in t&&(this.offset.click.left=this.helperProportions.width-t.right+this.margins.left),"top"in t&&(this.offset.click.top=t.top+this.margins.top),"bottom"in t&&(this.offset.click.top=this.helperProportions.height-t.bottom+this.margins.top)},_isRootNode:function(t){return/(html|body)/i.test(t.tagName)||t===this.document[0]},_getParentOffset:function(){var t=this.offsetParent.offset(),e=this.document[0];return"absolute"===this.cssPosition&&this.scrollParent[0]!==e&&y.contains(this.scrollParent[0],this.offsetParent[0])&&(t.left+=this.scrollParent.scrollLeft(),t.top+=this.scrollParent.scrollTop()),this._isRootNode(this.offsetParent[0])&&(t={top:0,left:0}),{top:t.top+(parseInt(this.offsetParent.css("borderTopWidth"),10)||0),left:t.left+(parseInt(this.offsetParent.css("borderLeftWidth"),10)||0)}},_getRelativeOffset:function(){if("relative"!==this.cssPosition)return{top:0,left:0};var t=this.element.position(),e=this._isRootNode(this.scrollParent[0]);return{top:t.top-(parseInt(this.helper.css("top"),10)||0)+(e?0:this.scrollParent.scrollTop()),left:t.left-(parseInt(this.helper.css("left"),10)||0)+(e?0:this.scrollParent.scrollLeft())}},_cacheMargins:function(){this.margins={left:parseInt(this.element.css("marginLeft"),10)||0,top:parseInt(this.element.css("marginTop"),10)||0,right:parseInt(this.element.css("marginRight"),10)||0,bottom:parseInt(this.element.css("marginBottom"),10)||0}},_cacheHelperProportions:function(){this.helperProportions={width:this.helper.outerWidth(),height:this.helper.outerHeight()}},_setContainment:function(){var t,e,i,s=this.options,o=this.document[0];this.relativeContainer=null,s.containment?"window"!==s.containment?"document"!==s.containment?s.containment.constructor!==Array?("parent"===s.containment&&(s.containment=this.helper[0].parentNode),(i=(e=y(s.containment))[0])&&(t=/(scroll|auto)/.test(e.css("overflow")),this.containment=[(parseInt(e.css("borderLeftWidth"),10)||0)+(parseInt(e.css("paddingLeft"),10)||0),(parseInt(e.css("borderTopWidth"),10)||0)+(parseInt(e.css("paddingTop"),10)||0),(t?Math.max(i.scrollWidth,i.offsetWidth):i.offsetWidth)-(parseInt(e.css("borderRightWidth"),10)||0)-(parseInt(e.css("paddingRight"),10)||0)-this.helperProportions.width-this.margins.left-this.margins.right,(t?Math.max(i.scrollHeight,i.offsetHeight):i.offsetHeight)-(parseInt(e.css("borderBottomWidth"),10)||0)-(parseInt(e.css("paddingBottom"),10)||0)-this.helperProportions.height-this.margins.top-this.margins.bottom],this.relativeContainer=e)):this.containment=s.containment:this.containment=[0,0,y(o).width()-this.helperProportions.width-this.margins.left,(y(o).height()||o.body.parentNode.scrollHeight)-this.helperProportions.height-this.margins.top]:this.containment=[y(window).scrollLeft()-this.offset.relative.left-this.offset.parent.left,y(window).scrollTop()-this.offset.relative.top-this.offset.parent.top,y(window).scrollLeft()+y(window).width()-this.helperProportions.width-this.margins.left,y(window).scrollTop()+(y(window).height()||o.body.parentNode.scrollHeight)-this.helperProportions.height-this.margins.top]:this.containment=null},_convertPositionTo:function(t,e){e||(e=this.position);var i="absolute"===t?1:-1,s=this._isRootNode(this.scrollParent[0]);return{top:e.top+this.offset.relative.top*i+this.offset.parent.top*i-("fixed"===this.cssPosition?-this.offset.scroll.top:s?0:this.offset.scroll.top)*i,left:e.left+this.offset.relative.left*i+this.offset.parent.left*i-("fixed"===this.cssPosition?-this.offset.scroll.left:s?0:this.offset.scroll.left)*i}},_generatePosition:function(t,e){var i,s,o,n,r=this.options,a=this._isRootNode(this.scrollParent[0]),l=t.pageX,h=t.pageY;return a&&this.offset.scroll||(this.offset.scroll={top:this.scrollParent.scrollTop(),left:this.scrollParent.scrollLeft()}),e&&(this.containment&&(i=this.relativeContainer?(s=this.relativeContainer.offset(),[this.containment[0]+s.left,this.containment[1]+s.top,this.containment[2]+s.left,this.containment[3]+s.top]):this.containment,t.pageX-this.offset.click.left<i[0]&&(l=i[0]+this.offset.click.left),t.pageY-this.offset.click.top<i[1]&&(h=i[1]+this.offset.click.top),t.pageX-this.offset.click.left>i[2]&&(l=i[2]+this.offset.click.left),t.pageY-this.offset.click.top>i[3]&&(h=i[3]+this.offset.click.top)),r.grid&&(o=r.grid[1]?this.originalPageY+Math.round((h-this.originalPageY)/r.grid[1])*r.grid[1]:this.originalPageY,h=i?o-this.offset.click.top>=i[1]||o-this.offset.click.top>i[3]?o:o-this.offset.click.top>=i[1]?o-r.grid[1]:o+r.grid[1]:o,n=r.grid[0]?this.originalPageX+Math.round((l-this.originalPageX)/r.grid[0])*r.grid[0]:this.originalPageX,l=i?n-this.offset.click.left>=i[0]||n-this.offset.click.left>i[2]?n:n-this.offset.click.left>=i[0]?n-r.grid[0]:n+r.grid[0]:n),"y"===r.axis&&(l=this.originalPageX),"x"===r.axis&&(h=this.originalPageY)),{top:h-this.offset.click.top-this.offset.relative.top-this.offset.parent.top+("fixed"===this.cssPosition?-this.offset.scroll.top:a?0:this.offset.scroll.top),left:l-this.offset.click.left-this.offset.relative.left-this.offset.parent.left+("fixed"===this.cssPosition?-this.offset.scroll.left:a?0:this.offset.scroll.left)}},_clear:function(){this._removeClass(this.helper,"ui-draggable-dragging"),this.helper[0]===this.element[0]||this.cancelHelperRemoval||this.helper.remove(),this.helper=null,this.cancelHelperRemoval=!1,this.destroyOnClear&&this.destroy()},_trigger:function(t,e,i){return i=i||this._uiHash(),y.ui.plugin.call(this,t,[e,i,this],!0),/^(drag|start|stop)/.test(t)&&(this.positionAbs=this._convertPositionTo("absolute"),i.offset=this.positionAbs),y.Widget.prototype._trigger.call(this,t,e,i)},plugins:{},_uiHash:function(){return{helper:this.helper,position:this.position,originalPosition:this.originalPosition,offset:this.positionAbs}}}),y.ui.plugin.add("draggable","connectToSortable",{start:function(e,t,i){var s=y.extend({},t,{item:i.element});i.sortables=[],y(i.options.connectToSortable).each(function(){var t=y(this).sortable("instance");t&&!t.options.disabled&&(i.sortables.push(t),t.refreshPositions(),t._trigger("activate",e,s))})},stop:function(e,t,i){var s=y.extend({},t,{item:i.element});i.cancelHelperRemoval=!1,y.each(i.sortables,function(){var t=this;t.isOver?(t.isOver=0,i.cancelHelperRemoval=!0,t.cancelHelperRemoval=!1,t._storedCSS={position:t.placeholder.css("position"),top:t.placeholder.css("top"),left:t.placeholder.css("left")},t._mouseStop(e),t.options.helper=t.options._helper):(t.cancelHelperRemoval=!0,t._trigger("deactivate",e,s))})},drag:function(i,s,o){y.each(o.sortables,function(){var t=!1,e=this;e.positionAbs=o.positionAbs,e.helperProportions=o.helperProportions,e.offset.click=o.offset.click,e._intersectsWith(e.containerCache)&&(t=!0,y.each(o.sortables,function(){return this.positionAbs=o.positionAbs,this.helperProportions=o.helperProportions,this.offset.click=o.offset.click,this!==e&&this._intersectsWith(this.containerCache)&&y.contains(e.element[0],this.element[0])&&(t=!1),t})),t?(e.isOver||(e.isOver=1,o._parent=s.helper.parent(),e.currentItem=s.helper.appendTo(e.element).data("ui-sortable-item",!0),e.options._helper=e.options.helper,e.options.helper=function(){return s.helper[0]},i.target=e.currentItem[0],e._mouseCapture(i,!0),e._mouseStart(i,!0,!0),e.offset.click.top=o.offset.click.top,e.offset.click.left=o.offset.click.left,e.offset.parent.left-=o.offset.parent.left-e.offset.parent.left,e.offset.parent.top-=o.offset.parent.top-e.offset.parent.top,o._trigger("toSortable",i),o.dropped=e.element,y.each(o.sortables,function(){this.refreshPositions()}),o.currentItem=o.element,e.fromOutside=o),e.currentItem&&(e._mouseDrag(i),s.position=e.position)):e.isOver&&(e.isOver=0,e.cancelHelperRemoval=!0,e.options._revert=e.options.revert,e.options.revert=!1,e._trigger("out",i,e._uiHash(e)),e._mouseStop(i,!0),e.options.revert=e.options._revert,e.options.helper=e.options._helper,e.placeholder&&e.placeholder.remove(),s.helper.appendTo(o._parent),o._refreshOffsets(i),s.position=o._generatePosition(i,!0),o._trigger("fromSortable",i),o.dropped=!1,y.each(o.sortables,function(){this.refreshPositions()}))})}}),y.ui.plugin.add("draggable","cursor",{start:function(t,e,i){var s=y("body"),o=i.options;s.css("cursor")&&(o._cursor=s.css("cursor")),s.css("cursor",o.cursor)},stop:function(t,e,i){var s=i.options;s._cursor&&y("body").css("cursor",s._cursor)}}),y.ui.plugin.add("draggable","opacity",{start:function(t,e,i){var s=y(e.helper),o=i.options;s.css("opacity")&&(o._opacity=s.css("opacity")),s.css("opacity",o.opacity)},stop:function(t,e,i){var s=i.options;s._opacity&&y(e.helper).css("opacity",s._opacity)}}),y.ui.plugin.add("draggable","scroll",{start:function(t,e,i){i.scrollParentNotHidden||(i.scrollParentNotHidden=i.helper.scrollParent(!1)),i.scrollParentNotHidden[0]!==i.document[0]&&"HTML"!==i.scrollParentNotHidden[0].tagName&&(i.overflowOffset=i.scrollParentNotHidden.offset())},drag:function(t,e,i){var s=i.options,o=!1,n=i.scrollParentNotHidden[0],r=i.document[0];n!==r&&"HTML"!==n.tagName?(s.axis&&"x"===s.axis||(i.overflowOffset.top+n.offsetHeight-t.pageY<s.scrollSensitivity?n.scrollTop=o=n.scrollTop+s.scrollSpeed:t.pageY-i.overflowOffset.top<s.scrollSensitivity&&(n.scrollTop=o=n.scrollTop-s.scrollSpeed)),s.axis&&"y"===s.axis||(i.overflowOffset.left+n.offsetWidth-t.pageX<s.scrollSensitivity?n.scrollLeft=o=n.scrollLeft+s.scrollSpeed:t.pageX-i.overflowOffset.left<s.scrollSensitivity&&(n.scrollLeft=o=n.scrollLeft-s.scrollSpeed))):(s.axis&&"x"===s.axis||(t.pageY-y(r).scrollTop()<s.scrollSensitivity?o=y(r).scrollTop(y(r).scrollTop()-s.scrollSpeed):y(window).height()-(t.pageY-y(r).scrollTop())<s.scrollSensitivity&&(o=y(r).scrollTop(y(r).scrollTop()+s.scrollSpeed))),s.axis&&"y"===s.axis||(t.pageX-y(r).scrollLeft()<s.scrollSensitivity?o=y(r).scrollLeft(y(r).scrollLeft()-s.scrollSpeed):y(window).width()-(t.pageX-y(r).scrollLeft())<s.scrollSensitivity&&(o=y(r).scrollLeft(y(r).scrollLeft()+s.scrollSpeed)))),!1!==o&&y.ui.ddmanager&&!s.dropBehaviour&&y.ui.ddmanager.prepareOffsets(i,t)}}),y.ui.plugin.add("draggable","snap",{start:function(t,e,i){var s=i.options;i.snapElements=[],y(s.snap.constructor!==String?s.snap.items||":data(ui-draggable)":s.snap).each(function(){var t=y(this),e=t.offset();this!==i.element[0]&&i.snapElements.push({item:this,width:t.outerWidth(),height:t.outerHeight(),top:e.top,left:e.left})})},drag:function(t,e,i){var s,o,n,r,a,l,h,c,p,f,u=i.options,d=u.snapTolerance,g=e.offset.left,m=g+i.helperProportions.width,v=e.offset.top,_=v+i.helperProportions.height;for(p=i.snapElements.length-1;0<=p;p--)l=(a=i.snapElements[p].left-i.margins.left)+i.snapElements[p].width,c=(h=i.snapElements[p].top-i.margins.top)+i.snapElements[p].height,m<a-d||l+d<g||_<h-d||c+d<v||!y.contains(i.snapElements[p].item.ownerDocument,i.snapElements[p].item)?(i.snapElements[p].snapping&&i.options.snap.release&&i.options.snap.release.call(i.element,t,y.extend(i._uiHash(),{snapItem:i.snapElements[p].item})),i.snapElements[p].snapping=!1):("inner"!==u.snapMode&&(s=Math.abs(h-_)<=d,o=Math.abs(c-v)<=d,n=Math.abs(a-m)<=d,r=Math.abs(l-g)<=d,s&&(e.position.top=i._convertPositionTo("relative",{top:h-i.helperProportions.height,left:0}).top),o&&(e.position.top=i._convertPositionTo("relative",{top:c,left:0}).top),n&&(e.position.left=i._convertPositionTo("relative",{top:0,left:a-i.helperProportions.width}).left),r&&(e.position.left=i._convertPositionTo("relative",{top:0,left:l}).left)),f=s||o||n||r,"outer"!==u.snapMode&&(s=Math.abs(h-v)<=d,o=Math.abs(c-_)<=d,n=Math.abs(a-g)<=d,r=Math.abs(l-m)<=d,s&&(e.position.top=i._convertPositionTo("relative",{top:h,left:0}).top),o&&(e.position.top=i._convertPositionTo("relative",{top:c-i.helperProportions.height,left:0}).top),n&&(e.position.left=i._convertPositionTo("relative",{top:0,left:a}).left),r&&(e.position.left=i._convertPositionTo("relative",{top:0,left:l-i.helperProportions.width}).left)),!i.snapElements[p].snapping&&(s||o||n||r||f)&&i.options.snap.snap&&i.options.snap.snap.call(i.element,t,y.extend(i._uiHash(),{snapItem:i.snapElements[p].item})),i.snapElements[p].snapping=s||o||n||r||f)}}),y.ui.plugin.add("draggable","stack",{start:function(t,e,i){var s,o=i.options,n=y.makeArray(y(o.stack)).sort(function(t,e){return(parseInt(y(t).css("zIndex"),10)||0)-(parseInt(y(e).css("zIndex"),10)||0)});n.length&&(s=parseInt(y(n[0]).css("zIndex"),10)||0,y(n).each(function(t){y(this).css("zIndex",s+t)}),this.css("zIndex",s+n.length))}}),y.ui.plugin.add("draggable","zIndex",{start:function(t,e,i){var s=y(e.helper),o=i.options;s.css("zIndex")&&(o._zIndex=s.css("zIndex")),s.css("zIndex",o.zIndex)},stop:function(t,e,i){var s=i.options;s._zIndex&&y(e.helper).css("zIndex",s._zIndex)}}),y.ui.draggable});