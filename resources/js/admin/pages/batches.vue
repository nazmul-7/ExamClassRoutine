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
								<div class="card-title">Batches Data</div>
								<div class="card_add_data btn btn-primary" @click="addModal = true">
									Add Batch
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
															<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Last name: activate to sort column ascending" style="width: 95px;">No</th>
															<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;">Batch Department</th>
															<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;">Batch Name</th>
															<!-- <th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;">Image</th> -->
															<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 101px;">Action</th>
														</tr> 
													</thead>
													<tbody>												
														<tr role="row" class="odd" v-for="(item,index) in categoryData" :key="index">
															<td>{{index+1}}</td>
															<td>{{item.department}}</td>
															<td>{{item.name}}</td>
															<!-- <td class="category_img"><img :src="item.image" alt=""></td> -->
															<td>
																<!-- <button class="btn btn-gray" @click="viewImage(item,index)">View Image</button> -->
																<button class="btn btn-primary" @click="isEditOn(item,index)">Edit</button>
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
			<Modal v-model="addModal" :mask-closable="false" :closable="false" title="Add New Batch">
				<div class="card m-b-20">
					<div class="card-body">
						<form>
							<div class="form-group">
								<label class="form-label" for="exampleInputEmail1">Batch Department</label>
                                <Select v-model="formItem.department"  placeholder="Please select a deparment" filterable>
                                    <Option v-for="(item,index) in department_data"  :key="index" :value="item.name" >{{item.name}}</Option>
                                </Select>
							</div>
							<div class="form-group">
								<label class="form-label" for="exampleInputEmail1">Batch Name</label>
								<input type="text" v-model="formItem.name" class="form-control" id="exampleInputname" placeholder="Enter Name">
							</div>
						</form>
					</div>
				</div>
				<div slot="footer">
					<button type="submit" class="btn btn-info" @click="addModal=false">Close</button>
					<button type="submit" class="btn btn-primary" @click="add_category">Add</button>

				</div>
			</Modal>

			<Modal :mask-closable="false" :closable="false" v-model="editModal"	title="Edit Batch">
				<div class="card m-b-20">
					<div class="card-body">
						<form>
							<div class="form-group">
								<label class="form-label" for="exampleInputEmail1">Batch Department</label>
                                <Select v-model="edit_form.department"  placeholder="Please select a deparment" filterable>
                                    <Option v-for="(item,index) in department_data"  :key="index" :value="item.name" >{{item.name}}</Option>
                                </Select>
							</div>
							<div class="form-group">
								<label class="form-label" for="exampleInputEmail1">Batch Name</label>
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
			addModal:false,
			editModal:false,
			formItem:{
				name:'', 
				department:'', 
			},
			editIndex:-1,
			edit_form:{
				name:'',
				id:'',
				department:'',
			},
			categoryData:[],
			department_data:[],
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
			if(this.formItem.name.trim()=='') return this.e('Name is required')
			if(this.formItem.department.trim()=='') return this.e('Department is required')
			this.loading = true
        	const res = await this.callApi('post',`app/admin/all_batch/add`,this.formItem)
			if(res.status==201){
				this.addModal=false
				this.s('Batch added successfully!')
				this.categoryData.unshift(res.data)
				this.loading = false
				this.formItem={
					name:'',
					department:'',
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
        	const res = await this.callApi('post', 'app/admin/all_batch/edit',this.edit_form)
			if(res.status==200){
				this.s('Batch updated successfully!')
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
			if(!confirm("Are you sure to delete this Batch")){
				return;
			}
			let ob = {
				id:id
			}
			this.loading = true
			const res = await this.callApi('post',`app/admin/all_batch/delete`,ob)
			if(res.status == 200){
				this.i(' Batch have been successfully Deleted!')
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
       const res = await this.callApi('get',`app/admin/all_batch`)
		if(res.status == 200){
			this.categoryData = res.data
		}
		else{
			this.swr();
		}
        this.loading = false

        const res1 = await this.callApi('get',`app/admin/all_department`)
		if(res1.status == 200){
			this.department_data = res1.data
		}
		else{
			this.swr();
		}
	}, 
	
}
</script>