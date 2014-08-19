function Checkbox() {
};

var checkboxes = document.getElementsByName("color");

Checkbox.prototype.check = function(mark) {
  for (var i = 0; i < checkboxes.length; i++) {
    checkboxes[i].checked = mark;
  }
  event.preventDefault();
};

Checkbox.prototype.bindEvents = function() {
  var _this = this;
  var checkAllLink = document.getElementById('check_all');
  checkAllLink.addEventListener("click", function() {
    _this.check(true);
  });
  var checkNoneLink = document.getElementById('check_none');
  checkNoneLink.addEventListener("click", function() {
    _this.check(false);
  });
};

window.onload = function() {
  var checkbox = new Checkbox();
  checkbox.bindEvents();
};