
<%@ page import="com.medfire.MobileProcedimiento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mobileProcedimiento.label', default: 'MobileProcedimiento')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-mobileProcedimiento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-mobileProcedimiento" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'mobileProcedimiento.descripcion.label', default: 'Descripcion')}" />
					
						<g:sortableColumn property="titulo" title="${message(code: 'mobileProcedimiento.titulo.label', default: 'Titulo')}" />
					
						<g:sortableColumn property="urlVideo" title="${message(code: 'mobileProcedimiento.urlVideo.label', default: 'Url Video')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${mobileProcedimientoInstanceList}" status="i" var="mobileProcedimientoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${mobileProcedimientoInstance.id}">${fieldValue(bean: mobileProcedimientoInstance, field: "descripcion")}</g:link></td>
					
						<td>${fieldValue(bean: mobileProcedimientoInstance, field: "titulo")}</td>
					
						<td>${fieldValue(bean: mobileProcedimientoInstance, field: "urlVideo")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${mobileProcedimientoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
