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
								<div v-if="authUser.userType == 'Admin'" class="card_add_data btn btn-primary mar_b10" @click="addModal = true">
									Add New
								</div> 
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
														<!-- <th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Last name: activate to sort column ascending" style="width: 60px;">Day</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Last name: activate to sort column ascending" style="width: 60px;">Time</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Last name: activate to sort column ascending" style="width: 60px;">Department</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Last name: activate to sort column ascending" style="width: 250px;">Course</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Last name: activate to sort column ascending" style="width: 250px;">Teacher</th>
														<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 250px;">Session</th>
														<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 250px;">Semester</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 100px;">Room</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 300px;" v-if="authUser.userType == 'Admin'">Action</th>
														<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;" >Day/Time</th> -->
														<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;" >Day/Time</th>
														<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;" >08:00-09:00</th>
														<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;" >09:00-10:00</th>
														<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;" >10:00-11:00</th>
														<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;" >11:00-12:00</th>
														<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;" >12:00-01:00</th>
														<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;" >01:00-02:00</th>
														<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;" >02:00-03:00</th>
														<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;" >03:00-04:00</th>
														<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;" >04:00-05:00</th>
													</tr>
												</thead>
												<tbody>												
													<tr role="row" class="odd" v-for="(d,i) in days_data" :key="i">
														<td>{{d}}</td>
														<template v-if="new_format_routine && new_format_routine[d]" >
															<td v-for="(t,ix) in times_data" :key="ix" v-if="new_format_routine[d][t] && new_format_routine[d][t][0] && new_format_routine[d][t][0]['col'] != 3" :colspan="new_format_routine[d][t][0]['hours']" style="text-align: center;">
																<span v-if="new_format_routine[d][t][0]['col'] == 2">
																	<span>{{new_format_routine[d][t][0].course_name}}</span><br/>
																	<span>{{new_format_routine[d][t][0].room}}</span><br/>
																	<span>{{new_format_routine[d][t][0].teacher_name}}</span><br/>
																</span>
																<span v-else-if="new_format_routine[d][t][0].col == 4">Break</span>
																<span v-else></span>
															</td>

															<!-- <td v-for="(t,ix) in times_data" :key="ix">
																<span v-if="new_format_routine[d][t].length>0">{{new_format_routine[d][t].batch_name}}</span>
																<span v-else></span>
															</td> -->
														</template>
														<template v-else>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td></td>
														<td style="text-align: center;">Break</td>
														<td></td>
														<td></td>
														<td></td>
														</template>
														<!-- <td v-if="authUser.userType == 'Admin'">
                                                            <button class="btn btn-info" @click="product_delete(item.id,index)">Delete</button>
														</td> -->
													</tr>
												</tbody>  
											</table>
										</div>
									</div>								
								</div>
							</div>
							<!-- <div style="text-align:center;" class="pagination_div _mar_t30">
								<Page :current="pagination.current_page" :total="pagination.total" @on-change="getpaginate" :page-size="parseInt(pagination.per_page)" />
							</div> -->
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
				<h3 class="card-title">Add</h3>
			</div>
			<div class="card m-b-20">
				<div class="card-body">
						<div class="row">
							<div class="col-md-6">
								<div class="form-group">
									<label class="form-label" >Semester</label>
									<Select v-model="semester_id"  placeholder="Please select a Semester" filterable>
										<Option v-for="(item,index) in semester_data"  :key="index" :value="item.id" >{{item.name}}</Option>
									</Select>
								</div>
							</div>
							<div class="col-md-6" v-if="semester_id">
								<div class="form-group">
									<label class="form-label" >Course</label>
									<Select v-model="semesterCourseId"  placeholder="Please select a course" filterable @on-change="changeCourse">
										<Option v-for="(item,index) in filter_course"  :key="index" :value="item.id" >{{item.course_name}}</Option>
									</Select>
								</div>
							</div>
							<div class="col-md-6" v-if="semesterCourseId">
								<div class="form-group">
									<label class="form-label" >Teacher</label>
									<input type="text" class="form-control" disabled  v-model="formItem.teacher_name"  placeholder="Teacher Name">
								</div>
							</div>
							<div class="col-md-6" v-if="semesterCourseId">
								<div class="form-group">
									<label class="form-label" >Room Number</label>
									<input type="text" class="form-control" disabled  v-model="formItem.room"  placeholder="Room">
								</div>
							</div>
								<div class="col-md-12" v-if="semesterCourseId">
								<div class="form-group">
									<label class="form-label" >Day</label>
									<Select v-model="formItem.day"  placeholder="Please select a day" filterable>
                                        <Option v-for="(item,index) in days_data_item"  :key="index" :value="item.day" >{{item.day}}</Option>
                                    </Select>
								</div>
							</div>
							<div class="col-md-6" v-if="semesterCourseId">
								<div class="form-group">
									<label class="form-label" >Start Time</label>
									<input class="form-control" id="exampleInputname" type="time" step="60" v-model="formItem.start_time" name="appt" min="08:00" max="20:00" @change="startTimeChanged">
								</div>
							</div>
							<div class="col-md-6" v-if="semesterCourseId">
								<div class="form-group">
									<label class="form-label" >End Time</label>
									<input class="form-control" id="exampleInputname" type="time" disabled step="60" v-model="formItem.end_time" name="appt" min="08:00" max="20:00">
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
			days_data:['Sunday','Monday',"Tuesday",'Wednesday','Thusday'],
			days_data_item:[],
			times_data:[8,9,10,11,12,1,2,3,4,5],
			semester_id:'',
			semesterCourseId:'',
			new_format_routine:{},
			course_data:[],
			semester_data:[],
			batch_data:[],
			teacher_data:[],
			department_data:[],
			addModal:false,
			formItem:{
				day:'',
				start_time:'',
				end_time:'',
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
	computed:{
      filter_course(){
        let arr = [];
        if(this.semester_id){
            for(let d of this.course_data){
                if(d.semester_id == this.semester_id){
                    arr.push(d)
                }
            }
        }
        else arr = this.course_data

        return arr
      }  
    },
	methods : {
		changeCourse(id){
			let index = this.course_data.findIndex(d=>d.id == id);
			this.formItem.teacher_name = this.course_data[index].teacher_name
			this.formItem.room = this.course_data[index].room_name
			this.formItem.course_name = this.course_data[index].course_name
			
		},
		startTimeChanged(value){
			console.log("value")
			let index = this.course_data.findIndex(d=>d.id == this.semesterCourseId);
			var datetime = new Date(`2018-07-25 ${this.formItem.start_time}:00`);

			datetime.setHours(datetime.getHours()+ parseInt(this.course_data[index].course.class_time)); 
			var hour = datetime.getHours();
			if(hour < 10) hour = `0${hour}`
			this.formItem.end_time = `${hour}:00`
			// console.log(this.formItem.start_time)
		},
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
			if(this.semester_id=='') return this.i('Semester is required')
			if(this.semesterCourseId=='') return this.i('Semester Course is required')
			if(this.formItem.day=='') return this.i('Day is required')
			if(this.formItem.start_time=='') return this.i('Time is required')
			// if(this.formItem.department_name.trim() =='') return this.i('Department is required')
			// if(this.formItem.batch_name.trim()=='') return this.i('Batch is required')
			// if(this.formItem.semister.trim()=='') return this.i('Semester is required')
			// if(this.formItem.course_name.trim() =='') return this.i('Course is required')
			// if(this.formItem.teacher_name.trim() =='') return this.i('Teacher is required')
			// if(this.formItem.room.trim()=='') return this.i('room is required')
			var ss = new Date(`2018-07-25 ${this.formItem.start_time}:00`);
			var sd = new Date(`2018-07-25 ${this.formItem.end_time}:00`);
			this.formItem.start_time = ss.getHours();
			this.formItem.end_time = sd.getHours();
			let ii = this.semester_data.findIndex(d=>d.id == this.semester_id)
			this.formItem.batch_name = this.semester_data[ii].name



			this.loading = true
        	let res = await this.callApi('post',`app/admin/class_routine/store`,this.formItem)
			if(res.status==200 || res.status == 201){
				this.s('Routine added successfully!')
				location.reload()
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
			if(!confirm("Are you sure to delete this routine")){
				return;
			}
			let ob = {
				id:id
			}
			this.loading = true
			const res = await this.callApi('post',`/app/admin/class_routine/delete`,ob)
			if(res.status == 200){
				this.i(' Routine has been deleted successfully!')
				this.allItems.splice(index,1)
			}
			else{
                this.swr();
			}
				this.loading = false
		},
	 
		async getAllData(){
			this.loading = true
			const res = await this.callApi('get',`app/admin/class_routine/session`)
			if(res.status == 200){
				this.new_format_routine = res.data.data
				this.days_data = res.data.days_data
				this.times_data = res.data.times_data
				// delete res.data.data
				// this.pagination = res.data
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

		const [course,teacher,department,batch,days] = await Promise.all([
			this.callApi('get','app/admin/all_semester_courses'),
			this.callApi('get','app/admin/all_teachers'),
			this.callApi('get','app/admin/all_department'),
			this.callApi('get','app/admin/all_semester'),
			this.callApi('get','app/admin/admin_class_days'),
		]);
		if(course.status == 200 && teacher.status == 200 && department.status == 200 &&  batch.status == 200){
			this.course_data = course.data;
			this.teacher_data = teacher.data;
			this.semester_data = batch.data;
			this.department_data = department.data;
			this.days_data_item = days.data;
			
		}
		this.days_data = []
		for(let d of this.days_data_item){
			this.days_data.push(d.day)
		}
	}, 
	
}
</script>

<style>