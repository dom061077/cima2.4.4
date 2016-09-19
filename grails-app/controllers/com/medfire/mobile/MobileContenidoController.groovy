package com.medfire.mobile

import grails.converters.JSON
import com.medfire.MobileContenido

class MobileContenidoController {

    def index() { }
    def quienesSomos(){
        def contenido=[:]
        def list = MobileContenido.list()
        list.each{
            contenido.quienessomos = it.quienesSomos
        }
        render contenido as JSON
    }
}
