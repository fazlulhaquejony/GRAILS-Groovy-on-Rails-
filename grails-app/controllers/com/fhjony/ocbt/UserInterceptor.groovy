package com.fhjony.ocbt


class UserInterceptor {
    AuthenticationService authenticationService

    boolean before() {
        if(authenticationService.isAdministratorMember()){
            return  true
        }
        flash.message = AppUtil.infoMessage("You have no permission to Login", false)
        redirect(controller: "dashboard", action:"index")
        return false
    }
}
