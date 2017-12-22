window.subscribeToChannel = function (uuid) {
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
      document.queryBehavior('messages-index').appendChild(rowContainer.firstElementChild)
    },

    speak: function (data) {
     this.perform('speak', data);
    }
  })
}
