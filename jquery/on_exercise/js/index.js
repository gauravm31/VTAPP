function Div() {
  this.$addButton = $("#add");
  this.$body = $("body");
  this.divNumber = 1;
}

Div.prototype.add = function() {
  var newDiv = $("<div>" , { class: 'red', text: "Div Number: " + this.divNumber, data: { 'number': this.divNumber++ } });
  this.$addButton.after(newDiv);
}

Div.prototype.highlightDiv = function(obj) {
  
  $(obj).addClass("blue");
  
}

Div.prototype.removeDiv = function(obj) {
  $(obj).remove();
  this.divNumber--;
}

Div.prototype.checkDivNumber = function(obj) {
  $("div.blue").removeClass("blue");
  if($(obj).data('number') === (this.divNumber - 1)) {
    this.removeDiv(obj);
  } else {
    this.highlightDiv(obj);
  }
}

Div.prototype.bindEvents = function() {
  var _this = this;
  this.$addButton.on('click', function() {
    _this.add();
  });
  this.$body.on('click', 'div', function() {
    _this.checkDivNumber(this);
  });
}

$(function() {
  var div = new Div();
  div.bindEvents();
})