function Loader() {
  this.$module = $("div#blog");
}

Loader.prototype.createTargetDiv = function() {
  var headings = this.$module.find("h3");
  $(headings).each(function() {
    var $targetDiv = $("<div></div>");
    $(this).after($targetDiv);
    $(this).data("targetDiv", $targetDiv);
  })
}

Loader.prototype.start = function(event) {
  var id = $(this).attr('href').split("#")[1];
  $(this).parent().data('targetDiv').load('data/blog.html #' + id);
  event.preventDefault();  
}

Loader.prototype.bindEvents = function() {
  _this = this;
  this.$module.on("click", "a", this.start);
}

$(function() {
  var loader = new Loader();
  loader.createTargetDiv();
  loader.bindEvents();
})
