<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="layout" content="mainMobile" />
    <g:set var="entityName" value="${message(code: 'institucion.label', default: 'Institucion')}" />
    <title><g:message code="default.create.label" args="[entityName]" /></title>





</head>
<body>
<script type="text/javascript">
    var loginurl='<% out << postUrl;%>';
    var indexurl= '<% out << g.createLink(uri:'/');%>';
</script>
<script type="text/javascript" src="${resource(dir:'js/script/login',file:'authm.js')}"></script>
<section id="login" data-role="content">
    <article data-role="content">

        <form id="form_login">
            <div data-role="fieldcontain" class="ui-hide-label">
                <label for="txtuser">Usuario:</label>
                <input type="text" name="txtuser" id="txtuser" value="" placeholder="Nombre de Usuario" />
            </div>
            <div data-role="fieldcontain" class="ui-hide-label">
                <label for="txtpassword">Contraseña:</label>
                <input type="password" name="txtpassword" id="txtpassword" value="" placeholder="Contraseña" />
            </div>
            <div data-role="fieldcontain" class="ui-hide-label">
                <label for="_spring_security_remember_me">Recordarme en este dispositivo</label>
                <input type="checkbox" name="_spring_security_remember_me" id="_spring_security_remember_me"/>
            </div>
            <input type="button" value="Iniciar Sesión" id="btnLogin">
        </form>
        <!--<div id="errorMsg" style="background-color:red;color: #FFFFFF;">Usuario o Contraseña no valida</div>-->


    </article>
</section>
<!-- Aqui nuestro dialog con el mensaje de error  -->
<div data-role="popup" id="loginFailedPopup" data-overlay-theme="b" data-theme="b" data-dismissible="false" style="max-width:400px;">
    <div data-role="header" data-theme="a">
        <h1>Error</h1>
    </div>
    <p>Usuario o contraseña incorrectos.</p>
    <a href="#" class="ui-btn ui-corner-all ui-shadow ui-btn-b" data-rel="back">Aceptar</a>
</div>
</body>

</html>