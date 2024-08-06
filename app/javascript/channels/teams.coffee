App.teams = App.cable.subscriptions.create "TeamsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    active_team = $("[data-behavior='messages'][data-team-id='#{data.team_id}']")
    if active_team.length > 0

      if document.hidden
        if $(".strike").length == 0
          active_team.append("<div class='strike'><span>Unread Messages</span></div>")

        if Notification.permission == "granted"
          new Notification(data.username, {body: data.body})

      else
        App.last_read.update(data.team_id)

      # Insert the message
      active_team.append("<div><strong>#{data.username}:</strong> #{data.body}</div>")

    else
      $("[data-behavior='team-link'][data-team-id='#{data.team_id}']").css("font-weight", "bold")

  send_message: (team_id, message) ->
    @perform "send_message", {team_id: team_id, body: message}