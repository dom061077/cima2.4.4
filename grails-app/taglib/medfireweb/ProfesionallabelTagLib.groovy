package medfireweb

import com.medfire.User
import com.medfire.security.Person;


class ProfesionallabelTagLib {
	def springSecurityService
	
	def antecedenteLabel = { attrs ->
		def fieldLabel = attrs.field
		def userInstance = Person.load(springSecurityService.getCurrentUser().id)//User.get(springSecurityService.getCurrentUser().id)
		def value = userInstance?.profesionalAsignado?.antecedenteLabel?."${fieldLabel}"
		if(value){
			if(attrs.url)
				out << response.encodeURL('/'+value)
			else	
				out << response.encodeURL(value)
		}
		
 	 
	}
}
