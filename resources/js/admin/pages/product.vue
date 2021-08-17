<template>
    <div>
      <div class="app-content  my-3 my-md-5">  
		<div class="side-app">
			<div class="page-header"> 
				<h4 class="page-title">Tables</h4>
				<ol class="breadcrumb">
					<li class="breadcrumb-item"><a href="#">Tables</a></li>
					<li class="breadcrumb-item active" aria-current="page">Data Tables</li>
				</ol>
			</div>
			<div class="row">
				<div class="col-md-12 col-lg-12">
					<div class="card">
						<div class="card-header card_header_area">
							<div class="card-title">Services</div>
							<div class="d-flex">
								<!-- <div id="example_filter" class="dataTables_filter dataTables_filter_up mr-5">
									<label><input type="search" class="form-control form-control-sm" v-model="filterField" @change="searchByEmail"   placeholder="Search" aria-controls="example">
									<button class="btn btn-primary" @click="searchByEmail"><i class="fa fa-search"></i></button>
									</label>
								</div> -->
								<div class="card_add_data btn btn-primary mar_b10" @click="addModal = true">
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
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Last name: activate to sort column ascending" style="width: 95px;">No</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Last name: activate to sort column ascending" style="width: 95px;">ID</th>
														<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 250px;">Title</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 200px;">Category</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 101px;">Price</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 101px;">Details</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 300px;">Action</th>
													</tr>
												</thead>
												<tbody>												
													<tr role="row" class="odd" v-for="(item,index) in ProductData" :key="index">
														<td>{{index+1}}</td>
														<td>{{item.id}}</td>
														<td>{{item.title}}</td>
														<td>{{item.categoryName}}</td>
														<td>${{item.price}}</td>
														<td><button class="btn btn-purple" @click="view_details(item,index)">View Details</button></td>
														<td>
															<button class="btn btn-primary" @click="isEditOn(item,index)">Edit</button>
															<button class="btn btn-info" @click="product_delete(item.id,index)">Delete</button>
														</td>
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
		<Drawer width="720" v-model="addModal" :mask-closable="false"  :closable="false"     class="ads_details_modal">
			<div class="card-header">
				<h3 class="card-title">Add New Service</h3>
			</div>
			<div class="card m-b-20">
				<div class="card-body">
					<form>
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Title</label>
									<input type="text" v-model="formItem.title" class="form-control" id="exampleInputname" placeholder="Title">
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Sub-Title</label>
									<input type="text" v-model="formItem.subTitle" class="form-control" id="exampleInputname" placeholder="Sub Title">
								</div>
							</div>
						
					
							<div class="col-md-6">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Category</label>
									<Select v-model="formItem.category_id" @on-change="selectCategory"  >
										<Option v-for="item in categoryData" :value="item.id" :key="item.id">
											{{ item.name }}
										</Option>
									</Select> 
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Price($)</label>
									<input type="number" step="0.01" v-model="formItem.price" class="form-control" id="exampleInputname" placeholder="Price">
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Duration</label>
									<input type="text" v-model="formItem.duration" class="form-control" id="exampleInputname" >
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Description</label>
										<Input v-model="formItem.description" type="textarea" :autosize="{minRows: 5,maxRows: 7}" placeholder="Description..."></Input>
								</div>
							</div>
							<!-- <div class="col-md-12">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Pages</label>
										<Input v-model="formItem.pages" type="textarea" :autosize="{minRows: 5,maxRows: 7}" placeholder="Description..."></Input>
								</div>
							</div> -->
							<!-- <div class="col-md-12">
								<Tag 
									v-for="(item, index) in pagesList"
									:key="index"
									:value="item.id"
									closable 
									@on-close="removeFromTheList(index)"
								>
									{{ item }}
								</Tag>
								<Button type="primary" size="small" @click="pageModal = true"> Add Page Info</Button> 
							</div> -->
						</div>  
					</form>
				</div>
			</div>
			<div class="demo-drawer-footer text-right">
				<button type="submit" v-if="loading == false" class="btn btn-primary" @click="service_add">Add </button>
				<button type="submit" v-else disabled class="btn btn-primary" @click="service_add">Adding.. </button>
				<button type="submit" class="btn btn-info" @click="addModal = false">Close </button>
			</div>
		</Drawer>
		<Drawer width="720" v-model="editNewModal" :closable="false" :mask-closable="false"  class="ads_details_modal">
				<div class="card-header">
					<h3 class="card-title">Edit Listing</h3>
				</div>
				<div class="card m-b-20">
					<div class="card-body">
						<form @submit.prevent>
							<div class="row">
									<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Title</label>
									<input type="text" v-model="edit_form.title" class="form-control" id="exampleInputname" placeholder="Title">
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Sub-Title</label>
									<input type="text" v-model="edit_form.subTitle" class="form-control" id="exampleInputname" placeholder="Sub Title">
								</div>
							</div>
						
							<div class="col-md-6">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Category</label>
									<Select v-model="edit_form.category_id" @on-change="selectCategory"  >
										<Option v-for="item in categoryData" :value="item.id" :key="item.id">
											{{ item.name }}
										</Option>
									</Select> 
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Price($)</label>
									<input type="number" step="0.01" v-model="edit_form.price" class="form-control" id="exampleInputname" placeholder="Price">
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Duration</label>
									<input type="text" v-model="edit_form.duration" class="form-control" id="exampleInputname" >
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Description</label>
										<Input v-model="edit_form.description" type="textarea" :autosize="{minRows: 5,maxRows: 7}" placeholder="Description..."></Input>
								</div>
							</div>
							<!-- <div class="col-md-12">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Pages</label>
										<Input v-model="edit_form.pages" type="textarea" :autosize="{minRows: 5,maxRows: 7}" placeholder="Description..."></Input>
								</div>
							</div> -->
							<!-- <div class="col-md-12">
								<Tag 
									v-for="(item, index) in pagesList"
									:key="index"
									:value="item.id"
									closable 
									@on-close="removeFromTheList(index)"
								>
									{{ item }}
								</Tag>
								<Button type="primary" :loading="loading" size="small" @click="pageModal = true"> Add Page Info</Button> 
							</div> -->
								
							</div>
						</form>
					</div>
				</div>
				<div class="demo-drawer-footer text-right">
					<button type="submit"  v-if="loading == false" class="btn btn-primary" @click="product_edit">Update </button>
					<button type="submit" v-else disabled class="btn btn-primary" @click="product_edit">Updating.. </button>
					<button type="submit" class="btn btn-info" @click="editNewModal = false">Close </button>
				</div>
	    </Drawer>
		<Drawer width="640" v-model="detailsModal" :closable="false" :mask-closable="false" class="ads_details_modal">
				<div class="card-header">
					<h3 class="card-title"> Details</h3>
				</div>
				<div class="demo-drawer-profile">
					<div class="card-body">
					<ul class="list-group">
						<li class="list-group-item list_group_item_rw">
							<span class="list_group_item_rw_title">Title</span>
							<span class="badgetext list_group_item_rw_text">{{dataDetails.title}}</span>
						</li>
						<li class="list-group-item list_group_item_rw">
							<span class="list_group_item_rw_title">Sub Title</span>
							<span class="badgetext list_group_item_rw_text">${{dataDetails.subTitle}}</span>
						</li>
						<li class="list-group-item list_group_item_rw">
							<span class="list_group_item_rw_title">Price</span>
							<span class="badgetext list_group_item_rw_text">
								{{ dataDetails.price }}</span>
						</li>
						<li class="list-group-item list_group_item_rw">
							<span class="list_group_item_rw_title">Category</span>
							<span class="badgetext list_group_item_rw_text">{{dataDetails.categoryName}}</span>
						</li>
						<li class="list-group-item list_group_item_rw">
							<span class="list_group_item_rw_title">Description</span>
							<span  class="badgetext list_group_item_rw_text">{{dataDetails.description}}</span>
						</li>   
						<!-- <li class="list-group-item list_group_item_rw">
							<span class="list_group_item_rw_title">Pages</span>
							<span  class="badgetext list_group_item_rw_text">{{dataDetails.pages}}</span>
						</li>    -->
						<!-- <li class="list-group-item list_group_item_rw">
							<span class="list_group_item_rw_title">Pages</span>
							<p v-if="dataDetails.pages">
								<span v-for="(item, index) in dataDetails.pages" :key="index"  class="badgetext list_group_item_rw_text">{{ item }}</span>
							</p>
							
						</li> -->
					</ul>   
				</div>
				</div>
					<div class="demo-drawer-footer text-right">
 					<button type="submit" class="btn btn-info" @click="detailsModal = false">Close </button>
				</div>
	    </Drawer>
		</div>
		<Modal  v-model="pageModal" width="500"   :closable="false">
            <p slot="header" style="color:#19be6b;text-align:center">
                <span>Add Page Info </span>
            </p>
            <div>  
				<Input v-model="tempPageModel" type="textarea" :autosize="{minRows: 3,maxRows: 5}" placeholder="Page Info..."></Input>
            </div> 
            <div slot="footer">
                <Button :loading="loading" v-if="editModal == true" type="success" @click="addOnEditList"  long >Add</Button>
                <Button :loading="loading" v-else type="success" @click="addOnAddList"  long >Add</Button>
            </div>
        </Modal>
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
			editNewModal:false,
			pageModal:false,
			visible:false,
			detailsModal:false,
			formItem:{
				category_id:'',
				categoryName:'',
				title:'',
				subTitle:'',
				price:0,
				description:'',
				duration:'',
				// pages:'',
			},
			uploadList:[],
			defaultList:[], 
			uploadListSizeOverFlow:false,
			editIndex:-1,
			editId:-1,
			edit_form:{
				id:-1,
				category_id:'',
				categoryName:'',
				title:'',
				subTitle:'',
				price:0,
				description:'',
				duration:'',
				// pages:'',
			},
			pagesList:[],
			ProductData:[],
			subcriptions:[],
			categoryData:[],
			breedData:[],
			animalTypeData:[],
			colourData:[],
			tagData:[],
			page:1,
			total:"10",
			pagination: {},
			loading:false,
			dataDetails:[],
			imageUrl:'',			
			imgName:'',			
			listMethod:true,
			statusOn:true,
			filterField:'',
 			tempPageModel:'',
		}
	},
	methods : {
		selectCategory(id){
			if(id == undefined) return;
			let index = this.categoryData.findIndex(d => d.id == id);
			this.formItem.categoryName = this.categoryData[index].name
			this.formItem.category_id = this.categoryData[index].id
			console.log(this.formItem.categoryName);
		},
		addOnAddList(){
			if(this.tempPageModel == "") return this.i("Please enter something..")
			this.pagesList.push(this.tempPageModel);
			this.tempPageModel = '';
			this.pageModal = false
		},
		addOnEditList(){
			if(this.tempPageModel == "") return this.i("Please enter something..")
			this.pagesList.push(this.tempPageModel);
			this.tempPageModel = '';
			this.pageModal = false
		}, 
		removeFromTheList(index){
			this.pagesList.splice(index,1);
		},
		// async searchByEmail(){
		// 	if(this.filterField){
		// 			const res = await this.callApi('get',`app/all_ads_pagi?page=${this.page}&email=${this.filterField}`)
		// 			if(res.status == 200){
		// 				this.ProductData =  res.data.data;
		// 				delete res.data.data
		// 				this.pagination = res.data;
		// 			}
		// 			else{
		// 				this.e('Oops!','Something went wrong, please try again!')
		// 			}
		// 	}
		// 	else {
		// 	this.getAllData()
		// 	}
		// },
		async getpaginate(page = 1){
			const res  = await this.callApi('get',`app/getAllService?page=${page}&total=${ parseInt(this.total)}`)
			if(res.status == 200){
				// for(let d of res.data.data){
				// 	if(d.pages) d.pages = JSON.parse(d.pages)
				// }
				this.ProductData = res.data.data
				this.pagination = res.data
			}

			else{
				this.swr()
			}
		},
		//Add
		async service_add(){
			if(this.formItem.title.trim()=='') return this.e('Title is required')
			if(this.formItem.subTitle.trim()=='') return this.e('Sub Title is required')
			if(this.formItem.categoryName.trim()=='') return this.e('Category  is required')
			if(this.formItem.description.trim()=='') return this.e('Description is required')
			// if(this.formItem.pages.trim()=='') return this.e('Pages is required')
			if(this.formItem.price < 0) return this.e('Please give a valid price')
			// if (this.pagesList == 0) {
            //   return this.i("Please add atleast one page Info");
			// }
			// let pp =  JSON.stringify(this.pagesList);
			// this.formItem.pages  = pp ;
			this.loading = true
        	let res = await this.callApi('post',`app/storeService`,this.formItem)
			if(res.status==201){
				this.addModal=false
				this.s('Service added successfully!')
				// res.data.pages = pp
				this.ProductData.unshift(res.data);
				this.loading = false
				this.formItem={
					category_id:'',
					categoryName:'',
					title:'',
					subTitle:'',
					price:0,
					description:'',
					// pages:'',
					duration:''
				}
				this.pagesList = []
			}
			else{
				this.swr();
				this.loading = false
			}
		},		 
		//Delete
		async product_delete(id,index){
			if(!confirm("Are you sure to delete this listing")){
				return;
			}
			let ob = {
				id:id
			}
			this.loading = true
			const res = await this.callApi('post',`app/delete_service?total=${this.total}`,ob)
			if(res.status == 200){
				this.i(' Listing has been deleted successfully!')
				this.ProductData.splice(index,1)
				this.ProductData = res.data.data
				this.pagination = res.data
				this.loading = false
			}
			else{
				this.swr();
				this.loading = false
			}
		},
		view_details(item,index){
			this.detailsModal=true
			this.dataDetails=item
		},
		async getAllData(){
			this.loading = true
			const res = await this.callApi('get',`app/getAllService?total=${this.total}`)
			if(res.status == 200){
				// for(let d of res.data.data){
				// 	if(d.pages) d.pages = JSON.parse(d.pages)
				// }
				this.ProductData = res.data.data
				// console.log(JSON.parse(this.ProductData[0].pages));
				
				
				delete res.data.data
				this.pagination = res.data
			}
			else{
				this.swr();
			}
			this.loading = false
		},
		isEditOn(item,index){
			this.editNewModal = true
			this.editIndex = index
			this.edit_form.id = this.ProductData[index].id
			this.edit_form.category_id = this.ProductData[index].category_id
			this.edit_form.categoryName = this.ProductData[index].categoryName
			this.edit_form.title = this.ProductData[index].title
			this.edit_form.subTitle = this.ProductData[index].subTitle
			this.edit_form.price = this.ProductData[index].price
			this.edit_form.description = this.ProductData[index].description
			// this.edit_form.pages = this.ProductData[index].pages
			this.pagesList = this.ProductData[index].pages
			this.edit_form.duration = this.ProductData[index].duration
		},
		async product_edit(){
			if(this.edit_form.title.trim()=='') return this.e('Title is required')
			if(this.edit_form.subTitle.trim()=='') return this.e('Sub Title is required')
			if(this.edit_form.categoryName.trim()=='') return this.e('Category  is required')
			if(this.edit_form.description.trim()=='') return this.e('Description is required')
			if(this.edit_form.price < 0) return this.e('Please give a valid price')
			if(this.edit_form.duration.trim() == '') return this.e('Duration is required')
			// if(this.edit_form.pages.trim() == '') return this.e('Pages is required')
			// if (this.pagesList == 0) {
            //   return this.i("Please add atleast one page Info");
			// }
			// let pp =  JSON.stringify(this.pagesList);
			// this.edit_form.pages  = pp ;
			this.loading = true
        	const res = await this.callApi('post',`app/editService`,this.edit_form)
			if(res.status==200){
				this.addModal=false
				this.s('Service added successfully!')
				this.ProductData[this.editIndex].category_id = this.edit_form.category_id
				this.ProductData[this.editIndex].categoryName = this.edit_form.categoryName
				this.ProductData[this.editIndex].title = this.edit_form.title
				this.ProductData[this.editIndex].subTitle = this.edit_form.subTitle
				this.ProductData[this.editIndex].price = this.edit_form.price
				this.ProductData[this.editIndex].category_id = this.edit_form.category_id
				// this.ProductData[this.editIndex].pages = this.edit_form.pages
				this.loading = false
				this.edit_form={
					id:-1,
					category_id:'',
					categoryName:'',
					title:'',
					subTitle:'',
					price:0,
					description:'',
					// pages:'',
					duration:''
				}
				this.pagesList = []
				this.editNewModal = false
			}
			else{
				this.swr();
				this.loading = false
			}
		}
	}, 
	async created(){
	   this.loading = true
	  await this.getAllData()   
		const [res1] = await Promise.all([ 
 			 	this.callApi('get','app/all_category'),
			])  
			if(res1.status == 200) {
				 this.categoryData= res1.data
				// this.pagesList = json_encode ( this.res1.data.pages );
				// console.log(this.pagesList)
				// JSON.parse(JSON.stringify(this.getLastChats));
			}
			else{
				this.swr()
			}
		this.loading = false
	}, 
	
}
</script>

<style>
    .demo-upload-list{
        display: inline-block;
        width: 120px;
        height: 120px;
        text-align: center;
        line-height: 60px;
        border: 1px solid transparent; 
        border-radius: 4px;
        overflow: hidden;
        background: #fff;
        position: relative;
        box-shadow: 0 1px 1px rgba(0,0,0,.2);
        margin-right: 4px;
    }
    .demo-upload-list img{
        width: 100%;
        height: 100%;
    }
    .demo-upload-list-cover{
        display: none;
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        background: rgba(0,0,0,.6);
    }
    .demo-upload-list:hover .demo-upload-list-cover{
        display: block;
    }
    .addImageClass{
        text-align:center
    }
    .addImageClass:hover .demo-upload-list-cover{
        display: block;
    }
    .demo-upload-list-cover i{
        color: #fff;
        font-size: 20px;
        cursor: pointer;
        margin: 0 2px;
    }
	._page_list{
		margin-top: 15px;
	}
	._page_list_item{
		margin-bottom: 10px;
    font-size: 16px;
	}
</style>