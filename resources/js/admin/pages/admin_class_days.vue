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
								<div class="card-title">Class Days Data</div>
								<!-- <div class="card_add_data btn btn-primary" @click="addModal = true">
									Add Semester Courses
								</div> -->
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
															<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;">Day</th>
															<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;">Choose</th>
															<!-- <th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;">Image</th> -->
															<!-- <th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 101px;">Action</th> -->
														</tr> 
													</thead>
													<tbody>												
														<tr role="row" class="odd" v-for="(item,index) in daysOb" :key="index">
															<!-- <td>{{index+1}}</td> -->
															<td>{{item.day}}</td>
															<td> <Checkbox v-model="item.isSelected"></Checkbox></td>
															<!-- <td class="category_img"><img :src="item.image" alt=""></td> -->
														
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
                            <div class="card-header card_header_area">
								<!-- <div class="card-title">Semester Courses Data</div> -->
								<div class="card_add_data btn btn-primary" @click="add_category">
									Update
								</div>
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
            days:['Saturday','Sunday','Monday',"Tuesday",'Wednesday','Thusday','Friday'],
            daysOb:[],
			addModal:false,
			editModal:false,
			formItem:{
				semester_name:'', 
				course_name:'', 
				semester_id:'', 
				course_id:'', 
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
			page:1,
			total:"10",
			pagination: {},
			loading:false,
			imgName:'',
			imageModal:false,

		}
	},

	methods : {
    
		//Add
		async add_category(){

            let newDeptDays = [];
            for(let d  of this.daysOb){
                if(d.isSelected == true){
                    let ob = {
                        name:"CSE",
                        day:d.day
                    }
                    newDeptDays.push(ob)
                }
            }
            
			this.loading = true
        	const res = await this.callApi('post',`app/admin/admin_class_days/add`,{data:newDeptDays})
			if(res.status==200){
				this.addModal=false
				this.s('Class Days Updated successfully!')
				// this.categoryData.unshift(res.data)
				this.loading = false
				this.formItem={
					name:'',
					total:'',
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
        	const res = await this.callApi('post', 'app/admin/admin_class_days/edit',this.edit_form)
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
			const res = await this.callApi('post',`app/admin/admin_class_days/delete`,ob)
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
		
	}, 

	async created(){
	   this.loading = true
       const res = await this.callApi('get',`app/admin/admin_class_days`)
		if(res.status == 200){
			this.categoryData = res.data
		}
		else{
			this.swr();
        }

        for(let d of this.days){
            let ob = {
                'day':d,
                'isSelected':false
            }
            for(let t of this.categoryData){
                if( d == t.day ){
                    ob.isSelected = true;
                    break;
                }
            }
            this.daysOb.push(ob)
        }
        

        this.loading = false

        
        
        
	}, 
	
}
</script>