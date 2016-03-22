package com.medfire.security



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import com.medfire.util.GUtilDomainClass

@Transactional(readOnly = true)
class PersonController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        log.info "Index method"
        params.max = Math.min(max ?: 10, 100)
        respond Person.list(params), model:[personInstanceCount: Person.count()]
    }

    def show(Person personInstance) {
        respond personInstance
    }


    def create() {
        log.info "Mètodo create. Paràmetros: $params"

        def roles = Authority.list()
        //userInstance.properties = params
        //userInstance.enabled=true


        roles.sort { r1, r2 ->
            r1.authority <=> r2.authority
        }
        LinkedHashMap<Authority, Boolean> roleMap = [:]
        for (role in roles) {
            roleMap[(role)]=false
        }

        //respond new Person(params)
        return [personInstance: new Person(params),authorityList:roleMap]
    }

    @Transactional
    def save(Person personInstance) {
        log.info "Parametros: $params"
        if (personInstance == null) {
            notFound()
            return
        }

        def authorities = Authority.list()
        def cantAuthorities=0
        authorities.sort { r1, r2 ->
            r1.authority <=> r2.authority
        }
        LinkedHashMap<Authority, Boolean> authorityMap = [:]
        for (authority in authorities) {
            authorityMap[(authority)]=false
        }

        def authorityAux
        for (String key in params.keySet()) {
            if (key.contains('ROLE') && 'on' == params.get(key)) {
                authorityAux=Authority.findByAuthority(key)
                authorityMap[authorityAux]=true
                cantAuthorities++
            }
        }

        if (personInstance.hasErrors()) {

            respond personInstance.errors,model:[authorityList: authorityMap], view:'create'
            return
        }



        if(cantAuthorities>1){
            personInstance.validate()
            personInstance.errors.rejectValue("authorities","user.roles.exluyentes","Solo puede selecionar un Rol")
            render(view: "create", model: [personInstance: personInstance,authorityList:authorityMap])
            return
        }


        personInstance.save flush:true
        addAuthorities(personInstance)
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'person.label', default: 'Person'), personInstance.id])
                redirect personInstance
            }
            '*' { respond personInstance, [status: CREATED] }
        }
    }

    def edit(Person personInstance) {
        respond personInstance
    }


    def listjson = {
        log.info "INGRESANDO AL CLOSURE listjson DEL CONTROLLER UserController"
        log.info "PARAMETROS: ${params}"
        def gud = new GUtilDomainClass(Person,params,grailsApplication)
        def list=gud.listrefactor(false)
        def totalregistros=gud.listrefactor(true)

        def totalpaginas=new Float(totalregistros/Integer.parseInt(params.rows))
        if (totalpaginas>0 && totalpaginas<1)
            totalpaginas=1;
        totalpaginas=totalpaginas.intValue()


        log.debug "TOTAL USUARIOS: "+list.size()

        def result='{"page":'+params.page+',"total":"'+totalpaginas+'","records":"'+totalregistros+'","rows":['
        log.debug "CONSULTA DE USUARIOS: $list"
        def flagaddcomilla=false
        def urlimg
        list.each{

            if (flagaddcomilla)
                result=result+','


            result=result+'{"id":"'+it.id+'","cell":["'+it.id+'","'+(it.username==null?"":it.username)+'","'+it.institucion?.nombre+'","'+(it.userRealName==null?"":it.userRealName)+'","'+(it.enabled==null?"":(it.enabled==true?'SI':'NO'))+'","'+(it.esProfesional==null?"":it.esProfesional)/*+'","'+(it.email==null?"":it.email)*/+'","'+(it.profesionalAsignado?.nombre==null?"":it.profesionalAsignado?.nombre)+'"]}'

            flagaddcomilla=true
        }
        result=result+']}'
        render result

    }


    @Transactional
    def update(Person personInstance) {
        if (personInstance == null) {
            notFound()
            return
        }

        if (personInstance.hasErrors()) {
            respond personInstance.errors, view:'edit'
            return
        }

        personInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Person.label', default: 'Person'), personInstance.id])
                redirect personInstance
            }
            '*'{ respond personInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Person personInstance) {

        if (personInstance == null) {
            notFound()
            return
        }

        personInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Person.label', default: 'Person'), personInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'person.label', default: 'Person'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }


    private void addAuthorities(person) {
        log.info "INGRESANDO AL METODO PRIVADO addAuthorities"
        for (String key in params.keySet()) {
            if (key.contains('ROLE') && 'on' == params.get(key)) {
                log.debug "ROL AGREGADO: "+key
                def authority = Authority.findByAuthority(key)
                PersonAuthority.create(person,authority)
            }
        }
    }


}
