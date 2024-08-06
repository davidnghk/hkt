class TeamsChannel < ApplicationCable::Channel
  def subscribed
    current_user.teams.each do |team|
      stream_from "teams:#{team.id}"
    end
  end

  def unsubscribed
    stop_all_streams
  end

  def send_message(data)
    @team = Team.find(data["team_id"])
    message   = @team.messages.create(body: data["body"], user: current_user)
    MessageRelayJob.perform_later(message)
  end
end
 