package com.medfire.security

import com.medfire.Institucion
import com.medfire.Profesional

class Person {

	transient springSecurityService

	String username
    String userRealName
	String password
	boolean enabled = true
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

    String email

    boolean esProfesional=false


    Profesional profesionalAsignado
    Institucion institucion


	static transients = ['springSecurityService']

	static constraints = {
		username blank: false, unique: true
		password blank: false
        profesionalAsignado(blank:true, nullable:true,validator:{val,obj->
            if(obj.profesionalAsignado && !obj.esProfesional)
                return ['invalid.activation']
        })
        esProfesional(validator:{val,obj->
            if(obj.esProfesional && !obj.profesionalAsignado)
                return ['invalid.activation']
        })
	}

	static mapping = {
		password column: '`password`'

        profesionalAsignado lazy:false
        institucion lazy:false
        profesionalAsignado cascade:'none'
        institucion cascade:'none'

	}

	List<Authority> getAuthorities() {

        return PersonAuthority.getAuthorities(this)
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService?.passwordEncoder ? springSecurityService.encodePassword(password) : password
	}
}
