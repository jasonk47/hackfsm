$(document).ready(function() {
  $("#timeline-select").on("activate.bs.scrollspy", function() {
    $("#timeline-select > ul > .active > ul").collapse('show');
  });

  $("#timeline-select > ul > li > a").on("click", function() {
    $(this).siblings("ul").addClass("u-invoked")
  });

  $(".node .text a").on("click", function() {

  });

  $("#sidebar ul li ul a").on("click", function() {
    $(this).siblings(".value").toggle();
    return false;
  });
});
