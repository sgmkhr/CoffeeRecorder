/*global $*/
$('#tab-menu-in-shop a').on('click', function(event) {
  $("#tab-contents .tab").hide();
  $("#tab-menu-in-shop .active").removeClass("active");
  $(this).addClass("active");
  $($(this).attr("href")).show();
  event.preventDefault();
});