<template>
<div class="page ">
			<div class="page-content z-index-10">
				<div class="container">
					<div class="row">  
						<div class="col-xl-4 col-md-12 col-md-12 d-block mx-auto">
							<div class="card mb-0">
								<div class="card-header">
									<h3 class="card-title">Registration</h3>
								</div>
								<div class="card-body">
									<div class="form-group">
										<label class="form-label text-dark">Registration as</label>
										<Select v-model="data.userType"  placeholder="Please select a type">
                                            <Option  value="Teacher" >Teacher</Option>
                                            <Option  value="Student" >Student</Option>
                                        </Select>
									</div>
                                    <template v-if="data.userType == 'Teacher'">
                                    	<div class="form-group">
                                            <label class="form-label text-dark">Name</label>
                                            <input type="text" v-model="data.name" class="form-control" placeholder="Enter Name">
                                        </div>
                                    	<div class="form-group">
                                            <label class="form-label text-dark">Phone no</label>
                                            <input type="text" v-model="data.mobile" class="form-control" placeholder="Enter...">
                                        </div>
                                    	<div class="form-group">
                                            <label class="form-label text-dark">Email address</label>
                                            <input type="email" v-model="data.email" class="form-control" placeholder="Enter email">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label text-dark">Designation</label>
                                            <input type="text" v-model="data.designation" class="form-control" placeholder="Enter...">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label text-dark">Department</label>
                                            <Select v-model="data.department"  placeholder="Please select a deparment" filterable>
                                                <Option v-for="(item,index) in department_data"  :key="index" :value="item.name" >{{item.name}}</Option>
                                            </Select>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label text-dark">Password</label>
                                            <input type="password" v-model="data.password"  class="form-control" id="exampleInputPassword1" placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label text-dark">Confirm Password</label>
                                            <input type="password" v-model="confirm_password"  class="form-control" id="exampleInputPassword1" placeholder="Password">
                                        </div>
                                    </template>
                                    <template v-else-if="data.userType == 'Student'">
                                        <div class="form-group">
                                            <label class="form-label text-dark">Name</label>
                                            <input type="text" v-model="data.name" class="form-control" placeholder="Enter Name">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label text-dark">Student ID</label>
                                            <input type="text" v-model="data.studentId" class="form-control" placeholder="Enter..">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label text-dark">Department</label>
                                            <Select v-model="data.department"  placeholder="Please select a deparment" filterable>
                                                <Option v-for="(item,index) in department_data"  :key="index" :value="item.name" >{{item.name}}</Option>
                                            </Select>
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label text-dark">Session</label>
                                            <Select v-model="data.batch"  placeholder="Please select a course" filterable>
                                                <Option v-for="(item,index) in batchByDept"  :key="index" :value="item.name" >{{item.name}}</Option>
                                            </Select>
                                        </div>
                                        <!-- <div class="form-group">
                                            <label class="form-label text-dark">Session</label>
                                            <input type="text" v-model="data.session" class="form-control" placeholder="Enter..">
                                        </div> -->
                                        <div class="form-group">
                                            <label class="form-label text-dark">Phone no</label>
                                            <input type="text" v-model="data.mobile" class="form-control" placeholder="Enter...">
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="form-label text-dark">Email address</label>
                                            <input type="email" v-model="data.email" class="form-control" placeholder="Enter email">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label text-dark">Password</label>
                                            <input type="password" v-model="data.password"  class="form-control" id="exampleInputPassword1" placeholder="Password">
                                        </div>
                                        <div class="form-group">
                                            <label class="form-label text-dark">Confirm Password</label>
                                            <input type="password" v-model="confirm_password"  class="form-control" id="exampleInputPassword1" placeholder="Password">
                                        </div>
                                    </template>
									<div class="form-footer mt-2">
                                        <Button class="btn btn-primary btn-block" type="primary" @click="login" :disabled="isLogging" :loading="isLogging">{{isLogging ? 'Please wait...' : 'Registration'}}</Button>
									</div>
									<div class="text-center  mt-3 text-dark">
										Already have account? <router-link to="/login">Login</router-link>
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
                password: '',
                mobile:'',
                name:'',
                userType:'',
                designation:'',
                department:'',
                batch:'',
                session:'',
                studentId:'',

            },
            confirm_password:'',
            isLogging: false,
			batch_data:[],
			department_data:[],
        }
    },
    computed:{
      batchByDept(){
          let arr = [];
        if(this.data.department){
            for(let d of this.batch_data){
                if(d.department == this.data.department){
                    arr.push(d)
                }
            }
        }
        else arr = this.batch_data

        return arr
      }  
    },

    methods : {
        async login(){

            if(this.data.userType.trim()=='') return this.e('Please Select a user type!')
            if(this.data.userType == "Teacher"){
                if(this.data.name.trim()=='') return this.e('Name is required')
                if(this.data.mobile.trim()=='') return this.e('Phone no is required')
                if(this.data.designation.trim()=='') return this.e('Designation is required')
                if(this.data.department.trim()=='') return this.e('Department is required')
                if(this.data.email.trim()=='') return this.e('Email is required')
                if(this.data.password.trim()=='') return this.e('Password is required')
                if(this.data.password.trim()!=this.confirm_password.trim()) return this.e('Confirm Password is not same!')
            }
            else if (this.data.userType == "Student"){

                if(this.data.name.trim()=='') return this.e('Name is required')
                if(this.data.studentId.trim()=='') return this.e('Student ID is required')
                if(this.data.department.trim()=='') return this.e('Department is required')
                if(this.data.batch.trim()=='') return this.e('Batch is required')
                // if(this.data.session.trim()=='') return this.e('Session is required')
                if(this.data.mobile.trim()=='') return this.e('Phone no is required')
                if(this.data.email.trim()=='') return this.e('Email is required')
                if(this.data.password.trim()=='') return this.e('Password is required')
                if(this.data.password.trim()!=this.confirm_password.trim()) return this.e('Confirm Password is not same!')

            }
            this.isLogging = true
            const res = await this.callApi('post', 'app/admin_registration', this.data)
            if(res.status===200){
                this.s(res.data.msg)
                window.location = '/'
            }else{
                if(res.status===401){
                    this.i(res.data.msg)
                }
                else if(res.status===422){
                    if(res.data.errors.email){
                        for(let e of res.data.errors.email  )
                            this.e(e);
                    }  
                    if(res.data.errors.password)
                    {
                        for(let e of res.data.errors.password  )
                            this.e(e);
                    } 
                }
                else{
                    this.swr()
                } 
            }
            this.isLogging = false
        }
    },
    async created(){
        const [department,batch] = await Promise.all([
			this.callApi('get','app/admin/all_department'),
			this.callApi('get','app/admin/all_batch'),
		]);
		if( department.status == 200 &&  batch.status == 200){
			this.batch_data = batch.data;
			this.department_data = department.data;
		}
    }
}
</script>





   