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
$("#urlVideoId").live('input urlVideoId',function(e){
    var url = $('#urlVideoId').val();
    var regExp = /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/;
    var match = url.match(regExp);
    var idvideo = 'http://img.youtube.com/vi/'+match[7]+'/default.jpg' ;
    $('#urlVideoImgId').attr('src',idvideo);
    $('#urlVideoAId').attr('href',url);
        $("#urlVideoAId").focus();
        setTimeout($(this).paste, 250);    
});                                
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
		<div id="create-mobileProcedimiento" class="content scaffold-create" role="main">
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
            	            <fieldset>
            	                    <g:hasErrors bean="${mobileProcedimientoInstance}" field="descripcion">
                                    	<div class="ui-state-error ui-corner-all">
                                    </g:hasErrors>
                                    <div class="span-4">
                                    	<label for="descripcion"><g:message code="mobileProcedimiento.descripcion.label" default="Descripcion" /></label>
                                    </div>
                                    <div class="span-4">
                                    	<g:textField class="ui-widget ui-corner-all ui-widget-content" name="descripcion" value="${mobileProcedimientoInstance?.descripcion}" />
                                    </div>
                               		<g:hasErrors bean="${mobileProcedimientoInstance}" field="descripcion">
                                    	<g:renderErrors bean="${mobileProcedimientoInstance}" as="list" field="descripcion"/>
                                    	</div>
                                   	</g:hasErrors>
                                    <div class="clear"></div>

            	                    <g:hasErrors bean="${mobileProcedimientoInstance}" field="titulo">
                                    	<div class="ui-state-error ui-corner-all">
                                    </g:hasErrors>
                                    <div class="span-4">
                                    	<label for="titulo"><g:message code="mobileProcedimiento.titulo.label" default="Título" /></label>
                                    </div>
                                    <div class="span-4">
                                    	<g:textField class="ui-widget ui-corner-all ui-widget-content" name="titulo" value="${mobileProcedimientoInstance?.titulo}" />
                                    </div>
                               		<g:hasErrors bean="${mobileProcedimientoInstance}" field="titulo">
                                    	<g:renderErrors bean="${mobileProcedimientoInstance}" as="list" field="titulo"/>
                                    	</div>
                                   	</g:hasErrors>
                                    <div class="clear"></div>     

                                    
            	                    <g:hasErrors bean="${mobileProcedimientoInstance}" field="urlVideo">
                                    	<div class="ui-state-error ui-corner-all">
                                    </g:hasErrors>
                                    <div class="span-4">
                                    	<label for="titulo"><g:message code="mobileProcedimiento.urlVideo.label" default="urlVideo" /></label>
                                    </div>
                                    <div class="span-4">
                                    	<g:textField id="urlVideoId"  class="ui-widget ui-corner-all ui-widget-content" name="urlVideo" value="${mobileProcedimientoInstance?.urlVideo}" />
		
                                        
                                        <a id="urlVideoAId" class="youtube" href="">
                                              <img id="urlVideoImgId" class="youtube" src="" title="..." />                                                                        
                                        </a>
	                                        
                                    </div>
                               		<g:hasErrors bean="${mobileProcedimientoInstance}" field="urlVideo">
                                    	<g:renderErrors bean="${mobileProcedimientoInstance}" as="list" field="urlVideo"/>
                                    	</div>
                                   	</g:hasErrors>
                                    <div class="clear"></div>                            
                                    
                            </fieldset>
				<fieldset class="buttons">
                  <div style="padding: 10px 15px 15px 15px;">
                  	<g:submitButton name="create" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                  </div>                

				</fieldset>
                            
			</g:form>
		</div>
	</body>
</html>
