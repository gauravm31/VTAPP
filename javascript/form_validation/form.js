var EMAILCHECK = /^[a-zA-Z0-9_.]+@([a-zA-Z]+\.)+[a-zA-Z]+$/;
var HOMEPAGECHECK = /^(http(s)?:\/\/)?([a-zA-Z0-9_-~]+\.)+[a-zA-Z]+(\/[a-zA-Z0-9#-_~]*)*$/;

function Form(inputClass) {
  this.inputElements = document.getElementsByClassName(inputClass);
};

Form.prototype.validateTextFields = function() {
  for(var i = 0, len = this.inputElements.length; i < len; i++) {
    switch(this.inputElements[i].id) {
      case 'email':
        if(this.checkFormat(EMAILCHECK, this.inputElements[i])) {
          return;
        }
        break;
      case 'home_page':
        if(this.checkFormat(HOMEPAGECHECK, this.inputElements[i])) {
          return; 
        }
        break;
      case 'about_me': 
        if(!this.validateTextArea(this.inputElements[i])) {
          return;
        }
        break;
      case 'notification': 
        if(!this.validateCheckBox(this.inputElements[i])) {
          return;
        }
      default: 
        if(this.checkEmpty(this.inputElements[i])) {
          return;
        }
    }
  }
  return true;
}

Form.prototype.checkEmpty = function(textBox) {
  if(!textBox.value.trim().length) {
    alert(textBox.id + " can't be empty.");
    return true;
  }
}

Form.prototype.checkFormat = function(checkRegex, checkElement) {
  if(!checkRegex.test(checkElement.value.trim())) {
    alert(checkElement.id + " is not valid.");
     return true;
  }
}

Form.prototype.validateTextArea = function(textArea) {
  if(textArea.value.trim().length < 50) {
    alert("Your description about yourself is too short.");
  } else {
    return true;
  }
}

Form.prototype.validateCheckBox = function(checkBox) {
  if(!checkBox.checked) {
    var confirmResult = confirm("Are you sure you dont want to receive notifications?");
    return confirmResult;
  }
  return true;
}

Form.prototype.bindEvents = function() {
  var _this = this,
      form = document.getElementById("user_form");
  form.addEventListener("submit", function(event) {
    event.preventDefault();
    if(_this.validateTextFields()) {
      this.submit();
    }
  });
}

window.onload = function() {
  var form = new Form("input_element");
  form.bindEvents();
};