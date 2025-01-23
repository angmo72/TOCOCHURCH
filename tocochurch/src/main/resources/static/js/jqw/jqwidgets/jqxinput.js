/*
jQWidgets v20.0.0 (2024-Sep)
Copyright (c) 2011-2024 jQWidgets.
License: https://jqwidgets.com/license/
*/
/* eslint-disable */

(function(){if(typeof document==="undefined"){return}(function(a){a.jqx.jqxWidget("jqxInput","",{});a.extend(a.jqx._jqxInput.prototype,{defineInstance:function(){var c=this;var b={disabled:false,filter:c._filter,sort:c._sort,highlight:c._highlight,dropDownWidth:null,renderer:c._renderer,opened:false,$popup:document.createElement("ul"),source:[],roundedCorners:true,searchMode:"default",placeHolder:"",width:null,height:null,value:"",rtl:false,enableBrowserBoundsDetection:true,hint:true,displayMember:"",valueMember:"",inlineAutoComplete:false,events:["select","open","close","change"],popupZIndex:1000,items:8,minLength:1,maxLength:null,aiKey:""};if(this===a.jqx._jqxInput.prototype){return b}a.extend(true,this,b);return b},createInstance:function(){var b=this;if(b.host.css("display")==="none"||document.body.contains(b.element)===false){b._initiallyHidden=true}b._popupHelper=a(b.$popup);b.render()},getAISuggestions:function(i){var f=this;var d="";if(!f.aiKey){i("")}function c(l,k){var m=[];m.push("Predict what text the user in the given ROLE would insert after the cursor position indicated by ^^^. Auto-correct the text.\n");m.push("RULES:\n");m.push("1. Reply with OK:, then in square brackets the predicted text, then END_INSERTION, and no other output.\n");m.push("2. When a specific value or quantity cannot be inferred and would need to be provided, use the word NEED_INFO.\n");m.push("3. If there isn't enough information to predict any words that the user would type next, just reply with the word NO_PREDICTION.\n");m.push("4. NEVER invent new information. If you can't be sure what the user is about to type, ALWAYS stop the prediction with END_INSERTION.\n");m.push("\n\nROLE: User USER_TEXT: "+l+k+"^^^");return m.join("\n")}function e(l,p){var o=f.aiKey;var n={"Content-Type":"application/json",Authorization:"Bearer "+o};var k=JSON.stringify({model:"gpt-3.5-turbo",messages:[{role:"user",content:l}],max_tokens:200});var m=new XMLHttpRequest();m.open("POST","https://api.openai.com/v1/chat/completions",true);m.setRequestHeader("Content-Type","application/json");m.setRequestHeader("Authorization","Bearer "+o);m.onreadystatechange=function(){if(m.readyState===4){if(m.status===200){var q=JSON.parse(m.responseText);if(q.choices&&q.choices.length>0&&q.choices[0].message.content){var r=q.choices[0].message.content;if(r.length>5&&r.startsWith("OK")){r=r.substring(4);r=r.replace("END_INSERTION","");var t=r.match(/\[(.*?)\]/g);if(t){var s=t.map(function(u){return u.replace(/^\[|\]$/g,"")});r=s[0]}r=r.replace("[","");r=r.replace("]","")}if(r.indexOf("NO_PREDICTION")>=0){r=""}p(null,r)}else{p("Error: No valid response from AI",null)}}else{p("Error fetching AI response: "+m.statusText,null)}}};m.send(k)}var g=f.input.value.substring(0,f.input.selectionStart);var h=f.input.value.substring(f.input.selectionStart+1);var j=g+h;if(j.endsWith(" ")){var b=c(g,h);e(b.toString(),function(l,k){if(l){i("")}else{i(k)}})}},render:function(){var e=this;this.input=this.element;if(e.isMaterialized()&&this.input instanceof HTMLInputElement){var b=this.host.children();a.each(b,function(k){var l="jqx-input-group-addon";a(this).removeClass(e.toThemeProperty("jqx-rc-all"));if(k===0){l+=" jqx-rc-l"}if(k===b.length-1){l+=" jqx-rc-r"}if(this!==e.element){l+=" jqx-fill-state-normal"}this.className+=" "+e.toThemeProperty(l)});var j=a("<div></div>");j.addClass(e.toThemeProperty("jqx-input-group"));this.host.after(j);var i=this.element;var c=this.host.data();j.append(i);var h=a("<label></label");if(this.hint){h[0].innerHTML=this.placeHolder}h.addClass(e.toThemeProperty("jqx-input-label"));j.append(h);var g=a("<label class='jqx-input-inline'></label");g[0].style.display="none";this._inlineLabel=g[0];j.append(g);var f=a("<span></span>");j.append(f);f.addClass(e.toThemeProperty("jqx-input-bar"));j[0].id=this.element.id;this.element.removeAttribute("id");j[0].style.cssText=this.element.style.cssText;if(this.element.className.indexOf("underlined")>=0){j.addClass("underlined")}e.input=e.element;if(!(this.input instanceof HTMLInputElement)){this.input=this.host.find("input");if(this.input.length>0){this.input=this.input[0]}a(this.input).addClass(this.toThemeProperty("jqx-input-widget"))}this.label=h;this.bar=f;this.element.style.cssText="";this.host=j;this.element=j[0];this.host.data(c);var e=this;if(e.template){e.bar.addClass(e.toThemeProperty("jqx-"+e.template));e.label.addClass(e.toThemeProperty("jqx-"+e.template))}if(b.length>0){e._hasAddons=true}}else{if(this.element.nodeName.toLowerCase()==="textarea"){this.element.style.overflow="auto"}else{if(this.element.nodeName.toLowerCase()==="div"){this.baseHost=this.element;var i=e.element.getElementsByTagName("input");var d=false;a.each(i,function(){var k=this.type;if(k==null||k==="text"||k==="textarea"){i=a(this);d=true;return false}});if(!d){throw new Error("jqxInput: Missing Text Input in the Input Group")}if(i.length>0){this.baseHost=a(this.element);e.baseElement=e.element;var c=this.host.data();this.host=i;this.element=i[0];e.input=i[0];this.host.data(c);e.baseElement.className+=" "+e.toThemeProperty("jqx-widget jqx-rc-all jqx-input-group");var b=this.baseHost.children();a.each(b,function(k){var l="jqx-input-group-addon";a(this).removeClass(e.toThemeProperty("jqx-rc-all"));if(k===0){l+=" jqx-rc-l"}if(k===b.length-1){l+=" jqx-rc-r"}if(this!==e.element){l+=" jqx-fill-state-normal"}this.className+=" "+e.toThemeProperty(l)})}}}}this.addHandlers();if(this.rtl){e.element.className+=" "+e.toThemeProperty("jqx-rtl")}e.input.setAttribute("autocomplete","off");e.input.setAttribute("autocorrect","off");e.input.setAttribute("spellcheck",false);e.element.setAttribute("role","textbox");a.jqx.aria(this,"aria-autocomplete","both");a.jqx.aria(this,"aria-disabled",this.disabled);a.jqx.aria(this,"aria-readonly",false);a.jqx.aria(this,"aria-multiline",false);if(this.source&&this.source.length){a.jqx.aria(this,"aria-haspopup",true)}if(this.value!==""){this.input.value=this.value}this._oldsource=this.source;this._updateSource()},_updateSource:function(){var d=this;var e=function(g){if(g===undefined){return null}if(typeof g==="string"||g instanceof String){return{label:g,value:g}}if(typeof g!=="string"&&g instanceof String===false){var f="";var h="";if(d.displayMember!==""&&d.displayMember!==undefined){if(g[d.displayMember]){f=g[d.displayMember]}}if(d.valueMember!==""&&d.valueMember!==undefined){h=g[d.valueMember]}if(f===""){f=g.label}if(h===""){h=g.value}return{label:f,value:h}}return g};var b=function(h){var f=[];for(var g=0;g<h.length;g++){f[g]=e(h[g])}return f};if(this.source&&this.source._source){this.adapter=this.source;if(this.adapter._source.localdata!=null){this.adapter.unbindBindingUpdate(this.element.id);this.adapter.bindBindingUpdate(this.element.id,function(){d.source=b(d.adapter.records)})}else{var c={};if(this.adapter._options.data){a.extend(d.adapter._options.data,c)}else{if(this.source._source.data){a.extend(c,this.source._source.data)}this.adapter._options.data=c}this.adapter.unbindDownloadComplete(this.element.id);this.adapter.bindDownloadComplete(this.element.id,function(){d.source=b(d.adapter.records)})}this.source.dataBind();return}if(!a.isFunction(this.source)){this.source=b(this.source)}},_refreshClasses:function(d){var c=d?"addClass":"removeClass",b="jqx-widget-content jqx-input-widget jqx-input jqx-widget",e="jqx-popup jqx-input-popup jqx-menu jqx-menu-vertical jqx-menu-dropdown jqx-widget jqx-widget-content";if(a.jqx.browser.msie){e+=" jqx-noshadow"}if(this.roundedCorners){b+=" jqx-rc-all";e+=" jqx-rc-all"}if(this.disabled){b+=" jqx-fill-state-disabled"}else{this.host.removeClass(this.toThemeProperty("jqx-fill-state-disabled"))}this.host[c](this.toThemeProperty(b));this._popupHelper[c](this.toThemeProperty(e))},selectAll:function(){var c=this;var b=this.host;if(b[0] instanceof HTMLInputElement===false){b=a(c.input)}setTimeout(function(){if("selectionStart" in b[0]){b[0].focus();b[0].setSelectionRange(0,b[0].value.length)}else{var d=b[0].createTextRange();d.collapse(true);d.moveEnd("character",b[0].value.length);d.moveStart("character",0);d.select()}},10)},selectLast:function(){var c=this;var b=this.host;if(b[0] instanceof HTMLInputElement===false){b=a(c.input)}this.selectStart(b[0].value.length)},selectFirst:function(){this.selectStart(0)},selectStart:function(c){var d=this;var b=this.host;if(b[0] instanceof HTMLInputElement===false){b=a(d.input)}setTimeout(function(){if("selectionStart" in b[0]){b[0].focus();b[0].setSelectionRange(c,c)}else{var e=b[0].createTextRange();e.collapse(true);e.moveEnd("character",c);e.moveStart("character",c);e.select()}},10)},focus:function(){try{var c=this;c.element.focus();setTimeout(function(){c.element.focus()},25)}catch(b){}},resize:function(c,b){this.width=c;this.height=b;this.refresh()},refresh:function(){this._refreshClasses(false);this._refreshClasses(true);if(!this.baseHost){if(this.width!=null&&this.width.toString().indexOf("px")!=-1){this.element.style.width=parseInt(this.width)+"px"}else{if(this.width!=undefined&&!isNaN(this.width)){this.element.style.width=this.width+"px"}else{this.element.style.width=this.width}}if(this.height!=null&&this.height.toString().indexOf("px")!=-1){this.element.style.height=parseInt(this.height)+"px"}else{if(this.height!=undefined&&!isNaN(this.height)){this.element.style.height=this.height+"px"}else{this.element.style.height=this.height}}if(this._hasAddons){this._addonsWidth=35;this.input.style.width="calc(100% - "+this._addonsWidth+"px)"}}else{if(this.width!=null&&this.width.toString().indexOf("px")!=-1){this.baseElement.style.width=parseInt(this.width)+"px"}else{if(this.width!=undefined&&!isNaN(this.width)){this.baseElement.style.width=this.width+"px"}}if(this.height!=null&&this.height.toString().indexOf("px")!=-1){this.baseElement.style.height=parseInt(this.height)+"px"}else{if(this.height!=undefined&&!isNaN(this.height)){this.baseElement.style.height=this.height+"px"}}var d=this,e=a.jqx.browser.msie&&a.jqx.browser.version<9,c=0;a.each(this.baseHost.children(),function(){this.style.height="100%";if(this!==d.element){c+=a(this).outerWidth()}});d._addonsWidth=c;if(e){var b=Math.max(0,d.baseElement.offsetHeight-2);d.element.style.width=Math.max(0,(d.baseElement.offsetWidth-c-1))+"px";d.element.style.minHeight=b+"px";d.element.style.lineHeight=b+"px"}else{d.element.style.width="calc(100% - "+c+"px)"}a.jqx.utilities.resize(d.baseHost,function(){if(e&&typeof d.width==="string"&&d.width.indexOf("%")!==-1&&!d._initiallyHidden){d.element.style.width=(d.baseElement.offsetWidth-d._addonsWidth-1)+"px"}else{if(d._initiallyHidden){d._addonsWidth=d._getAddonsWidth();if(!e){d.element.style.width="calc(100% - "+d._addonsWidth+"px)"}else{d.element.style.width=(d.baseElement.offsetWidth-d._addonsWidth-1)+"px";var f=d.baseElement.offsetHeight-2;d.element.style.minHeight=f+"px";d.element.style.lineHeight=f+"px"}d._initiallyHidden=false}}})}if(this.disabled){this.element.setAttribute("disabled",true)}else{this.element.removeAttribute("disabled")}if(this.maxLength){this.element.setAttribute("maxlength",this.maxLength);if(this.input){this.input.setAttribute("maxlength",this.maxLength)}}if(!this.element.getAttribute("placeholder")){this._refreshPlaceHolder()}},_refreshPlaceHolder:function(){var b=this;if(!b.isMaterialized()||!b.hint){if("placeholder" in this.input&&!(a.jqx.browser.msie&&a.jqx.browser.version<9)){b.input.setAttribute("placeHolder",b.placeHolder)}else{if(b.input.value===""){b.input.value=b.placeHolder}}}if(!b.hint){return}if(b.input.value!==""){b.element.setAttribute("hint",true)}else{b.element.removeAttribute("hint")}if(b.label){b.label.innerHTML=b.placeHolder}if(this._inlineLabel&&b.inlineAutoComplete){this._inlineLabel.style.display="none";b.host.css("overflow","visible")}},destroy:function(){this.removeHandlers();if(this.baseHost){this.baseHost.remove()}else{this.host.remove()}if(this.$popup){this._popupHelper.remove()}},propertiesChangedHandler:function(b,c,d){if(d.width&&d.height&&Object.keys(d).length===2){b.refresh()}},propertyChangedHandler:function(b,c,e,d){if(c==="width"&&d!==e){if(b.baseHost){b.baseElement.style.width=b._toPx(d);if(a.jqx.browser.msie&&a.jqx.browser.version<9){b.element.style.width=(b.baseElement.offsetWidth-b._addonsWidth-1)+"px"}}else{b.element.style.width=b._toPx(d)}return}if(c==="placeHolder"){if((!("placeholder" in b.element)||(a.jqx.browser.msie&&a.jqx.browser.version<9))&&b.input.value===e){b.input.value=""}b._refreshPlaceHolder();return}if(b.batchUpdate&&b.batchUpdate.width&&b.batchUpdate.height&&Object.keys(b.batchUpdate).length===2){return}if(c==="theme"){a.jqx.utilities.setTheme(e,d,b.host)}if(c==="opened"){if(d){b.open()}else{b.close()}return}if(c==="source"){b._oldsource=d;b._updateSource()}if(c==="displayMember"||c==="valueMember"){b.source=b._oldsource;b._updateSource()}if(c==="disabled"){a.jqx.aria(b,"aria-disabled",b.disabled)}if(c==="value"){b.input.value=d;b._refreshPlaceHolder()}b.refresh()},select:function(e,g,b){var d=this;var f=this._find("jqx-fill-state-pressed",this._popupHelper);if(this.inlineAutoComplete){f=this.element.querySelector(".jqx-input-inline");f.style.display="none";d.host.css("overflow","visible")}var h=f.getAttribute("data-value");var c=f.getAttribute("data-name");this.input.value=this.renderer(c,this.input.value);this.selectedItem={label:c,value:h};this.element.setAttribute("data-value",h);this.element.setAttribute("data-label",c);this._raiseEvent("0",{item:{label:c,value:h},label:c,value:h});this._raiseEvent("3",{type:b,item:{label:c,value:h},label:c,value:h});this.value=c;return this.close()},val:function(b){if(arguments.length===0||(b!=null&&typeof(b)==="object"&&!b.label&&!b.value)){if(this.displayMember!==""&&this.valueMember!==""&&this.selectedItem){if(this.input.value===""){return""}return this.selectedItem}return this.input.value}if(b&&b.label){this.selectedItem={label:b.label,value:b.value};this.element.setAttribute("data-value",b.value);this.element.setAttribute("data-label",b.label);this.value=b;this.input.value=b.label;if(this.input){this.input.value=b.label}return this.input.value}this.value=b;this.input.value=b;this.element.setAttribute("data-value",b);this.element.setAttribute("data-label",b);if(b&&b.label){this._raiseEvent("3",{type:null,item:{label:b.label,value:b.value},label:b.label,value:b.value})}else{this._raiseEvent("3",{type:null,item:{label:b,value:b},label:b,value:b})}this._refreshPlaceHolder();return this.input.value},_raiseEvent:function(f,c){if(c===undefined){c={owner:null}}var d=this.events[f];c.owner=this;var e=new a.Event(d);e.owner=this;e.args=c;if(e.preventDefault){e.preventDefault()}var b=this.host.trigger(e);return b},_renderer:function(b){return b},open:function(){if(a.jqx.isHidden(this.host)){return}var c=a.extend({},this.host.coord(true),{height:this.element.offsetHeight});if(this.$popup.parentNode!==document.body){var h=this.element.id+"_popup";this.$popup.id=h;a.jqx.aria(this,"aria-owns",h);document.body.appendChild(this.$popup)}this.$popup.style.position="absolute";this.$popup.style.zIndex=this.popupZIndex;this.$popup.style.top=this._toPx(c.top+c.height);this.$popup.style.left=this._toPx(c.left);this.$popup.style.display="block";var b=0;var g=this._popupHelper.children();a.each(g,function(){b+=a(this).outerHeight()+1});this.$popup.style.height=this._toPx(b);if(this.enableBrowserBoundsDetection){var d=a(window).height()+a(window).scrollTop();var i=a(this.$popup).offset();var e=a(this.$popup).outerHeight();if(i.top+e>d){var f=c.top+c.height-e-this.host.height();if(f<0){f=0}this.$popup.style.top=f+"px"}}this.opened=true;this._raiseEvent("1",{popup:this.$popup});a.jqx.aria(this,"aria-expanded",true);return this},close:function(){if(this._inlineLabel){this._inlineLabel.style.display="none"}if(!this.opened){return}this.$popup.style.display="none";this.opened=false;this._raiseEvent("2",{popup:this.$popup});a.jqx.aria(this,"aria-expanded",false);this._refreshPlaceHolder();return this},suggest:function(){var b;var c=this;this.query=this.input.value;if(c.inlineAutoComplete&&c.aiKey){this.load([]);return}if(!this.query||this.query.length<this.minLength){if(this._inlineLabel){this._inlineLabel.style.display="none"}return this.opened?this.close():this}if(a.isFunction(this.source)){b=this.source(this.query,a.proxy(this.load,this))}else{b=this.source}if(b){return this.load(b)}return this},load:function(e){var d=this,f=[];var c=this.searchMode;if(this.inlineAutoComplete){this.searchMode="startswith"}for(var b=0;b<e.length;b++){var k=e[b];if(d.filter(k)){f.push(k)}}f=this.sort(f);if(!f.length){if(this.inlineAutoComplete){var g=this.element.querySelector(".jqx-input-inline");g.style.display="none";d.host.css("overflow","visible");if(d._writeTimer){clearTimeout(d._writeTimer)}d._writeTimer=setTimeout(function(){d.getAISuggestions(function(i){if(i){i=d.input.value+i;g.textContent=i;g.setAttribute("data-value",i);g.setAttribute("data-name",i);g.style.opacity=0.5;g.style.position="absolute";g.style.zIndex=5;g.style.display="";g.style.left="6px";g.style.lineHeight=d.height+"px";d.host.css("overflow","hidden");d.searchMode=c}})},500)}if(this.opened){return this.close()}else{return this}}if(this.inlineAutoComplete){var k=f.length?f[0]:"";var h=typeof k==="string"?k:k.label;var j=typeof k==="string"?k:k.value;var g=this.element.querySelector(".jqx-input-inline");g.textContent=h;g.setAttribute("data-value",j);g.setAttribute("data-name",h);g.style.opacity=0.5;g.style.position="absolute";g.style.zIndex=5;g.style.display="";g.style.left="6px";g.style.lineHeight=d.height+"px";this.searchMode=c;d.host.css("overflow","hidden");this.getAISuggestions(function(i){if(i){g.textContent=i}});return}return this._render(f.slice(0,this.items)).open()},_filter:function(b){var c=this.query;var d=b;if(b.label!=null){d=b.label}else{if(this.displayMember){d=b[this.displayMember]}}switch(this.searchMode){case"none":break;default:return a.jqx.string.containsIgnoreCase(d,c);case"contains":return a.jqx.string.contains(d,c);case"equals":return a.jqx.string.equals(d,c);case"equalsignorecase":return a.jqx.string.equalsIgnoreCase(d,c);case"startswith":return a.jqx.string.startsWith(d,c);case"startswithignorecase":return a.jqx.string.startsWithIgnoreCase(d,c);case"endswith":return a.jqx.string.endsWith(d,c);case"endswithignorecase":return a.jqx.string.endsWithIgnoreCase(d,c)}},_sort:function(b){var h=[],d=[],f=[];for(var c=0;c<b.length;c++){var e=b[c];var g=e;if(e.label){g=e.label}else{if(this.displayMember){g=e[this.displayMember]}}if(g.toString().toLowerCase().indexOf(this.query.toString().toLowerCase())===0){h.push(e)}else{if(g.toString().indexOf(this.query)>=0){d.push(e)}else{if(g.toString().toLowerCase().indexOf(this.query.toString().toLowerCase())>=0){f.push(e)}}}}return h.concat(d,f)},_highlight:function(c){var d=this.query;d=d.replace(/[\-\[\]\/\{\}\(\)\*\+\?\.\\\^\$\|]/g,"\\$&");var b=new RegExp("("+d+")","ig");return c.replace(b,function(e,f){return"<b>"+f+"</b>"})},escapeHTML:function(c){var b={"&":"&amp;","<":"&lt;",">":"&gt;",'"':"&quot;","'":"&#39;","/":"&#x2F;","`":"&#x60;","=":"&#x3D;"};return String(c).replace(/[&<>"'`=\/]/g,function(d){return b[d]})},sanitizeHTML:function(e){var d=this;var c=new RegExp("<s*(applet|audio|base|bgsound|embed|form|iframe|isindex|keygen|layout|link|meta|object|script|svg|style|template|video)[^>]*>(.*?)<s*/s*(applet|audio|base|bgsound|embed|form|iframe|isindex|keygen|layout|link|meta|object|script|svg|style|template|video)>","ig");var b=String(e).replace(c,function(f){return d.escapeHTML(f)});return b},escape_HTML:function(b){if(b&&b.indexOf&&(b.indexOf("onclick")>=0||b.indexOf("onload")>=0||b.indexOf("onerror")>=0)){return this.escapeHTML(b)}var c=this.sanitizeHTML(b);return c},_render:function(f){var e=this,c=e._popupHelper.children();if(c.length>0){for(var d=0;d<c.length;d++){a(c[d]).remove()}}var g=function(n,k){var p=n,m=document.createElement("li"),j=document.createElement("a"),h,o;j.setAttribute("href","#");m.appendChild(j);if(n.value!==undefined&&n.value!==null){if(n.label!==undefined&&n.label!==null){h=n.label;o=e.escape_HTML(n.value)}else{h=n.value;o=e.escape_HTML(n.value)}}else{if(n.label!==undefined&&n.label!==null){h=n.label;o=n.label}else{if(e.displayMember!==undefined&&e.displayMember!==""){h=n[e.displayMember];o=n[e.valueMember]}else{h=n;o=n}}}m.setAttribute("data-value",o);m.setAttribute("data-name",h);if(n.label){p=n.label}else{if(e.displayMember){p=n[e.displayMember]}}j.innerHTML=e.highlight(p);var l="";if(e.rtl){l=" jqx-rtl"}if(k===0){l+=" jqx-fill-state-pressed"}m.className=e.toThemeProperty("jqx-item jqx-menu-item jqx-rc-all"+l);e.$popup.appendChild(m);e.addHandler(m,"mouseenter",function(i){e.mouseenter(i)})};var b=function(j){for(var h=0;h<j.length;h++){g(j[h],h)}};b(f);if(!this.dropDownWidth){this.$popup.style.width=e._toPx(e.element.offsetWidth-6)}else{this.$popup.style.width=e._toPx(e.dropDownWidth)}return this},next:function(){var c=this._find("jqx-fill-state-pressed",this._popupHelper),b=c.nextSibling;a(c).removeClass(this.toThemeProperty("jqx-fill-state-pressed"));if(!b){b=this.$popup.firstChild}b.className+=" "+this.toThemeProperty("jqx-fill-state-pressed")},prev:function(){var c=this._find("jqx-fill-state-pressed",this._popupHelper),b=c.previousSibling;a(c).removeClass(this.toThemeProperty("jqx-fill-state-pressed"));if(!b){b=this.$popup.lastChild}b.className+=" "+this.toThemeProperty("jqx-fill-state-pressed")},addHandlers:function(){var c=this,b=".jqxInput"+c.element.id;c.addHandler(c.host,"focus"+b,function(){c.onFocus()});c.addHandler(c.host,"blur"+b,function(){c.onBlur()});if(c.isMaterialized()&&this.input instanceof HTMLInputElement){c.addHandler(c.input,"blur"+b,function(){c.onBlur()})}c.addHandler(c.host,"change"+b,function(f){if(c.opened&&!f.args){f.stopPropagation();f.preventDefault();f.stopImmediatePropagation();return}if(!f.args){f.stopPropagation();f.preventDefault();f.stopImmediatePropagation();var e=c.val(),d,g;if(e&&e.label){d=e.label;g=e.val}else{d=e;g=e}c._raiseEvent("3",{type:"keyboard",item:{label:d,value:g},label:d,value:g});c.value=d;c._refreshPlaceHolder()}});c.addHandler(c.host,"keypress"+b,function(d){c.keypress(d)});c.addHandler(c.host,"keyup"+b,function(d){c.keyup(d)});c.addHandler(c.host,"keydown"+b,function(d){c.keydown(d)});c.addHandler(c.$popup,"pointerdown"+b,function(d){c.click(d)})},removeHandlers:function(){var c=this,b=".jqxInput"+c.element.id;c.removeHandler(c.host,"change"+b);c.removeHandler(c.host,"focus"+b);c.removeHandler(c.host,"blur"+b);c.removeHandler(c.host,"keypress"+b);c.removeHandler(c.host,"keyup"+b);c.removeHandler(c.host,"keydown"+b);c.removeHandler(c.$popup,"pointerdown"+b)},move:function(b){if(!this.opened){return}switch(b.keyCode){case 9:case 13:case 27:b.preventDefault();break;case 38:if(!b.shiftKey){b.preventDefault();this.prev()}break;case 40:if(!b.shiftKey){b.preventDefault();this.next()}break}b.stopPropagation()},keydown:function(c){var b=[40,38,9,13,27];this.suppressKeyPressRepeat=b.indexOf(c.keyCode)!==-1;if(c.key==="Tab"){if(!this.opened){if(this.inlineAutoComplete){this.select(c,this,"keyboard")}return}}this.move(c)},keypress:function(b){if(this.suppressKeyPressRepeat){return}this.move(b)},keyup:function(c){switch(c.keyCode){case 40:case 38:case 16:case 17:case 18:c.stopPropagation();c.preventDefault();break;case 9:case 13:if(!this.opened){if(this.inlineAutoComplete){this.select(c,this,"keyboard");c.stopPropagation();c.preventDefault()}return}this.select(c,this,"keyboard");c.stopPropagation();c.preventDefault();break;case 27:if(!this.opened){return}this.close();c.stopPropagation();c.preventDefault();break;default:var b=this;if(this.timer){clearTimeout(this.timer)}if(this.inlineAutoComplete){b.suggest();return}this.timer=setTimeout(function(){b.suggest()},300)}},clear:function(){this.val("")},onBlur:function(){var b=this;setTimeout(function(){b.close()},150);b.host.removeClass(b.toThemeProperty("jqx-fill-state-focus"));b._refreshPlaceHolder()},onFocus:function(){var b=this;b.element.className+=" "+b.toThemeProperty("jqx-fill-state-focus");b._refreshPlaceHolder()},click:function(b){b.stopPropagation();b.preventDefault();this.select(b,this,"mouse")},mouseenter:function(b){a(this._find("jqx-fill-state-pressed",this._popupHelper)).removeClass(this.toThemeProperty("jqx-fill-state-pressed"));b.currentTarget.className+=" "+this.toThemeProperty("jqx-fill-state-pressed")},_toPx:function(b){if(typeof b==="number"){return b+"px"}else{return b}},_find:function(e,b){var d=b.children();for(var c=0;c<d.length;c++){var f=d[c];if(f.className.indexOf(e)!==-1){return f}}},_getAddonsWidth:function(){var e=this,d=e.baseHost.children(),b=0;for(var c=0;c<d.length;c++){if(d[c]!==e.element){b+=a(d[c]).outerWidth()}}return b}})})(jqxBaseFramework)})();

