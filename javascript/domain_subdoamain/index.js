REGEX = /^(?:http(?:s)?:\/\/)?(?:www\.)?((?:(?:[a-z0-9_\-~]+)\.)*)((?:[a-z0-9_\-~]+)\.[a-z]{3,6})(\/[a-z0-9#-_~]*)*$/i;

function Input() {
  this.domain = '';
  this.subdomain = '';
}

Input.prototype.findDomainAndSubdomain = function() {
  var url = document.getElementById("url").value;
  var match = REGEX.exec(url);
  if(match) {
    this.domain = match[2];
    this.subdomain = match[1]
  } else {
    alert("invalid url");
    event.preventDefault();
  }
}

Input.prototype.showDomainAndSubdomain = function() {
  if(this.subdomain !== '') {
    alert(' domain: ' + this.domain + ', ' + 'subdomain: ' + this.subdomain.substring(0, this.subdomain.length - 1));
  } else if(this.domain !== '') {
    alert('domain: ' + this.domain);
  }
}

Input.prototype.bindEvents = function() {
  var form = document.forms[0];
  _this = this;
  form.addEventListener("submit", function() {
    _this.findDomainAndSubdomain();
    _this.showDomainAndSubdomain();
  }
  );
}

window.onload = function() {
  var input = new Input();
  input.bindEvents();
}
