$(document).ready(function() {
  $("#timeline-select").on("activate.bs.scrollspy", function() {
    $(".collapse:not('.u-invoked'):not('.active')").collapse('hide');
    $("#timeline-select > ul > .active > ul").collapse('show');
  });

  $("#timeline-select > ul > li > a").on("click", function() {
    $(this).siblings("ul").addClass("u-invoked")
  });
});
