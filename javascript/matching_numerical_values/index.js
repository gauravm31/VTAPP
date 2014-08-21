REGEX = /^\s*-?\d*\.?\d+\s*$/

var input = {
  check: function() {
    var number = document.getElementById("number");
    var result = document.getElementById("result");
    if(REGEX.test(number.value)) {
      result.value = true;
      event.preventDefault();
      setTimeout(function() {
        document.forms[0].submit();
      }, 1000);
    } else {
      result.value = false;
      event.preventDefault();
    }
  },

  bindevents: function() {
    var form = document.forms[0];
    form.addEventListener("submit", this.check);
  }
}

window.onload = function() {
  input.bindevents();
}