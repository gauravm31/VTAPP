function Url() {
}

Url.prototype.BLANK = /^\s*$/;

Url.prototype.CHECK = /^([a-zA-Z0-9_-~]+\.)+[a-zA-Z]+(\/[a-zA-Z0-9#-_~]*)*$/;

Url.prototype.prompt = function() {
  this.url = prompt("Enter the url");
  if(this.BLANK.test(this.url)) {
    alert("empty URL");
  } else if(this.CHECK.test(this.url)) {
    this.openNewWindow('https://' + this.url)
  } else {
    alert("URL is invalid.")
  }
};

Url.prototype.openNewWindow = function(address) {
  window.open(address, "_blank", "width=400, height=450, menubar=no, scrollbars=no, status=no, titlebar=no, toolbar=no", "false");
}

window.onload = function() {
  var link = new Url();
  link.prompt();
}