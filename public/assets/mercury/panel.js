!function(){var e={}.hasOwnProperty,t=function(t,i){function n(){this.constructor=t}for(var s in i)e.call(i,s)&&(t[s]=i[s]);return n.prototype=i.prototype,t.prototype=new n,t.__super__=i.prototype,t};this.Mercury.Panel=function(e){function i(e,t,n){this.url=e,this.name=t,this.options=null!=n?n:{},i.__super__.constructor.apply(this,arguments)}return t(i,e),i.prototype.build=function(){var e;return this.element=jQuery("<div>",{"class":"mercury-panel loading",style:"display:none;"}),this.titleElement=jQuery("<h1><span>"+Mercury.I18n(this.options.title)+"</span></h1>").appendTo(this.element),this.paneElement=jQuery("<div>",{"class":"mercury-panel-pane"}).appendTo(this.element),this.options.closeButton&&jQuery("<a/>",{"class":"mercury-panel-close"}).appendTo(this.titleElement).css({opacity:0}),this.element.appendTo(null!=(e=jQuery(this.options.appendTo).get(0))?e:"body")},i.prototype.bindEvents=function(){var e=this;return Mercury.on("resize",function(){return e.position(e.visible)}),Mercury.on("hide:panels",function(t,i){return i!==e?(e.button.removeClass("pressed"),e.hide()):void 0}),this.titleElement.find(".mercury-panel-close").on("click",function(e){return e.preventDefault(),Mercury.trigger("hide:panels")}),this.element.on("mousedown",function(e){return e.stopPropagation()}),this.element.on("ajax:beforeSend",function(t,i,n){return n.success=function(t){return e.loadContent(t),e.resize()}}),i.__super__.bindEvents.apply(this,arguments)},i.prototype.show=function(){return Mercury.trigger("hide:panels",this),i.__super__.show.apply(this,arguments)},i.prototype.resize=function(){var e,t,i,n=this;return this.titleElement.find(".mercury-panel-close").css({opacity:0}),this.paneElement.css({display:"none"}),i=this.element.width(),this.paneElement.css({visibility:"hidden",width:"auto",display:"block"}),t=this.element.width(),this.paneElement.css({visibility:"visible",display:"none"}),e=this.element.offset(),this.element.animate({left:e.left-(t-i),width:t},200,"easeInOutSine",function(){return n.titleElement.find(".mercury-panel-close").animate({opacity:1},100),n.paneElement.css({display:"block",width:t}),jQuery(n.paneElement.find(".focusable").get(0)).focus(),n.makeDraggable()}),this.visible?void 0:this.hide()},i.prototype.position=function(e){var t,i,n,s,r;return this.element.css({display:"block",visibility:"hidden"}),s=this.element.offset(),t=this.element.width(),i=Mercury.displayRect.height-16,r=i-this.titleElement.outerHeight(),this.paneElement.css({height:r,overflowY:30>r?"hidden":"auto"}),this.moved||(n=Mercury.displayRect.width-t-20),8>=n&&(n=8),(this.pinned||t+s.left>Mercury.displayRect.width-20)&&(n=Mercury.displayRect.width-t-20),this.element.css({top:Mercury.displayRect.top+8,left:n,height:i,display:e?"block":"none",visibility:"visible"}),this.makeDraggable(),e?void 0:this.element.hide()},i.prototype.loadContent=function(e){return this.loaded=!0,this.element.removeClass("loading"),this.paneElement.css({visibility:"hidden"}),this.paneElement.html(e),Mercury.config.localization.enabled?this.paneElement.localize(Mercury.locale()):void 0},i.prototype.makeDraggable=function(){var e,t=this;return e=this.element.width(),this.element.draggable({handle:"h1 span",axis:"x",opacity:.7,scroll:!1,addClasses:!1,iframeFix:!0,containment:[8,0,Mercury.displayRect.width-e-20,0],stop:function(){var i;return i=t.element.offset().left,t.moved=!0,t.pinned=i>Mercury.displayRect.width-e-30?!0:!1,!0}})},i}(Mercury.Dialog)}.call(this);