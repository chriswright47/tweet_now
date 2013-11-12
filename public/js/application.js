$(document).ready(function() {
  $(document).on('submit', '#tweet_form' ,function(event) {
    event.preventDefault();
    $('.container').prepend("<h5>Your tweet is being processed</h5><img src='ajax-loader.gif'>")
    var text = $(this.text).val();
    var userId = $(this).data('user-id')
    $('.input').prop('disable', true);
    $.post('/tweet/new', {text: text, user_id: userId}, function(response) {
      $('.container').html(response);
    });
  });
});
