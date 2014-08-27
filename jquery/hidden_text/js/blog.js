function Blog() {
  this.$module = $("div#blog");
}

Blog.prototype.showRelatedParagraph = function(obj) {
  this.$module.find("p:visible").slideUp("slow");
  $(obj).parent().next().slideDown("slow");
}

Blog.prototype.bindEvents = function() {
  _this = this;
  this.$module.on("click", "a", function() {
    event.preventDefault();
    _this.showRelatedParagraph(this);
  })
}

$(function() {
  var blog = new Blog();
  blog.bindEvents();
})
