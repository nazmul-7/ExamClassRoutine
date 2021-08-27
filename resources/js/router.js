
import Router from 'vue-router'
import Vue from 'vue'
Vue.use(Router)
// admin project pages 
import home from './components/pages/home'

import login from './admin/pages/login'
import registration from './admin/pages/registration'
import courses from './admin/pages/courses'
import departments from './admin/pages/departments'
import Sessions from './admin/pages/sessions'
import semester from './admin/pages/semester'
import rooms from './admin/pages/rooms'
import edit_profile from './admin/pages/edit_profile'
import notice from './admin/pages/notice'
import teacher_notice from './admin/pages/teacher_notice'
import teacher from './admin/pages/teacher'
import student from './admin/pages/student'
import admin_class_routine from './admin/pages/admin_class_routine'
import admin_class_days from './admin/pages/admin_class_days'
import teacher_class_routine from './admin/pages/teacher_class_routine'
import admin_teacher_courses from './admin/pages/admin_teacher_courses'
import admin_semester_courses from './admin/pages/admin_semester_courses'
import student_class_routine from './admin/pages/student_class_routine'
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
        path: '/courses', 
        component: courses, 
        name: 'courses'
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
        path: '/admin_class_days', 
        component: admin_class_days, 
        name: 'admin_class_days'
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
        path: '/admin_teacher_courses', 
        component: admin_teacher_courses, 
        name: 'admin_teacher_courses'
    },
    {
        path: '/admin_semester_courses', 
        component: admin_semester_courses, 
        name: 'admin_semester_courses'
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
        path: '/departments', 
        component: departments, 
        name: 'departments'
    },
    {
        path: '/Sessions', 
        component: Sessions, 
        name: 'Sessions'
    },
    {
        path: '/semester', 
        component: semester, 
        name: 'semester'
    },
    {
        path: '/rooms', 
        component: rooms, 
        name: 'rooms'
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