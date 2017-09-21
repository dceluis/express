App.conversations = App.cable.subscriptions.create {
    channel: "ConversationsChannel"
  },
  connected: ->
    # Called when the subscription is ready for use on the server
    App.conversations.fetch()

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    for own uuid, subscription of App.conversation
      subscription.unsubscribe

    for uuid in data
      subscribeToChannel uuid

  fetch: ->
    @perform 'fetch' 
