<%@ page import="com.medfire.MobileProcedimiento" %>



<div class="fieldcontain ${hasErrors(bean: mobileProcedimientoInstance, field: 'descripcion', 'error')} required">
	<label for="descripcion">
		<g:message code="mobileProcedimiento.descripcion.label" default="Descripcion" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descripcion" required="" value="${mobileProcedimientoInstance?.descripcion}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: mobileProcedimientoInstance, field: 'titulo', 'error')} required">
	<label for="titulo">
		<g:message code="mobileProcedimiento.titulo.label" default="Titulo" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="titulo" required="" value="${mobileProcedimientoInstance?.titulo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: mobileProcedimientoInstance, field: 'urlVideo', 'error')} required">
	<label for="urlVideo">
		<g:message code="mobileProcedimiento.urlVideo.label" default="Url Video" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="urlVideo" required="" value="${mobileProcedimientoInstance?.urlVideo}"/>

</div>

