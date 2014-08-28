function ToDoList() {
  this.detail = ""
  this.$toDoForm = $("#to_do_form");
  this.$toDoDiv = $("#to_do_list");
  this.Digits = /\((\d+)\)/;
}

ToDoList.prototype.createToDo = function() {
  this.$toDoForm.slideDown();
}

ToDoList.prototype.save = function() {
  var $assignees = $("#assignees")
  var selectedOptionIndex = $assignees[0].selectedIndex,
      $toDoInput = $("#to_do").val().trim();
  if( $toDoInput === "") {
    alert("To-Do field can not be empty.");
  } else {
    this.detail = $toDoInput;
    this.addCheckBoxToDiv($assignees);
    this.changeToDoValue($assignees.val(), 'add');
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
  var matchData = this.Digits.exec(text),
      toDoNumber = matchData[1],
      newText = '';
  if(operation === 'add') {
    toDoNumber++;
  } else {
    toDoNumber--;
  }
  newText = text.replace(this.Digits, '(' + toDoNumber + ')');
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
  var _this = this,
      $createToDoButton = $("#create_to_do");
  $createToDoButton.on('click', function() {
    _this.createToDo();
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
  var toDoList = new ToDoList();
  toDoList.bindEvents();
})
