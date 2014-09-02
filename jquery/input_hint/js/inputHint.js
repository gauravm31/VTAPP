function InputHint() {
  this.label = $("label[for='q']");
  this.input = $("input.input_text");
  this.hintText = this.label.text();
}

InputHint.prototype.init = function() {
  this.setText(this.hintText);
  this.removeLabel();
  this.bindEvents();
}

InputHint.prototype.removeLabel = function() {
  this.label.remove();
}

InputHint.prototype.focusInput = function() {
  if(this.input.val() == this.hintText) {
    this.input.removeClass("hint").val("");
  }
}

InputHint.prototype.blurInput = function() {
  if(!this.input.val().trim()) {
    this.setText(this.hintText)
  }
}

InputHint.prototype.setText  = function(text) {
  this.input.addClass("hint").val(text);
}

InputHint.prototype.bindEvents = function() {
  var _this = this;
  this.input.on("focus", function() {
    _this.focusInput();
  })
  this.input.on("blur", function() {
    _this.blurInput();
  })
}

$(function() {
  var searchInput = new InputHint();
  searchInput.init();
})