function Pane() {
  this.$menuList = $("#nav");
}

Pane.prototype.showSubmenu = function() {
  $(this).addClass("hover");
  $(this).find("ul").show();
}

Pane.prototype.hideSubmenu = function() {
  $(this).removeClass("hover");
  $(this).find("ul").hide();
}

Pane.prototype.bindEvents = function() {
  this.$menuList.children().hover(this.showSubmenu, this.hideSubmenu);
}

$(function() {
  var pane = new Pane();
  pane.bindEvents();
})