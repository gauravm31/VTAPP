function Name() {
  this.first = this.prompt("first");
  this.last = this.prompt("last")
}

Name.prototype.REGEX = /^\s*$/;

Name.prototype.prompt = function(nameType) {  
  var name = prompt("Enter your " + nameType + " name");
  if(!name || this.REGEX.test(name)){
    name = this.prompt(nameType);
  }
  return(name);
}

Name.prototype.welcome = function() {
  if(this.first && this.last) {
    var msg = this.first.trim() + ' ' + this.last.trim()
    alert('Hello ' + msg);
    document.body.appendChild(document.createTextNode(msg));
  } else {
    alert("Name is invalid. Please reload the page to re-enter the name.")
  }
};

window.onload = function() {
  var name = new Name();
  name.welcome();
}