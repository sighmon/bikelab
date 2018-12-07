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
    @updateChartData(data)
    @prependTableData(data)

  updateChartData: (data) ->
    # Update chart
    sensorReadingsChart.data.labels.push(data.label)
    for i in [0...sensorReadingsChart.data.datasets.length]
      sensorReadingsChart.data.datasets[i].data.push(data.readings[i])
    sensorReadingsChart.update()

  prependTableData: (data) ->
    # Update table
    html = @createLine(data)
    $("#sensorReadingsTable").prepend(html)
 
  createLine: (data) ->
    """
    <tr>
      <td>#{data.readings[0]}</td>
      <td>#{data.readings[1]}</td>
      <td>#{data.readings[2]}</td>
      <td>#{data.readings[3]}</td>
      <td>#{data.readings[4]}</td>
      <td>#{data.device_id}</td>
      <td>#{data.label}</td>
      <td>#{data.location[0]}</td>
      <td>#{data.location[1]}</td>
      <td>...</td>
      <td>...</td>
      <td>...</td>
    </tr>
    """