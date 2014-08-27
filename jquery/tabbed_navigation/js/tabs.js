function Elements() {
  this.divs = $("div.module");
  this.unorderedList = $("<ul></ul>");
}

Elements.prototype.performRequiredActions = function() {
  this.divs.hide();
  this.createList();
  this.divs.first().show().before(this.unorderedList);
}

Elements.prototype.createList = function() {
  var _this = this;
  this.divs.each(function() {
    var li = $("<li></li>");
    li.text($(this).find("h2").text());
      _this.unorderedList.append(li);
  })
}

Elements.prototype.showRelatedModule = function(obj) {
  var div = $("div#" + $(obj).text().toLowerCase());
  this.divs.hide();
  div.show();
  this.unorderedList.children().removeClass("current")
  $(obj).addClass("current");
}

Elements.prototype.bindEvents = function() {
  _this = this;
  this.unorderedList.on('click', 'li', function() {
    _this.showRelatedModule(this);
  })
}

$(function() {
  elements = new Elements;
  elements.performRequiredActions();
  elements.bindEvents();
})