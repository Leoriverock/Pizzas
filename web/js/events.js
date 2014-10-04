/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//Acciones de las seccion de pedidos
function muestra_oculta(id, id2){
    if (document.getElementById){ 
    var formulario = document.getElementById(id); 
    var botones = document.getElementById(id2);
    botones.style.display = (botones.style.display == 'block') ? 'none' : 'block';
    formulario.style.display = (formulario.style.display == 'none') ? 'block' : 'none'; 
    }
}
window.onload = function(){
    muestra_oculta('contenido_a_mostrar','contenido_a_ocultar');
    }


function oculta_muestra(id, id2){
if (document.getElementById){ 
    var formulario = document.getElementById(id); 
    var botones = document.getElementById(id2);
    botones.style.display = (botones.style.display == 'block') ? 'none' : 'block';
    formulario.style.display = (formulario.style.display == 'none') ? 'block' : 'none'; 
    }
}
window.onload = function(){
muestra_oculta('contenido_a_mostrar','contenido_a_ocultar');
}

//function generar id producto - esto no me sirve
var fecha = new Date();
var unidad = 8;
var decena = 8;
var centena = 0;
var mil = 0;
var concat = "";
function generar_id_producto(){

if(unidad>=9){
    unidad = 0;
    decena = ++decena;
    if(decena>=9){
        decena = 0;
        centena = ++centena;
    }else{
        concat = mil +""+centena+""+decena+""+unidad;
    }
    
}else{
        unidad = ++unidad;
        concat = mil +""+centena+""+decena+""+unidad;
    
}
var id_producto = fecha.getMonth()+1+""+ fecha.getFullYear()+""+concat;    
console.log(id_producto);
}