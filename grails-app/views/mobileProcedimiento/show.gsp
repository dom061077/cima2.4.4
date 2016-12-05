
<%@ page import="com.medfire.MobileProcedimiento" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'mobileProcedimiento.label', default: 'MobileProcedimiento')}" />
                <script type="text/javascript" src="${resource(dir:'js/jquery',file:'jquery.youtubepopup.min.js')}"></script>
                
		<title><g:message code="default.show.label" args="[entityName]" /></title>
            <script type="text/javascript">
                        function bindUrlVideo(){
    var url =  '<% out << "${mobileProcedimientoInstance.urlVideo}" %>'  ;
    var regExp = /^.*((youtu.be\/)|(v\/)|(\/u\/\w\/)|(embed\/)|(watch\?))\??v?=?([^#\&\?]*).*/;
    var match = url.match(regExp);
    var idvideo = 'http://img.youtube.com/vi/'+match[7]+'/default.jpg' ;
    $('#urlVideoImgId').attr('src',idvideo);
    $('#urlVideoAId').attr('href',url);
                        
                        }
                        $(function () {
                                $("a.youtube").YouTubePopup({ autoplay: 0 });
                                bindUrlVideo();
                                
                        });

            </script>                
                
	</head>
	<body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
		<div id="show-mobileProcedimiento" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			    <tbody>
				<g:if test="${mobileProcedimientoInstance?.descripcion}">
				<tr class="prop">
					<td valign="top" class="name"><g:message code="mobileProcedimiento.descripcion.label" default="Descripcion" /></td>
					
					<td valign="top" class="name"><g:fieldValue bean="${mobileProcedimientoInstance}" field="descripcion"/></td>
					
				</tr>
				</g:if>
			
				<g:if test="${mobileProcedimientoInstance?.titulo}">
				<tr class="prop">
					<td valign="top" class="name"><g:message code="mobileProcedimiento.titulo.label" default="Titulo" /></td>
					
					<td valign="top" class="name"><g:fieldValue bean="${mobileProcedimientoInstance}" field="titulo"/></td>
					
				</tr>
				</g:if>
			
				<g:if test="${mobileProcedimientoInstance?.urlVideo}">
				<tr class="prop">
					<td valign="top" class="name"><g:message code="mobileProcedimiento.urlVideo.label" default="Url Video" /></td>
					
					<td valign="top" class="name"><g:fieldValue bean="${mobileProcedimientoInstance}" field="urlVideo"/></td>
					
				</tr>
                                <tr class="prop">
                                       <td valign="top" class="name">
                                       </td>
                                       <td valign="top" class="name">
                                           <a id="urlVideoAId" class="youtube" href="">
                                               <img id="urlVideoImgId" class="youtube" src=""  />                                                                        
                                           </a>
                                           
                                      </td>
                                </tr>    
				</g:if>
			    </tbody>
			</table>
			<g:form url="[resource:mobileProcedimientoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" action="edit" resource="${mobileProcedimientoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
