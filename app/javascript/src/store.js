import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'

import { buildConversationSub } from './cable/conversation'
import { appearancesSubscription } from './cable/appearances'

Vue.use(Vuex)

export const store = new Vuex.Store({
  state: {
    currentMessages: []
  },
  currentSubscription: null,
  appearancesSubscription: appearancesSubscription,
  mutations: {
    setCurrentMessages (state, messages) {
      state.currentMessages = messages
    },
    pushToCurrentMessages (state, message) {
      state.currentMessages.push(message)
    }
  },
  actions: {
    subscribeToCurrent (context, id) {
      this.currentSubscription = buildConversationSub(id)
    },
    speakToCurrent (context, message) {
      this.currentSubscription.perform('speak', message)
    }
  }
})
