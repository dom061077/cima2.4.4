
<%@ page import="com.medfire.MobileProcedimiento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mobileProcedimiento.label', default: 'MobileProcedimiento')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-mobileProcedimiento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-mobileProcedimiento" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list mobileProcedimiento">
			
				<g:if test="${mobileProcedimientoInstance?.descripcion}">
				<li class="fieldcontain">
					<span id="descripcion-label" class="property-label"><g:message code="mobileProcedimiento.descripcion.label" default="Descripcion" /></span>
					
						<span class="property-value" aria-labelledby="descripcion-label"><g:fieldValue bean="${mobileProcedimientoInstance}" field="descripcion"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mobileProcedimientoInstance?.titulo}">
				<li class="fieldcontain">
					<span id="titulo-label" class="property-label"><g:message code="mobileProcedimiento.titulo.label" default="Titulo" /></span>
					
						<span class="property-value" aria-labelledby="titulo-label"><g:fieldValue bean="${mobileProcedimientoInstance}" field="titulo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${mobileProcedimientoInstance?.urlVideo}">
				<li class="fieldcontain">
					<span id="urlVideo-label" class="property-label"><g:message code="mobileProcedimiento.urlVideo.label" default="Url Video" /></span>
					
						<span class="property-value" aria-labelledby="urlVideo-label"><g:fieldValue bean="${mobileProcedimientoInstance}" field="urlVideo"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:mobileProcedimientoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${mobileProcedimientoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
