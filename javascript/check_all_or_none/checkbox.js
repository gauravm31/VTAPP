function Checkbox() {
};

Checkbox.prototype.checkAll = function() {
  event.preventDefault();
  var checkboxes = document.getElementsByName("color");
  for (var i = 0; i < checkboxes.length; i++) {
    checkboxes[i].checked = "checked";
  }
};

Checkbox.prototype.checkNone = function() {
  event.preventDefault();
  var checkboxes = document.getElementsByName("color");
  for (var i = 0; i < checkboxes.length; i++) {
    checkboxes[i].checked = "";
  }
};

Checkbox.prototype.bindEvents = function() {
  var checkAllLink = document.getElementById('check_all');
  checkAllLink.addEventListener("click", this.checkAll);
  var checkNoneLink = document.getElementById('check_none');
  checkNoneLink.addEventListener("click", this.checkNone);
};

window.onload = function() {
  var checkbox = new Checkbox();
  checkbox.bindEvents();
};