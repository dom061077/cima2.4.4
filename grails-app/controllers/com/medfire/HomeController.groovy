package com.medfire

class HomeController {
    def springSecurityService

    def index() {
        String view="index";
        if(!isNormal()){
            log.debug "En el home ingresa un dispositivo mobil"
            view="indexm"
        }
        def user = springSecurityService.getCurrentUser()

        render (view: view,model:[user:user])
    }
}
