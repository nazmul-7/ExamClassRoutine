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
							<div class="card-title">Payment</div>
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
											<table id="example" class="table card-table table-bordered table-hover table-vcenter " role="grid" aria-describedby="example_info">
												<thead>
													<tr role="row">
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Last name: activate to sort column ascending" style="width: 60px;">No</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Last name: activate to sort column ascending" style="width: 60px;">ID</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Last name: activate to sort column ascending" style="width: 250px;">CUSTOMER NAME</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Last name: activate to sort column ascending" style="width: 250px;">COMPANY</th>
														<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 250px;">Description</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 100px;">Price</th>
														<th  class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 100px;">link</th>
														<th  class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 100px;">Click Count</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 100px;">Status</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 300px;">Action</th>
													</tr>
												</thead>
												<tbody>												
													<tr role="row" class="odd" v-for="(item,index) in orderData" :key="index">
														<td>{{index+1}}</td>
														<td>{{item.id}}</td>
														<td >{{item.customer_name}}</td>
														<td >{{item.company}}</td>
														<td >{{item.description}}</td>
														<td>${{item.price}}</td>
														<td ><a :href="item.link" target="_blank" >Click Here</a></td>
														<td >{{item.click_count}}</td>
														<td>{{item.status}}</td>
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
		<Modal width="720" v-model="addModal" :mask-closable="false"  :closable="false" >
			<div class="card-header">
				<h3 class="card-title">Add Payment</h3>
			</div>
			<div class="card m-b-20">
				<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Customer Name :</label>
									<input type="text"  class="form-control" v-model="formItem.customer_name"  placeholder="Customer Name">
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Company :</label>
									<input type="text"  class="form-control" v-model="formItem.company"  placeholder="Company">
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Description :</label>
										<Input v-model="formItem.description" type="textarea"  :autosize="{minRows: 5,maxRows: 7}" placeholder="Description..."></Input>
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Price($) :</label>
										<InputNumber style="width:100%"  placeholder="$0.00" :max="100" :min="0" :formatter="value => `$${value}`"
										:parser="value => value.replace('$', '')"
										v-model="formItem.price" >
										</InputNumber>
								</div>
							</div>
						</div>
				</div>
			</div>
			<div slot="footer">
					<button type="submit" v-if="loading == false" class="btn btn-primary" @click="Order_add">Add </button>
					<button type="submit" class="btn btn-primary" v-else disabled @click="Order_add">Adding.. </button>
				    <button type="submit" class="btn btn-info" @click="addModal = false">Close </button>
			</div>
		</Modal>
		<Modal width="720" v-model="editModal" :closable="false" :mask-closable="false" >
				<div class="card-header">
					<h3 class="card-title">Edit Payment</h3>
				</div>
				<div class="card m-b-20">
					<div class="card-body">
						<form @submit.prevent>
							<div class="row">
								<div class="col-md-12">
									<div class="form-group">
										<label class="form-label" for="exampleInputEmail1">Customer Name :</label>
										<input type="text"  class="form-control" v-model="edit_form.customer_name"  placeholder="Customer Name">
									</div>
								</div>
								<div class="col-md-12">
									<div class="form-group">
										<label class="form-label" for="exampleInputEmail1">Company :</label>
										<input type="text"  class="form-control" v-model="edit_form.company"  placeholder="Company">
									</div>
								</div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="form-label" for="exampleInputEmail1">Description :</label>
                                            <Input v-model="edit_form.description" type="textarea"  :autosize="{minRows: 5,maxRows: 7}" placeholder="Description..."></Input>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="form-label" for="exampleInputEmail1">Price($) :</label>
                                            <InputNumber style="width:100%"  placeholder="$0.00" :max="100" :min="0" :formatter="value => `$${value}`"
                                            :parser="value => value.replace('$', '')"
                                            v-model="edit_form.price" >
                                            </InputNumber>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="form-label" for="exampleInputEmail1">Link :</label>
                                        <input type="text" disabled v-model="edit_form.link" class="form-control" id="exampleInputname" placeholder="Sub Title">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="form-label" for="exampleInputEmail1">Status :</label>
                                        <input type="text" disabled v-model="edit_form.status" class="form-control" id="exampleInputname" placeholder="Sub Title">
                                    </div>
                                </div>
							</div>
						</form>
					</div>
				</div>
				<div slot="footer">
					<button type="submit" v-if="loading == false" class="btn btn-primary" @click="order_edit">Update </button>
					<button type="submit" class="btn btn-primary" v-else disabled @click="order_edit">Updating.. </button>
					<button type="submit" class="btn btn-info" @click="editModal = false">Close </button>
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
			formItem:{
				customer_name:'',
				company:'',
				description:'',
				price:0.00,
			},
			editIndex:-1,
 			edit_form:{
				customer_name:'',
				company:'',
				description:'',
				price:0.00,
			}, 
 			orderData:[],
			page:1,
			total:"10",
			pagination: {},
			loading:false,			 
		}
	},
	methods : {
		async searchByEmail(){
			if(this.filterField){
					const res = await this.callApi('get',`app/customOrders?page=${this.page}&email=${this.filterField}`)
					if(res.status == 200){
						this.orderData =  res.data.data;
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
			const res  = await this.callApi('get',`app/customOrders?page=${page}&total=${ parseInt(this.total)}`)
			if(res.status == 200){
				this.orderData = res.data.data
				this.pagination = res.data
			}
			else{
				this.swr()
			}
		},
		//Add
		async Order_add(){
			if(this.formItem.description.trim()=='') return this.e('Description is required')
			if(this.formItem.price < 0) return this.e('Please give a valid price')
			this.loading = true
        	let res = await this.callApi('post',`app/customOrders`,this.formItem)
			if(res.status==201){
				this.s('Order added successfully!')
				res.data.status = "Pending";
				res.data.click_count = 0
				this.orderData.unshift(res.data);
				this.addModal=false
				
				this.formItem={
					description:'',
				    price:0.00,
				}
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
			const res = await this.callApi('post',`app/delcustomOrders/${id}`,ob)
			if(res.status == 200){
				this.i(' order has been deleted successfully!')
				this.orderData.splice(index,1)
			}
			else{
                this.swr();
			}
				this.loading = false
		},
	 
		async getAllData(){
			this.loading = true
			const res = await this.callApi('get',`app/customOrders?total=${this.total}`)
			if(res.status == 200){
				this.orderData = res.data.data
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
			this.edit_form.id = this.orderData[index].id
			this.edit_form.customer_name = this.orderData[index].customer_name
			this.edit_form.company = this.orderData[index].company
			this.edit_form.description = this.orderData[index].description
			this.edit_form.link = this.orderData[index].link
			this.edit_form.status = this.orderData[index].status
			this.edit_form.price = parseFloat( this.orderData[index].price)
		},
		async order_edit(){
			if(this.edit_form.description.trim()=='') return this.e('Description is required')
			if(this.edit_form.price < 0) return this.e('Please give a valid price')
			this.loading = true
        	const res = await this.callApi('put',`app/customOrders`,this.edit_form)
			if(res.status==200){
				this.editModal=false
				this.s('Order updated successfully!')
				this.orderData[this.editIndex].description =  this.edit_form.description
				this.orderData[this.editIndex].price =  this.edit_form.price
				this.edit_form={
                    description:'',
				    price:0.00,
				}
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
	}, 
	
}
</script>

<style>