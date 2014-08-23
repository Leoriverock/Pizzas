/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
