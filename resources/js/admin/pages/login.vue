<template>
<div class="page ">
			<div class="page-content z-index-10">
				<div class="container">
					<div class="row">  
						<div class="col-xl-4 col-md-12 col-md-12 d-block mx-auto">
							<div class="card mb-0">
								<div class="card-header">
									<h3 class="card-title">Login to your Account</h3>
								</div>
								<div class="card-body">
									<div class="form-group">
										<label class="form-label text-dark">Email address</label>
										<input type="email" v-model="data.email" class="form-control" placeholder="Enter email">
									</div>
									<div class="form-group">
										<label class="form-label text-dark">Password</label>
										<input type="password" v-model="data.password"  class="form-control" id="exampleInputPassword1" placeholder="Password">
									</div>
									<div class="form-group">
										<!-- <label class="custom-control custom-checkbox">
											<a href="forgot-password.html" class="float-right small text-dark mt-1">I forgot password</a>
											<input type="checkbox" class="custom-control-input">
											<span class="custom-control-label text-dark">Remember me</span>
										</label> -->
									</div>
									<div class="form-footer mt-2">
                                        <Button class="btn btn-primary btn-block" type="primary" @click="login" :disabled="isLogging" :loading="isLogging">{{isLogging ? 'Loging...' : 'Login'}}</Button>

										<!-- <a href="index.html" class="btn btn-primary btn-block">SignIn</a> -->
									</div>
									<div class="text-center  mt-3 text-dark">
										
										Don't have account yet? <router-link to="/registration">Registration</router-link>
									</div>
								</div>
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
            data : {
                email : '', 
                password: ''
            }, 
            isLogging: false, 
        }
    }, 

    methods : {
        async login(){
            if(this.data.email.trim()=='') return this.e('Email is required')
            if(this.data.password.trim()=='') return this.e('Password is required')
            if(this.data.password.length < 6) return this.e('Incorrect login details')
            this.isLogging = true
            const res = await this.callApi('post', 'app/admin_login', this.data)
            if(res.status===200){
                this.s(res.data.msg)
                window.location = '/'
            }else{
                if(res.status===401){
                    this.i(res.data.msg)
                }else if(res.status==422){
                    for(let i in res.data.errors){
                        this.e(res.data.errors[i][0])
                    }
                }
                else{
                    this.swr()
                } 
            }
            this.isLogging = false
        }
    }
}
</script>





   