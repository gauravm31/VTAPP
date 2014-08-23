REGEX = /^\s*-?\d*\.?\d+\s*$/

var input = {
  number: null,
  result: null,
  form: null,
  check: function() {
    event.preventDefault();
    if(REGEX.test(this.number.value)) {
      this.result.value = true;
      setTimeout(function() {
        document.forms[0].submit();
      }, 1000);
    } else {
      this.result.value = false;
    }
  },

  bindevents: function() {
    this.form.addEventListener("submit", this.check);
  }
}

window.onload = function() {
  input.number = document.getElementById("number");
  input.result = document.getElementById("result");
  input.form = document.forms[0];
  input.bindevents();
}