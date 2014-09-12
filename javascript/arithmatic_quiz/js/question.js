function Question(questionNumber) {
  this.answer = null;
  this.$domValue = '';
  this.operandLimit = 20;
  this.number = questionNumber;
  this.operator = '';
  this.firstOperand = null;
  this.secondOperand = null;
  this.$questionDiv = $("#question")
  this.correctBit = null;
  this.inputAnswer = null;
}

Question.prototype.generate = function() {
  this.firstOperand = Math.floor((Math.random() * this.operandLimit) + 1);
  this.secondOperand = Math.floor((Math.random() * this.operandLimit) + 1);
  var operatorNumber = Math.floor(Math.random() * 4),
      operators = ['+', '-', '*', '/'];
  this.operator = operators[operatorNumber];
  this.$domValue = $("<p>", { text: this.firstOperand + " " + this.operator + " " + this.secondOperand });
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
