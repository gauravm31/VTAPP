function Blog() {
  this.$module = $("div#blog");
}

Blog.prototype.showRelatedParagraph = function(listItem) {
  $(listItem).find("p.excerpt").slideToggle("slow");
  $(listItem).siblings().find("p:visible").slideUp("slow");
}

Blog.prototype.bindEvents = function() {
  var _this = this;
  this.$module.on("click", "li", function(event) {
    event.preventDefault();
    _this.showRelatedParagraph(this);
  })
}

$(function() {
  var blog = new Blog();
  blog.bindEvents();
})
