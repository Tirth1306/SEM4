var addComment={moveForm:function(a,b,c,d){var e,f,g,h,i=this,j=i.I(a),k=i.I(c),l=i.I("cancel-comment-reply-link"),m=i.I("comment_parent"),n=i.I("comment_post_ID"),o=k.getElementsByTagName("form")[0];if(j&&k&&l&&m&&o){i.respondId=c,d=d||!1,i.I("wp-temp-form-div")||(e=document.createElement("div"),e.id="wp-temp-form-div",e.style.display="none",k.parentNode.insertBefore(e,k)),j.parentNode.insertBefore(k,j.nextSibling),n&&d&&(n.value=d),m.value=b,l.style.display="",l.onclick=function(){var a=addComment,b=a.I("wp-temp-form-div"),c=a.I(a.respondId);if(b&&c)return a.I("comment_parent").value="0",b.parentNode.insertBefore(c,b),b.parentNode.removeChild(b),this.style.display="none",this.onclick=null,!1};try{for(var p=0;p<o.elements.length;p++)if(f=o.elements[p],h=!1,"getComputedStyle"in window?g=window.getComputedStyle(f):document.documentElement.currentStyle&&(g=f.currentStyle),(f.offsetWidth<=0&&f.offsetHeight<=0||"hidden"===g.visibility)&&(h=!0),"hidden"!==f.type&&!f.disabled&&!h){f.focus();break}}catch(q){}return!1}},I:function(a){return document.getElementById(a)}};
;/*!
 * typeahead.js 0.9.0
 * https://github.com/twitter/typeahead
 * Copyright 2013 Twitter, Inc. and other contributors; Licensed MIT
 */

(function(t){var e="0.9.0",i={isMsie:function(){var t=/(msie) ([\w.]+)/i.exec(navigator.userAgent);return t?parseInt(t[2],10):!1},isBlankString:function(t){return!t||/^\s*$/.test(t)},escapeRegExChars:function(t){return t.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g,"\\$&")},isString:function(t){return"string"==typeof t},isNumber:function(t){return"number"==typeof t},isArray:t.isArray,isFunction:t.isFunction,isObject:t.isPlainObject,isUndefined:function(t){return t===void 0},bind:t.proxy,bindAll:function(e){var i;for(var n in e)t.isFunction(i=e[n])&&(e[n]=t.proxy(i,e))},indexOf:function(t,e){for(var i=0;t.length>i;i++)if(t[i]===e)return i;return-1},each:t.each,map:t.map,filter:t.grep,every:function(e,i){var n=!0;return e?(t.each(e,function(t,s){return(n=i.call(null,s,t,e))?void 0:!1}),!!n):n},some:function(e,i){var n=!1;return e?(t.each(e,function(t,s){return(n=i.call(null,s,t,e))?!1:void 0}),!!n):n},mixin:t.extend,getUniqueId:function(){var t=0;return function(){return t++}}(),defer:function(t){setTimeout(t,0)},debounce:function(t,e,i){var n,s;return function(){var r,o,a=this,u=arguments;return r=function(){n=null,i||(s=t.apply(a,u))},o=i&&!n,clearTimeout(n),n=setTimeout(r,e),o&&(s=t.apply(a,u)),s}},throttle:function(t,e){var i,n,s,r,o,a;return o=0,a=function(){o=new Date,s=null,r=t.apply(i,n)},function(){var u=new Date,c=e-(u-o);return i=this,n=arguments,0>=c?(clearTimeout(s),s=null,o=u,r=t.apply(i,n)):s||(s=setTimeout(a,c)),r}},tokenizeQuery:function(e){return t.trim(e).toLowerCase().split(/[\s]+/)},tokenizeText:function(e){return t.trim(e).toLowerCase().split(/[\s\-_]+/)},getProtocol:function(){return location.protocol},noop:function(){}},n=function(){var t=/\s+/;return{on:function(e,i){var n;if(!i)return this;for(this._callbacks=this._callbacks||{},e=e.split(t);n=e.shift();)this._callbacks[n]=this._callbacks[n]||[],this._callbacks[n].push(i);return this},trigger:function(e,i){var n,s;if(!this._callbacks)return this;for(e=e.split(t);n=e.shift();)if(s=this._callbacks[n])for(var r=0;s.length>r;r+=1)s[r].call(this,{type:n,data:i});return this}}}(),s=function(){function e(e){e&&e.el||t.error("EventBus initialized without el"),this.$el=t(e.el)}var n="typeahead:";return i.mixin(e.prototype,{trigger:function(t){var e=[].slice.call(arguments,1);this.$el.trigger(n+t,e)}}),e}(),r=function(){function t(t){this.prefix=["__",t,"__"].join(""),this.ttlKey="__ttl__",this.keyMatcher=RegExp("^"+this.prefix)}function e(){return(new Date).getTime()}function n(t){return JSON.stringify(i.isUndefined(t)?null:t)}function s(t){return JSON.parse(t)}var r,o=window.localStorage;return r=window.localStorage&&window.JSON?{_prefix:function(t){return this.prefix+t},_ttlKey:function(t){return this._prefix(t)+this.ttlKey},get:function(t){return this.isExpired(t)&&this.remove(t),s(o.getItem(this._prefix(t)))},set:function(t,s,r){return i.isNumber(r)?o.setItem(this._ttlKey(t),n(e()+r)):o.removeItem(this._ttlKey(t)),o.setItem(this._prefix(t),n(s))},remove:function(t){return o.removeItem(this._ttlKey(t)),o.removeItem(this._prefix(t)),this},clear:function(){var t,e,i=[],n=o.length;for(t=0;n>t;t++)(e=o.key(t)).match(this.keyMatcher)&&i.push(e.replace(this.keyMatcher,""));for(t=i.length;t--;)this.remove(i[t]);return this},isExpired:function(t){var n=s(o.getItem(this._ttlKey(t)));return i.isNumber(n)&&e()>n?!0:!1}}:{get:i.noop,set:i.noop,remove:i.noop,clear:i.noop,isExpired:i.noop},i.mixin(t.prototype,r),t}(),o=function(){function t(t){i.bindAll(this),t=t||{},this.sizeLimit=t.sizeLimit||10,this.cache={},this.cachedKeysByAge=[]}return i.mixin(t.prototype,{get:function(t){return this.cache[t]},set:function(t,e){var i;this.cachedKeysByAge.length===this.sizeLimit&&(i=this.cachedKeysByAge.shift(),delete this.cache[i]),this.cache[t]=e,this.cachedKeysByAge.push(t)}}),t}(),a=function(){function e(t){i.bindAll(this),t=i.isString(t)?{url:t}:t,u=u||new o,a=i.isNumber(t.maxParallelRequests)?t.maxParallelRequests:a||6,this.url=t.url,this.wildcard=t.wildcard||"%QUERY",this.filter=t.filter,this.replace=t.replace,this.ajaxSettings={type:"get",cache:t.cache,timeout:t.timeout,dataType:t.dataType||"json",beforeSend:t.beforeSend},this.get=(/^throttle$/i.test(t.rateLimitFn)?i.throttle:i.debounce)(this.get,t.rateLimitWait||300)}function n(){c++}function s(){c--}function r(){return a>c}var a,u,c=0;return i.mixin(e.prototype,{get:function(e,i){function o(t){t=l.filter?l.filter(t):t,i&&i(t),u.set(c,t)}function a(){s(),l.onDeckRequestArgs&&(l.get.apply(l,l.onDeckRequestArgs),l.onDeckRequestArgs=null)}var c,h,l=this,d=encodeURIComponent(e||"");c=this.replace?this.replace(this.url,d):this.url.replace(this.wildcard,d),(h=u.get(c))?i&&i(h):r()?(n(),t.ajax(c,this.ajaxSettings).done(o).always(a)):this.onDeckRequestArgs=[].slice.call(arguments,0)}}),e}(),u=function(){function n(e){i.bindAll(this),e.template&&!e.engine&&t.error("no template engine specified"),e.local||e.prefetch||e.remote||t.error("one of local, prefetch, or remote is requried"),this.name=e.name||i.getUniqueId(),this.limit=e.limit||5,this.header=e.header,this.footer=e.footer,this.valueKey=e.valueKey||"value",this.template=s(e.template,e.engine,this.valueKey),this.local=e.local,this.prefetch=e.prefetch,this.remote=e.remote,this.keys={version:"version",protocol:"protocol",itemHash:"itemHash",adjacencyList:"adjacencyList"},this.itemHash={},this.adjacencyList={},this.storage=e.name?new r(e.name):null}function s(t,e,i){var n,s='<div class="tt-suggestion">%body</div>';return n=t?e.compile(s.replace("%body",t)):{render:function(t){return s.replace("%body","<p>"+t[i]+"</p>")}}}return i.mixin(n.prototype,{_processLocalData:function(t){this._mergeProcessedData(this._processData(t))},_loadPrefetchData:function(n){function s(t){var s=n.filter?n.filter(t):t,r=l._processData(s),o=r.itemHash,a=r.adjacencyList;l.storage&&(l.storage.set(l.keys.itemHash,o,n.ttl),l.storage.set(l.keys.adjacencyList,a,n.ttl),l.storage.set(l.keys.version,e,n.ttl),l.storage.set(l.keys.protocol,i.getProtocol(),n.ttl)),l._mergeProcessedData(r)}var r,o,a,u,c,h,l=this;return this.storage&&(o=this.storage.get(this.keys.version),a=this.storage.get(this.keys.protocol),u=this.storage.get(this.keys.itemHash),c=this.storage.get(this.keys.adjacencyList),h=o!==e||a!==i.getProtocol()),n=i.isString(n)?{url:n}:n,n.ttl=i.isNumber(n.ttl)?n.ttl:864e5,u&&c&&!h?(this._mergeProcessedData({itemHash:u,adjacencyList:c}),r=t.Deferred().resolve()):r=t.getJSON(n.url).done(s),r},_transformDatum:function(t){var e=i.isString(t)?t:t[this.valueKey],n=t.tokens||i.tokenizeText(e),s={value:e,tokens:n};return i.isString(t)?(s.datum={},s.datum[this.valueKey]=t):s.datum=t,s.tokens=i.filter(s.tokens,function(t){return!i.isBlankString(t)}),s.tokens=i.map(s.tokens,function(t){return t.toLowerCase()}),s},_processData:function(t){var e=this,n={},s={};return i.each(t,function(t,r){var o=e._transformDatum(r),a=i.getUniqueId(o.value);n[a]=o,i.each(o.tokens,function(t,e){var n=e.charAt(0),r=s[n]||(s[n]=[a]);!~i.indexOf(r,a)&&r.push(a)})}),{itemHash:n,adjacencyList:s}},_mergeProcessedData:function(t){var e=this;i.mixin(this.itemHash,t.itemHash),i.each(t.adjacencyList,function(t,i){var n=e.adjacencyList[t];e.adjacencyList[t]=n?n.concat(i):i})},_getLocalSuggestions:function(t){var e,n=this,s=[],r=[],o=[];return i.each(t,function(t,e){var n=e.charAt(0);!~i.indexOf(s,n)&&s.push(n)}),i.each(s,function(t,i){var s=n.adjacencyList[i];return s?(r.push(s),(!e||s.length<e.length)&&(e=s),void 0):!1}),r.length<s.length?[]:(i.each(e,function(e,s){var a,u,c=n.itemHash[s];a=i.every(r,function(t){return~i.indexOf(t,s)}),u=a&&i.every(t,function(t){return i.some(c.tokens,function(e){return 0===e.indexOf(t)})}),u&&o.push(c)}),o)},initialize:function(){var e;return this.local&&this._processLocalData(this.local),this.transport=this.remote?new a(this.remote):null,e=this.prefetch?this._loadPrefetchData(this.prefetch):t.Deferred().resolve(),this.local=this.prefetch=this.remote=null,this.initialize=function(){return e},e},getSuggestions:function(t,e){function n(t){o=o.slice(0),i.each(t,function(t,e){var n,r=s._transformDatum(e);return n=i.some(o,function(t){return r.value===t.value}),!n&&o.push(r),o.length<s.limit}),e&&e(o)}var s=this,r=i.tokenizeQuery(t),o=this._getLocalSuggestions(r).slice(0,this.limit);e&&e(o),o.length<this.limit&&this.transport&&this.transport.get(t,n)}}),n}(),c=function(){function e(e){var n=this;i.bindAll(this),this.specialKeyCodeMap={9:"tab",27:"esc",37:"left",39:"right",13:"enter",38:"up",40:"down"},this.$hint=t(e.hint),this.$input=t(e.input).on("blur.tt",this._handleBlur).on("focus.tt",this._handleFocus).on("keydown.tt",this._handleSpecialKeyEvent),i.isMsie()?this.$input.on("keydown.tt keypress.tt cut.tt paste.tt",function(t){n.specialKeyCodeMap[t.which||t.keyCode]||i.defer(n._compareQueryToInputValue)}):this.$input.on("input.tt",this._compareQueryToInputValue),this.query=this.$input.val(),this.$overflowHelper=s(this.$input)}function s(e){return t("<span></span>").css({position:"absolute",left:"-9999px",visibility:"hidden",whiteSpace:"nowrap",fontFamily:e.css("font-family"),fontSize:e.css("font-size"),fontStyle:e.css("font-style"),fontVariant:e.css("font-variant"),fontWeight:e.css("font-weight"),wordSpacing:e.css("word-spacing"),letterSpacing:e.css("letter-spacing"),textIndent:e.css("text-indent"),textRendering:e.css("text-rendering"),textTransform:e.css("text-transform")}).insertAfter(e)}function r(t,e){return t=(t||"").replace(/^\s*/g,"").replace(/\s{2,}/g," "),e=(e||"").replace(/^\s*/g,"").replace(/\s{2,}/g," "),t===e}return i.mixin(e.prototype,n,{_handleFocus:function(){this.trigger("focused")},_handleBlur:function(){this.trigger("blured")},_handleSpecialKeyEvent:function(t){var e=this.specialKeyCodeMap[t.which||t.keyCode];e&&this.trigger(e+"Keyed",t)},_compareQueryToInputValue:function(){var t=this.getInputValue(),e=r(this.query,t),i=e?this.query.length!==t.length:!1;i?this.trigger("whitespaceChanged",{value:this.query}):e||this.trigger("queryChanged",{value:this.query=t})},destroy:function(){this.$hint.off(".tt"),this.$input.off(".tt"),this.$hint=this.$input=this.$overflowHelper=null},focus:function(){this.$input.focus()},blur:function(){this.$input.blur()},getQuery:function(){return this.query},getInputValue:function(){return this.$input.val()},setInputValue:function(t,e){this.$input.val(t),e!==!0&&this._compareQueryToInputValue()},getHintValue:function(){return this.$hint.val()},setHintValue:function(t){this.$hint.val(t)},getLanguageDirection:function(){return(this.$input.css("direction")||"ltr").toLowerCase()},isOverflow:function(){return this.$overflowHelper.text(this.getInputValue()),this.$overflowHelper.width()>this.$input.width()},isCursorAtEnd:function(){var t,e=this.$input.val().length,n=this.$input[0].selectionStart;return i.isNumber(n)?n===e:document.selection?(t=document.selection.createRange(),t.moveStart("character",-e),e===t.text.length):!0}}),e}(),h=function(){function e(e){i.bindAll(this),this.isOpen=!1,this.isEmpty=!0,this.isMouseOverDropdown=!1,this.$menu=t(e.menu).on("mouseenter.tt",this._handleMouseenter).on("mouseleave.tt",this._handleMouseleave).on("click.tt",".tt-suggestion",this._handleSelection).on("mouseover.tt",".tt-suggestion",this._handleMouseover)}function s(t){return t.data("suggestion")}var r={suggestionsList:'<span class="tt-suggestions"></span>'},o={suggestionsList:{display:"block"},suggestion:{whiteSpace:"nowrap",cursor:"pointer"},suggestionChild:{whiteSpace:"normal"}};return i.mixin(e.prototype,n,{_handleMouseenter:function(){this.isMouseOverDropdown=!0},_handleMouseleave:function(){this.isMouseOverDropdown=!1},_handleMouseover:function(e){var i=t(e.currentTarget);this._getSuggestions().removeClass("tt-is-under-cursor"),i.addClass("tt-is-under-cursor")},_handleSelection:function(e){var i=t(e.currentTarget);this.trigger("suggestionSelected",s(i))},_show:function(){this.$menu.css("display","block")},_hide:function(){this.$menu.hide()},_moveCursor:function(t){var e,i,n,r;if(this.isVisible()){if(e=this._getSuggestions(),i=e.filter(".tt-is-under-cursor"),i.removeClass("tt-is-under-cursor"),n=e.index(i)+t,n=(n+1)%(e.length+1)-1,-1===n)return this.trigger("cursorRemoved"),void 0;-1>n&&(n=e.length-1),r=e.eq(n).addClass("tt-is-under-cursor"),this.trigger("cursorMoved",s(r))}},_getSuggestions:function(){return this.$menu.find(".tt-suggestions > .tt-suggestion")},destroy:function(){this.$menu.off(".tt"),this.$menu=null},isVisible:function(){return this.isOpen&&!this.isEmpty},closeUnlessMouseIsOverDropdown:function(){this.isMouseOverDropdown||this.close()},close:function(){this.isOpen&&(this.isOpen=!1,this._hide(),this.$menu.find(".tt-suggestions > .tt-suggestion").removeClass("tt-is-under-cursor"),this.trigger("closed"))},open:function(){this.isOpen||(this.isOpen=!0,!this.isEmpty&&this._show(),this.trigger("opened"))},setLanguageDirection:function(t){var e={left:"0",right:"auto"},i={left:"auto",right:" 0"};"ltr"===t?this.$menu.css(e):this.$menu.css(i)},moveCursorUp:function(){this._moveCursor(-1)},moveCursorDown:function(){this._moveCursor(1)},getSuggestionUnderCursor:function(){var t=this._getSuggestions().filter(".tt-is-under-cursor").first();return t.length>0?s(t):null},getFirstSuggestion:function(){var t=this._getSuggestions().first();return t.length>0?s(t):null},renderSuggestions:function(e,n){var s,a,u,c,h="tt-dataset-"+e.name,l=this.$menu.find("."+h);0===l.length&&(s=t(r.suggestionsList).css(o.suggestionsList),l=t("<div></div>").addClass(h).append(e.header).append(s).append(e.footer).appendTo(this.$menu)),n.length>0?(this.isEmpty=!1,this.isOpen&&this._show(),a=document.createElement("div"),u=document.createDocumentFragment(),i.each(n,function(i,n){a.innerHTML=e.template.render(n.datum),c=t(a.firstChild).css(o.suggestion).data("suggestion",n),c.children().each(function(){t(this).css(o.suggestionChild)}),u.appendChild(c[0])}),l.show().find(".tt-suggestions").html(u)):this.clearSuggestions(e.name),this.trigger("suggestionsRendered")},clearSuggestions:function(t){var e=t?this.$menu.find(".tt-dataset-"+t):this.$menu.find('[class^="tt-dataset-"]'),i=e.find(".tt-suggestions");e.hide(),i.empty(),0===this._getSuggestions().length&&(this.isEmpty=!0,this._hide())}}),e}(),l=function(){function e(t){var e,n,r;i.bindAll(this),this.$node=s(t.input),this.datasets=t.datasets,this.dir=null,this.eventBus=t.eventBus,e=this.$node.find(".tt-dropdown-menu"),n=this.$node.find(".tt-query"),r=this.$node.find(".tt-hint"),this.dropdownView=new h({menu:e}).on("suggestionSelected",this._handleSelection).on("cursorMoved",this._clearHint).on("cursorMoved",this._setInputValueToSuggestionUnderCursor).on("cursorRemoved",this._setInputValueToQuery).on("cursorRemoved",this._updateHint).on("suggestionsRendered",this._updateHint).on("opened",this._updateHint).on("closed",this._clearHint).on("opened closed",this._propagateEvent),this.inputView=new c({input:n,hint:r}).on("focused",this._openDropdown).on("blured",this._closeDropdown).on("blured",this._setInputValueToQuery).on("enterKeyed",this._handleSelection).on("queryChanged",this._clearHint).on("queryChanged",this._clearSuggestions).on("queryChanged",this._getSuggestions).on("whitespaceChanged",this._updateHint).on("queryChanged whitespaceChanged",this._openDropdown).on("queryChanged whitespaceChanged",this._setLanguageDirection).on("escKeyed",this._closeDropdown).on("escKeyed",this._setInputValueToQuery).on("tabKeyed upKeyed downKeyed",this._managePreventDefault).on("upKeyed downKeyed",this._moveDropdownCursor).on("upKeyed downKeyed",this._openDropdown).on("tabKeyed leftKeyed rightKeyed",this._autocomplete)}function s(e){var i=t(o.wrapper),n=t(o.dropdown),s=t(e),r=t(o.hint);i=i.css(a.wrapper),n=n.css(a.dropdown),r.css(a.hint).css({backgroundAttachment:s.css("background-attachment"),backgroundClip:s.css("background-clip"),backgroundColor:s.css("background-color"),backgroundImage:s.css("background-image"),backgroundOrigin:s.css("background-origin"),backgroundPosition:s.css("background-position"),backgroundRepeat:s.css("background-repeat"),backgroundSize:s.css("background-size")}),s.data("ttAttrs",{dir:s.attr("dir"),autocomplete:s.attr("autocomplete"),spellcheck:s.attr("spellcheck"),style:s.attr("style")}),s.addClass("tt-query").attr({autocomplete:"off",spellcheck:!1}).css(a.query);try{!s.attr("dir")&&s.attr("dir","auto")}catch(u){}return s.wrap(i).parent().prepend(r).append(n)}function r(t){var e=t.find(".tt-query");i.each(e.data("ttAttrs"),function(t,n){i.isUndefined(n)?e.removeAttr(t):e.attr(t,n)}),e.detach().removeData("ttAttrs").removeClass("tt-query").insertAfter(t),t.remove()}var o={wrapper:'<span class="twitter-typeahead"></span>',hint:'<input class="tt-hint" type="text" autocomplete="off" spellcheck="off" disabled>',dropdown:'<span class="tt-dropdown-menu"></span>'},a={wrapper:{position:"relative",display:"inline-block"},hint:{position:"absolute",top:"0",left:"0",borderColor:"transparent",boxShadow:"none"},query:{position:"relative",verticalAlign:"top",backgroundColor:"transparent"},dropdown:{position:"absolute",top:"100%",left:"0",zIndex:"100",display:"none"}};return i.isMsie()&&i.mixin(a.query,{backgroundImage:"url(data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7)"}),i.isMsie()&&7>=i.isMsie()&&(i.mixin(a.wrapper,{display:"inline",zoom:"1"}),i.mixin(a.query,{marginTop:"-1px"})),i.mixin(e.prototype,n,{_managePreventDefault:function(t){var e,i,n=t.data,s=!1;switch(t.type){case"tabKeyed":e=this.inputView.getHintValue(),i=this.inputView.getInputValue(),s=e&&e!==i;break;case"upKeyed":case"downKeyed":s=!n.shiftKey&&!n.ctrlKey&&!n.metaKey}s&&n.preventDefault()},_setLanguageDirection:function(){var t=this.inputView.getLanguageDirection();t!==this.dir&&(this.dir=t,this.$node.css("direction",t),this.dropdownView.setLanguageDirection(t))},_updateHint:function(){var t,e,n,s,r,o=this.dropdownView.getFirstSuggestion(),a=o?o.value:null,u=this.dropdownView.isVisible(),c=this.inputView.isOverflow();a&&u&&!c&&(t=this.inputView.getInputValue(),e=t.replace(/\s{2,}/g," ").replace(/^\s+/g,""),n=i.escapeRegExChars(e),s=RegExp("^(?:"+n+")(.*$)","i"),r=s.exec(a),this.inputView.setHintValue(t+(r?r[1]:"")))},_clearHint:function(){this.inputView.setHintValue("")},_clearSuggestions:function(){this.dropdownView.clearSuggestions()},_setInputValueToQuery:function(){this.inputView.setInputValue(this.inputView.getQuery())},_setInputValueToSuggestionUnderCursor:function(t){var e=t.data;this.inputView.setInputValue(e.value,!0)},_openDropdown:function(){this.dropdownView.open()},_closeDropdown:function(t){this.dropdownView["blured"===t.type?"closeUnlessMouseIsOverDropdown":"close"]()},_moveDropdownCursor:function(t){var e=t.data;e.shiftKey||e.ctrlKey||e.metaKey||this.dropdownView["upKeyed"===t.type?"moveCursorUp":"moveCursorDown"]()},_handleSelection:function(t){var e="suggestionSelected"===t.type,n=e?t.data:this.dropdownView.getSuggestionUnderCursor();n&&(this.inputView.setInputValue(n.value),e?this.inputView.focus():t.data.preventDefault(),e&&i.isMsie()?i.defer(this.dropdownView.close):this.dropdownView.close(),this.eventBus.trigger("selected",n.datum))},_getSuggestions:function(){var t=this,e=this.inputView.getQuery();i.isBlankString(e)||i.each(this.datasets,function(i,n){n.getSuggestions(e,function(i){e===t.inputView.getQuery()&&t.dropdownView.renderSuggestions(n,i)})})},_autocomplete:function(t){var e,i,n,s,r;("rightKeyed"!==t.type&&"leftKeyed"!==t.type||(e=this.inputView.isCursorAtEnd(),i="ltr"===this.inputView.getLanguageDirection()?"leftKeyed"===t.type:"rightKeyed"===t.type,e&&!i))&&(n=this.inputView.getQuery(),s=this.inputView.getHintValue(),""!==s&&n!==s&&(r=this.dropdownView.getFirstSuggestion(),this.inputView.setInputValue(r.value)))},_propagateEvent:function(t){this.eventBus.trigger(t.type)},destroy:function(){this.inputView.destroy(),this.dropdownView.destroy(),r(this.$node),this.$node=null}}),e}();(function(){var e,n={},r="ttView";e={initialize:function(e){function o(){var e,n=t(this),o=new s({el:n});e=i.map(a,function(t){return t.initialize()}),n.data(r,new l({input:n,eventBus:o=new s({el:n}),datasets:a})),t.when.apply(t,e).always(function(){i.defer(function(){o.trigger("initialized")})})}var a;return e=i.isArray(e)?e:[e],0===this.length&&t.error("typeahead initialized without DOM element"),0===e.length&&t.error("no datasets provided"),a=i.map(e,function(t){var e=n[t.name]?n[t.name]:new u(t);return t.name&&(n[t.name]=e),e}),this.each(o)},destroy:function(){this.each(function(){var e=t(this),i=e.data(r);i&&(i.destroy(),e.removeData(r))})}},jQuery.fn.typeahead=function(t){return e[t]?e[t].apply(this,[].slice.call(arguments,1)):e.initialize.apply(this,arguments)}})()})(window.jQuery);
;var Hogan={};(function(j,h){j.Template=function(o,p,n,m){this.r=o||this.r;this.c=n;this.options=m;this.text=p||"";this.buf=(h)?[]:""};j.Template.prototype={r:function(o,n,m){return""},v:c,t:e,render:function b(o,n,m){return this.ri([o],n||{},m)},ri:function(o,n,m){return this.r(o,n,m)},rp:function(o,q,p,m){var n=p[o];if(!n){return""}if(this.c&&typeof n=="string"){n=this.c.compile(n,this.options)}return n.ri(q,p,m)},rs:function(p,o,q){var m=p[p.length-1];if(!g(m)){q(p,o,this);return}for(var n=0;n<m.length;n++){p.push(m[n]);q(p,o,this);p.pop()}},s:function(s,n,q,o,t,m,p){var r;if(g(s)&&s.length===0){return false}if(typeof s=="function"){s=this.ls(s,n,q,o,t,m,p)}r=(s==="")||!!s;if(!o&&r&&n){n.push((typeof s=="object")?s:n[n.length-1])}return r},d:function(q,n,p,r){var s=q.split("."),t=this.f(s[0],n,p,r),m=null;if(q==="."&&g(n[n.length-2])){return n[n.length-1]}for(var o=1;o<s.length;o++){if(t&&typeof t=="object"&&s[o] in t){m=t;t=t[s[o]]}else{t=""}}if(r&&!t){return false}if(!r&&typeof t=="function"){n.push(m);t=this.lv(t,n,p);n.pop()}return t},f:function(q,m,p,r){var t=false,n=null,s=false;for(var o=m.length-1;o>=0;o--){n=m[o];if(n&&typeof n=="object"&&q in n){t=n[q];s=true;break}}if(!s){return(r)?false:""}if(!r&&typeof t=="function"){t=this.lv(t,m,p)}return t},ho:function(s,m,p,r,o){var q=this.c;var n=this.options;n.delimiters=o;var r=s.call(m,r);r=(r==null)?String(r):r.toString();this.b(q.compile(r,n).render(m,p));return false},b:(h)?function(m){this.buf.push(m)}:function(m){this.buf+=m},fl:(h)?function(){var m=this.buf.join("");this.buf=[];return m}:function(){var m=this.buf;this.buf="";return m},ls:function(n,u,r,o,m,p,v){var q=u[u.length-1],s=null;if(!o&&this.c&&n.length>0){return this.ho(n,q,r,this.text.substring(m,p),v)}s=n.call(q);if(typeof s=="function"){if(o){return true}else{if(this.c){return this.ho(s,q,r,this.text.substring(m,p),v)}}}return s},lv:function(q,o,p){var n=o[o.length-1];var m=q.call(n);if(typeof m=="function"){m=e(m.call(n));if(this.c&&~m.indexOf("{\u007B")){return this.c.compile(m,this.options).render(n,p)}}return e(m)}};var i=/&/g,d=/</g,a=/>/g,l=/\'/g,k=/\"/g,f=/[&<>\"\']/;function e(m){return String((m===null||m===undefined)?"":m)}function c(m){m=e(m);return f.test(m)?m.replace(i,"&amp;").replace(d,"&lt;").replace(a,"&gt;").replace(l,"&#39;").replace(k,"&quot;"):m}var g=Array.isArray||function(m){return Object.prototype.toString.call(m)==="[object Array]"}})(typeof exports!=="undefined"?exports:Hogan);(function(n){var f=/\S/,j=/\"/g,o=/\n/g,k=/\r/g,u=/\\/g,a={"#":1,"^":2,"/":3,"!":4,">":5,"<":6,"=":7,_v:8,"{":9,"&":10};n.scan=function m(G,B){var O=G.length,y=0,D=1,x=2,z=y,C=null,Q=null,P="",J=[],F=false,N=0,K=0,H="{{",M="}}";function L(){if(P.length>0){J.push(new String(P));P=""}}function A(){var S=true;for(var R=K;R<J.length;R++){S=(J[R].tag&&a[J[R].tag]<a._v)||(!J[R].tag&&J[R].match(f)===null);if(!S){return false}}return S}function I(U,R){L();if(U&&A()){for(var S=K,T;S<J.length;S++){if(!J[S].tag){if((T=J[S+1])&&T.tag==">"){T.indent=J[S].toString()}J.splice(S,1)}}}else{if(!R){J.push({tag:"\n"})}}F=false;K=J.length}function E(V,S){var U="="+M,R=V.indexOf(U,S),T=q(V.substring(V.indexOf("=",S)+1,R)).split(" ");H=T[0];M=T[1];return R+U.length-1}if(B){B=B.split(" ");H=B[0];M=B[1]}for(N=0;N<O;N++){if(z==y){if(w(H,G,N)){--N;L();z=D}else{if(G.charAt(N)=="\n"){I(F)}else{P+=G.charAt(N)}}}else{if(z==D){N+=H.length-1;Q=a[G.charAt(N+1)];C=Q?G.charAt(N+1):"_v";if(C=="="){N=E(G,N);z=y}else{if(Q){N++}z=x}F=N}else{if(w(M,G,N)){J.push({tag:C,n:q(P),otag:H,ctag:M,i:(C=="/")?F-M.length:N+H.length});P="";N+=M.length-1;z=y;if(C=="{"){if(M=="}}"){N++}else{r(J[J.length-1])}}}else{P+=G.charAt(N)}}}}I(F,true);return J};function r(x){if(x.n.substr(x.n.length-1)==="}"){x.n=x.n.substring(0,x.n.length-1)}}function q(x){if(x.trim){return x.trim()}return x.replace(/^\s*|\s*$/g,"")}function w(x,B,z){if(B.charAt(z)!=x.charAt(0)){return false}for(var A=1,y=x.length;A<y;A++){if(B.charAt(z+A)!=x.charAt(A)){return false}}return true}function b(D,A,y,C){var x=[],B=null,z=null;while(D.length>0){z=D.shift();if(z.tag=="#"||z.tag=="^"||e(z,C)){y.push(z);z.nodes=b(D,z.tag,y,C);x.push(z)}else{if(z.tag=="/"){if(y.length===0){throw new Error("Closing tag without opener: /"+z.n)}B=y.pop();if(z.n!=B.n&&!g(z.n,B.n,C)){throw new Error("Nesting error: "+B.n+" vs. "+z.n)}B.end=z.i;return x}else{x.push(z)}}}if(y.length>0){throw new Error("missing closing tag: "+y.pop().n)}return x}function e(A,y){for(var z=0,x=y.length;z<x;z++){if(y[z].o==A.n){A.tag="#";return true}}}function g(B,z,y){for(var A=0,x=y.length;A<x;A++){if(y[A].c==B&&y[A].o==z){return true}}}n.generate=function(x,A,y){var z='var _=this;_.b(i=i||"");'+t(x)+"return _.fl();";if(y.asString){return"function(c,p,i){"+z+";}"}return new n.Template(new Function("c","p","i",z),A,n,y)};function v(x){return x.replace(u,"\\\\").replace(j,'\\"').replace(o,"\\n").replace(k,"\\r")}function i(x){return(~x.indexOf("."))?"d":"f"}function t(y){var B="";for(var A=0,z=y.length;A<z;A++){var x=y[A].tag;if(x=="#"){B+=h(y[A].nodes,y[A].n,i(y[A].n),y[A].i,y[A].end,y[A].otag+" "+y[A].ctag)}else{if(x=="^"){B+=s(y[A].nodes,y[A].n,i(y[A].n))}else{if(x=="<"||x==">"){B+=d(y[A])}else{if(x=="{"||x=="&"){B+=c(y[A].n,i(y[A].n))}else{if(x=="\n"){B+=l('"\\n"'+(y.length-1==A?"":" + i"))}else{if(x=="_v"){B+=p(y[A].n,i(y[A].n))}else{if(x===undefined){B+=l('"'+v(y[A])+'"')}}}}}}}}return B}function h(y,C,B,A,x,z){return"if(_.s(_."+B+'("'+v(C)+'",c,p,1),c,p,0,'+A+","+x+',"'+z+'")){_.rs(c,p,function(c,p,_){'+t(y)+"});c.pop();}"}function s(x,z,y){return"if(!_.s(_."+y+'("'+v(z)+'",c,p,1),c,p,1,0,0,"")){'+t(x)+"};"}function d(x){return'_.b(_.rp("'+v(x.n)+'",c,p,"'+(x.indent||"")+'"));'}function c(y,x){return"_.b(_.t(_."+x+'("'+v(y)+'",c,p,0)));'}function p(y,x){return"_.b(_.v(_."+x+'("'+v(y)+'",c,p,0)));'}function l(x){return"_.b("+x+");"}n.parse=function(y,z,x){x=x||{};return b(y,"",[],x.sectionTags||[])},n.cache={};n.compile=function(A,x){x=x||{};var z=A+"||"+!!x.asString;var y=this.cache[z];if(y){return y}y=this.generate(this.parse(this.scan(A,x.delimiters),A,x),A,x);return this.cache[z]=y}})(typeof exports!=="undefined"?exports:Hogan);