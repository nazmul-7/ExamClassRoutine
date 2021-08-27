<template>
    <div>
      <div v-if="$store.state.user">

       <!--========= HEADER ==========-->
      	<div class="app-header1 header py-1 d-flex"> 
			<div class="container-fluid">
				<div class="d-flex">
					<a class="header-brand" href="/">
						<!-- <img src="/img/logo.png" class="header-brand-img" alt="Claylist logo"> -->
						<h4>Class and Exam Schedule System</h4>
					</a>
					<div class="d-flex order-lg-2 ml-auto">
						<div class="dropdown ">
							<a href="#" class="nav-link pr-0 leading-none user-img" data-toggle="dropdown">
								<img  v-if="authUser.image!=null" :src="authUser.image" alt="profile-img" class="avatar avatar-md brround">
								<img  v-else src="/img/profile.png" alt="profile-img" class="avatar avatar-md brround">
							</a>
							<div class="dropdown-menu dropdown-menu-right dropdown-menu-arrow ">
								<a class="dropdown-item" @click="logout">
									<i class="dropdown-icon icon icon-power"></i><a @click="logout" >Log Out </a>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
      <!--========= HEADER ==========-->
      <!--========== ADMIN SIDE MENU one ========-->
      <!-- <div class="app-sidebar__overlay" data-toggle="sidebar"></div> -->
      <aside class="app-sidebar doc-sidebar">
			<div class="app-sidebar__user clearfix">
				<div class="dropdown user-pro-body">
					<div>
						<img v-if="authUser.image!=null" :src="authUser.image" alt="" class="avatar avatar-lg brround">
						<img  v-else src="/img/profile.png" alt="" class="avatar avatar-lg brround">
						<router-link to="/edit_profile" class="profile-img">
								<span class="fa fa-pencil" aria-hidden="true"></span> 
							</router-link>
						</div>
					<div class="user-info">
						<h2>{{ authUser.name }}</h2>
						<!-- <span>Web Designer</span> -->
					</div>
				</div>
			</div>
			<ul class="side-menu">
				<template v-if="authUser.userType=='Admin'">
					<li class="slide">
						<router-link to="/" class="side-menu__item" :class=" $route.path == '/' ?'active': ''">
							<i class="side-menu__icon fa fa-tachometer"></i><span class="side-menu__label">Dashboard</span>
						</router-link>
					</li>
					<li class="slide">
						<router-link to="/teacher" class="side-menu__item" :class=" $route.path == '/teacher' ?'active': ''">
								<i class="side-menu__icon fa fa-database"></i><span class="side-menu__label">Teachers  </span>
						</router-link>
					</li>
					<li class="slide">
						<router-link to="/admin_teacher_courses" class="side-menu__item" :class=" $route.path == '/admin_teacher_courses' ?'active': ''">
								<i class="side-menu__icon fa fa-database"></i><span class="side-menu__label">Teachers Courses </span>
						</router-link>
					</li>
					<li class="slide">
						<router-link to="/student" class="side-menu__item" :class=" $route.path == '/student' ?'active': ''">
								<i class="side-menu__icon fa fa-database"></i><span class="side-menu__label">Students  </span>
						</router-link>
					</li>
					<li class="slide">
						<router-link to="/admin_class_routine" class="side-menu__item" :class=" $route.path == '/admin_class_routine' ?'active': ''">
								<i class="side-menu__icon fa fa-database"></i><span class="side-menu__label">Class Routine  </span>
						</router-link>
					</li>
					<li class="slide">
						<router-link to="/admin_exam_routine" class="side-menu__item" :class=" $route.path == '/admin_exam_routine' ?'active': ''">
								<i class="side-menu__icon fa fa-database"></i><span class="side-menu__label">Exam Routine  </span>
						</router-link>
					</li>
					<li class="slide">
						<router-link to="/notice" class="side-menu__item" :class=" $route.path == '/notice' ?'active': ''">
								<i class="side-menu__icon fa fa-database"></i><span class="side-menu__label">Notice  </span>
						</router-link>
					</li>
					<!-- <li class="slide">
						<router-link to="/departments" class="side-menu__item" :class=" $route.path == '/departments' ?'active': ''">
								<i class="side-menu__icon fa fa-database"></i><span class="side-menu__label">All Departments  </span>
						</router-link>
					</li> -->
					<li class="slide">
						<router-link to="/semester" class="side-menu__item" :class=" $route.path == '/semester' ?'active': ''">
								<i class="side-menu__icon fa fa-database"></i><span class="side-menu__label">All Semester  </span>
						</router-link>
					</li>
					<li class="slide">
						<router-link to="/courses" class="side-menu__item" :class=" $route.path == '/courses' ?'active': ''">
								<i class="side-menu__icon fa fa-database"></i><span class="side-menu__label">All Courses  </span>
						</router-link>
					</li>
					<li class="slide">
						<router-link to="/admin_semester_courses" class="side-menu__item" :class=" $route.path == '/admin_semester_courses' ?'active': ''">
								<i class="side-menu__icon fa fa-database"></i><span class="side-menu__label">Semester Courses  </span>
						</router-link>
					</li>
					<li class="slide">
						<router-link to="/rooms" class="side-menu__item" :class=" $route.path == '/rooms' ?'active': ''">
								<i class="side-menu__icon fa fa-database"></i><span class="side-menu__label">All Rooms  </span>
						</router-link>
					</li>
					<li class="slide">
						<router-link to="/admin_class_days" class="side-menu__item" :class=" $route.path == '/admin_class_days' ?'active': ''">
								<i class="side-menu__icon fa fa-database"></i><span class="side-menu__label">Class Days </span>
						</router-link>
					</li>
					<!-- <li class="slide">
						<router-link to="/users" class="side-menu__item" :class=" $route.path == '/users' ?'active': ''">
								<i class="side-menu__icon fa fa-database"></i><span class="side-menu__label">Users  </span>
						</router-link>
					</li> -->
				</template>
				<template v-else-if="authUser.userType=='Teacher'">
					<li class="slide">
						<router-link to="/admin_class_routine" class="side-menu__item" :class=" $route.path == '/admin_class_routine' ?'active': ''">
								<i class="side-menu__icon fa fa-database"></i><span class="side-menu__label">All Class Routine</span>
						</router-link>
					</li>
					<li class="slide">
						<router-link to="/teacher_class_routine" class="side-menu__item" :class=" $route.path == '/teacher_class_routine' ?'active': ''">
								<i class="side-menu__icon fa fa-database"></i><span class="side-menu__label">My Class Routine</span>
						</router-link>
					</li>
					<li class="slide">
						<router-link to="/admin_exam_routine" class="side-menu__item" :class=" $route.path == '/admin_exam_routine' ?'active': ''">
								<i class="side-menu__icon fa fa-database"></i><span class="side-menu__label">Exam Routine  </span>
						</router-link>
					</li>
					<li class="slide">
						<router-link to="/teacher_exam_routine" class="side-menu__item" :class=" $route.path == '/teacher_exam_routine' ?'active': ''">
								<i class="side-menu__icon fa fa-database"></i><span class="side-menu__label">My Exam Routine  </span>
						</router-link>
					</li>
						<li class="slide">
						<router-link to="/teacher_notice" class="side-menu__item" :class=" $route.path == '/teacher_notice' ?'active': ''">
							<i class="side-menu__icon fa fa-database"></i><span class="side-menu__label">Notice  </span>
						</router-link>
					</li>
				</template>
				<template v-else-if="authUser.userType=='Student'">
					<li class="slide">
						<router-link to="/admin_class_routine" class="side-menu__item" :class=" $route.path == '/admin_class_routine' ?'active': ''">
								<i class="side-menu__icon fa fa-database"></i><span class="side-menu__label">All Class Routine</span>
						</router-link>
					</li>
					<li class="slide">
						<router-link to="/student_class_routine" class="side-menu__item" :class=" $route.path == '/student_class_routine' ?'active': ''">
								<i class="side-menu__icon fa fa-database"></i><span class="side-menu__label">My Class Routine</span>
						</router-link>
					</li>
					<li class="slide">
						<router-link to="/admin_exam_routine" class="side-menu__item" :class=" $route.path == '/admin_exam_routine' ?'active': ''">
								<i class="side-menu__icon fa fa-database"></i><span class="side-menu__label">Exam Routine  </span>
						</router-link>
					</li>
					<li class="slide">
						<router-link to="/student_exam_routine" class="side-menu__item" :class=" $route.path == '/student_exam_routine' ?'active': ''">
								<i class="side-menu__icon fa fa-database"></i><span class="side-menu__label">My Exam Routine</span>
						</router-link>
					</li>
					
				
				</template>
				
				
				
				<!-- <li class="slide">
					<router-link to="/category" class="side-menu__item" :class=" $route.path == '/category' ?'active': ''">
							<i class="side-menu__icon fa fa-rocket"></i><span class="side-menu__label">Category</span>
					</router-link>
				</li> -->

				
			</ul>
			</aside>
      <!--========== ADMIN SIDE MENU ========-->
    	</div>
    	<router-view/>
    </div>
</template>

<script>
import { mapGetters } from 'vuex'

export default {
    props: ['user'],
    data(){
       return {
          isLoggedIn : true, 
       }
	}, 
	methods:{
		async logout() {
			         this.loading = true
       const res = await this.callApi('get',`/logout`)
		if(res.status == 200){
			this.$store.commit("setAuthInfo", false);
			window.location = '/login'
		}
		else{
			this.swr();
		}
		this.loading = false
		 
	}
	},
	// computed:{
    //     ...mapGetters([
    //           'setAuthInfo',      
    //     ])
    // },
    async created(){
		   this.$store.commit('setAuthInfo', this.user)
		   
	   	// const res = await this.callApi("get", `/app/count_pending_list`);
		// if (res.status == 200) {
		// 	this.$store.commit('setPendingList', res.data)
			
		// } 
    }
}
</script>