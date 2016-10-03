
<%@ page import="com.medfire.MobileProcedimiento" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'mobileProcedimiento.label', default: 'MobileProcedimiento')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'mobileProcedimiento.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="descripcion" title="${message(code: 'mobileProcedimiento.descripcion.label', default: 'Descripcion')}" />
                        
                            <g:sortableColumn property="titulo" title="${message(code: 'mobileProcedimiento.titulo.label', default: 'Titulo')}" />
                        
                            <g:sortableColumn property="urlVideo" title="${message(code: 'mobileProcedimiento.urlVideo.label', default: 'Url Video')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${mobileProcedimientoInstanceList}" status="i" var="mobileProcedimientoInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${mobileProcedimientoInstance.id}">${fieldValue(bean: mobileProcedimientoInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: mobileProcedimientoInstance, field: "descripcion")}</td>
                        
                            <td>${fieldValue(bean: mobileProcedimientoInstance, field: "titulo")}</td>
                        
                            <td>${fieldValue(bean: mobileProcedimientoInstance, field: "urlVideo")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${mobileProcedimientoInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
