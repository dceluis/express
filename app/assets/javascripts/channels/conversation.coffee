window.subscribeToChannel = (uuid) ->
  App.conversation = App.cable.subscriptions.create {
      channel: "ConversationChannel"
      uuid: uuid
    },
    connected: ->
      # Called when the subscription is ready for use on the server

    disconnected: ->
      # Called when the subscription has been terminated by the server

    received: (data) ->
      rowContainer = document.createElement('tbody')
      rowContainer.innerHTML = data['message']
      document.getElementById('conversation-messages').appendChild(rowContainer.firstElementChild)

    speak: (data) ->
      @perform 'speak', data

document.addEventListener 'submit', ((e) ->
  if e.target.dataset.behavior == 'submit-message'
    uuid = window.location.pathname.match(/conversations\/\d+\/messages/)[0].match(/\d+/)[0]
    e.preventDefault()
    e.stopPropagation()
    input = e.target.querySelector('input[type=text]')
    App.conversation.speak({ uuid: uuid, content: input.value })
    input.value = ''
  return
), true
