<%-- 
    Document   : index
    Created on : 22-ago-2014, 23:05:12
    Author     : Batcave
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Persistencia.ManejadorBD"%>
<%@page import="Servlet.ServletAction"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Pizzas Le</title>
		<script src="js/jquery.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/skel-panels.min.js"></script>
		<script src="js/init.js"></script>
                <script src ="js/events.js"></script>
                <%    ManejadorBD mbd = ManejadorBD.getInstancia();
                %>
                <!--scrips y css-->
                
                <style type="text/css">
                    #Gustos{visibility: hidden;}
                </style>
                <!--Codigo para Guille-->
                <script type="text/javascript">
                $(document).ready(function() {	
                $('#name').blur(function(){

                   // $('#Info').html('<img src="Images/ajax-loader.gif" alt="" />').fadeOut(1000);

                    var name = $(this).val(); //Este valor lo saco del id="name" que esta en section clientes imput name		
                    var dataString = 'name='+name;

                    $.ajax({
                type: "POST",
                url: "ServletAction",
                data: dataString,
                success: function(data) {
                                    $('#Info').fadeIn(1000).html(data);
                                    console.log(data);
                        }
                    });
                });
            });
             </script>
             <!--Codigo para Guille-->
                
	</head>
	
	<body>
		
	
		<!-- Header -->
			<div id="header" class="skel-panels-fixed">

				<div class="top">

					<!-- Logo -->
                                            <nav id="nav">
						<div id="logo">
                                                    <a href="#hero" id="hero" class="skel-panels-ignoreHref"><span>Pizzas Le</span></a>
                                                       
							<span class="byline">Sistema V1.0</span>
						</div>

					<!-- Nav -->
						
							<ul>
								<li><a href="#Pedidos" id="Pedidos" class="skel-panels-ignoreHref"><span class="icon icon-list-alt">Pedidos</span></a></li>
								<li><a href="#Clientes" id="Clientes" class="skel-panels-ignoreHref"><span class="icon icon-group">Clientes</span></a></li>
								<li><a href="#Productos" id="Productos" class="skel-panels-ignoreHref"><span class="icon icon-glass">Productos</span></a></li>
								<li><a href="#Balance" id="Balance" class="skel-panels-ignoreHref"><span class="icon icon-money">Balance</span></a></li>
								<li><a href="#Contacto" id="Contacto" class="skel-panels-ignoreHref"><span class="icon icon-envelope">Contacto</span></a></li>
							</ul>
						</nav>
						
				</div>
		
			</div>
			
		<!-- Main -->
			<div id="main">
			
				<section id="hero" class="hero">
					<h2>Pizzas Le</h2>
					<span>Sistema de gestion de clientes y balance de gastos y entradas</span>
				</section>
				
				<!---->
					<section id="Pedidos" class="one">
						
						<div class="container">
                                                        <header>
								<h2>Pedidos</h2>
                                                        </header>
                                                    <div id="contenido_a_ocultar" class="row half">
                                                        <div class="6u">
                                                            <a class="button">Pedidos</a>
                                                        </div>
                                                        <div class="6u">
                                                            <a  onclick="muestra_oculta('contenido_a_mostrar','contenido_a_ocultar');generar_id_producto();" class="button">Agregar</a>
                                                        </div>
                                                    </div>
                                                    <!--Lista de pedidos-->
                                                    
                                                    <!--Contenido a mostrar-->
                                                    <div id="contenido_a_mostrar">
                                                        <form method="post" action="#">
                                                        <div class="row half">
                                                            <div class="4u">
                                                                <label class="text" name="Id_Pedido">Pedido Nª</label>
                                                            </div>
                                                            <div class="4u">
                                                                <label class="text" name="Fecha"><script>
                                                                    var f = new Date();
                                                                    document.write(f.getDate() + "/" + (f.getMonth() +1) + "/" + f.getFullYear());
                                                                    </script> 
                                                                </label>
                                                            </div>
                                                            <div class="4u"><input id="names" type="text" class="text" name="name" placeholder="Buscar cliente..." /></div>
                                                            <!--El nombre lo traigo con una funcion ajax de busqueda-->
                                                            <div class="6u"><input type="text" class="text" name="celular" placeholder="Celular"  require=""/></div>
                                                            <div class="6u"><input type="text" class="text" name="telephone" placeholder="Telefono" /></div>
                                                        </div>
                                                        <div class="row half">
                                                            <div class="12u">
                                                                <textarea name="address" placeholder="Direccion"></textarea>
                                                                <!--La direccion se carga cuando cargo el cliente-->
                                                            </div>  
                                                        </div> 
                                                        <div class="row">
                                                            <div class="6u">
                                                                <label>Agregar Productos</label>
                                                                <select id="Prod" name="Prod" class="12u">
                                                                      <option selected>--- Cargar producto ---</option>
                                                                      <option value="uno">Producto 1</option>
                                                                      <option value="2">Producto 2</option>
                                                                </select>
                                                            </div>        
                                                        </div>    
                                                        <div id="Gustos" class="row">
                                                            <fieldset>
                                                                <legend class="12u">Gustos</legend>
                                                                <div id="InfoGustos"></div>
                                                            </fieldset>
                                                        </div>     
                                                        <div class="row">
                                                            <div class="12u">
                                                                <table>
                                                                    <tr><th><a class="button">Añadir</a></th></tr> 
                                                                </table>
                                                            </div>  
                                                        </div>
                                                        <div class="row">
                                                            <div class="12u">
                                                                <table>
                                                                    <thead>
                                                                    <tr>
                                                                       <th>Producto 1</th>
                                                                       <th>Cantidad</th>
                                                                       <th>Precio</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <tr>
                                                                       <td></td>
                                                                       <td></td>
                                                                    </tr>
                                                                    </tbody>
                                                                </table> 
                                                                <tr><th><a onclick="oculta_muestra('contenido_a_mostrar','contenido_a_ocultar')" class="button">Confirmar</a></th></tr> 
                                                            </div>
                                                        </div>
                                                        </form>
                                                    
                                            </section>
					
				
					<section id="Clientes" class="two">
						
						<div class="container">
					
                                                        <header>
								<h2>Clientes</h2>
							</header>
							<!---->
                                                        
                                                            <form method="POST" action="ValidarClases.jsp">
                                                                    <div class="row half">
                                                                            <div class="12u" id="Info"></div>
                                                                            <div class="6u"><input type="text" class="text" id="name" name="name" placeholder="Nombre" requiered = "requiered"/></div>
                                                                            <div class="6u"><input type="text" class="text" name="surname" placeholder="Apellido" requiered = "requiered"/></div>
                                                                            <div class="6u"><input type="text" class="text" name="mobile" placeholder="Celular" /></div>
                                                                            <div class="6u"><input type="text" class="text" name="phone" placeholder="Telefono" requiered = "requiered"/></div>
                                                                    </div>
                                                                    <div class="row half">
                                                                            <div class="12u">
                                                                                    <textarea name="address" placeholder="Direccion"></textarea>
                                                                            </div>  
                                                                     </div>
                                                                    <div class="row">
                                                                            <div class="12u">
                                                                                    <input type="submit" class="button" value="Crear nuevo"></a>
                                                                            </div>
                                                                    </div>
                                                            </form>
                                                      
                                                        
                                                       <!-- -->
							
					</div>
				</section>

				
                                <section id="Productos" class="three">
                                        <div class="container">
                                            <header>
                                                        <h2>Productos</h2>
                                            </header>

                                        </div>
                                </section>
			
				<!---->
                                <section id="Balance" class="four">
                                    <div class="container">
                                        <header>
                                                        <h2>Balance</h2>
                                        </header>
                                        
                                    </div>
                                </section>
                                
					
                                    <!-- Contact -->
                                    <section id="Contacto" class="five">
                                            <div class="container">
                                                <header>
                                                            <h2>Contacto</h2>
                                                </header>
                                            </div>
                                    </section>
			</div>	
			
		<!-- Footer -->
			<div id="footer">
				<!-- Copyright -->
					<div class="copyright">
						<p>&copy; 2014 La Pandilla Inc.</p>
					</div>
                        </div>
                <script>
    $('select#Prod').on('change',function(){
    var valor = $(this).val();
    if(valor == "uno"){
        var dataString = 'name='+valor;
        $.ajax({
                type: "POST",
                url: "Validar.jsp",
                data: dataString,
                success: function(data) {
                                    $('#InfoGustos').fadeIn(1000).html(data);
                                    //console.log(data);
                        }
                    });
        document.getElementById("Gustos").style.visibility = "visible";
    }
    else{
       document.getElementById("Gustos").style.visibility = "hidden"; 
    }
    });
    </script>
                                
			
    </body>
</html>