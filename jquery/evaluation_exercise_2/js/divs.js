function Div() {
  this.$displayDiv = $("#display")
  this.$moreButton = $("#more");
  this.$selectBox = $("#max_number");
}

Div.prototype.mouseOverDivAction = function(obj) {
  $(obj).addClass("green");
}

Div.prototype.mouseOutDivAction = function(obj) {
  $(obj).removeClass("green");
}

Div.prototype.mouseOverParaAction =function(obj) {
  $("p.name").each(function() {
    if(($(this).text() == $(obj).text()) && (this != obj)) {
      $(this).parent().addClass('yellow');
    }
  })
}

Div.prototype.mouseOutParaAction =function(obj) {
  $("div.yellow").removeClass("yellow");
}

Div.prototype.toggleSelectDiv = function(obj) {
  $(obj).toggleClass("red");
}

Div.prototype.bindEvents = function() {
  var _this = this;
  this.$displayDiv.on('mouseover', 'div.user_info', function() {
    _this.mouseOverDivAction(this);
  });
  this.$displayDiv.on('mouseout', 'div.user_info', function() {
    _this.mouseOutDivAction(this);
  });
  this.$displayDiv.on('mouseover', 'p.name', function() {
    _this.mouseOverParaAction(this);
  });
  this.$displayDiv.on('mouseout', 'p.name', function() {
    _this.mouseOutParaAction(this);
  });
  this.$displayDiv.on('click', 'div.user_info', function() {
    _this.toggleSelectDiv(this);
  });
}

$(function() {
  var div = new Div();
  div.bindEvents();
})
