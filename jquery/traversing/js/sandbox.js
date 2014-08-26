$("img").each(function() {
  console.log($(this).attr("alt"));
});

$("input.input_text").parent().addClass("form1");

$("#myList li.current").removeClass("current").next().addClass("current");

$("#specials select").parent().next().children("input.input_submit").val("submit");

$("#slideshow li:first").addClass("current").nextAll().addClass("disabled")