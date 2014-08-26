function SearchInput() {
  this.label = $("label[for='q']");
  this.input = $("input.input_text");
  this.hintText = this.label.text();
}

SearchInput.prototype.toggle = function() {
  if(event.type == "focus" && this.input.val() == this.hintText) {
    this.input.val("").removeClass("hint");
  } else {
    if(!this.input.val()) {
      this.changeInput();
    }
  }
}

SearchInput.prototype.changeInput  = function() {
  this.input.val(this.hintText).addClass("hint");
}

SearchInput.prototype.bindEvents = function() {
  var _this = this;
  this.input.on("focus blur", function() {
    _this.toggle();
  })
}

$(function() {
  var searchInput = new SearchInput();
  searchInput.changeInput();
  searchInput.label.remove();
  searchInput.bindEvents();
})