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
    var histclinicaurl = '<% out << createLink(controller:'historiaClinica',action:'listjsonm');%>';

</script>
    <a href="#opcionesPopup" data-rel="popup" class="ui-btn-right ui-btn ui-btn-inline ui-mini ui-corner-all ui-btn-icon-right ui-icon-gear">
    </a>

    <div data-role="popup" id="opcionesPopup" class="ui-content">
        <ul data-role="listview" data-inset="true" style="min-width: 210px;">
            <li><a href="#">Reg.Consulta</a></li>
            <li><a href="#">Ver Consultas</a></li>
        </ul>
    </div>


    <!-- div id="one" class="ui-body-d ui-content">
        <ul id="autocomplete" data-role="listview" data-inset="true" data-filter="true" data-filter-placeholder="Stadtname" data-filter-theme="a">

        </ul> <a href="#" class="ui-btn" id="send">Send</a>

    </div -->
    <!--form id="" action="${createLink(controller:'historiaClinica', action:'list')}"-->
    <form action="#">
        <div data-role="fieldcontain">
            <label for="search">Filtrar por Nombre de Paciente:</label>
            <input type="search" data-filter-placeholder="Stadtname" name="search" id="search-basic" value="" />
        </div>
        <input id="submitid" type="submit"  value="Filtrar"/>
    </form>
    <div id = "idajax">
        <table id="tblpacientes" data-role="table" data-mode="reflow"  class="ui-responsive ui-shadow">
            <thead>
            <tr>
                <th>Id</th>
                <th data-priority="1">Apellido</th>
                <th data-priority="2">Nombre</th>
                <th data-priority="3">D.N.I</th>
                <th data-priority="4">Obra Social</th>
            </tr>
            </thead>
            <tbody>
        
            </tbody>
        </table>
    </div>
<script type="text/javascript">

    /*.closest( "table#table-column-toggle" )
            .table( "refresh" )
        // Trigger if the new injected markontain         links or buttons that need to be enhanced
            .trigger( "create" );
    */
     function loadPacientes(){
         $.getJSON(histclinicaurl
             ,{search:$('#search-basic').val()}
             ,function(data){
                     var tbl = $("#tblpacientes tbody");

                     if(data.success){
                         $.each(data.rows,function(id,paciente){

                                tbl.append("<tr><td>" + paciente.id+ "</td>"
                                        +"<td>"+ paciente.apellido + "</td>"
                                        +"<td>" + paciente.nombre+ "</td>"+
                                        "<td>" + paciente.dni+ "</td>"+
                                        "<td>" + paciente.obrasocial + "</td>"
                                        +"</tr>")
                                        .closest( "table#tblpacientes" )
                                        .table("refresh");
                                        //.trigger("create");
                            }
                         );
                         $('#opcionesPopup').trigger('create');
                     }
             }
         );
     };
    $(document).ready(function(){
        //$( document ).one( "click", "#submitid", loadPacientes());
        $("#submitid").click(loadPacientes());
     });

</script>
</body>

</html>