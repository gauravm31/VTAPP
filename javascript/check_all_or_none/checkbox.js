function Checkbox() {
}

Checkbox.prototype.checkAll = function() {
  var checkboxes = document.getElementsByName("color");
  for (var i = 0; i < checkboxes.length; i++) {
    checkboxes[i].checked = "checked";
  }
};

Checkbox.prototype.checkNone = function() {
  var checkboxes = document.getElementsByName("color");
  for (var i = 0; i < checkboxes.length; i++) {
    checkboxes[i].checked = "";
  }
};

Checkbox.prototype.bindEvents = function() {
  var check_all = document.getElementById('check_all');
  check_all.addEventListener("click", this.checkAll);
  var check_none = document.getElementById('check_none');
  check_none.addEventListener("click", this.checkNone);
};

checkbox = new Checkbox();
checkbox.bindEvents();
