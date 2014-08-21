var BLANK = /^\s*$/;
var CHECK = /^https:\/\//;
function Url() {
  this.url = ""
}

Url.prototype.init = function() {
  this.promptForUrl();
};

Url.prototype.promptForUrl = function() {
  this.url = prompt("Enter the url", "")
  if(BLANK.test(this.url)) {
    alert("empty URL");
  } else if(CHECK.test(this.url)) {
    window.open(this.url, "_blank", "width=400, height=450, menubar=no, scrollbars=no, status=no, titlebar=no, toolbar=no", "false");
  } else {
    window.open('https://' + this.url, "_blank", "width=400, height=450, menubar=no, scrollbars=no, status=no, titlebar=no, toolbar=no", "false");
  }
};

window.onload = function() {
  var link = new Url();
  link.init();
}