import grails.plugin.springsecurity.SpringSecurityUtils

class LogoutController {

    /**
     * Index action. Redirects to the Spring security logout uri.
     */
    def index = {
        // TODO put any pre-logout code here
        if (!isNormal()){
            log.debug "ES UN DISPOSITIVO MOVIL"
            //redirect(controller: "login", action: "auth")
        }
        log.debug "Cerrando sesion"
        log.debug "URL DE CERRADO DE SESION: "+SpringSecurityUtils.securityConfig.logout.filterProcessesUrl
        redirect uri: SpringSecurityUtils.securityConfig.logout.filterProcessesUrl // '/j_spring_security_logout'
    }
}
