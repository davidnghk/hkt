handleVisiblityChange = ->
    $strike = $(".strike")
    if $strike.length > 0
      team_id = $("[data-behavior='messages']").data("team-id")
      App.last_read.update(team_id)
      $strike.remove()

$(document).on "turbolinks:load", ->
  $("#new_message").on "keypress", (e) ->
    if e && e.keyCode == 13
      e.preventDefault()
      $(this).submit()

  $("#new_message").on "submit", (e) ->
    e.preventDefault()

    team_id = $("[data-behavior='messages']").data("team-id")
    body        = $("#message_body")

    App.teams.send_message(team_id, body.val())

    body.val("")