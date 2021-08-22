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
							<div class="card-title"> Notice</div>
							<div class="card_add_data btn btn-primary" @click="addModal = true">
								Add Notice
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
														<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;"> Title</th>
														<th class="wd-20p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending" style="width: 170px;">Notice</th>
														<th class="wd-15p sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending" style="width: 101px;">Action</th>
													</tr> 
												</thead>
												<tbody>												
													<tr role="row" class="odd" v-for="(item,index) in msgList" :key="index">
														<!-- <td>{{index + 1}}</td> -->
														<td>{{item.title}}</td>
														<td>{{item.note}}</td> 
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
		<Modal width="720" v-model="addModal" :mask-closable="false"  :closable="false" >
			<div class="card-header">
				<h3 class="card-title">Add</h3>
			</div>
			<div class="card m-b-20">
				<div class="card-body">
						<div class="row">
					
						
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" >Title</label>
									<input type="text"  class="form-control" v-model="formItem.title"  placeholder="Time Range">
									
								</div>
							</div>
							<div class="col-md-12">
								<div class="form-group">
									<label class="form-label" >Details</label>
									 <Input v-model="formItem.note" type="textarea" :autosize="{minRows: 2,maxRows: 5}" placeholder="Enter something..." />
								</div>
							</div>
						</div>
				</div>
			</div>
			<div slot="footer">
					<button type="submit" v-if="loading == false" class="btn btn-primary" @click="addItem">Add </button>
					<button type="submit" class="btn btn-primary" v-else disabled >Adding.. </button>
				    <button type="submit" class="btn btn-info" @click="addModal = false">Close </button>
			</div>
		</Modal>
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
				title:'',
				note:'',
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
		if(!confirm("Are you sure to delete this Notice")){
			return;
		}
		this.loading = true
		const res = await this.callApi('post',`app/admin/notice/delete`,{id:id})
		if(res.status == 200){
			this.i('Notice has been deleted successfully !')
			this.msgList.splice(index,1)
			this.loading = false
		}
		else{
			this.swr();
		}
	},
		async addItem(){
			if(this.formItem.title.trim()=='') return this.i('title is required')
			if(this.formItem.note.trim()=='') return this.i('note is required')

			this.loading = true
        	let res = await this.callApi('post',`app/admin/notice/add`,this.formItem)
			if(res.status==200 || res.status == 201){
				this.s('Notice added successfully!')
				this.msgList.unshift(res.data);
				this.addModal=false
				this.pagesList = []
			}
			else{
				this.swr();
            }
            
            this.loading = false
		},
	 async searchByEmail(){
        if(this.filterField){
                const res = await this.callApi('get',`app/admin/notice?page=${this.page}&product=${this.filterField}`)
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
       const res = await this.callApi('get',`app/admin/notice?page=${this.page}`)
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