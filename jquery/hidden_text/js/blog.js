function Blog() {
  this.$module = $("div#blog");
}

Blog.prototype.showRelatedParagraph = function(obj) {
  $(obj).find("p.excerpt").slideToggle("slow");
  var visiblePara = $(obj).siblings().find("p:visible");
  visiblePara.slideUp("slow");
}

Blog.prototype.bindEvents = function() {
  _this = this;
  this.$module.on("click", "li", function(event) {
    event.preventDefault();
    _this.showRelatedParagraph(this);
  })
}

$(function() {
  var blog = new Blog();
  blog.bindEvents();
})
