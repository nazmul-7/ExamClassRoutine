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
							<div class="card-title">Orders</div>
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
											<table id="example" class="table card-table table-bordered table-hover table-vcenter text-nowrap" role="grid" aria-describedby="example_info">
												<thead>
													<tr role="row">
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Last name: activate to sort column ascending" style="width: 95px;">No</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Last name: activate to sort column ascending" style="width: 95px;">ID</th>
														<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;">Service</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 101px;">Price</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 101px;">Status</th>
														<th  class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 101px;">Customer</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 101px;">Action</th>
													</tr>
												</thead>
												<tbody>												
													<tr role="row" class="odd" v-for="(item,index) in orderData" :key="index">
														<td>{{index+1}}</td>
														<td>{{item.id}}</td>
														<td> <span v-if="item.service"> {{item.service.title}} </span></td>
														<td>${{item.price}}</td>
														<td>{{item.status}}</td>
														<td > <span v-if="item.customer">{{item.customer.name}} </span></td>
														<td>
															<button class="btn btn-primary" @click="isEditOn(item,index)">Edit</button>
															<button class="btn btn-info" @click="order_delete(item.id,index)">Delete</button>
															
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
				<h3 class="card-title">Add Order</h3>
			</div>
			<div class="card m-b-20">
				<div class="card-body">
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Service</label>
									<Select v-model="formItem.service_id"   >
										<Option v-for="item in serviceList" :value="item.id" :key="item.id">
											{{ item.title }} | {{ item.subTitle }} ( ${{ item.price }} )
										</Option>
									</Select> 
								</div>  
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Customer</label>
									<Select v-model="formItem.customer_id"  >
										<Option v-for="item in userList" :value="item.id" :key="item.id">
											{{ item.name }} | {{ item.email}}
										</Option>
									</Select>  
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1"> Status</label>
									<input type="text"  class="form-control" v-model="formItem.status"  placeholder="Status">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Price($)</label>
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
					<h3 class="card-title">Edit Order</h3>
				</div>
				<div class="card m-b-20">
					<div class="card-body">
						<form @submit.prevent>
							<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Service</label>
									<Select v-model="edit_form.service_id"   >
										<Option v-for="item in serviceList" :value="item.id" :key="item.id">
											{{ item.title }} | {{ item.subTitle }} ( ${{ item.price }} )  
										</Option>
									</Select> 
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Customer</label>
									<Select v-model="edit_form.customer_id"    >
										<Option v-for="item in userList" :value="item.id" :key="item.id">
											{{ item.name }} | {{ item.email }} 
										</Option>
									</Select> 
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Select Status</label>
									<input type="text"  class="form-control" v-model="edit_form.status"  placeholder="Status">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label class="form-label" for="exampleInputEmail1">Price($)</label>
										<InputNumber style="width:100%"  placeholder="$0.00" :max="100" :min="0" :formatter="value => `$${value}`"
										:parser="value => value.replace('$', '')"
										v-model="edit_form.price" >
										</InputNumber>
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
				customer_id:'',
				status:'Pending',
				service_id:'',
				price:0.00,
			},
			editIndex:-1,
 			edit_form:{
				id:-1,
				customer_id:'',
				status:'',
				service_id:'',
				price:0.00
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
					const res = await this.callApi('get',`app/getAllOrder?page=${this.page}&email=${this.filterField}`)
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
			const res  = await this.callApi('get',`app/getAllOrder?page=${page}&total=${ parseInt(this.total)}`)
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
			if(!this.formItem.service_id) return this.e('Service is required')
			if(!this.formItem.customer_id) return this.e('customer is required')
			if(this.formItem.status.trim()=='') return this.e('Status is required')
			if(this.formItem.price < 0) return this.e('Please give a valid price')
			this.loading = true
        	const res = await this.callApi('post',`app/storeOrder`,this.formItem)
			if(res.status==200){
				this.addModal=false
				this.s('Order added successfully!')
				this.orderData.unshift(res.data);
				this.loading = false
				this.formItem={
					customer_id:'',
                    status:'Pending',
                    service_id:'',
                    price:0.00
				}
				this.pagesList = []
			}
			else{
				this.swr();
			}
		},		 
		//Delete
		async order_delete(id,index){
			if(!confirm("Are you sure to delete this order")){
				return;
			}
			let ob = {
				id:id
			}
			this.loading = true
			const res = await this.callApi('post',`app/delete_Order?total=${this.total}`,ob)
			if(res.status == 200){
				this.i('Order has been deleted successfully!')
				this.orderData.splice(index,1)
				this.loading = false
			}
			else{
				this.swr();
			}
		},
	 
		async getAllData(){
			this.loading = true
			const res = await this.callApi('get',`app/getAllOrder?total=${this.total}`)
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
			this.edit_form.customer_id = this.orderData[index].customer_id
			this.edit_form.status = this.orderData[index].status
			this.edit_form.service_id = this.orderData[index].service_id
			this.edit_form.price = this.orderData[index].price
		},
		async order_edit(){
			if(!this.edit_form.service_id) return this.e('Service is required')
			if(!this.edit_form.customer_id) return this.e('Customer is required')
			if(this.edit_form.status.trim()=='') return this.e('Status is required')
			if(this.edit_form.price < 0) return this.e('Please give a valid price')
			this.loading = true
        	const res = await this.callApi('post',`app/editOrder`,this.edit_form)
			if(res.status==200){
				this.editModal=false
				this.s('Order updated successfully!')
				this.orderData[this.editIndex] =  res.data
				this.loading = false
				this.edit_form={
					id:-1,
					customer_id:'',
                    status:'',
                    service_id:'',
                    price:0.00
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
		const [res1, res2] = await Promise.all([ 
 			 	this.callApi('get','app/all_user'),
 			 	this.callApi('get','app/all_service'),
			])  
			if(res1.status == 200 && res2.status == 200) {
                 this.userList= res1.data
                 this.serviceList= res2.data
			}
			else{
				this.swr()
			}
		this.loading = false
	}, 
	
}
</script>

<style>