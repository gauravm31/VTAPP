var REGEX = /^\s*$/;
function Name() {
}

Name.prototype.init = function() {
  var check = this.loop();
  if(check) {
    this.welcome();
  }
};

// Name.prototype.loop = function() {
//   do {
//     this.firstName = prompt("Enter your first name.", "");
//     if(this.firstname){
//       this.lastName = prompt("Enter your last name.", "")
//     }
//   } while(!(this.firstName && this.lastName))

//   return (this.firstName !== null && this.lastName !== null)
// };

Name.prototype.loop = function() {
  do {
    this.firstName = prompt("Enter your first name.", "");
  } while(!this.firstName)
  do {
    this.lastName = prompt("Enter your last name.", "");
  } while(!this.lastName)

  return (this.firstName !== null && this.lastName !== null)

}

Name.prototype.prompt = function() {
  if(this.validate(this.firstName)) {
      this.firstName = prompt("Enter your first name.", "");
    } else if(this.firstName === null) {
      return false;
    } else {
      this.lastName = prompt("Enter your last name.", "")
    }
}

Name.prototype.validate = function(name) {
  return(REGEX.test(name))
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