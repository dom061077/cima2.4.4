<%@ page import="com.medfire.MobileContenido" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
                <script type="text/javascript" src="${resource(dir:'js/editor',file:'ckeditor.js')}"></script>                
		<g:set var="entityName" value="${message(code: 'mobileContenido.label', default: 'MobileContenido')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="edit-mobileContenido" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${mobileContenidoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${mobileContenidoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:mobileContenidoInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${mobileContenidoInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
                	<script>
                                CKEDITOR.replace( 'quienesSomosId', {
                                        //width: '70%',
                                        height: 250
                                } );
                                CKEDITOR.replace( 'soyCandidatoId', {
                                        //width: '70%',
                                        height: 250
                                } );                                
                	</script>
                
	</body>
</html>