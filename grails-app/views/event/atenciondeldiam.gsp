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

<ul  data-role="listview">
    <g:each in="${turnos}" status="i" var="eventInstance">
        <li><a href="index.html">${eventInstance.titulo} - ${eventInstance.estado.name} -
                <g:formatDate format="HH:mm" date="${eventInstance.fechaStart}" />
        </a></li>
    </g:each>
</ul>

<script type="text/javascript">
    function loadTurnos(){
        $.getJSON(atencionDelDiaUrl,
                {})
    }

</script>

</body>

</html>