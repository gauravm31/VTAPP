function Slideshow() {
  this.$unorderedList = $("#slideshow");
  this.$listItems = this.$unorderedList.children("li");
  this.$navigationArea = $("<div id='navigation_area'></div>")
}

Slideshow.prototype.start = function(imageNumber) {
  _this = this;
  imageNumber = this.setImageNumber(imageNumber);
  this.setNavigationAreaText(imageNumber);
  $(_this.$listItems[imageNumber]).fadeIn("slow").delay(2000).fadeOut("slow", function() {
    _this.start(imageNumber + 1);
  });
}

Slideshow.prototype.setImageNumber = function(imageNumber) {
  if(imageNumber === (this.$listItems.length)) {
    imageNumber = 0;
  }
  return imageNumber;
}

Slideshow.prototype.moveToTop = function() {
  $("body").prepend(this.$unorderedList);
  this.$listItems.hide();
}

Slideshow.prototype.setNavigationAreaText = function(imageNumber) {
  var newText = this.$navigationArea.text().substring(0, (this.$navigationArea.text().length - 1));
  this.$navigationArea.text(newText + (imageNumber + 1));
}

Slideshow.prototype.setNavigationArea = function() {
  this.$navigationArea.css({
    backgroundColor: "blue",
    color: "red"
  })
  this.$navigationArea.text("No. of images: " + this.$listItems.length +" Current Image Number:  ");
  this.$unorderedList.append(this.$navigationArea);
}

$(function() {
  slideshow = new Slideshow();
  slideshow.moveToTop();
  slideshow.setNavigationArea();
  slideshow.start(0);
})