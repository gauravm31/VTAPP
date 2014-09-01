var select = {
  move: function(fromElement, toElement) {
    var selectedElements = fromElement.selectedOptions;
    for(var i = 0, len = fromElement.selectedOptions.length; i < len; i++) {
      toElement.appendChild(fromElement.selectedOptions[i]);
      toElement.selectedOptions[i--].selected = false;
      len--;
    }
  },

  bindEvents: function() {
    var _this = this,
        addButton = document.getElementById("add"),
        removeButton = document.getElementById("remove"),
        selectBox1 = document.getElementById("countries1"),
        selectBox2 = document.getElementById("countries2");
    addButton.addEventListener("click", function() {
      _this.move(selectBox1, selectBox2);
    });
    removeButton.addEventListener("click", function() {
      _this.move(selectBox2, selectBox1);
    });
  }
}

window.onload = function() {
  select.bindEvents();
}