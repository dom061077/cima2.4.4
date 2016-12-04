package com.medfire



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MobileProcedimientoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MobileProcedimiento.list(params), model:[mobileProcedimientoInstanceCount: MobileProcedimiento.count()]
    }

    def show(MobileProcedimiento mobileProcedimientoInstance) {
        respond mobileProcedimientoInstance
    }

    def create() {
        respond new MobileProcedimiento(params)
    }

    @Transactional
    def save(MobileProcedimiento mobileProcedimientoInstance) {
        if (mobileProcedimientoInstance == null) {
            notFound()
            return
        }

        
        
        if (mobileProcedimientoInstance.hasErrors()) {
            respond mobileProcedimientoInstance.errors, view:'create'
            return
        }

        mobileProcedimientoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'mobileProcedimiento.label', default: 'MobileProcedimiento'), mobileProcedimientoInstance.id])
                redirect mobileProcedimientoInstance
            }
            '*' { respond mobileProcedimientoInstance, [status: CREATED] }
        }
    }

    def edit(MobileProcedimiento mobileProcedimientoInstance) {
        respond mobileProcedimientoInstance
    }

    @Transactional
    def update(MobileProcedimiento mobileProcedimientoInstance) {
        if (mobileProcedimientoInstance == null) {
            notFound()
            return
        }

        if (mobileProcedimientoInstance.hasErrors()) {
            respond mobileProcedimientoInstance.errors, view:'edit'
            return
        }

        mobileProcedimientoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MobileProcedimiento.label', default: 'MobileProcedimiento'), mobileProcedimientoInstance.id])
                redirect mobileProcedimientoInstance
            }
            '*'{ respond mobileProcedimientoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MobileProcedimiento mobileProcedimientoInstance) {

        if (mobileProcedimientoInstance == null) {
            notFound()
            return
        }

        mobileProcedimientoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MobileProcedimiento.label', default: 'MobileProcedimiento'), mobileProcedimientoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'mobileProcedimiento.label', default: 'MobileProcedimiento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
