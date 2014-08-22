var BLANK = /^\s*$/;
var CHECK = /^https:\/\//;
function Url() {
}

Url.prototype.prompt = function() {
  this.url = prompt("Enter the url");
  if(BLANK.test(this.url)) {
    alert("empty URL");
  } else if(CHECK.test(this.url)) {
    this.openNewWindow(this.url)
  } else {
    this.openNewWindow('https://' + this.url)
  }
};

Url.prototype.openNewWindow = function(address) {
  window.open(address, "_blank", "width=400, height=450, menubar=no, scrollbars=no, status=no, titlebar=no, toolbar=no", "false");
}

window.onload = function() {
  var link = new Url();
  link.prompt();
}