class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast( "teams:#{message.team.id}", {
      username: message.user.username,
      body: message.body,
      team_id: message.team.id
    })
  end
end
 