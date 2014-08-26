var myList = $("#myList");

for(var i = 0; i < 5; i++) {
  newListItem = $("<li>List Item " + (myList.children().length + 1) + "</li>");
  myList.append(newListItem);
}

$("#myList li:odd").remove();

var lastDiv = $("div.module").last();
lastDiv.append("<h2>New Heading</h2>", "<p>New Paragraph</p>");

$("select").append("<option value = 'wednesday'>Wednesday</option>")

var newDiv = $("<div class = 'module'></div>").append($("img").first().clone());
lastDiv.after(newDiv);