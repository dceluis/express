import Vue from 'vue/dist/vue.esm'
import Vuex from 'vuex'

Vue.use(Vuex)

export const store = new Vuex.Store({
  state: {
    messages: []
  },
  mutations: {
    setMessages (state, messages) {
      state.messages = messages
    },
    pushMessages (state, messages) {
      state.messages.push(...messages)
    }
  }
})
