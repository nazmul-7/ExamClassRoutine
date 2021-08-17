import Vue from 'vue'
import Vuex from 'vuex'
Vue.use(Vuex)

export default new Vuex.Store({
    state : {
        conuter : 1000, 
        pendingList : 0, 
        deleteModalObj : {
            showDeleteModal: false, 
            deleteUrl : '', 
            data : null,  
            deletingIndex: -1, 
            isDeleted : false,

        }, 
        user: false, 
    }, 
    getters: {
        getCounter(state){
           return state.conuter;
        }, 
        getPendingList(state){
           return state.pendingList;
        }, 
        getDeleteModalObj(state){
            return state.deleteModalObj;
        },
        getAuthUser (state) {
            return state.user;
          },
        

       

    },

    mutations: {
        changeTheCounter(state, data){
            state.conuter += data
        }, 
        setDeleteModal(state, data){
            const deleteModalObj = {
                showDeleteModal: false, 
                deleteUrl : '', 
                data : null, 
                deletingIndex: -1, 
                isDeleted : data,
            };
            state.deleteModalObj = deleteModalObj;
        },
        setDeletingModalObj(state, data){
            state.deleteModalObj = data;
        },
        setPendingList(state, data){
            state.pendingList = data;
        },
        updateUser(state, data){
            state.user = data;
        },
        setAuthInfo (state, data) {
            state.user = data;
          },
    }, 



    actions :{
        updateUser(state, data){
            state.user = data;
        },
        changeCounterAction({commit}, data){
            commit('changeTheCounter', data);
        },
        setPendingList({commit}, data){
            commit('setPendingList', data);
        },
        setAuthInfo ({ commit }, data) {
            commit('setAuthInfo', data);
          },
    }


})