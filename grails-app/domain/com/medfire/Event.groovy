package com.medfire

import com.medfire.enums.EstadoEvent
import com.medfire.security.Person

class Event {
	static auditable = true
	
	Date fechaStart
	Date fechaEnd
	Integer start
	Integer end
	String titulo
	boolean allDay
	boolean atendido
	EstadoEvent estado=EstadoEvent.EVENT_PENDIENTE
	Paciente paciente
	Profesional profesional
	User user
    Person person
    
	Consulta consulta
	Long tiempoAtencion
	boolean sobreTurno = false
	//static belongTo = [paciente:Paciente,profesional:User,user:User]
    static constraints = {
    	//start (unique:'profesional')
		start (unique:'paciente')
    	//end (unique:'profesional')
		end (unique:'paciente')
		paciente(nullable:true,blank:true)
		profesional(nullable:false,blank:false)
		user(nullable:true,blank:true)
        person(nullable: true, blank:true)
		consulta(nullable:true)
		tiempoAtencion(nullable:true,blank:true)
		titulo(blank:false)
		
    }
	
	static mapping = {
        //tiempoAtencion formula:"TIMESTAMPDIFF(MINUTE,fecha_start,fecha_end)"
        tiempoAtencion formula:"fecha_start-fecha_end"
	}
	
	
}
