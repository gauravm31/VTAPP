function User() {
  this.name = '';
  this.toDo = 0;
  this.$userForm = $("#user_form");
  this.users = [];
  this.$createToDoButton = $("#create_to_do");
  this.$nameInput = $('#name');
  this.$assignees = $("#assignees");
  this.$userList = $("#user_list")
}

User.prototype.createUser = function() {
  this.$userForm.slideDown();
}

User.prototype.add = function(userNumber) {
  debugger;
  if(this.name !== '') {
    this.users.push(this.name);
    this.$createToDoButton.show();
    this.addSelectOption(userNumber);
    this.addPara();
  }
  this.$nameInput.val("")
  this.$userForm.slideUp();
}

User.prototype.addSelectOption = function(userNumber) {
  var $selectOption = $("<option>", {value: this.name});
  $selectOption.text(userNumber + '. ' + this.name);
  this.$assignees.append($selectOption);
}

User.prototype.addPara = function() {
  var $newPara = $("<p>", {id: this.name});
  $newPara.append(this.name + '(' + this.toDo + ')')
  this.$userList.append($newPara);
}

User.prototype.setName = function() {
  this.name = '';
  if(this.$nameInput.val().trim() === "") {
    alert("Name can not be empty.");
  } else if(this.users.indexOf($("#name").val().trim()) != -1) {
    alert("This name is already taken.");
  } else {
    this.name = this.$nameInput.val().trim();
  }
}

User.prototype.bindEvents= function() {
  var $createUserButton = $("#create_user"),
      userNumber = 1,
      _this = this;

  $createUserButton.on('click', function() {
    _this.createUser()
  });
  
  this.$userForm.on('submit', function(event) {
    event.preventDefault();
    _this.setName();
    _this.add(userNumber);
    userNumber = (_this.users.length) + 1;
  });
}

$(function() {
  var user = new User();

  user.bindEvents();
})