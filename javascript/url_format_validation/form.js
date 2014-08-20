var EMAILCHECK = /^[a-zA-Z0-9_.]+@([a-zA-Z]+\.)+[a-zA-Z]+$/;
var HOMEPAGECHECK = /^(http(s)?:\/\/)?([a-zA-Z0-9_-~]+\.)+[a-zA-Z]+(\/[a-zA-Z0-9#-_~]*)*$/;

function Form() {

};

var inputElements = document.getElementsByTagName("input");
var textArea = document.getElementById("about_me");
var checkBox = document.getElementById("notification");

Form.prototype.validate = function() {
  var check = true;
  for (var i = 0, len = inputElements.length; i < len; i++) {
    if(inputElements[i].getAttribute("type") == "text") {
      if(inputElements[i].value === "") {
        alert(inputElements[i].id + " can't be empty.");
        check = false;
      } else if(inputElements[i].id === "email" && (!EMAILCHECK.test(inputElements[i].value))) {
        alert("Email id is not valid.");
        check = false;
      } else if(inputElements[i].id === "home_page" && (!HOMEPAGECHECK.test(inputElements[i].value))) {
        alert("Home Page is not valid.");
        check = false;
      }
    }
  }

  if(textArea.value.length < 50) {
    alert("Your description about yourself is too short.");
    check = false;
  }

  if(!checkBox.checked) {
    alert("Please check the receive notification checkbox.");
    check = false;
  }

  if(check == false){
    event.preventDefault();
  }
}

Form.prototype.bindEvents = function() {
  var form = document.forms[0];
  form.addEventListener("submit", this.validate);
}

window.onload = function() {
  var form = new Form();
  form.bindEvents();
};