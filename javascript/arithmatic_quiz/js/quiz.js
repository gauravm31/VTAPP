function Quiz() {
  this.questionNumber = 0;
  this.score = 0;
  this.questionLimit = 20;
  this.questions = [];
  this.inputAnswers = [];
  this.$answerForm = $("#answer_form");
  this.$scoreDiv = $("#score");
  this.$questionDiv = $("#question");
  this.$startButton = $("#start")
  this.DigitsCheck = /^-?\d+$/;
}

Quiz.prototype.next = function() {
  var $inputAnswer = $("#answer").val().trim();
  $("#answer").val("")
  if(this.DigitsCheck.test($inputAnswer)) {
    this.inputAnswers.push($inputAnswer);
    this.checkAnswer($inputAnswer);
    this.checkLastQestion();
  } else {
    alert("Please enter a valid number.")
  }
}

Quiz.prototype.checkAnswer = function($inputAnswer) {
  if($inputAnswer == this.questions[this.questions.length - 1].answer) {
    this.score++;
    this.showScore();
  }
}

Quiz.prototype.checkLastQestion = function() {
  if(this.questionNumber == this.questionLimit) {
    this.lastQuestionAction();
  } else {
    var question = new Question(++this.questionNumber);
    question.generate();
    question.display();
    question.setAnswer();
    this.questions.push(question);
  }
}

Quiz.prototype.lastQuestionAction = function() {
  this.$questionDiv.remove();
  this.$answerForm.remove();
  this.showScore();
  this.showIncorrectQuestions();
}

Quiz.prototype.showIncorrectQuestions = function() {
  var newDiv = $("<div>", { id: "answers" }),
      incorrectQuestions = [];

  for(var i = 0; i < this.questionLimit; i++) {
    if(this.inputAnswers[i] != this.questions[i].answer) {
      incorrectQuestions.push($('<p>', { 'text': 'Question: ' + this.questions[i].number, class: "red" }));
      incorrectQuestions.push(this.questions[i].value);
      incorrectQuestions.push($('<p>' , { 'text': 'Your Answer: ' + this.inputAnswers[i]}));
      incorrectQuestions.push($('<p>' , { 'text': 'Correct Answer: ' + this.questions[i].answer}));
    }
  }
  newDiv.append(incorrectQuestions);
  this.$scoreDiv.after(newDiv);
}

Quiz.prototype.showScore = function() {
  this.$scoreDiv.empty();
  this.$scoreDiv.append("<p>Score: " + this.score + "/20</p>")
}

Quiz.prototype.createNewQuestion = function() {
  var question = new Question(++this.questionNumber);
  question.generate();
  question.display();
  question.setAnswer();
  this.questions.push(question);
}

Quiz.prototype.bindEvents = function() {
  var _this = this;
  this.$answerForm.on('submit', function(event) {
    event.preventDefault();
    _this.next();
  })
  this.$startButton.on('click', function() {
    _this.$answerForm.show();
    _this.$scoreDiv.show();
    _this.createNewQuestion();
    $(this).remove();
  })
}

$(function() {
  var newQuiz = new Quiz();
  newQuiz.bindEvents();
})