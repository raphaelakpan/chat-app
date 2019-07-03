$(function () {
  $('#new_message').on('ajax:success', function () {
    $("#message_message").val('');
  });
});
