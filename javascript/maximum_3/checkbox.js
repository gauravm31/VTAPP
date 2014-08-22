function CheckboxGroup(name , id, limit) {
  this.boxesChecked = 0;
  this.checkBoxLimit = limit;
  this.checkboxes = document.getElementsByName(name);
  this.noneCheckbox = document.getElementById(id);
};



CheckboxGroup.prototype.checkNone = function() {
  this.boxesChecked = 0;
  for (var i = 0; (i < this.checkboxes.length - 1); i++) {
    this.checkboxes[i].checked = false;
  }
};

CheckboxGroup.prototype.checkMax = function(obj) {
  if(obj.checked) {
    if(this.boxesChecked == this.checkBoxLimit) {
      event.preventDefault();
      var msg = ""
      for (var i = 0; (i < this.checkboxes.length - 1); i++) {
        if(this.checkboxes[i].checked && this.checkboxes[i]!==obj) {
          msg += ' ' + this.checkboxes[i].value;
        }
      }
      alert('Only three days can be seleccted. You have already selected' + msg);
    } else {
      this.noneCheckbox.checked = false;
      this.boxesChecked += 1;
    }
  } else {
    this.boxesChecked -=1;
  }
};

CheckboxGroup.prototype.bindEvents = function() {
  var _this = this;
  this.noneCheckbox.addEventListener("click", function() {
    _this.checkNone();
  }
  );
  for (var i = 0; (i < this.checkboxes.length - 1); i++) {
    this.checkboxes[i].addEventListener("click", function() {
      _this.checkMax(this);
    }
    );
  }
};

window.onload = function() {
  var weekdays = new CheckboxGroup("weekday", "none", 3);
  weekdays.bindEvents();
};