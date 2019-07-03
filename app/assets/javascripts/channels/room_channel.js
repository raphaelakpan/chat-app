$(function () {
  $('[data-channel-subscribe="room"]').each(function (index, chatRoom) {
    var chatRoom = $(chatRoom),
      room_id = chatRoom.data('room-id'),
      messageTemplate = $('[data-role="message-template"]'),
      noMessages = $('.no-messages');

    chatRoom.animate({ scrollTop: chatRoom.prop("scrollHeight") }, 1000)

    App.cable.subscriptions.create(
      {
        channel: "RoomChannel",
        room: room_id
      },
      {
        received: function (data) {
          if (noMessages) noMessages.hide()
          var content = messageTemplate.children().clone(true, true);
          content.find('[data-role="user-avatar"]').attr('src', data.user_avatar_url);
          content.find('[data-role="user-username"]').text(data.user_username);
          content.find('[data-role="message-text"]').text(data.message);
          content.find('[data-role="message-date"]').text(data.created_at);
          chatRoom.append(content);
          chatRoom.animate({ scrollTop: chatRoom.prop("scrollHeight") }, 1000);
        }
      }
    );
  });
});
