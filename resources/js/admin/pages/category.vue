<template>
    <div>
      <div class="app-content  my-3 my-md-5">
		<div class="side-app">
			<div class="page-header">
				<h4 class="page-title">Data Tables</h4>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Tables</a></li>
					<li class="breadcrumb-item active" aria-current="page">Data Tables</li>
				</ol>
			</div>
			<div class="row">
				<div class="col-md-12 col-lg-12">
					<div class="card">
						<div class="card-header card_header_area">
							<div class="card-title">Category Data</div>
							<div class="card_add_data btn btn-primary" @click="addModal = true">
								Add Category
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
											<table id="example" class="table table-striped table-bordered dataTable no-footer" role="grid" aria-describedby="example_info">
												<thead>
													<tr role="row">
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Last name: activate to sort column ascending" style="width: 95px;">ID</th>
														<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;">Category Name</th>
														<!-- <th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;">Image</th> -->
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 101px;">Action</th>
													</tr> 
												</thead>
												<tbody>												
													<tr role="row" class="odd" v-for="(item,index) in categoryData" :key="index">
														<td>{{item.id}}</td>
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
			<Modal
				v-model="addModal" :mask-closable="false" :closable="false"
				title="Add Category"
				>
				<div class="card m-b-20">
					<div class="card-body">
						<form>
							<div class="form-group">
								<label class="form-label" for="exampleInputEmail1">Category Name</label>
								<input type="text" v-model="formItem.name" class="form-control" id="exampleInputname" placeholder="Enter Category Name">
							</div>
							<!-- <div class="form-group">
								<label class="form-label" for="exampleInputEmail1">Logo</label>
								<Upload
										type="drag"
										:with-credentials="true"
										:headers="crfObj"
										:on-success="handleImageUpload" 
										name="img"
										action="/uploadCategory">
										<div style="padding: 20px 0">
											<Icon type="ios-cloud-upload" size="52" style="color: #3399ff"></Icon>
											<p>Click or drag files here to upload</p>
										</div>
								</Upload>
								 <Card  span="10" offset="1" class="mt-3" v-if="formItem.image">
									<div style="text-align:center" class="image_up_show">
										<img  style="width: 100%;height: auto;" v-if="formItem.image" :src="formItem.image" >
									</div>
								</Card>
							</div> -->
						</form>
					</div>
				</div>
				<div slot="footer">
					<button type="submit" class="btn btn-info" @click="addModal=false">Close</button>
					<button type="submit" class="btn btn-primary" @click="add_category">Add Category</button>

				</div>
			</Modal>

			<Modal :mask-closable="false" :closable="false"
				v-model="editModal"
				title="Edit Category"
				>
				<div class="card m-b-20">
					<div class="card-body">
						<form>
							<div class="form-group">
								<label class="form-label" for="exampleInputEmail1">Category Name</label>
								<input type="text" v-model="edit_form.name" class="form-control" id="exampleInputname" placeholder="Enter Category Name">
							</div>
							<!-- <div class="form-group">
								<label class="form-label" for="exampleInputEmail1">Logo</label>
								<Upload
										type="drag"
										:headers="crfObj"
										:with-credentials="true"
										:on-success="handleEditImageUpload"
										name="img"
										action="/uploadCategory">
										<div style="padding: 20px 0">
											<Icon type="ios-cloud-upload" size="52" style="color: #3399ff"></Icon>
											<p>Click or drag files here to upload</p>
										</div>
								</Upload>
								<Card  span="10" offset="1" class="mt-3" v-if="edit_form.image">
									<div style="text-align:center" class="image_up_show">
										<img  style="width: 100%;height: auto;" v-if="edit_form.image" :src="edit_form.image" >
									</div>
								</Card>
							</div> -->
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
			},
			editIndex:-1,
			edit_form:{
				name:'',
			},
			categoryData:[],
			page:1,
			total:"10",
			pagination: {},
			loading:false,
			imgName:'',
			imageModal:false,

		}
	},

	methods : {
		async getpaginate(page = 1){
			const res  = await this.callApi('get',`app/all_category_pagi?page=${page}&total=${ parseInt(this.total)}`)
			if(res.status == 200){
				this.categoryData = res.data.data
				this.pagination = res.data
			}

			else{
				this.swr()
			}
		},
	    // async handleImageUpload(res, file) {
        //     if (res) {
        //         this.formItem.image = res.imageUrl
        //     }
		// },
		// async handleEditImageUpload(res, file) {
		// 	if (res) {
		// 		this.edit_form.image = res.imageUrl
		// 	}
		// },
    
		//Add
		async add_category(){
			if(this.formItem.name.trim()=='') return this.e('Category name is required')
			// if (this.formItem.image == null || this.formItem.image.trim() == "") return this.e('Category logo is required')
			this.loading = true
        	const res = await this.callApi('post',`app/add_category?total=${this.total}`,this.formItem)
			if(res.status==200){
				this.addModal=false
				this.s('Category added successfully!')
				this.categoryData = res.data.data
				this.pagination = res.data
				this.loading = false
				this.formItem={}
			}
			else{
				this.swr();
			}
		},
		//Edit
		async edit_category(){
			if(this.edit_form.name.trim()=='') return this.e('Category name is required')
			this.loading = true
        	const res = await this.callApi('post', 'app/edit_category',this.edit_form)
			if(res.status==200){
				this.s('Category updated successfully!')
				this.editModal = false
				this.categoryData[this.editIndex].name = this.edit_form.name
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
			if(!confirm("Are you sure to delete this Category")){
				return;
			}
			let ob = {
				id:id
			}
			this.loading = true
			const res = await this.callApi('post',`app/category_delete?total=${this.total}`,ob)
			if(res.status == 200){
				this.i(' Category have been successfully Deleted!')
				this.categoryData.splice(index,1)
				this.categoryData = res.data.data
				this.pagination = res.data
				this.loading = false
			}
			else{
				this.swr();
			}
		},
		// viewImage (item,index) {
		// 	this.imgName=item.image
		// 	this.imageModal = true;
		// },
		
	}, 

	async created(){
	   this.loading = true
       const res = await this.callApi('get',`app/all_category_pagi?total=${this.total}`)
		if(res.status == 200){
			this.categoryData = res.data.data
			this.pagination = res.data

		}
		else{
			this.swr();
		}
		this.loading = false
	}, 
	
}
</script>