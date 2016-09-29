package com.medfire.mobile

import grails.converters.JSON
import com.medfire.MobileContenido
import com.medfire.MobileProcedimiento

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
    
    def procedimientos(){
        def procedimientos=[]
        //procedimientos.add(url:)
        def list = MobileProcedimiento.list()
        list.each{
            procedimientos.add(id:it.id,descripcion:it.descripcion
                ,titulo:it.titulo,urlVideo:it.urlVideo)
        }
        render procedimientos as JSON
    }
}
