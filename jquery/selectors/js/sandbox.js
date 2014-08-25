// Select all of the div elements that have a class of "module".
$("div.module").show();

// three selectors i can use to get the third item in the #myList unordered list.
// out of these the 3rd one is teh best because
$("#myListItem").css("background-color", "red")
$("#myList > li:nth-child(3)");
$("#myList li:eq(2)");

// selecting label for search input using attribute selector
$("label[for='q']").css("background-color", "red");

// find out number of hidden elements
console.log("no. of hidden elements: " + $(":hidden").length);

// find out number of image with alt attribute
console.log("no. of images with alt attribute: " + $("img[alt]").length);

// select all odd table rows
$("tbody > tr:odd").css("background-color", "red");