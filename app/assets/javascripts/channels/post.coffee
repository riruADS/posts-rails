App.post = App.cable.subscriptions.create "PostChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log data
    unless data.blank?
      console.log "Its works"
      $('ul#post').prepend '<li>' + data.title
