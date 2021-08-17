
import Router from 'vue-router'
import Vue from 'vue'
Vue.use(Router)
// admin project pages 
import home from './components/pages/home'

import login from './admin/pages/login'
import registration from './admin/pages/registration'
import category from './admin/pages/category'
import services from './admin/pages/product'
import edit_profile from './admin/pages/edit_profile'
import orders from './admin/pages/orders'
import contact_us from './admin/pages/contact_us'
import users from './admin/pages/users'
import teacher from './admin/pages/teacher'
import student from './admin/pages/student'
import portfolios from './admin/pages/portfolios'
import custom_orders from './admin/pages/custom_orders'
 


const routes = [
    //projects routes....

    {
        path: '/', 
        component: home, 
        name: 'home'
       
    },
    {
        path: '/login', 
        component: login, 
        name: 'login'
       
    },
    {
        path: '/registration', 
        component: registration, 
        name: 'registration'
       
    },
    {
        path: '/category', 
        component: category, 
        name: 'category'
    },
    
    {
        path: '/services', 
        component: services, 
        name: 'services'
    },
    {
        path: '/contact_us', 
        component: contact_us, 
        name: 'contact_us'
    },
    {
        path: '/orders', 
        component: orders, 
        name: 'orders'
    },
    {
        path: '/custom_orders', 
        component: custom_orders, 
        name: 'custom_orders'
    },
    {
        path: '/portfolios', 
        component: portfolios, 
        name: 'portfolios'
    },
    {
        path: '/users', 
        component: users, 
        name: 'users'
    },
    {
        path: '/teacher', 
        component: teacher, 
        name: 'teacher'
    },
    {
        path: '/student', 
        component: student, 
        name: 'student'
    },
    {
        path: '/edit_profile', 
        component: edit_profile, 
        name: 'edit_profile'
    },
     

]



export default new Router({
    mode: 'history', 
    routes

})