var select = {
  move: function(fromElement, toElement) {
    for(var i = 0; i < fromElement.options.length; i++) {
      if(fromElement.options[i].selected) {
        fromElement.options[i].selected = false;
        toElement.appendChild(fromElement.options[i--]);
      }
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
