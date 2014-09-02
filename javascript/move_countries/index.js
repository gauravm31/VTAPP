var countryMover = {
  move: function(fromElement, toElement) {
    var selectedElements = fromElement.selectedOptions;
    while(selectedElements[0]) {
      toElement.appendChild(selectedElements[0]);
      toElement.selectedOptions[0].selected = false;
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
  countryMover.bindEvents();
}