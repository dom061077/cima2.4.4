<%@ page import="com.medfire.MobileContenido" %>



<div class="fieldcontain ${hasErrors(bean: mobileContenidoInstance, field: 'quienesSomos', 'error')} required">
	<label for="quienesSomos">
		<g:message code="mobileContenido.quienesSomos.label" default="Quienes Somos" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="quienesSomos" required="" value="${mobileContenidoInstance?.quienesSomos}"/>

</div>

