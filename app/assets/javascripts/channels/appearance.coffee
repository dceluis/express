App.appearance = App.cable.subscriptions.create {
    channel: "AppearanceChannel"
  },
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    appearances = document.querySelectorAll("[data-user-appearance]")
    for appearance in appearances
      if (data['online'].indexOf appearance.dataset.userAppearance) is -1
        appearance && (appearance.style = 'display: none;')
      else
        appearance && (appearance.style = '')
