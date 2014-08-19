function Checkbox() {
};

var boxesChecked = 0;
var checkboxes = document.getElementsByName("weekday");
var noneCheckbox = document.getElementById("none");

Checkbox.prototype.checkNone = function() {
  boxesChecked = 0;
  for (var i = 0; (i < checkboxes.length - 1); i++) {
    checkboxes[i].checked = "";
  }
};

Checkbox.prototype.checkMax = function() {
  if(this.checked) {
    if(boxesChecked == 3) {
      event.preventDefault();
      var msg = ""
      for (var i = 0; (i < checkboxes.length - 1); i++) {
        if(checkboxes[i].checked && checkboxes[i]!==this) {
          msg += ' ' + checkboxes[i].value;
        }
      }
      alert('Only three days can be seleccted. You have already selected' + msg);
    } else {
      noneCheckbox.checked = "";
      boxesChecked += 1;
    }
  } else {
    boxesChecked -=1;
  }
};

Checkbox.prototype.bindEvents = function() {
  noneCheckbox.addEventListener("click", this.checkNone);
  for (var i = 0; (i < checkboxes.length - 1); i++) {
    checkboxes[i].addEventListener("click", this.checkMax);
  }
};

window.onload = function() {
  var checkbox = new Checkbox();
  checkbox.bindEvents();
};