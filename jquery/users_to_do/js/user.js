function User(userFormId, createToDoButtonId, nameInputId, selectBoxId, userListId, createUserButtonId) {
  this.name = '';
  this.toDo = 0;
  this.$userForm = $(userFormId);
  this.users = [];
  this.$createToDoButton = $(createToDoButtonId);
  this.$nameInput = $(nameInputId);
  this.$assignees = $(selectBoxId);
  this.$userList = $(userListId);
  this.$createUserButton = $(createUserButtonId)
}

User.prototype.showUserForm = function() {
  this.$userForm.slideDown();
}

User.prototype.add = function(userNumber) {
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
  var nameInput = this.$nameInput.val().trim()
  if( nameInput === "") {
    alert("Name can not be empty.");
  } else if(this.users.indexOf(nameInput) != -1) {
    alert("This name is already taken.");
  } else {
    this.name = nameInput;
  }
}

User.prototype.bindEvents= function() {
  var userNumber = 1,
      _this = this;

  this.$createUserButton.on('click', function() {
    _this.showUserForm()
  });
  
  this.$userForm.on('submit', function(event) {
    event.preventDefault();
    _this.setName();
    _this.add(userNumber);
    userNumber = (_this.users.length) + 1;
  });
}

$(function() {
  var userFormId = "#user_form",
      createToDoButtonId = "#create_to_do",
      nameInputId = "#name",
      selectBoxId = "#assignees",
      userListId = "#user_list",
      createUserButtonId = "#create_user"
  var user = new User(userFormId, createToDoButtonId, nameInputId, selectBoxId, userListId, createUserButtonId);

  user.bindEvents();
})