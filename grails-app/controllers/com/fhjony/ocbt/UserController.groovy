package com.fhjony.ocbt

class UserController {

    UserService userService

    def index() {
        def response = userService.list(params)
        [memberList: response.list, total:response.count]
    }

    def details(Integer id) {
        def response = userService.getById(id)
        if (!response){
            redirect(controller: "user", action: "index")
        }else{
            [user: response]
        }
    }

    def create() {
        [user: flash.redirectParams]
    }

    def save() {
        def response = userService.save(params)
        if (!response.isSuccess) {
            flash.redirectParams = response.model
            flash.message = AppUtil.infoMessage(g.message(code: "unable.to.save"), false)
            redirect(controller: "user", action: "create")
        }else{
            flash.message = AppUtil.infoMessage(g.message(code: "saved"))
            redirect(controller: "user", action: "index")
        }
    }


    def edit(Integer id) {
        if (flash.redirectParams) {
            [user: flash.redirectParams]
        } else {
            def response = userService.getById(id)
            if (!response) {
                flash.message = AppUtil.infoMessage(g.message(code: "invalid.entity"), false)
                redirect(controller: "user", action: "index")
            } else {
                [user: response]
            }
        }
    }


    def update() {
        def response = userService.getById(params.id)
        if (!response){
            flash.message = AppUtil.infoMessage(g.message(code: "invalid.entity"), false)
            redirect(controller: "user", action: "index")
        }else{
            response = userService.update(response, params)
            if (!response.isSuccess){
                flash.redirectParams = response.model
                flash.message = AppUtil.infoMessage(g.message(code: "unable.to.update"), false)
                redirect(controller: "user", action: "edit")
            }else{
                flash.message = AppUtil.infoMessage(g.message(code: "updated"))
                redirect(controller: "user", action: "index")
            }
        }
    }

    def delete(Integer id) {
        def response = userService.getById(id)
        if (!response){
            flash.message = AppUtil.infoMessage(g.message(code: "invalid.entity"), false)
            redirect(controller: "member", action: "index")
        }else{
            response = userService.delete(response)
            if (!response){
                flash.message = AppUtil.infoMessage(g.message(code: "unable.to.delete"), false)
            }else{
                flash.message = AppUtil.infoMessage(g.message(code: "deleted"))
            }
            redirect(controller: "user", action: "index")
        }
    }



}
