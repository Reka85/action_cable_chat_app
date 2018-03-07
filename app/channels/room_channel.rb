class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel" #global stream
    stream_from "room_channel_user_#{message_user.id}" # separate stream for users, we send @mention notifications here
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
