function Name() {
}

Name.prototype.REGEX = /^\s*$/;

Name.prototype.init = function() {
  var name = this.getName();
  if(name) {
    this.welcome();
  }
};

Name.prototype.getName = function() {
  this.first = this.prompt("first");
  this.last = this.prompt("last");

  return (this.first && this.last)
}

Name.prototype.prompt = function(nameType) {  
  var name = prompt("Enter your " + nameType + " name");
  if(!name || this.REGEX.test(name)){
    name = this.prompt(nameType);
  }
  return(name);
}

Name.prototype.welcome = function() {
  var msg = this.first.trim() + ' ' + this.last.trim()
  alert('Hello ' + msg);
  document.body.appendChild(document.createTextNode(msg));
};

window.onload = function() {
  var name = new Name();
  name.init();
}