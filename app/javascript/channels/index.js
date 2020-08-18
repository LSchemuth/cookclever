// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

const channels = require.context('.', true, /_channel\.js$/)
channels.keys().forEach(channels)

const navbarHome = document.getElementById("navbarHome")
if (navbarHome) {
  var prevScrollpos = window.pageYOffset;
  window.onscroll = function() {
    var currentScrollPos = window.pageYOffset;
    if (prevScrollpos > currentScrollPos) {
      navbarHome.style.top = "0";
    } else {
      navbarHome.style.top = "-120px";
    }
    prevScrollpos = currentScrollPos;
  }
}
