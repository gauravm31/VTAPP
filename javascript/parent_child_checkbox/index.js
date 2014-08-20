var Checkbox = {
  check: function(obj) {
    var unorderedList = document.getElementById(obj.value);
    var checkboxes = document.getElementsByName(obj.value);
    if(obj.checked) {
      this.setCheckMark("visible", true, unorderedList, checkboxes);
      unorderedList.scrollIntoView(false);
    } else {
      this.setCheckMark("hidden", false, unorderedList, checkboxes);
    }
  },
  setCheckMark: function(classValue, checkValue, unorderedList, checkboxes) {
    unorderedList.setAttribute("class", classValue);
    for(var i = 0; i < checkboxes.length; i++) {
    checkboxes[i].checked = checkValue;
    }
  },
  bindEvents: function() {
    _this = this;
    var list = document.getElementsByName("list");
    for(var i = 0; i < list.length; i++) {
      list[i].addEventListener("click", function() {
        _this.check(this);
      });
    }
  }
}

window.onload = function() {
  Checkbox.bindEvents();
};
