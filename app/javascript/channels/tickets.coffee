$(() ->
  App.tickets = App.cable.subscriptions.create {channel: "TicketsChannel", noti_id: $('#user_id').val() },
    received: (data) ->
      $('#num_of_unread').html(data.unread)
      $('#tickets').prepend(data.message)
      $('#navbar_num_of_unread').html(data.unread)
)
