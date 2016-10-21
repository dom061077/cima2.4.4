package com.medfire



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MobileContenidoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MobileContenido.list(params), model:[mobileContenidoInstanceCount: MobileContenido.count()]
    }

    def show(MobileContenido mobileContenidoInstance) {
        respond mobileContenidoInstance
    }

    def create() {
        respond new MobileContenido(params)
    }

    @Transactional
    def save(MobileContenido mobileContenidoInstance) {
        if (mobileContenidoInstance == null) {
            notFound()
            return
        }

        if (mobileContenidoInstance.hasErrors()) {
            respond mobileContenidoInstance.errors, view:'create'
            return
        }

        mobileContenidoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'mobileContenido.label', default: 'MobileContenido'), mobileContenidoInstance.id])
                redirect mobileContenidoInstance
            }
            '*' { respond mobileContenidoInstance, [status: CREATED] }
        }
    }

    def edit() {
        def mobileContenidoInstance
        MobileContenido.list().each{
            mobileContenidoInstance = it
        }
        respond mobileContenidoInstance
    }

    @Transactional
    def update(MobileContenido mobileContenidoInstance) {
        if (mobileContenidoInstance == null) {
            notFound()
            return
        }

        if (mobileContenidoInstance.hasErrors()) {
            respond mobileContenidoInstance.errors, view:'edit'
            return
        }

        mobileContenidoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MobileContenido.label', default: 'MobileContenido'), mobileContenidoInstance.id])
                redirect mobileContenidoInstance
            }
            '*'{ respond mobileContenidoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MobileContenido mobileContenidoInstance) {

        if (mobileContenidoInstance == null) {
            notFound()
            return
        }

        mobileContenidoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MobileContenido.label', default: 'MobileContenido'), mobileContenidoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'mobileContenido.label', default: 'MobileContenido'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
