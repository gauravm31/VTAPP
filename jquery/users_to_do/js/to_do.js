function ToDoList(toDoFormId, toDoDivId, selectBoxId, createToDoButtonId) {
  this.detail = ""
  this.$toDoForm = $(toDoFormId);
  this.$toDoDiv = $(toDoDivId);
  this.$assignees = $(selectBoxId);
  this.$createToDoButton = $(createToDoButtonId);
  this.digitsRegex = /\((\d+)\)/;
}

ToDoList.prototype.showToDoForm = function() {
  this.$toDoForm.slideDown();
}

ToDoList.prototype.save = function() {
  var selectedOptionIndex = this.$assignees[0].selectedIndex,
      $toDoInput = $("#to_do").val().trim();
  if( $toDoInput === "") {
    alert("To-Do field can not be empty.");
  } else {
    this.detail = $toDoInput;
    this.addCheckBoxToDiv(this.$assignees);
    this.changeToDoValue(this.$assignees.val(), 'add');
  }
  this.$toDoForm[0].reset();
  this.$toDoForm.slideUp();
}

ToDoList.prototype.addCheckBoxToDiv = function($assignees) {
  var $checkBox = $("<input>", {type: 'checkbox', value: $assignees.val(), name: this.detail, checked: false});
  this.$toDoDiv.append($checkBox);
  this.$toDoDiv.append('<span>' +this.detail + ' assigned by (' + $assignees.val() + ')</span><br>')
}

ToDoList.prototype.changeToDoValue = function(selectedParaId, operation) {
  var $selectedPara = $('#' + selectedParaId),
        selectedText = $selectedPara.text(),
        newSelectedText = this.setText(selectedText, operation);
    $selectedPara.text(newSelectedText);
}

ToDoList.prototype.setText = function(text, operation) {
  var matchData = this.digitsRegex.exec(text),
      toDoNumber = matchData[1],
      newText = '';
  if(operation === 'add') {
    toDoNumber++;
  } else {
    toDoNumber--;
  }
  newText = text.replace(this.digitsRegex, '(' + toDoNumber + ')');
  return(newText)
}

ToDoList.prototype.checkBoxAction = function(obj) {
  var $span = $(obj).next();
  if(obj.checked) {
    $span.css('textDecoration', 'line-through');
    this.changeToDoValue($(obj).val(), 'subtract');
  } else {
    $span.css('textDecoration', 'none');
    this.changeToDoValue($(obj).val(), 'add');
  }
}

ToDoList.prototype.bindEvents = function() {
  var _this = this;
  this.$createToDoButton.on('click', function() {
    _this.showToDoForm();
  })
  this.$toDoForm.on('submit', function(event) {
    event.preventDefault();
    _this.save();
  })
  this.$toDoDiv.on('change', 'input', function() {
    _this.checkBoxAction(this);}
  );

}

$(function() {
  var toDoFormId = "#to_do_form",
      toDoDivId = "#to_do_list",
      selectBoxId = "#assignees",
      createToDoButtonId = "#create_to_do";
  var toDoList = new ToDoList(toDoFormId, toDoDivId, selectBoxId, createToDoButtonId);
  toDoList.bindEvents();
})
