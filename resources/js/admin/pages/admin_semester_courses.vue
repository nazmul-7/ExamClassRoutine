<template>
    <div>
      	<div class="app-content  my-3 my-md-5">
			<div class="side-app">
				<div class="page-header">
					<h4 class="page-title">Data Tables</h4>
				</div>
				<div class="row">
					<div class="col-md-12 col-lg-12">
						<div class="card">
							<div class="card-header card_header_area">
								<div class="card-title">Semester Courses Data</div>
								<div class="card-title">	
								<Select v-model="filterSemester"  placeholder="Please select a Semester" filterable @on-change="getData">
									<Option v-for="(item,index) in semester_data"  :key="index" :value="item.id" style="width:600px" >{{item.name}}</Option>
								</Select>
							</div>
								<div class="card_add_data btn btn-primary" @click="addModal = true">
									Add Semester Courses
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
										<div class="row">
											<div class="col-sm-12">
												<table id="example" class="table table-striped table-bordered dataTable no-footer" role="grid" aria-describedby="example_info">
													<thead>
														<tr role="row">
															<!-- <th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Last name: activate to sort column ascending" style="width: 95px;">No</th> -->
															<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;">Semester Name</th>
															<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;">Course Name</th>
															<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;">Teacher Name</th>
															<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;">Room</th>
															<!-- <th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;">Image</th> -->
															<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 101px;">Action</th>
														</tr> 
													</thead>
													<tbody>												
														<tr role="row" class="odd" v-for="(item,index) in categoryData" :key="index">
															<!-- <td>{{index+1}}</td> -->
															<td>{{item.semester_name}}</td>
															<td>{{item.course_name}}</td>
															<td>{{item.teacher_name}}</td>
															<td>{{item.room_name}}</td>
															<!-- <td class="category_img"><img :src="item.image" alt=""></td> -->
															<td>
																<!-- <button class="btn btn-gray" @click="viewImage(item,index)">View Image</button> -->
																<!-- <button class="btn btn-primary" @click="isEditOn(item,index)">Edit</button> -->
																<button class="btn btn-info" @click="category_delete(item.id,index)">Delete</button>
															</td>
														</tr>
													</tbody>
													<!-- <Modal title="View Image" v-model="imageModal">
														<img :src="imgName" v-if="imageModal" class="category_img_modal" style="width:100%">
													</Modal> -->
												</table>
											</div>
										</div>								
									</div>
								</div>
							</template>
							</div>
						</div>
							<!-- table-wrapper -->
					</div>
					<!-- section-wrapper -->
				</div>
			</div>
			<Modal v-model="addModal" :mask-closable="false" :closable="false" title="Add New Semester Courses">
				<div class="card m-b-20">
					<div class="card-body">
						<form>
							<div class="form-group">
								<label class="form-label" for="exampleInputEmail1">Semester Name</label>
                                <Select v-model="formItem.semester_id"  placeholder="Please select a teacher" filterable>
                                    <Option v-for="(item,index) in semester_data"  :key="index" :value="item.id" >{{item.name}}</Option>
                                </Select>
							</div>
							<div class="form-group">
								<label class="form-label" for="exampleInputEmail1">Course Name</label>
                                 <Select v-model="formItem.course_id"  placeholder="Please select a course" filterable>
                                    <Option v-for="(item,index) in course_data"  :key="index" :value="item.id" >{{item.name}}</Option>
                                </Select>
							</div>
							<div class="form-group">
								<label class="form-label" for="exampleInputEmail1">Teacher Name</label>
                                 <Select v-model="formItem.teacher_id"  placeholder="Please select a course" filterable>
                                    <Option v-for="(item,index) in filter_teacher"  :key="index" :value="item.id" >{{item.name}}</Option>
                                </Select>
							</div>
							<div class="form-group">
								<label class="form-label" for="exampleInputEmail1">Room</label>
                                 <Select v-model="formItem.room_id"  placeholder="Please select a course" filterable>
                                    <Option v-for="(item,index) in filter_room"  :key="index" :value="item.id" >{{item.name}}</Option>
                                </Select>
							</div>
						</form>
					</div>
				</div>
				<div slot="footer">
					<button type="submit" class="btn btn-info" @click="addModal=false">Close</button>
					<button type="submit" class="btn btn-primary" @click="add_category">Add</button>

				</div>
			</Modal>

			<Modal :mask-closable="false" :closable="false" v-model="editModal"	title="Edit Semester Courses">
				<div class="card m-b-20">
					<div class="card-body">
						<form>
							<div class="form-group">
								<label class="form-label" for="exampleInputEmail1">Semester Courses Department</label>
                                <Select v-model="edit_form.department"  placeholder="Please select a deparment" filterable>
                                    <Option v-for="(item,index) in department_data"  :key="index" :value="item.name" >{{item.name}}</Option>
                                </Select>
							</div>
							<div class="form-group">
								<label class="form-label" for="exampleInputEmail1">Semester Courses Name</label>
								<input type="text" v-model="edit_form.name" class="form-control" id="exampleInputname" placeholder="Enter  Name">
							</div>
						</form>
					</div>
				</div>
				<div slot="footer">
					<button type="submit" class="btn btn-info" @click="editModal=false">Close</button>
					<button type="submit" class="btn btn-primary" @click="edit_category">Update</button>
				</div>
			</Modal>
		</div>
    </div>
</template>


<script>

export default {
	data(){
		return {
			crfObj: {
                    'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf-token"]')
                },
			filterSemester:'',
			addModal:false,
			editModal:false,
			formItem:{
				semester_name:'', 
				course_name:'', 
				teacher_name:'', 
				room_name:'', 
				semester_id:'', 
				course_id:'', 
				teacher_id:'', 
				room_id:'', 
			},
			editIndex:-1,
			edit_form:{
				semester_name:'', 
				course_name:'', 
				semester_id:'', 
				course_id:'', 
			},
			categoryData:[],
			department_data:[],
			semester_data:[],
			course_data:[],
			teacher_data:[],
			room_data:[],
			page:1,
			total:"10",
			pagination: {},
			loading:false,
			imgName:'',
			imageModal:false,

		}
	},
	computed:{
      filter_teacher(){
        let arr = [];
        if(this.formItem.course_id){
            for(let d of this.teacher_data){
				if(d.courses.length > 0){
					for(let c of d.courses){
						if (c.course_id == this.formItem.course_id){
							arr.push(d)
							break
						}
					}
				}
            }
        }
        else arr = this.teacher_data

        return arr
      },
      filter_room(){
        let arr = [];
        if(this.formItem.semester_id){
			let index = this.semester_data.findIndex(d=>d.id == this.formItem.semester_id);

            for(let d of this.room_data){
				
				if (d.total  >= this.semester_data[index].total){
					arr.push(d)
				}
            }
        }
        else arr = this.room_data

        return arr
      }  
    },

	methods : {
    
		//Add
		async add_category(){
			if(this.formItem.semester_id =='') return this.e('Semester name is required')
            if(this.formItem.course_id =='') return this.e('Course name is required')
            if(this.formItem.teacher_id =='') return this.e('Teacher name is required')
            if(this.formItem.room_id =='') return this.e('Room is required')
            let tIndex = this.semester_data.findIndex(d=>d.id == this.formItem.semester_id)
            let cIndex = this.course_data.findIndex(d=>d.id == this.formItem.course_id)
            let rIndex = this.room_data.findIndex(d=>d.id == this.formItem.room_id)
            let tcIndex = this.teacher_data.findIndex(d=>d.id == this.formItem.teacher_id)
            this.formItem.semester_name = this.semester_data[tIndex].name
            this.formItem.course_name = this.course_data[cIndex].name
            this.formItem.room_name = this.room_data[rIndex].name
            this.formItem.teacher_name = this.teacher_data[tcIndex].name
			// if(this.formItem.department.trim()=='') return this.e('Department is required')
			this.loading = true
        	const res = await this.callApi('post',`app/admin/all_semester_courses/add`,this.formItem)
			if(res.status==201){
				this.addModal=false
				this.s('Semester Courses added successfully!')
				this.categoryData.unshift(res.data)
				this.loading = false
				this.formItem={
					semester_name:'', 
					course_name:'', 
					teacher_name:'', 
					room_name:'', 
					semester_id:'', 
					course_id:'', 
					teacher_id:'', 
					room_id:'', 
				}
			}
			else{
				this.swr();
			}
		},
		//Edit
		async edit_category(){
			if(this.edit_form.name.trim()=='') return this.e('Name is required')
			if(this.edit_form.department.trim()=='') return this.e('Department is required')
			this.loading = true
        	const res = await this.callApi('post', 'app/admin/all_semester_courses/edit',this.edit_form)
			if(res.status==200){
				this.s('Semester Courses updated successfully!')
				this.editModal = false
				this.categoryData[this.editIndex].name = this.edit_form.name
				this.categoryData[this.editIndex].department = this.edit_form.department
				this.loading = false
			}
			else{
				this.swr();
			}
		},
		isEditOn(item,index){
			this.edit_form = _.clone(item) 
			this.editIndex = index
			this.editModal = true
		},
		//Delete
		async category_delete(id,index){
			if(!confirm("Are you sure to delete this Semester Courses")){
				return;
			}
			let ob = {
				id:id
			}
			this.loading = true
			const res = await this.callApi('post',`app/admin/all_semester_courses/delete`,ob)
			if(res.status == 200){
				this.i(' Semester Courses have been successfully Deleted!')
				this.categoryData.splice(index,1)
				this.pagination = res.data
				this.loading = false
			}
			else{
				this.swr();
			}
		},
		async getData(){
			this.loading = true
			const res = await this.callApi('get',`app/admin/all_semester_courses?semester=${this.filterSemester}`)
			if(res.status == 200){
				this.categoryData = res.data
			}
			else{
				this.swr();
			}
			this.loading = false
		}
		
	}, 

	async created(){
		await this.getData();

        const [course,batch,teacher,room] = await Promise.all([
            this.callApi('get','app/admin/all_course'),
            this.callApi('get','app/admin/all_semester'),
            this.callApi('get','app/admin/all_teachers'),
            this.callApi('get','app/admin/all_rooms'),
		]);
		if(course.status == 200 && teacher.status == 200 ){
			this.course_data = course.data;
			this.semester_data = batch.data;
			this.teacher_data = teacher.data;
			this.room_data = room.data;
		}
	}, 
	
}
</script>