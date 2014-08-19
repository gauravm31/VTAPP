function Checkbox() {
};

var checkboxes = document.getElementsByName("color");

Checkbox.prototype.check = function() {
  for (var i = 0; i < checkboxes.length; i++) {
    if(this.id === "check_all") {
      checkboxes[i].checked = "checked";
    } else {
      checkboxes[i].checked = "";
    }
  }
  event.preventDefault();
};

Checkbox.prototype.bindEvents = function() {
  var checkAllLink = document.getElementById('check_all');
  checkAllLink.addEventListener("click", this.check);
  var checkNoneLink = document.getElementById('check_none');
  checkNoneLink.addEventListener("click", this.check);
};

window.onload = function() {
  var checkbox = new Checkbox();
  checkbox.bindEvents();
};