
<%@ page import="com.medfire.MobileContenido" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mobileContenido.label', default: 'MobileContenido')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="show-mobileContenido" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list mobileContenido">
			
				<g:if test="${mobileContenidoInstance?.quienesSomos}">
				<li class="fieldcontain">
					<span id="quienesSomos-label" class="property-label"><g:message code="mobileContenido.quienesSomos.label" default="Quienes Somos" /></span>
					
					
				</li>

				</g:if>
			
			</ol>
                        <div class='buttons'>
                            ${raw(mobileContenidoInstance?.quienesSomos)}                        
                        </div>    
			<g:form url="[resource:mobileContenidoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${mobileContenidoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
