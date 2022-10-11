function startsWith(c,d){return(c.indexOf(d)===0)
}function DomDataCollection(n){var j=this;
j.config={recursion_level:1,collection_mode:"partial",functionsToExclude:[],function_list_size:1024,json_script:n?n:"json2.js"};
j.emptyDomData=function(){j.dom_data={functions:{names:[],excluded:{size:0,count:0},truncated:false},inputs:[],iFrames:[],scripts:[],collection_status:DomDataCollection.NotStarted}
};
j.startInspection=function(){var b=false;
var c=true;
BrowserDetect.init();
if(!(BrowserDetect.browser==="Explorer")){try{j.inspectJSFunctions();
c=false
}catch(a){b=b||true
}}else{j.dom_data.functions=[];
if(j.dom_data.functions===undefined||j.dom_data.functions.names===undefined){j.dom_data.functions={names:[],excluded:{size:0,count:0},truncated:false}
}}try{j.inspectFrames();
c=false
}catch(a){b=b||true
}try{j.inspectScripts();
c=false
}catch(a){b=b||true
}try{j.inspectInputFields();
c=false
}catch(a){b=b||true
}if(b){if(c){j.dom_data.collection_status=DomDataCollection.Fail
}else{j.dom_data.collection_status=DomDataCollection.Partial
}}else{j.dom_data.collection_status=DomDataCollection.Success
}if(!(BrowserDetect.browser==="Explorer")){j.handleSizeLimit()
}};
j.domDataAsJSON=function(){return stripIllegalChars(JSON.stringify(j.dom_data))
};
j.recursiveGetAllFunctionNamesUnderElement=function(B,e,A){var C;
var d;
var g;
var x=j.config;
var D=x.recursion_level;
var a=x.collection_mode;
if(j.dom_data.functions===undefined||j.dom_data.functions.names===undefined){j.dom_data.functions={names:[],excluded:{size:0,count:0},truncated:false}
}var f=j.dom_data.functions;
var c=f.excluded;
for(var E in e){try{var F=e[E];
C=""+F;
if(B.length>0){prefix=B+"."
}else{prefix=""
}d=prefix+E;
if(k(F)){if(j.functionShouldBeCollected(F,E)){var G=f.names;
g=G.length;
G[g]=d
}else{if(a=="partial"){c.size+=C.length;
c.count++
}}}if(A+1<D){j.recursiveGetAllFunctionNamesUnderElement(d,F,A+1)
}else{f.names.sort()
}}catch(b){if(!window.console){window.console={};
window.console.info=o;
window.console.log=o;
window.console.warn=o;
window.console.error=o
}if(console&&console.log){console.log("error counting functions: "+b.toString())
}}}};
function o(){}function k(a){return typeof a=="function"
}function h(a){return a.length
}var l=new Hashtable();
j.initFunctionsToExclude=function(){if(l){l.clear()
}var a=j.config.functionsToExclude;
var b=a.length;
while(b--){l.put(a[b],"")
}};
j.functionShouldBeCollected=function m(a,b){if(j.config.collection_mode=="full"){return true
}else{if(l.size()===0){j.initFunctionsToExclude()
}if(l.containsKey(b)){return false
}else{return true
}}};
j.inspectJSFunctions=function(){j.dom_data.functions=[];
j.recursiveGetAllFunctionNamesUnderElement("",window,0)
};
j.handleSizeLimit=function(){var x=j.dom_data;
var g=j.config;
var v=g.function_list_size;
var e=x.functions;
e.names.sort();
var b=JSON.stringify(x);
if(v<0){v=0
}var a=0;
if(g.colllection_mode!="full"&&b.length>v){var c=e.names;
var d=c.toString();
var y=b.length-JSON.stringify(c).length+"[]".length;
var f=false;
var w=c.length;
while(!f){if(a++==1000){f=true
}lastComma=d.lastIndexOf(",");
if(lastComma>=0&&w>0){quotation_marks=w*2;
if(y+lastComma+quotation_marks>v){d=d.substring(0,lastComma-1);
w--
}else{f=true
}}else{f=true
}}if(w>1){e.truncated=true;
e.names=e.names.slice(0,w-1);
x.functions.truncated=true
}else{j.emptyDomData();
x=j.dom_data;
x.collection_status=DomDataCollection.Partial;
x.functions.truncated=true
}}};
j.inspectFrames=function(){j.countElements("iframe")
};
j.countElements=function(e){var d;
var c=document.getElementsByTagName(e);
if(j.dom_data.iFrames===undefined){j.dom_data.iFrames=[]
}var b=j.dom_data.iFrames;
var a=b.length;
for(i=0;
i<c.length;
i++){b[a+i]=""+c[i].src
}b.sort()
};
j.inspectScripts=function(){var b=document.getElementsByTagName("script");
j.dom_data.scripts=[];
for(var a=0;
a<b.length;
a++){j.dom_data.scripts[a]=b[a].text.length
}};
j.collectFields=function(b){var r=document.getElementsByTagName(b);
if(j.dom_data.inputs===undefined){j.dom_data.inputs=[]
}var e=j.dom_data.inputs;
var g=e.length;
var a=r.length;
while(a--){var c=r[a];
var d=c.name;
var f=c.id;
if(d&&d.length>0){element_name=d
}else{if(f&&f.length>0){element_name=f
}else{element_name="NO_NAME"
}}e[g+a]=element_name
}e.sort()
};
j.inspectInputFields=function(){j.collectFields("input");
j.collectFields("textarea");
j.collectFields("select");
j.collectFields("button")
};
loadJSON=function(){if(!window.JSON){var a=document.getElementsByTagName("head")[0];
var b=document.createElement("script");
b.type="text/javascript";
b.src=j.config.json_script;
a.appendChild(b)
}};
j.emptyDomData();
loadJSON()
}DomDataCollection.Success=0;
DomDataCollection.Fail=1;
DomDataCollection.Partial=2;
DomDataCollection.NotStarted=3;
function IE_FingerPrint(){this.deviceprint_browser=function(){var a=navigator.userAgent.toLowerCase();
t=a+SEP+navigator.appVersion+SEP+navigator.platform;
t+=SEP+navigator.appMinorVersion+SEP+navigator.cpuClass+SEP+navigator.browserLanguage;
t+=SEP+ScriptEngineBuildVersion();
return t
};
this.deviceprint_software=function(){var b="";
var l=true;
try{document.body.addBehavior("#default#clientCaps");
var k;
var m=d.length;
for(i=0;
i<m;
i++){k=activeXDetect(d[i]);
var j=c[i];
if(k){if(l===true){b+=j+PAIR+k;
l=false
}else{b+=SEP+j+PAIR+k
}}else{b+="";
l=false
}}}catch(a){}return b
};
var c=["abk","wnt","aol","arb","chs","cht","dht","dhj","dan","dsh","heb","ie5","icw","ibe","iec","ieh","iee","jap","krn","lan","swf","shw","msn","wmp","obp","oex","net","pan","thi","tks","uni","vtc","vnm","mvm","vbs","wfd"];
var d=["7790769C-0471-11D2-AF11-00C04FA35D02","89820200-ECBD-11CF-8B85-00AA005B4340","47F67D00-9E55-11D1-BAEF-00C04FC2D130","76C19B38-F0C8-11CF-87CC-0020AFEECF20","76C19B34-F0C8-11CF-87CC-0020AFEECF20","76C19B33-F0C8-11CF-87CC-0020AFEECF20","9381D8F2-0288-11D0-9501-00AA00B911A5","4F216970-C90C-11D1-B5C7-0000F8051515","283807B5-2C60-11D0-A31D-00AA00B92C03","44BBA848-CC51-11CF-AAFA-00AA00B6015C","76C19B36-F0C8-11CF-87CC-0020AFEECF20","89820200-ECBD-11CF-8B85-00AA005B4383","5A8D6EE0-3E18-11D0-821E-444553540000","630B1DA0-B465-11D1-9948-00C04F98BBC9","08B0E5C0-4FCB-11CF-AAA5-00401C608555","45EA75A0-A269-11D1-B5BF-0000F8051515","DE5AED00-A4BF-11D1-9948-00C04F98BBC9","76C19B30-F0C8-11CF-87CC-0020AFEECF20","76C19B31-F0C8-11CF-87CC-0020AFEECF20","76C19B50-F0C8-11CF-87CC-0020AFEECF20","D27CDB6E-AE6D-11CF-96B8-444553540000","2A202491-F00D-11CF-87CC-0020AFEECF20","5945C046-LE7D-LLDL-BC44-00C04FD912BE","22D6F312-B0F6-11D0-94AB-0080C74C7E95","3AF36230-A269-11D1-B5BF-0000F8051515","44BBA840-CC51-11CF-AAFA-00AA00B6015C","44BBA842-CC51-11CF-AAFA-00AA00B6015B","76C19B32-F0C8-11CF-87CC-0020AFEECF20","76C19B35-F0C8-11CF-87CC-0020AFEECF20","CC2A9BA0-3BDD-11D0-821E-444553540000","3BF42070-B3B1-11D1-B5C5-0000F8051515","10072CEC-8CC1-11D1-986E-00A0C955B42F","76C19B37-F0C8-11CF-87CC-0020AFEECF20","08B0E5C0-4FCB-11CF-AAA5-00401C608500","4F645220-306D-11D2-995D-00C04F98BBC9","73FA19D0-2D75-11D2-995D-00C04F98BBC9"]
}IE_FingerPrint.prototype=new FingerPrint();
function Mozilla_FingerPrint(){}Mozilla_FingerPrint.prototype=new FingerPrint();
function Opera_FingerPrint(){}Opera_FingerPrint.prototype=new FingerPrint();
function Timer(){this.startTime=new Date().getTime()
}Timer.prototype.start=function(){this.startTime=new Date().getTime()
};
Timer.prototype.duration=function(){return(new Date().getTime())-this.startTime
};
function getRandomPort(){return Math.floor(Math.random()*60000+4000)
}var ProxyCollector={};
ProxyCollector.internalIP="127.0.0.1";
ProxyCollector.externalIP;
ProxyCollector.internalPingTime;
ProxyCollector.externalPingTime;
ProxyCollector.setInternalPingTime=function(b){ProxyCollector.internalPingTime=b
};
ProxyCollector.setExternalPingTime=function(b){ProxyCollector.externalPingTime=b
};
ProxyCollector.PROXY_DETECTION_TIMEOUT=5000;
ProxyCollector.TIMEOUT_CHECK_FREQUENCY=1000;
ProxyCollector.isTimedOut=function(d,e,f){_timer=new Timer();
if((e-_timer.duration()<=0)&&(((typeof ProxyCollector.internalPingTime==="undefined")&&((new RegExp("internalPingTime")).test(d)))||((typeof ProxyCollector.externalPingTime==="undefined")&&((new RegExp("externalPingTime")).test(d))))){d.call(this,-1);
f.abort()
}else{if(((typeof ProxyCollector.internalPingTime==="undefined")&&((new RegExp("internalPingTime")).test(d)))||((typeof ProxyCollector.externalPingTime==="undefined")&&((new RegExp("externalPingTime")).test(d)))){setTimeout(function(){ProxyCollector.isTimedOut(d,e-(_timer.duration()+ProxyCollector.TIMEOUT_CHECK_FREQUENCY),f)
},ProxyCollector.TIMEOUT_CHECK_FREQUENCY)
}}};
ProxyCollector.doAjax=function(k,l){var j=document.location.protocol+"//"+k+":"+getRandomPort()+"/NonExistentImage"+getRandomPort()+".gif";
var m;
var o;
if(window.XDomainRequest){m=new window.XDomainRequest();
o=new Timer();
try{m.timeout=ProxyCollector.PROXY_DETECTION_TIMEOUT;
m.ontimeout=function(){l.call(this,-1);
m.abort()
};
m.onprogress=function(){l.call(this,o.duration());
m.abort()
};
m.onerror=function(){l.call(this,o.duration());
m.abort()
};
m.open("GET",j,true);
m.send()
}catch(h){ProxyCollector.doAjaxViaImage(l,j)
}}else{m=new XMLHttpRequest();
var n="ontimeout" in m;
o=new Timer();
try{m.onreadystatechange=function(){if(m.readyState==4){if(((typeof ProxyCollector.internalPingTime==="undefined")&&((new RegExp("internalPingTime")).test(l)))||((typeof ProxyCollector.externalPingTime==="undefined")&&((new RegExp("externalPingTime")).test(l)))){l.call(this,o.duration())
}}};
m.timeout=ProxyCollector.PROXY_DETECTION_TIMEOUT;
m.ontimeout=function(){l.call(this,-1);
m.abort()
};
m.open("GET",j,true);
m.send();
if(!n){ProxyCollector.isTimedOut(l,ProxyCollector.PROXY_DETECTION_TIMEOUT-o.duration(),m)
}}catch(h){ProxyCollector.doAjaxViaImage(l,j)
}}};
ProxyCollector.doAjaxViaImage=function(g,e){var f=new Image();
var h=new Timer();
f.onerror=function(){g.call(this,h.duration())
};
f.src=e
};
ProxyCollector.collect=function(){ProxyCollector.doAjax(ProxyCollector.externalIP,ProxyCollector.setExternalPingTime);
if(typeof XDomainRequest=="object"){if(!ProxyCollector.externalPingTime){forceIE89Synchronicity()
}}else{ProxyCollector.doAjax(ProxyCollector.internalIP,ProxyCollector.setInternalPingTime)
}};
forceIE89Synchronicity=function(){if(!ProxyCollector.externalPingTime){setTimeout(forceIE89Synchronicity,100)
}else{ProxyCollector.doAjax(ProxyCollector.internalIP,ProxyCollector.setInternalPingTime)
}};
ProxyCollector.isValidIPAddress=function(h){var e=/^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$/;
if(e.test(h)){var g=h.split(".");
if(parseInt(parseFloat(g[0]))==0){return false
}for(var f=0;
f<g.length;
f++){if(parseInt(parseFloat(g[f]))>255){return false
}}return true
}else{return false
}};
ProxyCollector.initProxyCollection=function(){if(ProxyCollector.isValidIPAddress(ProxyCollector.externalIP)&&ProxyCollector.isValidIPAddress(ProxyCollector.internalIP)){ProxyCollector.collect()
}};
function BlackberryLocationCollector(){var m=this;
var q=null;
this.getGeolocationWatchId=function(){return q
};
var n=null;
this.getGeolocationLastPosition=function(){return n
};
var r=4;
this.getGeolocationStatusCode=function(){return r
};
var l="";
this.getGeolocationErrorMessage=function(){return l
};
var k={aidMode:2,timeout:180,relevancy:120,expiration:48,alertDebug:false};
var o=-1;
var j=0;
this.getInvokeCount=function(){return j
};
this.handleBlackBerryLocationTimeout=function(){if(o!=-1){m.stopWatch();
r=3;
if(j===0&&k.aidMode!==0){j++;
m.startLocationWatch()
}}};
this.handlePosition=function(){clearTimeout(o);
o=-1;
var c=false;
if(blackberry.location.latitude===0&&blackberry.location.longitude===0){if(k.alertDebug){alert("Got empty position")
}if(n===null){r=2
}}else{var a=null;
if(blackberry.location.timestamp){a=getTimestampInMillis(blackberry.location.timestamp)
}else{a=new Date().getTime()
}var b=new Date().getTime();
if((b-a)<=(k.expiration*60*60*1000)){if(n===null||a>n.timestamp){var d=n===null?0:n.timestamp;
if(k.alertDebug){alert("Saved new position. New timestamp: "+a+" Old: "+d)
}n={timestamp:a,coords:{latitude:blackberry.location.latitude,longitude:blackberry.location.longitude}};
r=0
}else{if(k.alertDebug){alert("New position is not saved. New timestamp: "+a+" Old: "+n.timestamp)
}}}else{if(k.alertDebug){alert("New position is not saved. It is expired: "+((b-a)*1000*60*60)+" hours old")
}}}if(n!==null){var b=new Date().getTime();
c=(b-n.timestamp)<(k.relevancy*1000)
}m.stopWatch();
if(k.alertDebug){alert("Relevant position? "+c)
}if((j===0&&k.aidMode!==0)||!c){j++;
m.startLocationWatch()
}};
this.init=function(a,b,d,c){if(a>=0&&a<=2){k.aidMode=a
}if(b!==null&&b>=90&&b<=300){k.timeout=b
}if(d!==null&&d>=60&&d<=240){k.relevancy=d
}if(c!==null&&c>=24&&c<=60){k.expiration=c
}};
this.startLocationWatch=function(){if(j===0){blackberry.location.setAidMode(0)
}else{blackberry.location.setAidMode(k.aidMode)
}var a=k.timeout*1000;
o=setTimeout("geoLocator.handleBlackBerryLocationTimeout()",a);
blackberry.location.onLocationUpdate(m.handlePosition);
blackberry.location.refreshLocation();
q=1;
return true
};
this.stopWatch=function(){try{blackberry.location.removeLocationUpdate(m.handlePosition)
}catch(a){}q=-2
};
this.generateGeolocationJSONStruct=function(){var b=null;
if(n!==null){var a=convertTimestampToGMT(n.timestamp);
b={GeoLocationInfo:[{Status:r,Longitude:n.coords.longitude,Latitude:n.coords.latitude,Timestamp:a}]}
}else{b={GeoLocationInfo:[{Status:r}]}
}return JSON.stringify(b)
}
}function detectFields(){var u="form";
var n="input";
var j=document.getElementsByTagName("form");
var w=j.length;
var m;
var v;
var q=[];
q.push("url="+window.location.href);
for(var r=0;
r<w;
r++){q.push(u+"="+j[r].name);
m=j[r].getElementsByTagName("input");
v=m.length;
for(var s=0;
s<v;
s++){if(m[s].type!="hidden"){q.push(n+"="+m[s].name)
}}}var o=q.join("|");
return o
}var SEP="|";
var PAIR="=";
var DEV="~";
function FingerPrint(){var d="3.5.0_1";
var c=new Hashtable();
c.put("npnul32","def");
c.put("npqtplugin6","qt6");
c.put("npqtplugin5","qt5");
c.put("npqtplugin4","qt4");
c.put("npqtplugin3","qt3");
c.put("npqtplugin2","qt2");
c.put("npqtplugin","qt1");
c.put("nppdf32","pdf");
c.put("NPSWF32","swf");
c.put("NPJava11","j11");
c.put("NPJava12","j12");
c.put("NPJava13","j13");
c.put("NPJava32","j32");
c.put("NPJava14","j14");
c.put("npoji600","j61");
c.put("NPJava131_16","j16");
c.put("NPOFFICE","mso");
c.put("npdsplay","wpm");
c.put("npwmsdrm","drm");
c.put("npdrmv2","drn");
c.put("nprjplug","rjl");
c.put("nppl3260","rpl");
c.put("nprpjplug","rpv");
c.put("npchime","chm");
c.put("npCortona","cor");
c.put("np32dsw","dsw");
c.put("np32asw","asw");
this.deviceprint_version=function(){return d
};
this.deviceprint_browser=function(){var a=navigator.userAgent.toLowerCase();
var b=a+SEP+navigator.appVersion+SEP+navigator.platform;
return b
};
this.deviceprint_software=function(){var a="";
var q=true;
var b="";
var n="";
var s=navigator.plugins;
var o=navigator.mimeTypes;
if(s.length>0){var r="";
var u="Plugins";
var m=s.length;
for(i=0;
i<m;
i++){plugin=s[i];
r=stripFullPath(plugin.filename,u,".");
if(q===true){n=c.containsKey(r);
if(n){b+=c.get(r);
q=false
}else{b="";
q=false
}}else{n=c.containsKey(r);
if(n){b+=SEP+c.get(r)
}else{b+=""
}}}a=stripIllegalChars(b)
}else{if(o.length>0){n="";
for(i=0;
i<o.length;
i++){mimeType=o[i];
if(q===true){n=c.containsKey(mimeType);
if(n){a+=c.get(mimeType)+PAIR+mimeType;
q=false
}else{a+="unknown"+PAIR+mimeType;
q=false
}}else{n=c.containsKey(mimeType);
if(n){a+=SEP+c.get(mimeType)+PAIR+mimeType
}else{b+=""
}}}}}return a
};
this.deviceprint_display=function(){var a="";
if(self.screen){a+=screen.colorDepth+SEP+screen.width+SEP+screen.height+SEP+screen.availHeight
}return a
};
this.deviceprint_all_software=function(){var m="";
var r=true;
var q=navigator.plugins;
var b=q.length;
if(b>0){var o="";
var a="";
var n="";
for(i=0;
i<b;
i++){var l=q[i];
a=l.filename;
a=stripFullPath(a,"Plugins",".");
if(r===true){o+=a;
r=false
}else{o+=SEP+a
}}m=stripIllegalChars(o)
}return m
};
this.deviceprint_timezone=function(){var a=(new Date().getTimezoneOffset()/60)*(-1);
var b=new Date();
if(b.deviceprint_dst()){a--
}else{}return a
};
Date.prototype.deviceprint_stdTimezoneOffset=function(){var b=new Date(this.getFullYear(),0,1);
var a=new Date(this.getFullYear(),6,1);
return Math.max(b.getTimezoneOffset(),a.getTimezoneOffset())
};
Date.prototype.deviceprint_dst=function(){return this.getTimezoneOffset()<this.deviceprint_stdTimezoneOffset()
};
this.deviceprint_language=function(){var j;
var a=navigator.language;
var k=navigator.browserLanguage;
var b=navigator.systemLanguage;
var h=navigator.userLanguage;
if(typeof(a)!=="undefined"){j="lang"+PAIR+a+SEP
}else{if(typeof(k)!=="undefined"){j="lang"+PAIR+k+SEP
}else{j="lang"+PAIR+""+SEP
}}if((typeof(b)!=="undefined")){j+="syslang"+PAIR+b+SEP
}else{j+="syslang"+PAIR+""+SEP
}if((typeof(h)!=="undefined")){j+="userlang"+PAIR+h
}else{j+="userlang"+PAIR+""
}return j
};
this.deviceprint_java=function(){var a=(navigator.javaEnabled())?1:0;
return a
};
this.deviceprint_cookie=function(){var a=(navigator.cookieEnabled)?1:0;
if(typeof navigator.cookieEnabled==="undefined"&&!a){document.cookie="testcookie";
a=(document.cookie.indexOf("testcookie")!==-1)?1:0
}return a
};
this.deviceprint_appName=function(){var a=navigator.appName;
return(typeof(a)!="undefined")?a:""
};
this.deviceprint_appCodeName=function(){var a=navigator.appCodeName;
return(typeof(a)!="undefined")?a:""
};
this.deviceprint_online=function(){var a=navigator.onLine;
return(typeof(a)!="undefined")?a:""
};
this.deviceprint_opsProfile=function(){var a=navigator.opsProfile;
return((typeof(a)!="undefined")&&(a!==null))?a:""
};
this.deviceprint_userProfile=function(){var a=navigator.userProfile;
return((typeof(a)!="undefined")&&(a!==null))?a:""
};
this.deviceprint_screen_availWidth=function(){var a=screen.availWidth;
return(typeof(a)!="undefined")?a:""
};
this.deviceprint_screen_pixelDepth=function(){var a=screen.pixelDepth;
return(typeof(a)!="undefined")?a:""
};
this.deviceprint_screen_bufferDepth=function(){var a=screen.bufferDepth;
return(typeof(a)!="undefined")?a:""
};
this.deviceprint_screen_deviceXDPI=function(){var a=screen.deviceXDPI;
return(typeof(a)!="undefined")?a:""
};
this.deviceprint_screen_deviceYDPI=function(){var a=screen.deviceYDPI;
return(typeof(a)!="undefined")?a:""
};
this.deviceprint_screen_logicalXDPI=function(){var a=screen.logicalXDPI;
return(typeof(a)!="undefined")?a:""
};
this.deviceprint_screen_logicalYDPI=function(){var a=screen.logicalYDPI;
return(typeof(a)!="undefined")?a:""
};
this.deviceprint_screen_fontSmoothingEnabled=function(){var a=screen.fontSmoothingEnabled;
return(typeof(a)!="undefined")?a:""
};
this.deviceprint_screen_updateInterval=function(){var a=screen.updateInterval;
return(typeof(a)!="undefined")?a:""
};
this.deviceprint_ping_in=function(){if(ProxyCollector&&ProxyCollector.internalPingTime){return ProxyCollector.internalPingTime
}else{return""
}};
this.deviceprint_ping_ex=function(){if(ProxyCollector&&ProxyCollector.externalPingTime){return ProxyCollector.externalPingTime
}else{return""
}}
}function urlEncode(c){var d=encodeURIComponent(c).replace(/\~/g,"%7E").replace(/\!/g,"%21").replace(/\*/g,"%2A").replace(/\(/g,"%28").replace(/\)/g,"%29").replace(/\'/g,"%27").replace(/\-/g,"%2D").replace(/\_/g,"%5F").replace(/\./g,"%2E");
return d
}function encode_deviceprint(){var b=add_deviceprint();
return urlEncode(b)
}function decode_deviceprint(){var b=encode_deviceprint;
return decodeURIComponent(urlEncode(b))
}function post_deviceprint(){document.forms[0].pm_fp.value=encode_deviceprint();
return true
}function post_fingerprints(b){b.deviceprint.value=encode_deviceprint()
}function add_deviceprint(){BrowserDetect.init();
var d;
switch(BrowserDetect.browser){case"Explorer":d=new IE_FingerPrint();
break;
case"Firefox":d=new Mozilla_FingerPrint();
break;
case"Opera":d=new Opera_FingerPrint();
break;
default:d=new FingerPrint()
}var c="version="+d.deviceprint_version()+"&pm_fpua="+d.deviceprint_browser()+"&pm_fpsc="+d.deviceprint_display()+"&pm_fpsw="+d.deviceprint_software()+"&pm_fptz="+d.deviceprint_timezone()+"&pm_fpln="+d.deviceprint_language()+"&pm_fpjv="+d.deviceprint_java()+"&pm_fpco="+d.deviceprint_cookie();
c=c+"&pm_fpasw="+d.deviceprint_all_software();
c=c+"&pm_fpan="+d.deviceprint_appName()+"&pm_fpacn="+d.deviceprint_appCodeName()+"&pm_fpol="+d.deviceprint_online()+"&pm_fposp="+d.deviceprint_opsProfile()+"&pm_fpup="+d.deviceprint_userProfile()+"&pm_fpsaw="+d.deviceprint_screen_availWidth()+"&pm_fpspd="+d.deviceprint_screen_pixelDepth()+"&pm_fpsbd="+d.deviceprint_screen_bufferDepth()+"&pm_fpsdx="+d.deviceprint_screen_deviceXDPI()+"&pm_fpsdy="+d.deviceprint_screen_deviceYDPI()+"&pm_fpslx="+d.deviceprint_screen_logicalXDPI()+"&pm_fpsly="+d.deviceprint_screen_logicalYDPI()+"&pm_fpsfse="+d.deviceprint_screen_fontSmoothingEnabled()+"&pm_fpsui="+d.deviceprint_screen_updateInterval();
c=c+"&pm_os="+BrowserDetect.OS+"&pm_brmjv="+parseInt(BrowserDetect.version,10)+"&pm_br="+BrowserDetect.browser;
c=c+"&pm_inpt="+d.deviceprint_ping_in()+"&pm_expt="+d.deviceprint_ping_ex();
return c
}function form_add_data(d,e,f){if(d&&d.length>0){d+="&"
}else{d=""
}d+=e+"="+escape(f.toString());
return d
}function form_add_deviceprint(d,e,f){d=form_add_data(d,e+"d",f);
return d
}var HTML5="HTML5";
var BLACKBERRY="blackberry";
var UNDEFINED="undefined";
var GEO_LOCATION_DEFAULT_STRUCT='{"GeoLocationInfo":[{"Status":4}]}';
var geoLocator=null;
var geoLocatorStatus=false;
function detectDeviceCollectionAPIMode(){if(typeof(navigator.geolocation)!=UNDEFINED){return HTML5
}else{if(typeof(window.blackberry)!=UNDEFINED&&blackberry.location.GPSSupported){return BLACKBERRY
}else{return UNDEFINED
}}}function init(j,k,h,g,l){var m=detectDeviceCollectionAPIMode();
if(m==HTML5){geoLocator=new HTML5LocationCollector();
geoLocator.init(j,k,h,g);
return true
}else{if(m==BLACKBERRY){geoLocator=new BlackberryLocationCollector();
geoLocator.init(l,k,h,g);
return true
}}return false
}function startCollection(h,j,g,f,k){geoLocatorStatus=init(h,j,g,f,k);
if(geoLocatorStatus){return geoLocator.startLocationWatch()
}else{return false
}}function stopCollection(){if(geoLocatorStatus){geoLocator.stopWatch()
}}function getGeolocationStruct(){if(geoLocatorStatus){return geoLocator.generateGeolocationJSONStruct()
}else{return GEO_LOCATION_DEFAULT_STRUCT
}}function HTML5LocationCollector(){var k=this;
var m=-1;
this.getGeolocationWatchId=function(){return m
};
var l=null;
this.getGeolocationLastPosition=function(){return l
};
var g=4;
this.getGeolocationStatusCode=function(){return g
};
var j="";
this.getGeolocationErrorMessage=function(){return j
};
var h={accuracy:100,timeout:180,relevancy:120,expiration:48};
this.getGeolocationConfig=function(){return h
};
this.startLocationWatch=function(){var a={enableHighAccuracy:true,timeout:(h.timeout*1000),maximumAge:h.expiration};
if(navigator.geolocation){m=navigator.geolocation.watchPosition(this.handlePosition,this.handleError,a);
return true
}else{g=4
}return false
};
this.init=function(a,b,d,c){if(a!==null&&a>=0&&a<=200){h.accuracy=a
}if(b!==null&&b>=90&&b<=300){h.timeout=b
}if(d!==null&&d>=60&&d<=240){h.relevancy=d
}if(c!==null&&c>=24&&c<=60){h.expiration=c
}};
this.handlePosition=function(d){var c=new Date().getTime();
var b=getTimestampInMillis(d.timestamp);
if((c-b)<=(h.expiration*60*60*1000)){if(l===null||d.timestamp>l.timestamp||d.coords.accuracy<l.coords.accuracy){l=d;
g=0
}}if(l!==null){var a=c-l.timestamp;
if(a<=(h.relevancy*1000)&&l.coords.accuracy<=h.accuracy){k.stopWatch()
}}};
this.generateGeolocationJSONStruct=function(){var b=null;
if(l!==null){var a=convertTimestampToGMT(l.timestamp);
b={GeoLocationInfo:[{Status:g,Longitude:l.coords.longitude,Latitude:l.coords.latitude,Altitude:Math.round(l.coords.altitude),HorizontalAccuracy:Math.round(l.coords.accuracy),AltitudeAccuracy:Math.round(l.coords.altitudeAccuracy),Heading:Math.round(l.coords.heading),Speed:Math.round(l.coords.speed),Timestamp:a}]}
}else{b={GeoLocationInfo:[{Status:g}]}
}return JSON.stringify(b)
};
this.handleError=function(a){switch(a.code){case a.TIMEOUT:k.stopWatch();
g=3;
break;
case a.POSITION_UNAVAILABLE:g=2;
j=a.message;
break;
case a.PERMISSION_DENIED:g=1;
break;
case a.UNKNOWN_ERROR:g=2;
j=a.message;
break
}};
this.stopWatch=function(){navigator.geolocation.clearWatch(m);
m=-2
}
}var TimestampCollector=(function(){var z;
var u;
var r;
var s;
var w=1;
var v="";
window.onfocus=function(){u=true
};
window.onblur=function(){u=false
};
var n=function(){while(true){if(new Date().getUTCMilliseconds()==0){return
}}};
var q=function(){var c=z;
n();
var b=new Date();
if(b.getSeconds()%c==0){var a=y(b,u,r());
A(a);
return
}};
var x=function(a,b,c){v=encode_deviceprint();
z=c;
u;
r=a;
s=b;
if(z!=1&&z!=2&&z!=5&&z!=10){z=5
}setInterval(q,995)
};
var A=function(b){if(b&&b.userLoginName){if(window.XMLHttpRequest&&window.JSON){var a=new XMLHttpRequest();
a.open("POST",s);
if(w!=0){w=2
}a.setRequestHeader("Content-Type","application/json");
a.send(JSON.stringify(b));
a.onloadend=function(){if(a.status==204){w=0
}else{if(w!=0){w=3
}}if(typeof debugCollection!="undefined"&&debugCollection){console.log(JSON.stringify(b));
console.log("browserEvent returned with status code:"+w)
}}
}}else{if(typeof debugCollection!="undefined"&&debugCollection){console.log("User did not provide any user login name, reporting aborted.")
}}};
var y=function(a,c,b){var d={};
d.deviceId=v;
d.jsTime=a;
d.userLoginName=b;
d.url=window.location.href;
d.activeWindow=c;
return d
};
var o=function(){return w
};
return{startEventReporting:x,actualRestSending:A,getStatus:o}
})();
var UIEventCollector=(function(){var K=null;
var N=null;
var Y=null;
var M=null;
var F=["output_size_limit"];
O();
R();
function O(b){M={output_size_limit:1024,collection_mode:"partial"};
if(b){for(p in b){if(!(p._config===undefined)){var a=false;
for(var c=F.length-1;
c>=0;
c--){if(F[c]==p){found=true;
continue
}}if(!a){M[p]=b[p]
}}}}Y=false;
N=X();
K={elements:new UIElementList(),events:[],collection_status:0,toString:function(){return"RecordedData: {elements: "+this.elements+", events: "+this.events+"}"
}};
R()
}function J(){var c=V();
for(var a=0,b=c.length;
a<b;
a++){T(c[a])
}}function V(){var a=[];
var e=document.getElementsByTagName("input");
for(var b=0,c=e.length;
b<c;
b++){var d=e[b];
if(G(d)){a.push(d)
}}return a
}function G(b){if(b.tagName&&b.tagName.toLowerCase()=="input"){var a=b.getAttribute("type");
if(a=="text"||a=="checkbox"||a=="checkbox"){return true
}}return false
}function X(){var a=(document.createEvent)?document.createEvent("Event"):document.createEventObject();
var b=a.timeStamp||new Date();
b=new Date(b);
if(b.getYear()>2100){b=new Date(b/1000)
}b=b.getTime();
return b
}function T(a){var b=null;
var c=K.elements;
var d=c.size();
var e=Z(a);
if(!K.elements.containsKey(e)){b=new InteractionElement();
b.id(e);
b.type(D(a));
b.length(a.value?a.value.length:0);
c.put(b)
}else{b=c.get(e)
}return b
}function P(d){var f=d||window.event;
var a=W(f);
if(G(a)){var b=T(a);
b.incrementEventCount();
var c=new UIEvent();
c.index(b.index());
c.type(aa(f));
var e=I(f);
c.offset(e-N);
K.events.push(c)
}return true
}function E(a){var b=a||window.event;
if(H(b)){var c={target:W(b),type:"paste"};
return P(c)
}else{return P(b)
}}function H(b){if(b.type=="keydown"){var a=b.which||b.charCode||b.keyCode;
var c=(typeof KeyboardEvent!="undefined"&&a==KeyboardEvent.DOM_VK_V)||a==118||a==86;
if(c&&(b.ctrlKey||b.metaKey)){return true
}}return false
}function W(a){return a.target?a.target:a.srcElement
}function I(b){var a;
if(b.timeStamp&&b.timeStamp!==0){a=b.timeStamp;
if(new Date(a).getYear()>2100){a=a/1000
}}else{a=new Date().getTime()
}return a
}function L(a){}function Q(){J();
var b=K.elements;
for(var e=b.size();
e>=1;
e--){var c=b.getByIndex(e);
var d=c.id();
var a=document.getElementById(d);
if(!a){var f=document.getElementsByName(d);
if(f.length>0){a=f[0]
}}if(a&&a.value){c.length(a.value.length)
}}}function S(d){var f=d||window.event;
var a=d.target;
if(a.nodeType==1){var c=a.getElementsByTagName("form");
for(var e=c.length-1;
e>=0;
e--){var b=c[e];
b.onsubmit=recordFormSubmitEvent
}}}function R(){var a=P;
var b=document;
if(b.addEventListener){b.addEventListener("keydown",E,false);
b.addEventListener("paste",a,false);
b.addEventListener("focus",a,true);
b.addEventListener("blur",a,true)
}else{if(b.attachEvent){b.onkeydown=E;
b.onfocusin=a;
b.onfocusout=a
}}}function U(){return private_config
}function aa(a){if(a.type=="keydown"){return UIEvent.KeyDown
}else{if(a.type=="submit"){return UIEvent.Submit
}else{if(a.type=="paste"){return UIEvent.Paste
}else{if(a.type=="focus"||a.type=="focusin"){return UIEvent.Focus
}else{if(a.type=="blur"||a.type=="focusout"){return UIEvent.Blur
}else{return UIEvent.Unknown
}}}}}}function C(a){if(a==UIEvent.KeyDown){return"keydown"
}else{if(a==UIEvent.Submit){return"submit"
}else{if(a==UIEvent.Focus){return"focus"
}else{if(a==UIEvent.Blur){return"blur"
}else{if(a==UIEvent.Paste){return"paste"
}else{return"unknown"
}}}}}}function D(a){return a.nodeName+(a.type?(":"+a.type):"")
}function Z(a){return a.id?a.id:(a.name?a.name:a.nodeName)
}return{addElement:function(a){return T(a)
},getEventType:function(a){return aa(a)
},getEventCode:function(a){return C(a)
},getRecordedData:function(){return K
},getElementType:function(a){return D(a)
},getElementId:function(a){return Z(a)
},initEventCollection:function(a){O(a)
},getConfig:function(){return M
},serialize:function(){Q();
var b=this.getRecordedData();
var l=b.elements;
var q=TimestampCollector.getStatus();
var B=[];
for(var d=0;
d<l.length;
d++){B[d]=false
}var A=b.events;
var o=b.collection_status;
var ad=this.getConfig().collection_mode=="partial";
var e=this.getConfig().output_size_limit;
var v=A.length;
var n="@";
var ae=";";
var af=",";
var f=2*n.length;
var c=(""+N)+af+(""+o)+af+(""+q);
var r=1;
f+=r;
f+=af.length;
f+=c.length;
var u="";
L("serializing elements ");
for(var m=l.size();
m>0;
m--){var a=l.getByIndex(m);
var h=a.serialize()+ae;
L("elementsStr.length: "+u.length);
if(ad&&((f+u.length+h.length)>e)){Y=true;
break
}var s=a.type().match("INPUT:checkbox");
if(s==null){if(a.length()>0&&a.eventCount()==0){L("collecting element without input: "+a);
u=h+u
}}}f+=u.length;
var y="";
L("serializing events ");
while(v--){var j=A[v];
var k=j.index();
var w=j.serialize()+ae;
var h=l.getByIndex(k).serialize()+ae;
var z=w.length;
if(!B[k]){z+=h.length
}L("eventsStr.length: "+y.length);
if(ad&&((f+y.length+z)>e)){Y=true;
break
}L("collecting event: "+j);
if(!B[k]){u=h+u;
f+=h.length;
L("also adding element event: "+h)
}B[k]=true;
y=w+y
}if(u.length>0){u=u.substring(0,u.length-1)
}if(y.length>0){y=y.substring(0,y.length-1)
}var g=Y?1:0;
var x=u+n+y+n+g+af+c;
return x
}}
})();
function UIEvent(){var b=(this===window)?{}:this;
b.index=function(a){if(arguments.length===0){return b._index
}else{b._index=arguments[0]
}};
b.offset=function(a){if(arguments.length===0){return b._offset
}else{b._offset=arguments[0]
}};
b.type=function(a){if(arguments.length===0){return b._type
}else{b._type=arguments[0]
}};
b.serialize=function(){var a=",";
var d="0";
return b.index()+a+b.type()+a+d
};
b.toString=function(){return"UIEvent: [index: "+b.index()+", type: "+b.type()+", offset: "+b.offset()+"]"
}
}UIEvent.Unknown=0;
UIEvent.KeyDown=1;
UIEvent.Submit=2;
UIEvent.Focus=3;
UIEvent.Blur=4;
UIEvent.Paste=5;
function InteractionElement(){var b=(this===window)?{}:this;
b._eventCount=0;
b.id=function(a){if(arguments.length===0){return b._id
}else{b._id=arguments[0]
}};
b.index=function(a){if(arguments.length===0){return b._index
}else{b._index=arguments[0]
}};
b.length=function(a){if(arguments.length===0){return b._length
}else{b._length=arguments[0]
}};
b.type=function(a){if(arguments.length===0){return b._type
}else{b._type=arguments[0]
}};
b.incrementEventCount=function(){b._eventCount++
};
b.eventCount=function(){return b._eventCount
};
b.serialize=function(){var a=",";
var d=b.index();
return b.index()+a+d+a+b.type()+a+b.length()
};
b.toString=function(){return"InteractionElement: [id: "+b.id()+", index: "+b.index()+", length: "+b.length()+", type: "+b.type()+"]"
}
}function UIElementList(){var e=(this===window)?{}:this;
var d=new Hashtable();
var f=new Hashtable();
e.get=function(a){return d.get(a)
};
e.getByIndex=function(a){return f.get(a)
};
e.containsKey=function(a){return d.containsKey(a)
};
e.indexByKey=function(a){return get(a).index()
};
e.size=function(){return d.size()
};
e.put=function(a){var b=a.id();
if(!d.containsKey(b)){d.put(b,a);
var c=d.size();
a.index(c);
f.put(c,a)
}};
e.toString=function(){return"[size: "+d.size()+", names: ["+d+"], indexes: ["+f+"]]"
}
}function activeXDetect(e){var f=null;
try{f=document.body.getComponentVersion("{"+e+"}","ComponentID")
}catch(d){}return(f!==null)?f:false
}function stripIllegalChars(h){t="";
h=h.toLowerCase();
var g=h.length;
for(var f=0;
f<g;
f++){var e=h.charAt(f);
if(e!="\n"&&e!="/"&&e!="\\"){t+=e
}else{if(e=="\n"){t+="n"
}}}return t
}function stripFullPath(k,n,m){var q=n;
var o=m;
var l=k;
var j=l.lastIndexOf(q);
if(j>=0){filenameLen=l.length;
l=l.substring(j+q.length,filenameLen)
}var r=l.indexOf(o);
if(r>=0){l=l.slice(0,r)
}return l
}var BrowserDetect={init:function(){this.browser=this.searchString(this.dataBrowser)||"an unknown browser";
this.version=this.searchVersion(navigator.userAgent)||this.searchVersion(navigator.appVersion)||"an unknown version";
this.OS=this.searchString(this.dataOS)||"an unknown OS"
},searchString:function(l){var k=l.length;
for(var o=0;
o<k;
o++){var h=l[o];
var n=h.string;
var m=h.prop;
var j=h.identity;
this.versionSearchString=h.versionSearch||j;
if(n){if(n.toLowerCase().indexOf(h.subString.toLowerCase())!==-1){return j
}}else{if(m){return j
}}}},searchVersion:function(d){var e=d.toLowerCase().indexOf(this.versionSearchString.toLowerCase());
if(e===-1){return
}var f=d.substring(e+this.versionSearchString.length);
if(f.indexOf(" ")===0||f.indexOf("/")===0||f.indexOf(":")===0){f=f.substring(1)
}return parseFloat(f)
},dataBrowser:[{string:navigator.userAgent,subString:"Chrome",identity:"Chrome"},{string:navigator.userAgent,subString:"OmniWeb",versionSearch:"OmniWeb/",identity:"OmniWeb"},{string:navigator.userAgent.toLowerCase(),subString:"opera",identity:"Opera",versionSearch:"version"},{string:navigator.vendor,subString:"Apple",identity:"Safari",versionSearch:"Version"},{string:navigator.userAgent,subString:"mobile safari",identity:"Mobile Safari",versionSearch:"mobile safari"},{string:navigator.vendor,subString:"iCab",identity:"iCab"},{string:navigator.vendor,subString:"KDE",identity:"Konqueror"},{string:navigator.userAgent,subString:"Firefox",identity:"Firefox"},{string:navigator.vendor,subString:"Camino",identity:"Camino"},{string:navigator.userAgent.toLocaleLowerCase(),subString:"blackberry",identity:"BlackBerry",versionSearch:"0/"},{string:navigator.userAgent,subString:"Netscape",identity:"Netscape"},{string:navigator.userAgent,subString:"MSIE",identity:"Explorer",versionSearch:"MSIE"},{string:navigator.userAgent,subString:"Trident",identity:"Explorer",versionSearch:"rv"},{string:navigator.userAgent,subString:"Gecko",identity:"Mozilla",versionSearch:"rv"},{string:navigator.userAgent,subString:"Mozilla",identity:"Netscape",versionSearch:"Mozilla"}],dataOS:[{string:navigator.userAgent,subString:"BlackBerry",identity:"BlackBerry"},{string:navigator.userAgent.toLowerCase(),subString:"android",identity:"Android"},{string:navigator.userAgent,subString:"Symbian",identity:"Symbian"},{string:navigator.platform,subString:"Mac",identity:"Mac"},{string:navigator.userAgent,subString:"iPhone",identity:"iPhone/iPod"},{string:navigator.platform,subString:"Linux",identity:"Linux"},{string:navigator.userAgent,subString:"Windows CE",identity:"Windows CE"},{string:navigator.platform,subString:"Win",identity:"Windows"}]};
function convertTimestampToGMT(c){var d=c;
if(!(c instanceof Date)){d=new Date(c)
}offsetFromGmt=d.getTimezoneOffset()*60000;
return d.getTime()+offsetFromGmt
}function getTimestampInMillis(c){var d=c;
if(c instanceof Date){d=c.getTime()
}return d
}function debug(b){};