function Div() {
  this.$addButton = $("#add");
  this.$body = $("body");
  this.divNumber = 1;
}

Div.prototype.add = function(divNumber) {
  var newDiv = $("<div>" , { class: 'red' });
  newDiv.text("Div Number: " + divNumber);
  newDiv.data('number', divNumber);
  this.$addButton.after(newDiv);
}

Div.prototype.highlight = function(obj) {
  $("div.blue").removeClass("blue");
  if($(obj).data('number') === (this.divNumber - 1)) {
    $(obj).remove();
    this.divNumber--;
  } else {
    console.log($(obj))
    $(obj).addClass("blue");
  }
}

Div.prototype.bindEvents = function() {
  var _this = this;
  this.$addButton.on('click', function() {
    _this.add(_this.divNumber++);
  });
  this.$body.on('click', 'div', function() {
    _this.highlight(this);
  });
}

$(function() {
  var div = new Div();
  div.bindEvents();
})