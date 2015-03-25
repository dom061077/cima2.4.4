package com.medfire

class HomeController {

    def index() {
        String view="index";
        if(!isNormal()){
            log.debug "En el home ingresa un dispositivo mobil"
            view="indexm"
        }
        render view: view
    }
}
