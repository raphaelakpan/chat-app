$(function () {
  $('#new_message').on('ajax:success', function (a, b, c) {
    $("#message_message").val('');
  });
});
