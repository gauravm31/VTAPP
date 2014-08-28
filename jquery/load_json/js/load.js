function Loader() {
  this.$select = $("select");
  this.$form = $("#specials form");
  this.$targetDiv = $("<div></div>");
  this.data = {};
}

Loader.prototype.init = function() {
  this.createTargetDiv();
  this.getJson();
  this.bindEvents();
}

Loader.prototype.createTargetDiv = function() {
  this.$form.after(this.$targetDiv);
}

Loader.prototype.getJson = function() {
  var _this = this;

  this.json = $.ajax({
    url: 'data/specials.json',
    dataType: 'json',
    success: function(data) {
      _this.data = data
    },
    error: function() {
      console.log("failure");
    }
  })
}

Loader.prototype.showSpecials = function(obj) {
  var specialData = this.data[$(obj)
                    .val()],
      title = specialData['title'],
      text = specialData['text'],
      imageSource = specialData['image'].substring(1, specialData['image'].length),
      color = specialData['color'];

  this.$targetDiv.empty();
  this.$targetDiv.css("color", color);
  this.$targetDiv.append('<h2>' + title + '</h2>' + text + '<br>')
  this.$targetDiv.append("<img src='" + imageSource + "'>");
}

Loader.prototype.bindEvents = function() {
  var _this = this;

  this.$select.on("change", function(){
    _this.showSpecials(this);
  });
}

$(function() {
  var loader = new Loader();
  loader.init();
})
