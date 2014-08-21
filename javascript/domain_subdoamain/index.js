REGEX = /^(?:http(?:s)?:\/\/)?(?:www\.)?((?:(?:[a-z0-9_\-~]+)\.)*)((?:[a-z0-9_\-~]+)\.[a-z]{3,6})(\/[a-z0-9#-_~]*)*$/i;

var Input = {
  findDomain: function() {
    var url = document.getElementById("url").value;
    var match = REGEX.exec(url);
    if(match) {
      if(match[1]) {
        alert(' domain: ' + match[2] + ', ' + 'subdomain: ' + match[1].substring(0, match[1].length - 1));
      } else {
        alert('domain: ' + match[2]);
      }
      event.preventDefault();
    } else {
      alert("invalid url");
      event.preventDefault();
    }
  },
  bindEvents: function() {
    var form = document.forms[0];
    form.addEventListener("submit", this.findDomain);
  }
}

window.onload = function() {
  Input.bindEvents();
}
