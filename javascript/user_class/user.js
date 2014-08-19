function User(name, age) {
  this.name = name;
  this.age = age;
};

User.prototype.compare = function(anotherUser) {
  if(this.age > anotherUser.age) {
    alert(this.name + " is older than " + anotherUser.name);
  } else if(this.age < anotherUser.age) {
    alert(anotherUser.name + " is older than " + this.name);
  } else {
    alert("Both are of same age");
  }
};

window.onload = function() {
  var user1 = new User("Mary", 23);
  var user2 = new User("John", 22);
  user1.compare(user2);
}
