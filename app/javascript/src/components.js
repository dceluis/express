import Vue from 'vue'
import Punchbox from 'punchbox-js'
import App from './components/app.vue'

Punchbox.on('Messages', {
  index: function (){

    document.body.appendChild(document.createElement('hello'))
    const app = new Vue({
      render: h => h(App)
    }).$mount('hello')

    console.log(app)
  }
})
