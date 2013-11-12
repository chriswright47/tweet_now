$(document).ready(function() {
  $(document).on('submit', '#tweet_form' ,function(event) {
    event.preventDefault();
    $('.container').prepend("<h5>Your tweet is being processed</h5><img src='ajax-loader.gif'>")
    var text = $(this.text).val();
    $('.input').prop('disable', true);
    $.post('/tweet/new', {text: text}, function(response) {
      $('.container').html(response);
    });
  });
});
