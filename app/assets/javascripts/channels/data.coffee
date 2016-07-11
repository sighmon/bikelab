# TODO: Hand in Device ID here instead of hard coding id: 2 which was my dev device id.
App.data = App.cable.subscriptions.create { channel: "DataChannel", id: 2 },
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log("DataChannel is connected.")

  disconnected: ->
    # Called when the subscription has been terminated by the server
    console.log("DataChannel is disconnected.")

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    console.log("DataChannel received: " + data)
    updateChartData(data.label, data.readings)