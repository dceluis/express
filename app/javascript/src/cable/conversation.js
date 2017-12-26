import { Consumer } from './cable'
import { store } from '../store'

export var buildConversationSub = function (id) {
  return Consumer.subscriptions.create({
    channel: "ConversationChannel",
    id: id
  },{
    connected: function () {},

    disconnected: function () {},

    received: function (message)  {
      store.commit('pushToCurrentMessages', JSON.parse(message))
    },

    speak: function (message) {
     this.perform('speak', message);
    }
  })
}
