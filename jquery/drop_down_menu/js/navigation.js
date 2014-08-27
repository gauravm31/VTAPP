function Pane(list) {
  this.$menuList = $(list);
}

Pane.prototype.showSubmenu = function() {
  $(this).addClass("hover")
         .find("ul").show();
}

Pane.prototype.hideSubmenu = function() {
  $(this).removeClass("hover")
         .find("ul").hide();
}

Pane.prototype.bindEvents = function() {
  this.$menuList.children().hover(this.showSubmenu, this.hideSubmenu);
}

$(function() {
  var pane = new Pane("#nav");
  pane.bindEvents();
})