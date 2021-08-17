require('./bootstrap');
window.Vue = require('vue')
import Vue from 'vue';
import router from './router'
import store from './store'
import ViewUI from 'view-design';
import VueQuillEditor from 'vue-quill-editor' 
import 'quill/dist/quill.core.css'
import 'quill/dist/quill.snow.css'
import 'quill/dist/quill.bubble.css'

Vue.use(VueQuillEditor, /* { default global options } */)
Vue.use(ViewUI);
import common from './common'
Vue.mixin(common)
import JsonExcel from 'vue-json-excel'
 
Vue.component('downloadExcel', JsonExcel)

import iView from 'iview';
import 'iview/dist/styles/iview.css';
import locale from 'iview/dist/locale/en-US';
Vue.use(iView, { locale });

Vue.component('mainapp', require('./components/mainapp.vue').default)
const app = new Vue({
    el: '#app', 
    router, 
    store
})