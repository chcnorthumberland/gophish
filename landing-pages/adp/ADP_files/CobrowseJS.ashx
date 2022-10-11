(function() {/*

 Copyright The Closure Library Authors.
 SPDX-License-Identifier: Apache-2.0
*/
'use strict';/*
 Copyright (c) 2022 Glance Networks, Inc.
 Copyright 2022 Glance Networks, Inc.
*/
window.GLANCE=window.GLANCE||{};window.GLANCE.VERSION="5.6.11.4";window.GLANCE.PATCH="";window.GLANCE.Lib=window.GLANCE.Lib||{};var h=navigator.userAgent.toLowerCase(),ca=navigator.platform.toLowerCase(),m=h.match(/(edge)[\s\/:]([\w\d\.]+)?/)||h.match(/(opera|ie|firefox|chrome|version)[\s\/:]([\w\d\.]+)?.*?(safari|version[\s\/:]([\w\d\.]+)|$)/)||h.match(/(rv):([\w\d\.]+)/)||[null,"unknown",0];"rv"===m[1]&&(m[1]="ie");
var n={extend:Function.prototype.extend,name:"version"==m[1]?m[3]:m[1],version:"ie"==m[1]&&document.documentMode||parseFloat("opera"==m[1]&&m[4]?m[4]:m[2]),g:{name:h.match(/ip(?:ad|od|hone)/)?"ios":(h.match(/(?:webos|android)/)||ca.match(/mac|win|linux/)||["other"])[0]},A:{F:!!document.evaluate,C:!!window.D,query:!!document.querySelector,json:!!window.JSON},B:{}};
document.documentMode&&window.XDomainRequest?(n.name="ie",n.version=document.documentMode):window.navigator&&navigator.appVersion&&-1!=navigator.appVersion.indexOf("MSIE 7.")&&(n.name="ie",n.version="7");n[n.name]=!0;n[n.name+parseInt(n.version,10)]=!0;n.g[n.g.name]=!0;if(void 0===da)var da=function(a){return JSON.stringify(a)};function r(a,c,b){x(window,"addEventListener",a,c,b)}function y(a,c,b){var f={};f[c]=b;a.postMessage(f,"*")}
function A(a,c){x(window,"addEventListener","message",function(b){if("string"===typeof b.data)try{var f=JSON.parse(b.data)}catch(u){return!1}else f=b.data;void 0!==f[a]&&c(b.source,f[a])})}function B(){this.name="glance_ssn_info";var a=new G,c=a.b.location.hostname;for(a=a.b;""===c&&a.parent!==a;)c=a.parent.location.hostname,a=a.parent;this.domain=ea(c)}
B.prototype.get=function(){return this.c()?unescape(document.cookie.replace(new RegExp("(?:^|.*;\\s*)"+escape(this.name).replace(/[\-\.\+\*]/g,"\\$&")+"\\s*\\=\\s*((?:[^;](?!;))*[^;]?).*"),"$1")):null};B.prototype.f=function(){var a=new Date;a.setDate(a.getDate()-1);document.cookie=escape(this.name)+"=; expires="+a.toGMTString()+"; domain="+this.domain+"; path=/"};B.prototype.c=function(){return(new RegExp("(?:^|;\\s*)"+escape(this.name).replace(/[\-\.\+\*]/g,"\\$&")+"\\s*\\=")).test(document.cookie)};
function H(){this.name="glance_ssn_info"}H.prototype.get=function(){return this.c()?localStorage.getItem(this.name):null};H.prototype.f=function(){localStorage.removeItem(this.name);localStorage.removeItem(this.name+"_exp")};H.prototype.c=function(){var a=localStorage.getItem(this.name+"_exp");if(!a)return!1;a=new Date(a);return a<new Date?(this.f(),!1):!0};function I(){this.a=[new B,new H]}I.prototype.get=function(){return this.a[0].get()||this.a[1].get()};
I.prototype.f=function(){this.a[0].f();this.a[1].f()};I.prototype.c=function(){return this.a[0].c()||this.a[1].c()};function G(){var a=window;this.a=a.document;this.b=a;var c=[["hidden","visibilitychange"],["mozHidden","mozvisibilitychange"],["webkitHidden","webkitvisibilitychange"],["msHidden","msvisibilitychange"],["oHidden","ovisibilitychange"]];for(a=0;a<c.length&&!(c[a][0]in document);a++);}
function ea(a){var c=new RegExp(/^(?:[a-z]{1,5}:\/\/|)([^:\?\/]*)/),b=a.match(/^\d+\.\d+.\d+.\d+$/);c=c.exec(a);if(b)return a;if(null===c||2!==c.length)return"about:"!==a&&J("ERR_DOMAINPARSE: "+a),null;b=c[1].split(".");return 1===b.length?(J("ERR_DOMAINPARSE: "+a),null):2===b.length?b.join("."):3===b.length?b.slice(1).join("."):4>=b[b.length-2].length?b.slice(b.length-3).join("."):b.slice(b.length-2).join(".")}G.prototype.getElementsByTagName=function(a){return x(this.a,"getElementsByTagName",a)};
function K(a,c,b){var f=a.a.createElement("script");b&&f.addEventListener("load",b);f.setAttribute("type","text/javascript");f.setAttribute("charset","UTF-8");for(b=0;b<c.length;b++)f.setAttribute(c[b][0],c[b][1]);a.a.head.appendChild(f)}G.prototype.head=function(){return void 0!==this.a.head?this.a.head:this.getElementsByTagName("head")[0]};
function M(a,c){a.b.addEventListener&&(document.readyState.match(/complete/)?c():(a.b.addEventListener("load",c),a.a.addEventListener("DOMContentLoaded",c,!1)))}
function N(a){if(void 0!==window.pageXOffset)return{x:Math.round(a.b.pageXOffset),y:Math.round(a.b.pageYOffset)};if(void 0!==document.documentElement.scrollTop)return{x:a.a.documentElement.scrollLeft,y:a.a.documentElement.scrollTop};if(void 0!==document.body.scrollLeft)return{x:a.a.body.scrollLeft,y:a.a.body.scrollTop};throw Error("Can't get page scroll");}
G.prototype.scrollTo=function(a,c,b){var f=N(this);f[a]=c;a={left:f.x,top:f.y,behavior:b?"smooth":"auto"};n.ie11||n.edge?window.scrollTo(f.x,f.y):window.scrollTo(a);N(this)};G.prototype.addEventListener=function(a,c,b){x(this.a,"addEventListener",a,c,b)};G.prototype.removeEventListener=function(a,c,b){x(this.a,"removeEventListener",a,c,b)};function R(a){this.a=a}R.prototype.addEventListener=function(a,c,b){x(this.a,"addEventListener",c,b)};
R.prototype.removeEventListener=function(a,c,b){x(this.a,"removeEventListener",c,b)};function x(a,c,...b){return R.b&&R.a&&a.nodeType?"#document"===a.nodeName?R.a.document[c].apply(a,b):"#document-fragment"===a.nodeName?R.a.DocumentFragment.prototype[c].apply(a,b):R.a.document.body[c].apply(a,b):R.b&&R.a&&"[object Window]"===a.toString()?R.a.window[c].apply(a,b):a[c].apply(a,b)}function S(a,c,b){a.a.style.left=c+"px";a.a.style.top=b+"px"}
R.prototype.moveTo=function(a,c){function b(){10>v++?(u+=p,g+=C,S(f,Math.floor(u),Math.floor(g)),f.b=x(window,"setTimeout",b,20)):S(f,a,c)}void 0!==this.b&&x(window,"clearTimeout",this.b);var f=this,u=parseInt(this.a.style.left),g=parseInt(this.a.style.top);isNaN(u)&&(u=-999);isNaN(g)&&(g=-999);var v=0,p=(a-u)/10,C=(c-g)/10;0===p&&0===C||b()};function T(){this.listeners=this.a={}}T.prototype.add=function(a,c){this.a[a]=this.a[a]||[];this.a[a].push(c)};
function U(a,...c){!window.console||!window.console[a]||window.GLANCE_COBROWSE&&window.GLANCE_COBROWSE.disableLogging||(c=c.map(b=>{if("object"===typeof b)try{b=JSON.stringify(b)}catch(f){console.error(f),b="unable to convert object to string"}return"string"===typeof b?b.replace(/[\r\n]/g," ").replace("<","&lt;"):b}),window.console[a](...c))}function J(...a){U("log",...a)}function V(...a){J("DEBUG:",...a)};function W(a,c){if(void 0!==a){var b=b||Object.keys(a);b.forEach(function(f){void 0!==a[f]&&(c[f]=a[f])})}}function X(a){var c={};if(!a)return c;var b=0;for(a=a.attributes;b<a.length;b++){var f=a[b].nodeName.match(/data-(.*)/);f&&2===f.length&&(c[f[1]]=a[b].nodeValue)}return c}function fa(){var a=window.GLANCE_COBROWSE?window.GLANCE_COBROWSE:{},c=document.getElementById("glance-cobrowse"),b=X(document.getElementById("cobrowsescript"));c=X(c);W(b,a);W(c,a);return a};var ha=["5","6","11","4"].slice(0,3).join(".")+"M";
function ia(){this.b=document.getElementById("cobrowsescript")||document.getElementById("glance-cobrowse");if(null!==this.b){var a=fa();W(a,this);var c=/\/\/(.*)\//.exec("string"===typeof this.b.src?this.b.src:a.scriptserver+"/");this.a=c&&2===c.length?c[1]:"www.glancecdn.net/cobrowse";this.a=this.a.replace("/js","");a.cbexperiment&&(this.a=this.a.replace("cobrowse","cbexperiment"));this.h=a.groupid||this.b.getAttribute("groupid");this.v=a.ws||this.b.getAttribute("ws")||"www.glance.net";this.v.match("\\.glance\\.net$");
this.u=a.ui;this.o=a.site||this.b.getAttribute("site")||"production";this.l=JSON.parse(a.inputevents||"{}");this.m=a.presence;if(!this.h)throw Error("data-groupid missing");a=a.additionalgroupids||"";this.i=[this.h].concat(a?a.split(","):[]);this.i=this.i.map(function(b){if(!parseInt(b))throw Error("data-groupid invalid: "+b);return parseInt(b)});if(!/staging|production/i.test(this.o))throw Error("data-site invalid");}};function Y(){return 0<window.location.href.indexOf("GlanceSession=1")};window.GLANCE=window.GLANCE||{};window.GLANCE.Cobrowse=window.GLANCE.Cobrowse||{};
function Z(){function a(d){function e(t,E,L){return function(F){F.keyCode===E&&F[t+"Key"]&&(F=L.match(/showButton|toggleButton|showTerms/)?"VisitorUI":"Visitor",u(F,L)||(V("inputevent:",L),window.GLANCE.Cobrowse[F][L]()))}}for(var k in d)if(d.hasOwnProperty(k)){var l=k.match(/(ctrl|alt|shift)-(\d*)/);!l||3>l.length||r("keydown",e(l[1],parseInt(l[2]),d[k]),!0)}}function c(d){function e(k){return function(l){var t=k.match(/showButton|toggleButton|showTerms/)?"VisitorUI":"Visitor";l.stopPropagation();
l.preventDefault();u(t,k)||(V("button click",t,k),w[t][k]())}}["glance_button","data-glancebutton"].forEach(function(k){for(var l=d.querySelectorAll("["+k+"]"),t=0;l&&t<l.length;t++){var E=l[t].getAttribute(k);"start"===E&&(E="startSession");l[t].addEventListener("click",e(E))}})}function b(){return w.Visitor}function f(d,e){w[e][d]=function(k){d.match(/showButton|toggleButton|showTerms/)&&"Visitor"==e&&(e="VisitorUI");g(function(){w[e][d](k)},e)}}function u(d,e){if(!v)return!1;V("forward event:",
d,e);y(window.top,"forwardevent",{namespace:d,funcname:e});return!0}function g(d,e){e=e||"Visitor";if(x(p.a,"getElementById",("glance_"+e).toLowerCase()))w[e].loaded?d&&d():d&&J("SCRIPT_NOT_LOADED:"+e);else if(d&&(aa._onload[e]=d),v||"Visitor"!==e||z.u||g(null,"VisitorUI"),K(p,[["id",("glance_"+e).toLowerCase()],["src",O+"/GlanceCobrowse"+e+"_"+P+".js"]]),"Visitor"===e)for(e=document.getElementsByTagName("iframe"),d=0;d<e.length;d++)e[d].contentWindow&&y(e[d].contentWindow,"glance_load",{j:!0})}window.GLANCE.runTroubleshooter=
function(){K(p,[["src","https://"+z.a+"/js/Troubleshooter.js"]])};window.GLANCE.checkHTML=function(){K(p,[["src","https://"+z.a+"/js/HTMLChecker.js"]])};if(window.localStorage&&window.XMLHttpRequest&&window.atob){var v=window.parent!==window,p=new G,C=!1,z=new ia,P=ha,w=window.GLANCE.Cobrowse,O="//"+z.a+"/js";if(!z.a)if(window.console&&window.console.error)U("error",...["ASSERT"]);else throw Error("ASSERT");var Q=new T,q=z.b;if(w.Loader&&q&&q.getAttribute("data-loaded"))J("ERR_DUP_SCRIPTS");else{q&&
q.setAttribute("data-loaded",!0);var ba=null;q=new Promise(d=>{ba=()=>{d()}});var aa={load:function(d){g(d)},loadScript:function(d,e){K(p,[["src",O+"/"+d+"_"+P+".js"]],e)},setUIReady:ba,_uiready:q,_eventListeners:Q,_onload:{},_origpath:window.location.pathname};A("glance_load",function(d,e){d&&(d!==window.parent&&d.parent!==window?J("UNTRUSTED_LOAD_MSG"):(e.j&&g(),e.s&&null!==x(p.a,"getElementById","glance_visitor")&&y(d,"glance_load",{j:!0})))});v&&y(window.parent,"glance_load",{s:!0});window.addEventListener("message",
function(d){if("string"!==typeof d.data){if(b().loaded)return!0;d.data.glance_invoke&&(d.data.origin=d.origin,g(function(){window.postMessage(d.data,window.location.href)}))}});r("focus",function(){if(b().loaded)return!0;b().inSession()&&g()});w.Visitor={loaded:!1,inSession:function(){return(new I).c()},addEventListener:function(d,e){Q.add(d,e)},removeEventListener:function(d,e){d=Q.a[d];void 0!==d&&(e=d.indexOf(e),0<=e&&d.splice(e,1))}};q=["showButton","toggleButton","showTerms","setStyle"];v||(w.VisitorUI=
{},q.forEach(function(d){f(d,"VisitorUI")}));q=q.concat(["startSession","setStartParams"]);q.forEach(function(d){f(d,"Visitor")});w.Loader=aa;v||Y()||!b().inSession()||g();!v&&Y()&&g(null,"XDOM");M(p,function(){document.body&&!C&&(C=!0,c(document.body),a(z.l),z.m&&!v&&K(p,[["src",O+"/GlancePresenceVisitor_"+P+".js"]]))});A("forwardevent",function(d,e){V("received forwarded event:",e);if(d.top!==window)J("UNTRUSTED_KEYEVT");else window.GLANCE.Cobrowse[e.namespace][e.funcname]()})}}else U("error",...["ERR_COBROWSE_NOT_SUPP"])}
document.getElementById("cobrowsescript")||document.getElementById("glance-cobrowse")?Z():(J("LOADER_PAGE_NOT_READY"),M(new G,Z));}).call(window);