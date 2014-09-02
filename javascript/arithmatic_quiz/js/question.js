function Question(questionNumber) {
  this.answer = null;
  this.value = '';
  this.number = questionNumber;
  this.operator = '';
  this.firstOperand = null
  this.$questionDiv = $("#question")
}

Question.prototype.generate = function() {
  this.firstOperand = Math.floor((Math.random() * 20) + 1);
  this.secondOperand = Math.floor((Math.random() * 20) + 1);
  var operatorNumber = Math.floor(Math.random() * 4),
      operators = ['+', '-', '*', '/'];
  this.operator = operators[operatorNumber];
  this.value = ("<p>" + this.firstOperand + " " + this.operator + " " + this.secondOperand + "</p>");
}

Question.prototype.display = function() {
  this.$questionDiv.empty();
  this.$questionDiv.append("<p>Question: " + this.number + "</p>" + this.value);
}

Question.prototype.setAnswer = function() {
  switch(this.operator) {
    case '+':
      this.answer = this.firstOperand + this.secondOperand;
      break;
    case '-':
      this.answer = this.firstOperand - this.secondOperand;
      break;
    case '*':
      this.answer = this.firstOperand * this.secondOperand;
      break;
    case '/':
      this.answer = parseInt(this.firstOperand / this.secondOperand);
      break;
    default: 
  }
}
