var EMAILCHECK = /^[a-zA-Z0-9_.]+@([a-zA-Z]+\.)+[a-zA-Z]+$/;
var HOMEPAGECHECK = /^(http(s)?:\/\/)?([a-zA-Z0-9_-~]+\.)+[a-zA-Z]+(\/[a-zA-Z0-9#-_~]*)*$/;

function Form(inputClass, textArea, checkbox) {
  this.inputElements = document.getElementsByClassName(inputClass);
  this.textArea = document.getElementById(textArea);
  this.checkBox = document.getElementById(checkbox);
  this.check = true;
};

Form.prototype.validateTextFields = function(email, homePage) {
  for (var i = 0, len = this.inputElements.length; i < len; i++) {
    if(this.inputElements[i].value === "") {
      this.alertMessage(this.inputElements[i].id + " can't be empty.");
    } else if(this.checkFormat(this.inputElements[i], email, EMAILCHECK)) {
      this.alertMessage("Email id is not valid.");
    } else if(this.checkFormat(this.inputElements[i], homePage, HOMEPAGECHECK)) {
      this.alertMessage("Home Page is not valid.");
    }
  }
}

Form.prototype.validateTextArea = function() {
  if(this.textArea.value.length < 50) {
    this.alertMessage("Your description about yourself is too short.");
  }
}

Form.prototype.validateCheckBox = function() {
  if(!this.checkBox.checked) {
    this.check = confirm("Are you sure you dont want to receive notifications?");
  }
}

Form.prototype.checkSubmit = function() {
  if(this.check) {
    document.forms[0].submit();
    alert("Form was submitted succesfully.")
  }
}

Form.prototype.checkFormat = function(inputElement, elementId, validFormat) {
  return(inputElement.id === elementId && (!validFormat.test(inputElement.value)));
}

Form.prototype.alertMessage = function(msg) {
  alert(msg);
  this.check = false;
  throw {
    name: "error",
    message: "incorrect form values."
  }
}

Form.prototype.bindEvents = function() {
  var _this = this;
      submitButton = document.getElementById("go");
  submitButton.addEventListener("click", function() {
    event.preventDefault();
    _this.validateTextFields("email", "home_page");
    _this.validateTextArea();
    _this.validateCheckBox();
    _this.checkSubmit();
  });
}

window.onload = function() {
  var form = new Form("input_text", "about_me", "notification");
  form.bindEvents();
};