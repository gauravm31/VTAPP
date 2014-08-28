function Blog() {
  this.$module = $("div#blog");
}

Blog.prototype.showRelatedParagraph = function(obj) {
  var visiblePara = this.$module.find("p:visible");
  visiblePara.slideUp("slow");
  $(obj).parent().next().slideDown("slow");
}

Blog.prototype.bindEvents = function() {
  _this = this;
  this.$module.on("click", "a", function(event) {
    event.preventDefault();
    _this.showRelatedParagraph(this);
  })
}

$(function() {
  var blog = new Blog();
  blog.bindEvents();
})
