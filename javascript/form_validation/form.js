function Form() {

};

var inputElements = document.getElementsByTagName("input");
var textArea = document.getElementById("about_me");
var checkBox = document.getElementById("notification");

Form.prototype.validate = function() {
  var check = true;
  for (var i = 0, len = inputElements.length; i < len; i++) {
    if((inputElements[i].getAttribute("type") == "text") && (inputElements[i].value === "")) {
      alert(inputElements[i].id + " can't be empty.");
      check = false;
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