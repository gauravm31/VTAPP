function User() {
  this.$form = $("#user");
  this.$display = $("#display");
  this.$deleteButton = $("#delete");
  this.name = '';
  this.email = '';
  this.phone = '';
  this.emailCheck = /^[a-zA-Z0-9_.]+@([a-zA-Z]+\.)+[a-zA-Z]+$/;
  this.phoneCheck = /^\d{10}$/;
}

User.prototype.fieldsValid = function() {
  return(this.checkName() && this.checkEmail() && this.checkPhoneNumber());
}

User.prototype.checkName = function() {
  var $inputName = $("#name").val().trim();
  if($inputName === "") {
    alert("Name can not be empty.");
    return(false);
  } else {
    this.name = $inputName;
    return(true);
  }
}

User.prototype.checkEmail = function() {
  var $inputEmail = $("#email").val().trim(),
      check = true;
  if($inputEmail === "") {
    alert("Email can not be empty.");
    return(false);
  }

  if (!this.emailCheck.test($inputEmail)) {
    alert("Email is not valid.")
    return(false);
  }
  
  $("div.user_info").each(function(index, value) {
    console.log($(value).data("email"));
    if($inputEmail === $(value).data("email")) {
      alert("This email id is already registered.");
      check = false;
    }
  })
  this.email = $inputEmail;
  return(check);
}

User.prototype.checkPhoneNumber = function() {
  var $inputPhone = $("#phone").val().trim();
  if($inputPhone === "") {
    alert("Phone number can not be empty.");
    return(false);
  }
  if(!this.phoneCheck.test($inputPhone)) {
    alert("Phone number is not valid. Please enter a valid 10 digit number.");
    return(false);
  }
  this.phone = $inputPhone;
  return(true);
}

User.prototype.createDiv = function() {
  var $newDiv = $("<div>", { class: 'user_info', 'data-email': this.email });
  $newDiv.append("<p class = 'name'>" + this.name + "</p><p>" + this.email + "</p><p>" + this.phone + "</p>");
  return($newDiv);
}