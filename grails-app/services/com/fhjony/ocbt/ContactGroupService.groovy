package com.fhjony.ocbt

import grails.gorm.transactions.Transactional
import grails.web.api.WebAttributes
import grails.web.servlet.mvc.GrailsParameterMap


@Transactional
class ContactGroupService implements WebAttributes {

    AuthenticationService authenticationService

    def save(def params) {
        ContactGroup contactGroup = new ContactGroup(params)
        contactGroup.user = authenticationService.getUser()
        def response = AppUtil.saveResponse(false, contactGroup)
        if (contactGroup.validate()) {
            response.isSuccess = true
            contactGroup.save()
        }
        return response
    }

    def update(ContactGroup contactGroup, GrailsParameterMap params) {
        contactGroup.properties = params
        def response = AppUtil.saveResponse(false, contactGroup)
        if (contactGroup.validate()) {
            response.isSuccess = true
            contactGroup.save()
        }
        return response
    }

    def get(Serializable id) {
        return ContactGroup.get(id)
    }

    def list(GrailsParameterMap params) {
        params.max = params.max?: GlobalConfig.itemPerPage()
        List<ContactGroup> contactGroupList = ContactGroup.createCriteria().list(params) {
            if (params?.colName || params?.colValue){
                like(params.colName, "%" +  params.colValue + "%")
            }
            if (!params.sort){
                order("id","desc")
            }
            eq("member", authenticationService.getMember())
        }
        return [list:contactGroupList, count:contactGroupList.totalCount]
    }


    def getGroupList(){
        return ContactGroup.createCriteria().list {
            eq("user", authenticationService.getMember())
        }
    }

    def cleanGroupContactById(Integer id){
        ContactGroup contactGroup = ContactGroup.get(id)
        contactGroup.contact.each {contact ->
            contact.removeFromContactGroup(contactGroup)
        }
        contactGroup.save()
    }


    def delete(ContactGroup contactGroup) {
        try {
            cleanGroupContactById(contactGroup.id)
            contactGroup.delete()
        } catch (Exception e) {
            println(e.getMessage())
            return false
        }
        return true
    }



}
