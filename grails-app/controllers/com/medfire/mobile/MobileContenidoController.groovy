package com.medfire.mobile

import grails.converters.JSON
import com.medfire.MobileContenido
import com.medfire.MobileProcedimiento
import java.util.regex.Pattern;
import java.util.regex.Matcher;

class MobileContenidoController {

    def index() { }
    def quienesSomos(){
        def contenido=[:]
        def list = MobileContenido.list()
        list.each{
            contenido.quienessomos = it.quienesSomos
            contenido.soyCandidato = it.soyCandidato
        }
        render contenido as JSON
    }
    
    def procedimientos(){
        def procedimientos=[]
        //procedimientos.add(url:)
        def list = MobileProcedimiento.list()
        

        String pattern = "(?<=watch\\?v=|/videos/|embed\\/)[^#\\&\\?]*";

        Pattern compiledPattern = Pattern.compile(pattern);
        list.each{
             Matcher matcher = compiledPattern.matcher(it.urlVideo);
             String vId = null;
             if(matcher.find()){
                vId= matcher.group();
             }        
             procedimientos.add(id:it.id,descripcion:it.descripcion
                ,titulo:it.titulo,urlVideo:'http://www.youtube.com/embed/'+vId+'?rel=0'
                ,urlVideoImg:'http://img.youtube.com/vi/'+vId+'/default.jpg');
        }
        render procedimientos as JSON
    }
}
