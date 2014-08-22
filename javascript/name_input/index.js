var REGEX = /^\s*$/;
function Name() {
}

Name.prototype.init = function() {
  var name = this.getName();
  if(name) {
    this.welcome();
  }
};

Name.prototype.getName = function() {
  this.firstName = this.prompt("first");
  this.lastName = this.prompt("last");

  return (this.firstName && this.lastName)
}

Name.prototype.prompt = function(nameType) {  
  var name = prompt("Enter your " + nameType + " name");
  if(!name || REGEX.test(name)){
    name = this.prompt(nameType);
  }
  return(name);
}

Name.prototype.welcome = function() {
  var msg = this.firstName.trim() + ' ' + this.lastName.trim()
  alert('Hello ' + msg);
  document.body.appendChild(document.createTextNode(msg));
};

window.onload = function() {
  var name = new Name();
  name.init();
}