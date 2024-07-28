/*global $*/
document.addEventListener("turbolinks: load", function() {

  // ページトップへスクロールするボタンを押した時
  $('#btn_to_pagetop').on('click', function(event) {
    $("body, html").animate({
      scrollTop: 0
    }, 800);
    event.preventDefault();
  });

});