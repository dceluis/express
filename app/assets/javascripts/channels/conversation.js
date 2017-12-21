window.subscribeToChannel = (uuid) => {
  this.App.conversation || (this.App.conversation = {})

  App.conversation[uuid] = App.cable.subscriptions.create({
    channel: "ConversationChannel",
    uuid: uuid
  },{
    connected: function () {},

    disconnected: function () {},

    received: function (data)  {
      rowContainer = document.createElement('tbody')
      rowContainer.innerHTML = data['partial']
      document.getElementById('conversation-messages').appendChild(rowContainer.firstElementChild)
    },

    speak: function (data) {
     this.perform('speak', data);
    }
  })
}
