import Vue from 'vue/dist/vue.esm'
import BootstrapVue from 'bootstrap-vue'
import App from '../app.vue'

import 'bootstrap/dist/css/bootstrap.css'
import 'bootstrap-vue/dist/bootstrap-vue.css'

Vue.use(BootstrapVue)

document.addEventListener('DOMContentLoaded', () => {
  const app = new Vue({
    el: '#hello',
     data: {
      message: "Can you say hello?"
    },
    components: { App }
  })
})
Vue.component('todo-item', {
  // todo-item コンポーネントはカスタム属性のような "プロパティ" で受け取ります。
  // このプロパティは todo と呼ばれます。
  props: ['todo'],
  template: '<li>{{ todo.text }}</li>'
})