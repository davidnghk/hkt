class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_team

  def new
    @message = Message.new
  end

  def create
    message = Message.new(message_params)
    message.user = current_user
    message.team = current_team
    message.save
    MessageRelayJob.perform_later(message)
  end

  private

    def set_team
      @team = Team.find(params[:team_id])
    end

    def message_params
      params.require(:message).permit(:body)
    end
end