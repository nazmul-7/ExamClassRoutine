<template>
   <div>
      <div class="app-content  my-3 my-md-5">
		<div class="side-app"> 
			 <div class="page-header">
                <h4 class="page-title">Edit Profile</h4>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="#">Pages</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Edit Profile</li>
                </ol>
            </div>
			<div class="row">
				 <div class="col-lg-4">
								<div class="card">
									<div class="card-header">
										<h3 class="card-title">My Profile</h3>

									</div>
									<div class="card-body">
										
											<div class="row mb-2">
												
												<div class="col">
													<h3 class="mb-1 "> {{profileData.name}}</h3>
													<p class="mb-4 ">{{profileData.userType}}</p>
													<button v-if="profileImageOn== false" type="submit" @click="profileImageOn = true" class="btn btn-primary" > Change Photo </button>
												</div>
											</div>
											 
											<div class="form-group">
												<label class="form-label">Current Password</label>
												<input type="password" v-model="passwordValue.currentPassword" class="form-control" value="password"/>
											</div>
											<div class="form-group">
												<label class="form-label">New Password</label>
												<input type="password" v-model="passwordValue.password" class="form-control" value="password"/>
											</div>
											<div class="form-group">
												<label class="form-label">Confirm Password</label>
												<input type="password" v-model="passwordValue.confirmPassword" class="form-control" value="password"/>
											</div>
											 
											<div class="form-footer">
												<button @click="passwordUpdate" v-if="loading == false" class="btn btn-primary btn-block">Save</button>
												<button disabled v-else class="btn btn-primary btn-block">Saving..</button>
											</div>
									</div>
								</div>
							</div>
							<div class="col-lg-8">
 									<div class="card-header">
										<h3 class="card-title">Edit Profile</h3>

									</div>
									<div class="card-body">
										<div class="row">
											 
											<div class="col-sm-6 col-md-5">
												<div class="form-group">
													<label class="form-label">Name</label>
													<input type="text" class="form-control" v-model="formValue.name" placeholder="Username" >
												</div>
											</div>
											<div class="col-sm-6 col-md-4">
												<div class="form-group">
													<label class="form-label">Email address</label>
 													<input type="email" class="form-control" v-model="formValue.email" placeholder="your-email@domain.com">
												</div>
											</div>
											<div class="col-sm-6 col-md-3">
												<div class="form-group">
													<label class="form-label">Contact Number</label>
 													<input type="text" class="form-control" v-model="formValue.mobile" placeholder="your-email@domain.com">
												</div>
											</div>
											<!-- <div class="col-md-12">
												<div class="form-group">
													<label class="form-label">Address</label>
													<input type="text" class="form-control" v-model="formValue.address" placeholder="Home Address" >
												</div>
											</div> -->
											<!-- <div class="col-sm-6 col-md-6">
												<div class="form-group">
													<label class="form-label">City</label>
													<input type="text" class="form-control" v-model="formValue.city" placeholder="City" >
												</div>
											</div> -->
											<!-- <div class="col-sm-6 col-md-6">
												<div class="form-group">
													<label class="form-label">State</label>
													<input type="text" class="form-control" v-model="formValue.state" placeholder="State" >
												</div>
											</div>  -->
										</div>
									</div>
									<div class="card-footer text-right">
										<button type="submit" v-if="loading == false" @click="infoUpdate" class="btn btn-primary">Update Profile</button>
										<button type="submit" v-else disabled class="btn btn-primary">Updating..</button>
									</div>
 							</div>
			</div>
		</div>
			 
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
			profileImageOn :true,
             formValue:{
				 name:'',
				 email:'',
				 mobile:'',
				 address:'',
 			 },
			 image:"",
             passwordValue:{
                    currentPassword: "",
                    password: "",
                    confirmPassword: "",
				},
				profileData:[],
				loading:false
 		}
	},

	methods : {
		async handleImageUpload(res, file) {
            if (res) {
				this.image = res.imageUrl
			}
			const res2 = await this.callApi(
				"put",
				`app/addProfilePicture/${this.profileData.id}`,
				{image:this.image}
       		 );
       		 if (res2.status == 200) {
 					this.s("Great!", "Image has been updated successfully!");
					this.profileImageOn= false
					// this.$store.dispatch("setAuthInfo", res2.data);
					this.$store.commit('setAuthInfo',(res2.data));

			} else {
			this.e("Oops!", "Something went wrong, please try again!");
			}
		},
		 
	 async passwordUpdate(){
     
      if (!this.passwordValue.currentPassword) return this.e("Current Password can not be empty! !");
      if (!this.passwordValue.password) return this.e("New Password can not be empty! !");
      if (!this.passwordValue.confirmPassword) return this.e("Confirm Password can not be empty! !");
      if (this.passwordValue.password != this.passwordValue.confirmPassword) return this.e("Password doesn't match! !");
	  this.loading = true
      const res = await this.callApi(
        "put",
        `app/adminPasswordUpdate/${this.profileData.id}`,
        this.passwordValue
      );
      if (res.status == 200) {
        this.passwordValue.currentPassword = ''
        this.passwordValue.password = ''
        this.passwordValue.confirmPassword = ''
        this.s("Great!", "Password has been updated successfully!");
      }
      else if (res.status == 422) {
        if (res.data.msg) {
          this.e(res.data.msg);
        }else if(res.data.password){
			this.e(res.data.password);
		}
      }
       else {
        this.e("Oops!", "Something went wrong, please try again!");
      }
	  this.loading = false
    },
    async infoUpdate() { 
    //   if (this.formValue.name.trim() == "") return this.e("Username can not be empty! !");
    //   if (this.formValue.email.trim() == "") return this.e("Email can not be empty! !");
	//   if (this.formValue.mobile.trim() == "") return this.e("Phone can not be empty! !");
	  this.loading = true
          const res = await this.callApi(
        "put",
        `app/adminInfoUpdate/${this.profileData.id}`,
        this.formValue
      );
      if (res.status == 200) {
         this.$store.dispatch("setAuthInfo", res.data);
         this.s("Great!", "Profile info has been updated successfully!");
      }else if (res.status == 422) {
        if (res.data.msg) {
          this.e(res.data.msg);
        }else if(res.data.email){
			this.e(res.data.email);
		}
      }
       else {
        this.e("Oops!", "Something went wrong, please try again!");
	  }
	  this.loading = false
    },
		
	}, 
	async created(){
        this.loading = true
        const res = await this.callApi('get',`app/profileData`)
		if(res.status == 200){
			this.profileData = res.data
			this.formValue.name = this.profileData.name
			this.formValue.email = this.profileData.email
			this.formValue.address = this.profileData.address
			this.formValue.phone = this.profileData.phone
			this.formValue.city = this.profileData.city
			this.formValue.state = this.profileData.state
		}
		else{
			this.swr();
		}
		this.loading = false
	     
	}, 
	
}
</script>