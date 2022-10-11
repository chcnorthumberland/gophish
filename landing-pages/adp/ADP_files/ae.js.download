!function(){
  if(window.__audioEyeInitialized) { return; }
  window.__audioEyeInitialized=!0;
  var document = window.document,
  addListener = document.addEventListener || document.attachEvent,
  removeListener = document.removeEventListener || document.detachEvent,
  eventName = document.addEventListener ? "DOMContentLoaded" : "onreadystatechange",
  hostOverride = window.localStorage.getItem("aeHostOverride")
  readyCallback = function () {
      removeListener.call(document, eventName, readyCallback, false);
      var a=document.createElement("script"),h=window.__AudioEyeSiteHash,d=window.location.hostname;
      a.src=[hostOverride||"https://wsv3cdn.audioeye.com","/bootstrap.js?",h?"h="+h:"d="+d].filter(Boolean).join('');
      a.type="text/javascript";
      a.setAttribute("async","");
      document.getElementsByTagName("body")[0].appendChild(a)
  };
  if (document.readyState !== "loading") {
    readyCallback();
  } else {
    addListener.call(document, eventName, readyCallback, false);
  }
}();
