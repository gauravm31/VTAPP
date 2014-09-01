function ContactManager() {
  this.contacts = [];
  this.emails = [];
  this.$form = $("#user");
  this.$display = $("#display");
  this.$deleteButton = $("#delete");
  this.$moreButton = $("#more");
  this.$selectBox = $("#max_number");
  this.$moreButton = $("#more");
}

ContactManager.prototype.save = function(event) {
  var newUser = new User();
  event.preventDefault();
  if(newUser.fieldsValid()) {
    var $newDiv = newUser.createDiv();
    this.contacts.unshift($newDiv);
    this.$form[0].reset();
    $(document.activeElement).val("")
    this.showSelected();
  }
}

ContactManager.prototype.emptyInput = function() {
  var $this = $(this);
  if($this.val().trim() === $this.attr('id'))
    $this.val("");
}

ContactManager.prototype.fillInput = function() {
  var $this = $(this);
  if($this.val().trim() === "") {
    $this.val($this.attr('id'))
  }
}

ContactManager.prototype.showSelected = function() {
  var shownContacts = [],
      maxNumber = $("#max_number").val();
      i = 0;
  $.each(this.contacts, function() {
    if(i < maxNumber) {
      shownContacts.push(this)
    }
    i++;
  })
  this.removeChildrenDivs();
  this.$display.prepend(shownContacts);
  this.$moreButton.val("more");
  this.setMoreButtonVisibility(maxNumber);
}

ContactManager.prototype.setMoreButtonVisibility = function(maxNumber) {
  if(this.contacts.length > maxNumber) {
    this.$moreButton.show();
  } else {
    this.$moreButton.hide();
  }
}

ContactManager.prototype.showAll = function() {
  this.$moreButton.val("less");
  this.removeChildrenDivs();
  this.$display.prepend(this.contacts);
}

ContactManager.prototype.removeChildrenDivs = function() {
  this.$display.children('div').remove();
}

ContactManager.prototype.deleteDivs = function() {
  var _this = this;
  var _temporaryContacts = _this.contacts.slice(0);
  var indexToSplice = 0;
  $.each(_this.contacts, function(index, elem) {
    if(elem.hasClass('red')) {
      _temporaryContacts.splice(index - indexToSplice++, 1);
    }
  })
  _this.contacts = _temporaryContacts;
  this.showSelected();
}

ContactManager.prototype.moreButtonAction = function(obj) {
  if($(obj).val() == "more") {
    this.showAll();
  } else {
    this.showSelected();
  }
}

ContactManager.prototype.bindEvents = function() {
  var _this = this;
  this.$form.on('focus', 'input:text', this.emptyInput);
  this.$form.on('blur', 'input:text', this.fillInput);
  this.$form.on('submit', function(event) {
    _this.save(event);
  });
  this.$deleteButton.on('click', function() {
    _this.deleteDivs(this);
  })
  this.$moreButton.on('click', function() {
    _this.moreButtonAction(this);
  })
  this.$selectBox.on('change', function() {
    _this.showSelected();
  })
}

$(function() {
  var contactManager = new ContactManager();
  contactManager.bindEvents();
})
