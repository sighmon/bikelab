# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class DataChannel < ApplicationCable::Channel
  def subscribed
    # NOTE: first we tried stream_from "data_channel", but this didn't work.
    # stream_from "data_channel"
    device = Device.find(params[:id])
    stream_for device
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
