<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mobileProcedimiento.label', default: 'MobileProcedimiento')}" />
                <script type="text/javascript" src="${resource(dir:'js/jquery',file:'jquery.youtubepopup.min.js')}"></script>
		<title><g:message code="default.create.label" args="[entityName]" /></title>
            <script type="text/javascript">
                        $(function () {
                                $("a.youtube").YouTubePopup({ autoplay: 0 });
                        });
            </script>                
	</head>
	<body>
		<a href="#create-mobileProcedimiento" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<!--div id="create-mobileProcedimiento" class="content scaffold-create" role="main">
			<h1><g:message code="default.create.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${mobileProcedimientoInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${mobileProcedimientoInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:mobileProcedimientoInstance, action:'save']" >
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" />
				</fieldset>
			</g:form>
		</div-->
<img class="youtube" id="pZ9tT9A5Weg" src="http://img.youtube.com/vi/pZ9tT9A5Weg/default.jpg" title="..." />                                
                                <a class="youtube" href="https://www.youtube.com/watch?v=pZ9tT9A5Weg&t=3s">Test Me</a>
	</body>
</html>
