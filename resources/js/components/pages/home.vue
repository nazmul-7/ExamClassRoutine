<template>
    <div>
       <div class="app-content  my-3 my-md-5">
		  	<div class="side-app">
				<div class="page-header">
					<h4 class="page-title">Dashboard Overview</h4>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a>Dashboard</a></li>
						<li class="breadcrumb-item active" aria-current="page">Dashboard Overview</li>
					</ol>
				</div>



				<div class="row row-cards">
					<div class="col-sm-12 col-md-12 col-lg-12 col-xl-12">
						<div class="card">
							<router-link to="/">
							<div class="card-body text-center feature">
								<div class="fa-stack fa-lg fa-1x icons shadow-default bg-primary-transparent">
									<i class="icon icon-people text-primary"></i>
								</div>
								<h1>Welcome , {{authUser.name}}</h1>
							</div>
							</router-link>
						</div>  
					</div>
				</div>
				<div class="row row-cards" v-if="authUser.userType == 'Admin'">
					<div class="col-sm-12 col-md-6 col-lg-6 col-xl-3">
						<div class="card">
							<router-link to="/teacher">
							<div class="card-body text-center feature">
								<div class="fa-stack fa-lg fa-1x icons shadow-default bg-primary-transparent">
									<i class="icon icon-people text-primary"></i>
								</div>
								<p class="card-text mt-3 mb-3">  Total Teachers</p>
								<p  v-if="dashboardData.totaTeacher" class="h2 text-center text-primary">{{dashboardData.totaTeacher}}</p>
							</div>
							</router-link>
						</div>  
					</div>
					<div class="col-sm-12 col-md-6 col-lg-6 col-xl-3">
						<div class="card">
							<router-link to="/student">
							<div class="card-body text-center feature">
								<div class="fa-stack fa-lg fa-1x icons shadow-default bg-primary-transparent">
									<i class="icon icon-people text-primary"></i>
								</div>
								<p class="card-text mt-3 mb-3"> Total Student</p>
								<p  v-if="dashboardData.totalStudent" class="h2 text-center text-primary">{{dashboardData.totalStudent}}</p>
							</div>
							</router-link>
						</div>  
					</div>
					<!-- <div class="col-sm-12 col-md-6 col-lg-6 col-xl-3">
						<div class="card">
							<router-link to="/orders">
							<div class="card-body text-center feature">
								<div class="fa-stack fa-lg fa-1x icons shadow-default bg-secondary-transparent">
									<i class="icon icon-refresh text-secondary"></i>
								</div>
								<p class="card-text mt-3 mb-3"> Orders</p>
								<p v-if="dashboardData.totalOrder" class="h2 text-center text-secondary">{{ dashboardData.totalOrder.totalOrder}}</p>
							</div>
							</router-link>
						</div>
					</div>
					<div class="col-sm-12 col-md-6 col-lg-6 col-xl-3">
						<div class="card">
							<router-link to="/services">
							<div class="card-body text-center feature">
								<div class="fa-stack fa-lg fa-1x icons shadow-default bg-secondary-transparent">
									<i class="icon icon-refresh text-secondary"></i>
								</div>
								<p class="card-text mt-3 mb-3"> Services</p>
								<p v-if="dashboardData.totalService" class="h2 text-center text-secondary">{{dashboardData.totalService.totalService}}</p>
							</div>
							</router-link>
						</div>
					</div>
					<div class="col-sm-12 col-md-6 col-lg-6 col-xl-3">
						<div class="card">
							<router-link to="/contact_us">
							<div class="card-body text-center feature ">
								<div class="fa-stack fa-lg fa-1x icons shadow-default bg-info-transparent">
									<i class="icon icon-speech text-info"></i>
								</div>
								<p class="card-text mt-3 mb-3"> Message</p>
								<p v-if="dashboardData.totalMsg" class="h2 text-center text-success-1">{{dashboardData.totalMsg.totalMsg}}</p>
							</div>
							</router-link>
						</div>
					</div>  -->
				</div>
				<!-- <div class="row">
							<div class="col-lg-12">
								<div class="card">
									<div class="card-header">
										<h3 class="card-title">Latest User</h3>
									</div>
									<div class="card-body">
										<div class="table-responsive border-top mb-0 ">
											<table class="table table-bordered table-hover text-nowrap mb-0">
												<thead>
													<tr>
														<th>Name</th>
														<th>Email</th>
														<th>Phone</th>
														<th>Address</th>
													</tr>
												</thead>
												<tbody>
													<tr v-for="(item,index) in dashboardData.latestUser" :key="index">
														<td>{{item.name}}</td>
														<td>{{item.email}}</td>
														<td>{{item.phone}}</td>
														<td class="font-weight-semibold fs-16">{{item.address}}</td>
													</tr>
													 
												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
				</div> -->
			</div>
		</div>
    </div>
</template>
<script>
import {mapGetters} from 'vuex'
export default {
	data(){
		return { 
			loading:false,
			dashboardData:[]
		}
	},
	methods : {
			
	}, 
	async created(){
 		this.loading = true
       const res = await this.callApi('get',`app/getDashboardData`)
		if(res.status == 200){
			this.dashboardData = res.data
		}
		else{
			this.swr();
		}
		this.loading = false
	},
	
	
}
</script>