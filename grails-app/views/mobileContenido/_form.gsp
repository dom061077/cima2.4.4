<%@ page import="com.medfire.MobileContenido" %>



<div class="fieldcontain ${hasErrors(bean: mobileContenidoInstance, field: 'quienesSomos', 'error')} required">
	<label for="quienesSomos">
		<g:message code="mobileContenido.quienesSomos.label" default="Quienes Somos" />
		<span class="required-indicator">*</span>
	</label>
	<!--g:textField name="quienesSomos" required="" value="${mobileContenidoInstance?.quienesSomos}"/-->
        <textArea style="min-height: 500px" name="quienesSomos" class="ckeditor"  id="quienesSomosId">
                ${mobileContenidoInstance?.quienesSomos}
        </textArea>
	<label for="soyCandidato">
		<g:message code="mobileContenido.soyCandidato.label" default="¿Soy candidato?" />
		<span class="required-indicator">*</span>
	</label>        
        <textArea style="min-height: 500px" name="soyCandidato" class="ckeditor"  id="soyCandidatoId">
                ${mobileContenidoInstance?.soyCandidato}
        </textArea>        

</div>

