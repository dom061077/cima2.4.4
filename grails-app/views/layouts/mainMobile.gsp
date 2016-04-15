<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN"
   "http://www.w3.org/TR/html4/strict.dtd">
<html>
   <head>
       <meta name="viewport" content="width=device-width, initial-scale=1">

       <!--link rel="stylesheet" href="${resource(dir:'/css/mobile',file:'stylemobile.css')}" /-->
       <!--link rel="stylesheet" href="${resource(dir:'/css/mobile',file:'style.mobile.css')}"-->
       <link rel="stylesheet" href="${resource(dir:'/css/mobile',file:'jquery.mobile-1.4.5.min.css')}">
       <link rel="stylesheet" href="${resource(dir:'/css/mobile',file:'jquery.mobile-1.4.5.min.map')}">


       <script src="${resource(dir:'js/jquery',file:'jquery1.8.js')}"></script>
       <!--script src="${resource(dir:'js/jquery',file:'jquery.mobile.js')}"></script-->
       <script src="${resource(dir:'js/jquery',file:'jquery.mobile-1.4.5.min.js')}"></script>
       <script type="text/javascript">
           $(document).on("pagecreate", "#demo-page",function(){
               $(document).on("swiperleft swiperight", "#demo-page",function(e){
                   if($(".ui-page-active").jqmData("panel")!== "open"){
                       if(e.type === "swipeleft"){
                           $("#right-panel").panel("open");

                       }else if(e.type === "swiperright"){
                           $("#left-panel").panel("open");
                       }
                   }
               });
           });
       </script>
       <style type="text/css" media="screen">
       #demo-pag :not(INPUT):not(TEXTAREA){
           -webkit-user-select: none;
           -moz-user-select: none;
           -ms-user-select: none
       }
           /*Content styling.*/
       dl{ font-family:"Times New Roman", Times, serif; padding: 1em; }
       dt{ font-size: 2em; font-weight: bold; }
       dt span{ font-size: .5em; color: #777; margin-left: .5em;}
       dd{ font-size: 1.25em; margin: 1em 0 0; padding-bottom: 1em
       ; border-bottom: 1px solid #eee;}
       .back-btn{float: right; margin: 0 2em 1em 0;}

       </style>


   </head>
<body>
<div data-role="page" id="demo-page" data-url="demo-page" >
    <div data-role="header" data-theme="b">
        <h1>${pageTitle}</h1>
        <sec:ifLoggedIn>
        <a href="#left-panel" data-icon="carat-r" data-iconpos="notext"
           data-shadow="false" data-iconshadow="false" class="ui-nodisc-icon">
            Opciones de Paciente

        </a>
        <a href="#right-panel" data-icon="carat-l" data-iconpos="notext"
           data-shadow="false" data-iconshadow="false" class="ui-nodisc-icon">
            Panel Derecho
        </a>
        </sec:ifLoggedIn>
    </div><!-- header -->
    <div role="main" class="ui-content" >
          <g:layoutBody/>
    </div><!-- /content -->
    <sec:ifLoggedIn>
    <div data-role="panel" id="left-panel" data-theme="b">
        <p>Opciones de Paciente</p>
        <ul data-role="listview">
          <li><a href="${createLink(controller:'event',action:'atenciondeldia') }" data-ajax="false">Turnos</a></li>
          <li><a href="${createLink(controller:'historiaClinica', action:'list')}" data-ajax="false">Historias Clínicas</a></li>
          <li><a href="${createLink(controller:'logout',action:'index')}" data-ajax="false">Cerrar Sesión</a></li>

        </ul>
    </div><!-- /panel left-->
    </sec:ifLoggedIn>
    <div data-role="panel" id="right-panel" data-display="push" data-position="right"
         data-theme="b">
        <p>Panel izquierdo</p>
    </div><!-- /panel right-->

</div>
</body>
</html>