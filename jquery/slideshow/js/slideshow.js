function Slideshow(slideshow_id, delay_interval, fade_in_interval, fade_out_interval) {
  this.$unorderedList = slideshow_id;
  this.$listItems = this.$unorderedList.children("li");
  this.$navigationArea = $("<div>", { id: 'navigation_area' });
  this.$imageNumberSpan = $("<span>", { id: 'image_number'});
  this.delay =delay_interval;
  this.fadeInInterval = fade_in_interval;
  this.fadeOutInterval = fade_out_interval;
}

Slideshow.prototype.start = function(imageNumber) {
  var _this = this
  imageNumber = this.setImageNumber(imageNumber);
  this.setNavigationAreaText(imageNumber);
  $(this.$listItems[imageNumber]).fadeIn(this.fadeInInterval)
                                  .delay(this.delay)
                                  .fadeOut(this.fadeOutInterval, function() {
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
  this.$imageNumberSpan.text(imageNumber + 1);
}

Slideshow.prototype.setNavigationArea = function() {
  this.$navigationArea.css({
    backgroundColor: "blue",
    color: "red"
  })
  this.$navigationArea.text("No. of images: " + this.$listItems.length + " Current Image Number:  ");
  this.$navigationArea.append(this.$imageNumberSpan);
  this.$unorderedList.append(this.$navigationArea);
}

$(document).ready(function() {
  slideshow = new Slideshow($("#slideshow"), 2000, "slow", "slow");
  slideshow.moveToTop();
  slideshow.setNavigationArea();
  slideshow.start(0);
})