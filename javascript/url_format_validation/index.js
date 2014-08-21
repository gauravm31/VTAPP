var EMAILCHECK = /^[a-zA-Z0-9_.]+@([a-zA-Z]+\.)+[a-zA-Z]+$/;
var HOMEPAGECHECK = /^(http(s)?:\/\/)?([a-zA-Z0-9_-~]+\.)+[a-zA-Z]+(\/[a-zA-Z0-9#-_~]*)*$/;

function Form(input, textArea, checkbox) {
  this.inputElements = document.getElementsByTagName(input);
  this.textArea = document.getElementById(textArea);
  this.checkBox = document.getElementById(checkbox);
  this.check = false
};

Form.prototype.validate = function() {
  var check = true;
  for (var i = 0, len = this.inputElements.length; i < len; i++) {
    if(this.inputElements[i].getAttribute("type") == "text") {
      if(this.inputElements[i].value === "") {
        this.alertMessage(this.inputElements[i].id + " can't be empty.");
      } else if(this.inputElements[i].id === "email" && (!EMAILCHECK.test(this.inputElements[i].value))) {
        this.alertMessage("Email id is not valid.");
      } else if(this.inputElements[i].id === "home_page" && (!HOMEPAGECHECK.test(this.inputElements[i].value))) {
        this.alertMessage("Home Page is not valid.");
      }
    }
  }

  if(this.textArea.value.length < 50) {
    this.alertMessage("Your description about yourself is too short.");
  }

  if(!this.checkBox.checked) {
    this.alertMessage("Please check the receive notification checkbox.");
  }

  if(this.check == false){
    event.preventDefault();
  }
}

Form.prototype.alertMessage = function(msg) {
  alert(msg);
  this.check = false;
}

Form.prototype.bindEvents = function() {
  var _this = this;
  var form = document.forms[0];
  form.addEventListener("submit", function() {
    _this.validate();
  });
}

window.onload = function() {
  var form = new Form("input", "about_me", "notification");
  form.bindEvents();
};