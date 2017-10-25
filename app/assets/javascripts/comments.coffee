window.client = new Faye.Client('/faye')

jQuery ->
  client.subscribe '/comments', (payload) ->
    $('#conversation').append(payload.message) if payload.message
