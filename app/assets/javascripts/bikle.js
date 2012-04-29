// I use the code below to move content left and right.
// When I move it left, I hide navigation links on the left hand side.
// When I move it right, I try to bring the links back.
$(document).ready(function() {
  $("a#show_div4_lhs").hide("slow");
  $("a#hide_div4_lhs").show("slow");

  $("a#hide_div4_lhs").click(function () {
    $("div#div4_lhs").hide("slow");
    $("a#hide_div4_lhs").hide("slow");
    $("div#div4row2").addClass("margin_left0px");
    $("a#show_div4_lhs").show("slow");
  });    

  $("a#show_div4_lhs").click(function () {
    $("div#div4_lhs").show("slow");
    $("a#show_div4_lhs").hide("slow");
    $("a#hide_div4_lhs").show("slow");
    $("div#div4row2").removeClass("margin_left0px");
  });    

  $("a#show_ul_10").show("slow");
  $("a#hide_ul_10").hide("slow");
  $("ul#ul_10").hide("slow");

  $("a#hide_ul_10").click(function (event) {
    event.preventDefault();
    $("a#hide_ul_10").hide("slow");
    $("ul#ul_10").hide("slow");
    $("a#show_ul_10").show("slow");
  });

  $("a#show_ul_10").click(function (event) {
    event.preventDefault();
    $("a#show_ul_10").hide("slow");
    $("a#hide_ul_10").show("slow");
    $("ul#ul_10").show("slow");
  });

});


