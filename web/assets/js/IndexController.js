/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var urlImg;
var srcImg;
$(document).ready(function () {
    //$("#dialogo").fadeOut();
    $(this).keydown(function (event) {
        var num = String.fromCodePoint(event.which);
        if (event.which === 39) {
            siguiente();
            //alert(srcImg);
        } else if (event.which === 37) {
            atras();
            //alert(srcImg);
        }
    });
    $(this).bind("swipeleft",function (){
        atras();
    });
    $(this).bind("swiperight",function (){
        siguiente();
    });
    var numImg = document.getElementsByName("img");
    urlImg = numImg;
    
    $("#borrar").click(function (){
        sedAjax("?borrar=borrar","GetPost");   
        setInterval(function() {
            location.reload();
        },100);
    });
    logoutSession();
});
function siguiente() {
    var hrefimg = srcImg;
    var listUrl = urlImg;
    var position = 0;
    var siguiente = 0;
    for (var i = 0; i < listUrl.length; i++) {
        if (hrefimg === listUrl[i].value) {
            position = parseInt(i);
            siguiente = parseInt(position + 1);
        }
    }
    for (var i = position; i < siguiente; i++) {
        document.getElementById("imgDialog").src = listUrl[siguiente].value;
        srcImg = listUrl[siguiente].value;
    }
}
function atras() {
    var hrefimg = srcImg;
    var listUrl = urlImg;
    var position = 0;
    var atrasImg = 0;
    for (var i = 0; i < listUrl.length; i++) {
        if (hrefimg === listUrl[i].value) {
            position = parseInt(i);
            atrasImg = parseInt(position - 1);
        }
    }
    for (var i = position; i > atrasImg; i--) {
        document.getElementById("imgDialog").src = listUrl[atrasImg].value;
        srcImg = listUrl[atrasImg].value;
    }
}

function dimensionesPageIndex(){
    var quitar="display:none;";
    var poner ="display:inline;";
    var ponerFlex ="display:flex;";
    if(window.innerWidth>1000){
        
    }else if(window.innerWidth>600 && window.innerWidth<999){
        
    }else if(window.innerWidth>200 && window.innerWidth<599){
        
    }
}
function dialogo(id, src) {
    $("#menuMobile").fadeOut();
    $("#dialogo").show();
    srcImg = src;
    document.getElementById("imgDialog").src = src;
}
function salir() {
    $("#menuMobile").fadeOut();
    var dialog = $("#dialogo").fadeOut();
}
function sedAjax(datos, pag) {
    $.ajax({type: 'GET', data: datos, url: pag,success: function (data, textStatus, jqXHR) {
            alert(data);
        }});
}