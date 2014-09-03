function ContainerDiv() {
  this.$addButton = $("#add");
  this.$body = $("body");
  this.divNumber = 0;
}

ContainerDiv.prototype.add = function() {
  var newDiv = $("<div>" , { class: 'red', text: "Div Number: " + (++this.divNumber), data: { 'number': this.divNumber } });
  this.$addButton.after(newDiv);
}

ContainerDiv.prototype.highlightInnerDiv = function($obj) {
  $("div.blue").removeClass("blue");
  $obj.addClass("blue");
}

ContainerDiv.prototype.removeInnerDiv = function($obj) {
  $obj.remove();
  this.divNumber--;
}

ContainerDiv.prototype.manipulateInnerDiv = function(obj) {
  var $obj = $(obj)
  if($obj.data('number') === (this.divNumber)) {
    this.removeInnerDiv($obj);
  } else {
    this.highlightInnerDiv($obj);
  }
}

ContainerDiv.prototype.bindEvents = function() {
  var _this = this;
  this.$addButton.on('click', function() {
    _this.add();
  });
  this.$body.on('click', 'div', function() {
    _this.manipulateInnerDiv(this);
  });
}

$(function() {
  var containerDiv = new ContainerDiv();
  containerDiv.bindEvents();
})