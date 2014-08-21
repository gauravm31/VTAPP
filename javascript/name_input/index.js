var REGEX = /^\s*$/;
function Name() {
  this.firstName = "";
  this.lastName = "";
}

Name.prototype.init = function() {
  var check = this.prompt();
  if(check) {
    this.welcome();
  }
};

Name.prototype.prompt = function() {
  do {
    if(REGEX.test(this.firstName)) {
      this.firstName = prompt("Enter your first name.", "");
    } else if(this.firstName === null) {
      return false;
    } else {
      this.lastName = prompt("Enter your last name.", "")
    }
  } while(REGEX.test(this.firstName) || REGEX.test(this.lastName))
  return (this.firstName !== null && this.lastName !== null)
};

Name.prototype.welcome = function() {
  var msg = this.firstName.trim() + ' ' + this.lastName.trim()
  alert('Hello ' + msg);
  document.body.appendChild(document.createTextNode(msg));
};

window.onload = function() {
  var name = new Name();
  name.init();
}