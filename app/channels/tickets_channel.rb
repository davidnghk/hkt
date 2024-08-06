class TicketsChannel < ApplicationCable::Channel
  def subscribed
#    stream_from "ticket_#{current_user.id}"
    stream_from "ticket_#{params[:noti_id]}"
  end
end
