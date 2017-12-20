import Vue from 'vue/dist/vue.esm'
import Punchbox from 'punchbox-js'
import VueResource from 'vue-resource'
import TurbolinksAdapter from 'vue-turbolinks'

Vue.use(VueResource)
Vue.use(TurbolinksAdapter)

Punchbox.on('Messages', {
  index: () => {

    var element = document.queryBehavior('submit-message')

    const app = new Vue({
      el: element,
      data: () => {
        return {
          content: '',
          uuid: element.dataset.uuid
        }
      },
      methods: {
        submit: function(e) {
          e.preventDefault()

          App.conversation[this.uuid].speak({ content: this.content })
          this.content = ''
        }
      }
    })

    console.log(app)
  }
})
