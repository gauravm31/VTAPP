function SearchInput() {
  this.label = $("label[for='q']");
  this.input = $("input.input_text");
  this.hintText = this.label.text();
}

SearchInput.prototype.init = function() {
  this.changeInput(this.hintText).addClass("hint");
  this.label.remove();
  this.bindEvents();
}

SearchInput.prototype.focusInput = function() {
  if(this.input.val() == this.hintText) {
    this.changeInput("").removeClass("hint");
  }
}

SearchInput.prototype.blurInput = function() {
  if(!this.input.val().trim()) {
    this.changeInput(this.hintText).addClass("hint");
  }
}

SearchInput.prototype.changeInput  = function(text) {
  this.input.val(text);
  return(this.input);
}

SearchInput.prototype.bindEvents = function() {
  var _this = this;
  this.input.on("focus", function() {
    _this.focusInput();
  })
  this.input.on("blur", function() {
    _this.blurInput();
  })
}

$(function() {
  var searchInput = new SearchInput();
  searchInput.init();
})