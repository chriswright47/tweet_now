$(document).ready(function() {
  $(document).on('submit', 'form' ,function(event) {
    event.preventDefault();
    $('.container').prepend("<h5>Your tweet is being processed</h5><img src='ajax-loader.gif'>")
    var text = $(this.text).val();
    var userId = $(this).data('user-id')
    var time = $(this.time).val();
    debugger
    var url = this.action
    debugger
    $('.input').prop('disable', true);
    $.post(url, {text: text, user_id: userId, time: time}, function(response) {
      // event.preventDefault();
      var jobId = response;
      debugger
      // setTimeout(function(){alert("Hello")},3000);
      var complete = setTimeout( $.get('/status/' + jobId, function(answer) {
        $('.container').html(answer);
      }), 4000);
    });
  });
});
