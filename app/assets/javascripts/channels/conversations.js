App.conversations = App.cable.subscriptions.create({
  channel: "ConversationsChannel"
},{
  connected: function () {
    App.conversations.fetch();
  },

  disconnected: function () {},

  received: function (data) {
    var ref = App.conversation;

    for (var uuid in ref) {
      if (!hasProp.call(ref, uuid)) continue;
      let subscription = ref[uuid];
      App.cable.subscriptions.remove(subscription);
      delete App.conversation[uuid];
    }

    for ( var i = 0; i < data.length ; i++ ) {
      let uuid = data[i];
      subscribeToChannel(uuid);
    }
  },

  fetch: function () {
    this.perform('fetch');
  }
})
