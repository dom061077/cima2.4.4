$(document).ready(function(){
    $("#errorMsg").hide();
    $("#btnLogin").click(function(){
        var usu = $("#txtuser").val();
        var pass = $("#txtpassword").val();
        var rememberme = $('#_spring_security_remember_me').val();
        $.post(loginurl,{ j_username : usu, j_password : pass,_spring_security_remember_me:rememberme},function(respuesta){
            if (!respuesta.error) {
                $.mobile.changePage(indexurl);
            }
            else{
                $('#loginFailedPopup').popup("open");
                /*$("#errorMsg").fadeIn(300);
                 $("#errorMsg").css("display", "block");*/
            }
        });
    });
});
