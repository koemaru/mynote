$(function() {
  $('.note').hover(
    function() {
      $(this).css('background-color', 'rgba(225,192,172,0.5)')
    },
    function() {
      $(this).css('background-color', '')
    }
  );
});