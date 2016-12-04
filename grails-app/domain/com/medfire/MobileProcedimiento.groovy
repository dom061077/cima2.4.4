package com.medfire

class MobileProcedimiento {
    String descripcion
    String titulo
    
    String urlVideo
    static constraints = {
        descripcion(nullable:false,blank:false)
        titulo(nullable:false,blank:false)
        urlVideo(nullable:false,blank:false)
    }
}
