package com.medfire

import com.medfire.enums.EstadoConsultaEnum
import java.sql.Date

class Consulta {
	static auditable = true
	
	Date fechaConsulta = new java.sql.Date((new java.util.Date()).getTime())
	Date fechaAlta = new java.sql.Date((new java.util.Date()).getTime())
	String contenido
	Cie10 cie10
	Profesional profesional
	Paciente paciente
	EstadoConsultaEnum estado
	Event evento

	//examen fisico	
	String pulso
	String fc
	String ta
	String fr
	String taxilar
	String trectal
	String pesoh
	String pesoa
	String impresion
	String habito
	String actitud
	String ubicacion
	String marcha
	String psiqui
	String facie
	Institucion institucion
	
	

	
	static belongsTo = [paciente:Paciente]
	
	static hasMany = [prescripciones:Prescripcion,estudios:EstudioComplementario]
	
    static constraints = {
                fechaConsulta(nullable:false,blank:false)
		cie10(nullable:true,blank:true)
		contenido(blank:false)
		estudios validator: {
			it?.every { it?.validate() }
		}
		evento(nullable:true)

                pulso(nullable:true,blank:true)
                fc(nullable:true,blank:true)
                ta(nullable:true,blank:true)
                fr(nullable:true,blank:true)
                taxilar(nullable:true,blank:true)
                trectal(nullable:true,blank:true)
                pesoh(nullable:true,blank:true)
                pesoa(nullable:true,blank:true)
                impresion(nullable:true,blank:true)
                habito(nullable:true,blank:true)
                actitud(nullable:true,blank:true)
                ubicacion(nullable:true,blank:true)
                marcha(nullable:true,blank:true)
                psiqui(nullable:true,blank:true)
                facie(nullable:true,blank:true)
        
    }
	
	static mapping = {
		contenido type: "text"
		impresion type:"text"
		paciente lazy:false
		cie10 lazy:false
		profesional lazy:false
		prescripciones lazy:false
		estudios sort:'secuencia'
	}
	
	
	
	
}
