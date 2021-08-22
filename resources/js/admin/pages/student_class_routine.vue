<template>
    <div>
      <div class="app-content  my-3 my-md-5">  
		<div class="side-app">
			<div class="page-header"> 
				<h4 class="page-title">Class Routine Table</h4>
			</div>
			<div class="row">
				<div class="col-md-12 col-lg-12">
					<div class="card">
						<div class="card-header card_header_area">
							<div class="card-title">Data</div>
							<div class="d-flex">
								<div id="example_filter" class="dataTables_filter dataTables_filter_up mr-5">
									<!-- <label><input type="search" class="form-control form-control-sm" v-model="filterField" @change="searchByEmail"   placeholder="Search" aria-controls="example">
									<button class="btn btn-primary" @click="searchByEmail"><i class="fa fa-search"></i></button>
									</label> -->
								</div>
								<!-- <div class="card_add_data btn btn-primary mar_b10" @click="addModal = true">
									Add New
								</div>  -->
							</div>
						</div>
						<div class="card-body">
						<template v-if="pagination.total==0">
							<div class="alert alert-secondary text-center" role="alert">
								<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
								No data availble!
							</div>
						</template>
						<template v-else-if="loading==true">
							<div class="alert alert-secondary" role="alert">
								<p class="_1card_header_title text-center _padd30 no_data">Loading...</p>
							</div>
						</template>
						<template v-else>
							<div class="table-responsive">
								<div id="example_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
									<!-- <div class="row">
										<div class="col-sm-12 col-md-12">
											<div id="example_filter" class="dataTables_filter">
												<label>Search:<input type="search" class="form-control form-control-sm" placeholder="" aria-controls="example"></label>
											</div>  
										</div>
									</div> -->
									<div class="row">
										<div class="col-sm-12">
											<table id="example" class="table card-table table-bordered table-hover table-vcenter " role="grid" aria-describedby="example_info">
												<thead>
													<tr role="row">
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Last name: activate to sort column ascending" style="width: 60px;">Day</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Last name: activate to sort column ascending" style="width: 60px;">Time</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Last name: activate to sort column ascending" style="width: 60px;">Department</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Last name: activate to sort column ascending" style="width: 250px;">Course</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Last name: activate to sort column ascending" style="width: 250px;">Teacher</th>
														<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 250px;">Semester</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 100px;">Room</th>
														<!-- <th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 300px;">Action</th> -->
													</tr>
												</thead>
												<tbody>												
													<tr role="row" class="odd" v-for="(item,index) in allItems" :key="index">
														<td>{{item.day}}</td>
														<td >{{item.time}}</td>
														<td >{{item.department_name}}</td>
														<td >{{item.course_name}}</td>
														<td >{{item.teacher_name}}</td>
														<td>{{item.batch_name}}</td>
														<td>{{item.room}}</td>
														<!-- <td>
                                                            <button class="btn btn-info" @click="product_delete(item.id,index)">Delete</button>
														</td> -->
													</tr>
												</tbody>  
											</table>
										</div>
									</div>								
								</div>
							</div>
							<div style="text-align:center;" class="pagination_div _mar_t30">
								<Page :current="pagination.current_page" :total="pagination.total" @on-change="getpaginate" :page-size="parseInt(pagination.per_page)" />
							</div>
						</template>
						</div>
					</div>
						<!-- table-wrapper -->
				</div>
				<!-- section-wrapper -->
			</div>
		</div>
		<Modal width="720" v-model="addModal" :mask-closable="false"  :closable="false" >
			<div class="card-header">
				<h3 class="card-title">Add Payment</h3>
			</div>
			<div class="card m-b-20">
				<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" >Department</label>
									<Select v-model="formItem.department_name"  placeholder="Please select a deparment" filterable>
										<Option v-for="(item,index) in department_data"  :key="index" :value="item.name" >{{item.name}}</Option>
									</Select>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" >Semester</label>
									<Select v-model="formItem.semister"  placeholder="Please select a course">
										<Option value="Spring" >Spring</Option>
										<Option value="Summer" >Summer</Option>
									</Select>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" >Day</label>
									<Select v-model="formItem.day"  placeholder="Please select a day" filterable>
                                        <Option v-for="(item,index) in days"  :key="index" :value="item" >{{item}}</Option>
                                    </Select>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" >Time</label>
									<input type="text"  class="form-control" v-model="formItem.time"  placeholder="Time Range">
								</div>
							</div>
							
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" >Course</label>
									<Select v-model="formItem.course_name"  placeholder="Please select a course" filterable>
										<Option v-for="(item,index) in course_data"  :key="index" :value="item.name" >{{item.name}}</Option>
									</Select>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" >Teacher</label>
									<Select v-model="formItem.teacher_name"  placeholder="Please select a course" filterable>
										<Option v-for="(item,index) in teacher_data"  :key="index" :value="item.name" >{{item.name}}</Option>
									</Select>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" >Batch</label>
									<Select v-model="formItem.batch_name"  placeholder="Please select a course" filterable>
										<Option v-for="(item,index) in batch_data"  :key="index" :value="item.name" >{{item.name}}</Option>
									</Select>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" >Room Number</label>
									<input type="text" class="form-control" v-model="formItem.room"  placeholder="Room number">
								</div>
							</div>
						</div>
				</div>
			</div>
			<div slot="footer">
					<button type="submit" v-if="loading == false" class="btn btn-primary" @click="addItem">Add </button>
					<button type="submit" class="btn btn-primary" v-else disabled >Adding.. </button>
				    <button type="submit" class="btn btn-info" @click="addModal = false">Close </button>
			</div>
		</Modal>
		</div>
    </div>
</template>
<script>
export default {
	data(){
		return {
			days:['Saturday','Sunday','Monday',"Tuesday",'Wednesday','Thusday','Friday'],
			course_data:[],
			batch_data:[],
			teacher_data:[],
			department_data:[],
			addModal:false,
			formItem:{
				day:'',
				time:'',
				department_name:'',
				teacher_name:'',
				batch_name:'',
				semister:'',
				room:'',
				course_name:'',
			},
 			allItems:[],
			page:1,
			pagination: {},
			loading:false,			 
		}
	},
	methods : {
		async getpaginate(page = 1){
			const res  = await this.callApi('get',`app/admin/class_routine?page=${page}`)
			if(res.status == 200){
				this.allItems = res.data.data
				this.pagination = res.data
			}
			else{
				this.swr()
			}
		},
		async addItem(){
			if(this.formItem.day.trim()=='') return this.i('Day is required')
			if(this.formItem.time.trim()=='') return this.i('Time is required')
			if(this.formItem.department_name.trim() =='') return this.i('Department is required')
			if(this.formItem.batch_name.trim()=='') return this.i('Batch is required')
			if(this.formItem.semister.trim()=='') return this.i('Semester is required')
			if(this.formItem.course_name.trim() =='') return this.i('Course is required')
			if(this.formItem.teacher_name.trim() =='') return this.i('Teacher is required')
			if(this.formItem.room.trim()=='') return this.i('room is required')

			this.loading = true
        	let res = await this.callApi('post',`app/admin/class_routine/store`,this.formItem)
			if(res.status==200 || res.status == 201){
				this.s('Order added successfully!')
				this.allItems.unshift(res.data);
				this.addModal=false
				this.pagesList = []
			}
			else{
				this.swr();
            }
            
            this.loading = false
		},		 
		//Delete
		async product_delete(id,index){
			if(!confirm("Are you sure to delete this payment")){
				return;
			}
			let ob = {
				id:id
			}
			this.loading = true
			const res = await this.callApi('post',`/app/admin/class_routine/delete`,ob)
			if(res.status == 200){
				this.i(' order has been deleted successfully!')
				this.allItems.splice(index,1)
			}
			else{
                this.swr();
			}
				this.loading = false
		},
	 
		async getAllData(){
			this.loading = true
			const res = await this.callApi('get',`app/student/class_routine`)
			if(res.status == 200){
				this.allItems = res.data.data
				delete res.data.data
				this.pagination = res.data
			}
			else{
				this.swr();
			}
			this.loading = false
		}
	}, 

	async created(){
	   	this.loading = true
	  	await this.getAllData() 
		this.loading = false

		// const [course,teacher,department,batch] = await Promise.all([
		// 	this.callApi('get','app/admin/all_course'),
		// 	this.callApi('get','app/admin/all_teachers'),
		// 	this.callApi('get','app/admin/all_department'),
		// 	this.callApi('get','app/admin/all_batch'),
		// ]);
		// if(course.status == 200 && teacher.status == 200 && department.status == 200 &&  batch.status == 200){
		// 	this.course_data = course.data;
		// 	this.teacher_data = teacher.data;
		// 	this.batch_data = batch.data;
		// 	this.department_data = department.data;
		// }
	}, 
	
}
</script>

<style>