function Checkbox() {
};

Checkbox.prototype.check = function() {
  var ul = document.getElementById(this.value);
  var checkboxes = document.getElementsByName(this.value);
  if(this.checked) {
    ul.setAttribute("class", "visible");
    ul.scrollIntoView(false);
    for(var i = 0; i < checkboxes.length; i++) {
      checkboxes[i].checked = "checked"
    }
  } else {
    ul.setAttribute("class", "hidden");
    for(var i = 0; i < checkboxes.length; i++) {
      checkboxes[i].checked = ""
    }
  }
};

Checkbox.prototype.bindEvents = function() {
  var list = document.getElementsByName("list");
  for(var i = 0; i < list.length; i++) {
    list[i].addEventListener("click", this.check);
  }
};

window.onload = function() {
  var checkbox = new Checkbox();
  checkbox.bindEvents();
};
