<template>
    <div>
     	<div class="app-content  my-3 my-md-5">
			<div class="side-app">
				<div class="page-header">
					<h4 class="page-title">Students</h4>
				</div>
				<div class="row">
					<div class="col-md-12 col-lg-12">
						<div class="card">
							<div class="card-header card_header_area">
								<div class="card-title">Students Data</div>
								
								<!-- <div class="card_add_data btn btn-primary" @click="addModal = true">
									Add Category
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
															<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Last name: activate to sort column ascending" style="width: 95px;">No</th>
															<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;">Name</th>
															<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 101px;">Student ID</th>
															<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 101px;">Email</th>
															<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 101px;">Phone</th>
															<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 101px;">Department</th>
															<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 101px;">Batch</th>
															<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 101px;">session</th>
														</tr>
													</thead>
													<tbody>												
														<tr role="row" class="odd" v-for="(item,index) in userData" :key="index">
															<td>{{index+1}}</td>
															<td>{{item.name}}</td>
															<td>{{item.studentId}}</td>
															<td>{{item.email}}</td>
															<td>{{item.phone}}</td>
															<td>{{item.department}}</td>
															<td>{{item.batch}}</td>
															<td>{{item.session}}</td>
 															<!-- <td>
																 <Select v-if="statusOn && index == editIndex" v-model="item.userType"  @on-change="userTypeChange(index)" :placeholder="item.userType" >
																	<Option value="User">User </Option> 
																	<Option value="Admin"> Admin</Option>  
                                 								</Select> 
															   <button v-else type="submit" @click="clickStatusOn(index)" :class="item.userType=='User'? 'btn btn-primary' : 'btn btn-success'" > <span class="fa fa-pencil" aria-hidden="true"></span> {{item.userType}}</button>
														   </td>
															<td>
																<button class="btn btn-info" @click="user_delete(item.id,index)">Delete</button>
															</td> -->
														</tr>
													</tbody>
												</table>
											</div>
										</div>								
									</div>
								</div>
								<!-- <div style="text-align:center;" class="pagination_div _mar_t30">
									<download-excel
										style="float: left;"
										:data="searchD" >
										<button class="card_add_data btn btn-primary" >Export as CSV</button>
									</download-excel>
								</div> -->
								<div style="text-align:center;" class="pagination_div _mar_t30">
									<Page :current="pagination.current_page" :total="pagination.total" @on-change="getpaginate" :page-size="parseInt(pagination.per_page)" />
								</div>
							</template>
							</div>
						</div>
						<!-- </div> -->
							<!-- table-wrapper -->
					</div>
					<!-- section-wrapper -->
				</div>
			</div>
		</div>
    </div>
</template>
<script>
export default {
	data(){
		return {
			userData:[],
			page:1,
			total:"10",
			userType:'',
			pagination: {},
			loading:false,
			statusOn:false,
			editIndex:-1,
			filterField:'',
			checkAll:false,
		}
	},
	computed: {
		searchD(){
			let data = []

			for(let d of this.userData){ 
				if(d.isSelected == true){
					let v = {
						name:d.name,
						email:d.email,
						userType:d.userType,
						phone:d.phone,
						address:d.address,
						city:d.city,
						state:d.state,
						zip:d.zip_code,
					}
					
					data.push(v)
				}
			}

			return data
			
		}
	},

	methods : {
		async searchByEmail(){
			if(this.filterField){
					const res = await this.callApi('get',`app/all_user_pagi?page=${this.page}&email=${this.filterField}`)
					if(res.status == 200){
						this.userData =  res.data.data;
						delete res.data.data
						this.pagination = res.data;
					}
					else{
						this.e('Oops!','Something went wrong, please try again!')
					}
			}
			else {
           		this.getAllData()
			}
		  },
		changeAll(){

			for(let d of this.userData){
				d.isSelected = this.checkAll
			}
		},
		async getpaginate(page = 1){
			const res  = await this.callApi('get',`app/all_user_pagi?page=${page}&total=${ parseInt(this.total)}&userType=Student`)
			if(res.status == 200){
				this.userData = res.data.data
				this.pagination = res.data
			}

			else{
				this.swr()
			}
		},
		clickStatusOn(index){
			this.statusOn = true
			this.editIndex=index
		},
		 async userTypeChange(index){
			this.editIndex= index
			this.editId = this.userData[index].id
			const res = await this.callApi("put", `app/user/${this.editId}`, {userType:this.userData[index].userType});
			if (res.status == 200) {
				this.statusOn = false

			}else if (res.data.message) {
				this.e(res.data.message);  
			} else{
				this.swr();
			}
		},
		//Delete
		async user_delete(id,index){
			if(!confirm("Are you sure to delete this User")){
				return;
			}
			let ob = {
				id:id
			}
			this.loading = true
			const res = await this.callApi('post',`app/user_delete?total=${this.total}`,ob)
			if(res.status == 200){
				this.i(' User have been successfully Deleted!')
				this.userData.splice(index,1)
				this.userData = res.data.data
				this.pagination = res.data
				this.loading = false
			}
			else{
				this.swr();
			}
		},
		async getAllData(){

			this.loading = true
			const res = await this.callApi('get',`app/all_user_pagi?total=${this.total}&userType=Student`)
			if(res.status == 200){
				for(let d of res.data.data){
					d.isSelected = false
				}
				this.userData = res.data.data
				this.pagination = res.data

			}
			else{
				this.swr();
			}
			this.loading = false
		}
		
	}, 

	async created(){
	   this.getAllData();
	}, 
	
}
</script>