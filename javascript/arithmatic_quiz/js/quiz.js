function Quiz() {
  this.currentQuestion = -1;
  this.score = 0;
  this.questionLimit = 20;
  this.questions = [];
  this.$queryForm = $("#query_form");
  this.$scoreDiv = $("#score");
  this.$questionDiv = $("#question");
  this.$startButton = $("#start");
  this.DigitsCheck = /^[+-]?\d+$/;
}

Quiz.prototype.next_question = function() {
  var $answer = $("#answer");
  var $inputAnswer = $answer.val().trim();
  $answer.val("");
  if(this.DigitsCheck.test($inputAnswer)) {
    this.questions[this.currentQuestion].inputAnswer = $inputAnswer;
    this.setCorrectBit($inputAnswer);
    this.setScore();
    this.checkLastQestion();
  } else {
    alert("Please enter a valid number.")
  }
}

Quiz.prototype.setCorrectBit = function($inputAnswer) {
  if($inputAnswer == this.questions[this.currentQuestion].answer) {
    this.questions[this.currentQuestion].correctBit = 1;
  } else {
    this.questions[this.currentQuestion].correctBit = 0;
  }
}

Quiz.prototype.setScore = function() {
  if(this.questions[this.currentQuestion].correctBit) {
    this.score++;
    this.showScore();
  }
}

Quiz.prototype.checkLastQestion = function() {
  if(this.currentQuestion + 1 == this.questionLimit) {
    this.lastQuestionAction();
  } else {
    this.displayQuestion();
  }
}

Quiz.prototype.lastQuestionAction = function() {
  this.$questionDiv.remove();
  this.$queryForm.remove();
  this.showScore();
  this.showIncorrectQuestions();
}

Quiz.prototype.showIncorrectQuestions = function() {
  var newDiv = $("<div>", { id: "answers" }),
      incorrectQuestions = [];

  for(var i = 0; i < this.questionLimit; i++) {
    if(!this.questions[i].correctBit) {
      incorrectQuestions.push($('<p>', { 'text': 'Question: ' + this.questions[i].number, class: "red" }));
      incorrectQuestions.push(this.questions[i].$domValue);
      incorrectQuestions.push($('<p>' , { 'text': 'Your Answer: ' + this.questions[i].inputAnswer}));
      incorrectQuestions.push($('<p>' , { 'text': 'Correct Answer: ' + this.questions[i].answer}));
    }
  }
  newDiv.append(incorrectQuestions);
  this.$scoreDiv.after(newDiv);
}

Quiz.prototype.showScore = function() {
  var $score = $("<p>", { text: "Score: " + this.score + "/" + this.questionLimit })
  this.$scoreDiv.empty();
  this.$scoreDiv.append($score)
}

Quiz.prototype.createQuestions = function() {
  for(var i = 0; i < this.questionLimit; i++) {
    var question = new Question(this.questions.length + 1);
    question.generate();
    question.setAnswer();
    this.questions.push(question);
  }
}

Quiz.prototype.displayQuestion = function() {
  var $questionNumberPara = $("<p>", { text: "Question: " + (++this.currentQuestion + 1) });  
  this.$questionDiv.empty();
  this.$questionDiv.append($questionNumberPara, this.questions[this.currentQuestion].$domValue);
}

Quiz.prototype.bindEvents = function() {
  var _this = this;
  this.$queryForm.on('submit', function(event) {
    event.preventDefault();
    _this.next_question();
  })
  this.$startButton.on('click', function() {
    _this.$queryForm.show();
    _this.$scoreDiv.show();
    _this.displayQuestion();
    _this.showScore();
    $(this).remove();
  })
}

$(function() {
  var newQuiz = new Quiz();
  newQuiz.createQuestions();
  newQuiz.bindEvents();
})