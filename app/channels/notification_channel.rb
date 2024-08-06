class NotificationChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "notification_channel:#{current_user.id}"
  end

  def unsubscribed
    stop_all_streams
  end
end
