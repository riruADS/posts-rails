App.privat_post = App.cable.subscriptions.create "PrivatPostChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    unless data.blank?
      $('ul#post').prepend '<li>' + data.title
