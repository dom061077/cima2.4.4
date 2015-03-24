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



   </head>
<body>
<div class="demo-wrapper" data-role="page">
    <!-- panel 01 -->
    <div class="panel left" data-role="panel" data-position="left" data-display="push" id="panel-01">
        <ul>
            <li class="newsfeed"><a href="#" title="Home">News Feed</a></li>
            <li class="profile"><a href="#" title="Profile">Profile</a></li>
            <li class="setting"><a href="#" title="Setting">Setting</a></li>
            <li class="logout"><a href="#" title="Logout">Logout</a></li>
            <li class="report"><a href="#" title="Report">Report Bug</a></li>
        </ul>
    </div>
    <div class="header" data-role="header">
        <span class="open left"><a href="#panel-01">&#61641;</a></span>
        <span class="title" style="text-align: center;">CIMA MOBILE</span>
        <span class="open right"><a href="#panel-02">&#9776;</a></span>
    </div>
    <div class="content" data-role="content">
        <g:layoutBody />    </div>
    <!-- panel 02 -->
    <div class="panel right" data-role="panel" data-position="right" data-display="overlay" id="panel-02">
        <ul>
            <li><a href="#" title="John Doe"><span class="avatar"></span>John Doe</a></li>
            <li><a href="#" title="Jessy Doe"><span class="avatar"></span>Jessy Doe</a></li>
        </ul>
    </div>
</div>
</body>
</html>