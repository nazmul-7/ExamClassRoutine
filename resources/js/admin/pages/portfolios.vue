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
							<div class="card-title">Portfolios</div>
							<div class="d-flex">
								<div id="example_filter" class="dataTables_filter dataTables_filter_up mr-5">
									<!-- <label><input type="search" class="form-control form-control-sm" v-model="filterField" @change="searchByEmail"   placeholder="Search" aria-controls="example">
									<button class="btn btn-primary" @click="searchByEmail"><i class="fa fa-search"></i></button>
									</label> -->
								</div>
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
											<table id="example" class="table card-table table-bPortfolioed table-hover table-vcenter text-nowrap" role="grid" aria-describedby="example_info">
												<thead>
													<tr role="row">
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Last name: activate to sort column ascending" style="width: 95px;">No</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Last name: activate to sort column ascending" style="width: 95px;">Image</th>
														<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;">Title</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 101px;">Description</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 101px;">Action</th>
													</tr>
												</thead>
												<tbody>												
													<tr role="row" class="odd" v-for="(item,index) in portfolioData" :key="index">
														<td>{{index+1}}</td>
														<td>
                                                            <span v-if="item.image"><img @click="showImageModal(index)" class="image" :src="item.image" alt="image"></span>
                                                            <span v-else><img class="image" src="/img/why.png"   alt="Image"></span>
                                                        </td>
  														<td>{{item.title}}</td>
                                                        <td>
                                                            <span class="length" v-if="item.description.length<=70">{{item.description}}</span> 
                                                            <a class="length" @click="showDetailsModal(index)" v-else >{{item.description.substring(0, 70)}}....  More</a>
                                                        </td>
 														<td>
															<button class="btn btn-primary" @click="isEditOn(item,index)">Edit</button>
                                                            <button class="btn btn-info" @click="portfolio_delete(item.id,index)">Delete</button>
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
		<Modal width="500" v-model="addModal" :mask-closable="false"  :closable="false" >
			<div class="card-header">
				<h3 class="card-title">Add Portfolio</h3>
			</div>
			<div class=" m-b-20">
				<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Title</label>
									 <input type="text"  class="form-control" v-model="formItem.title"  placeholder="Title">
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1"> Description</label>
                                    <Input v-model="formItem.description" type="textarea" :autosize="{ minRows: 10,maxRows: 20}" placeholder="Description "/>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Image</label>
                                    <div v-if="formItem.image" class="img_class">
                                        <img class="uploadedImage"  :src="formItem.image" alt="Image">
                                        <div class="button">
                                            <button class="btn btn-info" @click="formItem.image = ''"> Change Image </button>
                                        </div>
                                    </div>
                                    <div v-else>
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
                                    </div>
										
								</div>
							</div>
						</div>
				</div>
			</div>
			<div slot="footer">
					<button type="submit" v-if="loading == false" class="btn btn-primary" @click="Portfolio_add">Add </button>
					<button type="submit" v-else disabled class="btn btn-primary" @click="Portfolio_add">Adding.. </button>
				    <button type="submit" class="btn btn-info" @click="addModal = false">Close </button>
			</div>
		</Modal>
		<Modal width="720" v-model="editModal" :closable="false" :mask-closable="false" >
				<div class="card-header">
					<h3 class="card-title">Edit Portfolio</h3>
				</div>
				<div class="card m-b-20">
					<div class="card-body">
						<form @submit.prevent>
							<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Title</label>
									 <input type="text"  class="form-control" v-model="edit_form.title"  placeholder="Title">
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1"> Description</label>
                                    <Input v-model="edit_form.description" type="textarea" :autosize="{ minRows: 10,maxRows: 20}" placeholder="Description "/>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Image</label> 
                                    <div v-if="edit_form.image" class="img_class">
                                        <img class="uploadedImage"  :src="edit_form.image" alt="Image">
                                        <div class="button">
                                            <button class="btn btn-info" @click="edit_form.image = ''"> Change Image </button>
                                        </div>
                                    </div>
                                    <div v-else>
                                            <Upload
                                                type="drag"
                                                :with-credentials="true"
                                                :headers="crfObj"
                                                :on-success="handleImageEdit" 
                                                name="img"
                                                action="/uploadCategory">
                                                <div style="padding: 20px 0">
                                                <Icon type="ios-cloud-upload" size="52" style="color: #3399ff"></Icon>
                                                <p>Click or drag files here to upload</p>
                                            </div>
                                        </Upload>
                                    </div>
								</div>
							</div>
							</div>
						</form>
					</div>
				</div>
				<div slot="footer">
					<button type="submit" v-if="loading == false" class="btn btn-primary" @click="Portfolio_edit">Update </button>
					<button type="submit" class="btn btn-primary" v-else disabled >Updating.. </button>
					<button type="submit" class="btn btn-info" @click="editModal = false">Close </button>
				</div>
	    </Modal>
        <Modal v-model="detailsModal" width="600" :mask-closable="false" :closable="false">
			<p slot="header" style="color:#ddd;text-align:center">
				<Icon type="close"></Icon> Details
			</p>
			<div style="text-align:center">
				<p v-if="portfolioData[editIndex]">{{ portfolioData[editIndex].description }}</p>
			</div>
			<div slot="footer">
				<Button type="success" long @click="detailsModal=false">Close</Button>
			</div>
		</Modal>
		</div>
    </div>
</template>
<script>
export default {
	data(){
		return {
			userList:[],
			serviceList:[],
			addModal:false,
            editModal:false,
     		detailsModal: false,
			formItem:{
				title:'',
				description:'',
				image:'',
 			},
			editIndex:-1,
 			edit_form:{
				id:-1,
				title:'',
				description:'',
				image:'',
			},
 			portfolioData:[],
			page:1,
			total:"10",
			pagination: {},
            loading:false,
            crfObj: {
                    'X-CSRF-TOKEN' : document.querySelector('meta[name="csrf-token"]')
                },			 
		}
	},
	methods : {
        async handleImageUpload(res, file) {
            if (res) {
				this.formItem.image = res.imageUrl
			}
		},
        async handleImageEdit(res, file) {
            if (res) {
				this.edit_form.image = res.imageUrl
			}
		},
       showDetailsModal(index){
            this.editIndex = index
            this.detailsModal = true
        },
         
		async searchByEmail(){
			if(this.filterField){
					const res = await this.callApi('get',`app/getAllPortfolio?page=${this.page}&email=${this.filterField}`)
					if(res.status == 200){
						this.portfolioData =  res.data.data;
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
		async getpaginate(page = 1){
			const res  = await this.callApi('get',`app/getAllPortfolio?page=${page}&total=${ parseInt(this.total)}`)
			if(res.status == 200){
				this.portfolioData = res.data.data
				this.pagination = res.data
			}
			else{
				this.swr()
			}
		},
		//Add
		async Portfolio_add(){ 
			if(this.formItem.title.trim()=='') return this.e('Title is required')
			if(this.formItem.description.trim()=='') return this.e('Description is required')
 			this.loading = true
        	const res = await this.callApi('post',`app/storePortfolio`,this.formItem)
			if(res.status==201){
				this.addModal=false
				this.s('Portfolio added successfully!')
				this.portfolioData.unshift(res.data);
				this.loading = false
				this.formItem={
					title:'',
                    description:'',
                    image:'',
				}
				this.pagesList = []
			}
			else{
				this.swr();
			}
		},		 
		//Delete
		async portfolio_delete(id,index){
			if(!confirm("Are you sure to delete this portfolio")){
				return;
			}
			let ob = {
				id:id
			}
			this.loading = true
			const res = await this.callApi('post',`app/delete_Portfolio`,ob)
			if(res.status == 200){
				this.i(' Portfolio has been deleted successfully!')
				this.portfolioData.splice(index,1)
 				this.loading = false
			}
			else{
				this.swr();
			}
		},
		async getAllData(){
			this.loading = true
			const res = await this.callApi('get',`app/getAllPortfolio?total=${this.total}`)
			if(res.status == 200){
				this.portfolioData = res.data.data
				delete res.data.data
				this.pagination = res.data
			}
			else{
				this.swr();
			}
			this.loading = false
		},
		isEditOn(item,index){
			this.editModal = true
            this.editIndex = index
			this.edit_form.id = this.portfolioData[index].id
			this.edit_form.title = this.portfolioData[index].title
			this.edit_form.description = this.portfolioData[index].description
			this.edit_form.image = this.portfolioData[index].image
 		},
		async Portfolio_edit(){
			if(this.edit_form.title.trim()=='') return this.e('Title is required')
			if(this.edit_form.description.trim()=='') return this.e('Description is required')
 			this.loading = true
        	const res = await this.callApi('post',`app/editPortfolio`,this.edit_form)
			if(res.status==200){
				this.editModal=false
				this.s('Portfolio updated successfully!')
				this.portfolioData[this.editIndex] =  res.data
				this.loading = false
				this.edit_form={
					id:-1,
					title:'',
                    description:'',
                    image:'',
				}
			}
			else{
				this.swr();
			}
		}
	}, 
	async created(){
	   this.loading = true
	  await this.getAllData()  
		this.loading = false
	}, 
	
}
</script>

<style>