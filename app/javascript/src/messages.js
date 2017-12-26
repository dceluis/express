import Punchbox from 'punchbox-js'

import Vue from 'vue/dist/vue.esm'
import VueResource from 'vue-resource'
import Vuex from 'vuex'
import TurbolinksAdapter from 'vue-turbolinks'
import { store } from './store'

Vue.use(VueResource)
Vue.use(Vuex)
Vue.use(TurbolinksAdapter)

Punchbox.on('Messages', {
  index: () => {

    var formElem = document.queryBehavior('submit-message')
    var indexElem = document.queryBehavior('messages-index')

    store.dispatch('subscribeToCurrent', indexElem.dataset.id)

    const form = new Vue({
      el: formElem,
      data: function () {
        return {
          content: '',
          uuid: formElem.dataset.uuid
        }
      },
      methods: {
        submit: function(e) {
          e.preventDefault()

          store.dispatch('speakToCurrent', { content: this.content })

          this.content = ''
        }
      }
    })

    const index = new Vue({
      el: indexElem,
      store,
      data: function () {
        return {
          messages: this.$store.state.currentMessages
        }
      },
      beforeCreate: function() {
        var messages = JSON.parse(indexElem.dataset.messages)

        this.$store.commit('setCurrentMessages', messages)
      }
    })

    console.log(form)
    console.log(index)
  }
})
