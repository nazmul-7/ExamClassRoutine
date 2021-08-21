
import Router from 'vue-router'
import Vue from 'vue'
Vue.use(Router)
// admin project pages 
import home from './components/pages/home'

import login from './admin/pages/login'
import registration from './admin/pages/registration'
import category from './admin/pages/category'
import edit_profile from './admin/pages/edit_profile'
import notice from './admin/pages/notice'
import teacher_notice from './admin/pages/teacher_notice'
import teacher from './admin/pages/teacher'
import student from './admin/pages/student'
import admin_class_routine from './admin/pages/admin_class_routine'
import student_class_routine from './admin/pages/student_class_routine'
import teacher_class_routine from './admin/pages/teacher_class_routine'
import admin_exam_routine from './admin/pages/admin_exam_routine'
import student_exam_routine from './admin/pages/student_exam_routine'
import teacher_exam_routine from './admin/pages/teacher_exam_routine'
 


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
        path: '/notice', 
        component: notice, 
        name: 'notice'
    },
    {
        path: '/admin_class_routine', 
        component: admin_class_routine, 
        name: 'admin_class_routine'
    },
    {
        path: '/student_class_routine', 
        component: student_class_routine, 
        name: 'student_class_routine'
    },
    {
        path: '/teacher_class_routine', 
        component: teacher_class_routine, 
        name: 'teacher_class_routine'
    },
    {
        path: '/teacher_notice', 
        component: teacher_notice, 
        name: 'teacher_notice'
    },
    {
        path: '/student_exam_routine', 
        component: student_exam_routine, 
        name: 'student_exam_routine'
    },
    {
        path: '/admin_exam_routine', 
        component: admin_exam_routine, 
        name: 'admin_exam_routine'
    },
    {
        path: '/teacher_exam_routine', 
        component: teacher_exam_routine, 
        name: 'teacher_exam_routine'
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