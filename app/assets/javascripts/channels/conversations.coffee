App.conversations = App.cable.subscriptions.create {
    channel: "ConversationsChannel"
  },
  connected: ->
    # Called when the subscription is ready for use on the server
    App.conversations.fetch()

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log(data)
    conversationChannels = App.cable.subscriptions.subscriptions.filter (s) ->
      s.identifier.match /\"ConversationChannel\"/

    conversationChannels.forEach (c) ->
      c.unsubscribe()

    data.forEach (uuid) ->
      subscribeToChannel uuid

  fetch: ->
    @perform 'fetch' 
