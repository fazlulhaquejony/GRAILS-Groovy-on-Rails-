package com.fhjony.ocbt

import grails.gorm.transactions.Transactional
import grails.web.api.WebAttributes
import grails.web.servlet.mvc.GrailsParameterMap


@Transactional
class UserService implements WebAttributes {

    def save(GrailsParameterMap params) {
        User member = new User(params)
        def response = AppUtil.saveResponse(false, user)
        if (user.validate()) {
            user.save(true)
            if (!user.hasErrors()){
                response.isSuccess = true
            }
        }
        return response
    }


    def update(User user, GrailsParameterMap params) {

        user.properties = params
        def response = AppUtil.saveResponse(false, user)
        if (user.validate()) {
            user.save(flush: true)
            if (!user.hasErrors()){
                response.isSuccess = true
            }
        }
        return response
    }


    def getById(Serializable id) {
        return user.get(id)
    }


    def list(GrailsParameterMap params) {
        params.max = params.max ?: GlobalConfig.itemPerPage()
        List<User> userList = User.createCriteria().list(params) {
            if (params?.colName || params?.colValue) {
                like(params.colName, "%" + params.colValue + "%")
            }
            if (!params.sort) {
                order("id", "desc")
            }
        }
        return [list: userList, count: userList.totalCount]
    }


    def delete(User user) {
        try {

            user.delete(flush: true,failOnError:true)
        } catch (Exception e) {
            println(e.getMessage())
            return false
        }
        return true
    }
}
