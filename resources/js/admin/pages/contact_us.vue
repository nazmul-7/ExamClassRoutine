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
							<div class="card-title"> Messages</div>
							<!-- <div class="card_add_data btn btn-primary" @click="addModal = true">
								Add reports
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
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Last name: activate to sort column ascending" style="width: 95px;">ID</th>
														<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;"> Name</th>
														<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;">Phone</th>
														<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;">Email</th>
														<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;">Services</th>
														<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;"> Message</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 101px;">Action</th>
													</tr> 
												</thead>
												<tbody>												
													<tr role="row" class="odd" v-for="(item,index) in msgList" :key="index">
														<td>{{item.id}}</td>
														<td>{{item.first_name}} {{ item.last_name }}</td>
														<td>{{item.phone}}</td> 
														<td>{{item.email}}</td>
														<td >
															<template v-if="item.categories.length>0">
																<span v-for="(item2,index2) in item.categories" :key="index2"> 
																	<span v-if="index2 == 0">
																		{{item.categories[index2].category_name.name}}
																	</span>
																	<span v-else>
																		,{{item.categories[index2].category_name.name}}
																	</span>
																</span>
															</template>
														</td>
														<td>
                                                            <span class="length" v-if="item.note.length<=20">{{item.note}}</span> 
                                                            <span class="length" @click="showDetailsModal(index)" v-else >{{item.note.substring(0, 20)}}....  More</span>
                                                        </td>
														<td>
															<button class="btn btn-info" @click="msg_delete(item.id,index)">Delete</button>
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
			 
		</div>
		<Modal v-model="detailsModal" width="600" :mask-closable="false" :closable="false">
			<p slot="header" style="color:#ddd;text-align:center">
				<Icon type="close"></Icon> Details
			</p>
			<div style="text-align:center">
				<p v-if="msgList[editIndex]">{{ msgList[editIndex].note }}</p>
			</div>
			<div slot="footer">
				<Button type="success" long @click="detailsModal=false">Close</Button>
			</div>
		</Modal>
    </div>
</template>


<script>

export default {
	data(){
		return {
     		detailsModal: false,
			addModal:false,
			editModal:false,
			formItem:{
				name:'',
				image:'',
			},
		 
			edit_form:{
				name:'',
				image:'',
			},
			msgList:[],
			page:1,
			total:"10",
			pagination: {},
			loading:false,
			filterField:'',
			editIndex:-1

		}
	},

methods : {
	showDetailsModal(index){
      this.editIndex = index
       this.detailsModal = true
    },
	async msg_delete(id,index){
		if(!confirm("Are you sure to delete this Message")){
			return;
		}
		this.loading = true
		const res = await this.callApi('delete',`app/msgDelete/${id}`)
		if(res.status == 200){
			this.i('Message has been deleted successfully !')
			this.msgList.splice(index,1)
			this.loading = false
		}
		else{
			this.swr();
		}
	},
	 async searchByEmail(){
        if(this.filterField){
                const res = await this.callApi('get',`app/contuct_us?page=${this.page}&product=${this.filterField}`)
                if(res.status == 200){
                    this.msgList =  res.data.data;
                    delete res.data.data
                    this.dataListPagination = res.data;
                }
                else{
                    this.e('Oops!','Something went wrong, please try again!')
                }
        }
         else {
           this.getAllData()
         }
      },
    getpaginate(page){
            this.page = page
            this.searchByEmail()
    },
		
	}, 

	async created(){
	   this.loading = true
       const res = await this.callApi('get',`app/contuct_us?page=${this.page}`)
		if(res.status == 200){
			this.msgList = res.data.data
			this.pagination = res.data

		}
		else{
			this.swr();
		}
		this.loading = false
	}, 
	
}
</script>