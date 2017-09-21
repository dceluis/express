App.conversation = App.cable.subscriptions.create "ConversationChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    row = document.createElement('tr')
    row.innerHTML = data['message']
    document.getElementById('conversation-messages').appendChild(row)

  speak: (data) ->
    @perform 'speak', data

document.addEventListener 'submit', ((e) ->
  if e.target.dataset.behavior == 'submit-message'
    e.preventDefault()
    e.stopPropagation()
    input = e.target.querySelector('input[type=text]')
    App.conversation.speak({ uuid: e.target.dataset.uuid, content: input.value })
    input.value = ''
  return
), true
