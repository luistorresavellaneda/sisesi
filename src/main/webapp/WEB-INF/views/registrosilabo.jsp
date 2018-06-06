<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
 -->
 
 
 <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.16/af-2.2.2/b-1.5.1/cr-1.4.1/fc-3.2.4/fh-3.1.3/kt-2.3.2/r-2.2.1/rg-1.0.2/rr-1.2.3/sc-1.4.4/sl-1.2.5/datatables.min.css"/>
 
 
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="resources/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<!-- <link rel="stylesheet" type="text/css" href="resources/vendor/bootstrap/css/bootstrap.min.css"> -->
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/css/util.css">
	<link rel="stylesheet" type="text/css" href="resources/css/ie10-viewport-bug-workaround.css">
	<link rel="stylesheet" type="text/css" href="resources/css/main.css">
	<link rel="stylesheet" type="text/css" href="resources/css/navbar.css">
	<link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css">
<!--===============================================================================================-->
<title>SISESI</title>
<style>
	#contenedor{
		/* border: 60px;
	    background: lightgray;
	    border-radius: 10px;
	    margin-bottom: 10px;
	    padding-top: 10px; */
	}
	.tab-content{
		border: 60px;
    	background: #c2c5d4;
    	padding-bottom: 600px;
	}
</style>

</head>
<body>	
	<div class="container">

      <!-- Static navbar -->
      <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<c:url value="menu" />">SISESI</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li id="inicio"><a href="<c:url value="menu" />">Inicio</a></li>
              <li id="rol1" class="active"><a href="<c:url value="registro" />">Registro de silabo</a></li>
              <li id="rol2"><a href="<c:url value="control" />">Control de avance de silabo</a></li>
              <li align="right" class="">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"> USUARIO <span class="caret"></span></a>
                <ul class="dropdown-menu">
                  <li class=""><a href="<c:url value="/" />">Cerrar sesion</a></li>
                </ul>
              </li>
            </ul>
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>
      <!-- Main component for a primary marketing message or call to action -->
      <div class="jumbotron" style="padding-top:10px;">
      	<h4 style="text-align:center;color:blue;">REGISTRO DE SILABO</h4>
      	<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
		  <li class="nav-item">
		    <a class="nav-link active" id="menuUniDid" data-toggle="pill" href="#pills-home" role="tab" 
		    	aria-controls="pills-home" aria-selected="true">UNIDAD DIDACTICA</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" id="menuTema" data-toggle="pill" href="#pills-profile" role="tab" 
		    	aria-controls="pills-profile" aria-selected="false">TEMA</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" id="menuAct" data-toggle="pill" href="#pills-contact" role="tab" 
		    	aria-controls="pills-contact" aria-selected="false">ACTIVIDAD</a>
		  </li>
		</ul>
      	<div class="tab-content" id="pills-tabContent">
		  <div class="tab-pane fade" id="pills-home" role="tabpanel" aria-labelledby="menuUniDid">
		  	<br>
		  	<div id="contenedor" class="col-md-12">
	      		<div class="col-md-6">
	    			<div class="form-group">
	    				<label for="exampleFormControlSelect1">Unidad didactica</label>
			   			<input id="idUD" name="idUD" required class="form-control" type="text">
	    			</div>		   		
			 	</div>				 
	      		<div class="col-md-3">
	      			<div class="form-group">
						<label for="exampleFormControlSelect1">Cantidad de semanas</label>
						<input id="idSE" name="idSE" required class="form-control" type="number">
					</div>
				</div>
				<div class="col-md-1">
				  	<button onclick="guardarUnidadDidactica();" type="submit" class="btn btn-primary">GUARDAR</button>
				</div>
	      	</div>
	      	<div id="contenedor" class="col-md-12">
	      		<div id="content" style="width: 100%">
		            <div class="row">
		                <div class="col-md-12">
		                    <table id="tab1" class="nowrap" style="width: 100%">
		                        <thead class="bg-primary">
		                        	<th>Codigo</th>
		                            <th>#</th>
		                            <th>Unidad didactica</th>
		                            <th>Cantidad de semanas</th>
		                            <th>Acción</th>
		                        </thead>
		                    </table>
		                </div>
		            </div>
		        </div>
	      	</div>
		  </div>
		  <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="menuTema">
		  	<br>
		  	<div id="contenedor" class="col-md-12">
	    		<div class="col-md-3">
			   		<div class="form-group">
					   <label for="exampleFormControlSelect1">Unidad didactica</label>
					   <select class="form-control" id="unidadDidactica2" onchange="listarSemanas(this.value, 'semana2')">
					   		<option value=0>Seleccione</option>
					   </select>
					 </div>
			 	</div>				 
	      		<div class="col-md-3">
	      			<div class="form-group">
					   <label for="exampleFormControlSelect1">Semana</label>
					   <select class="form-control" id="semana2" onchange="listarTemas(this.value)">
					   </select>
					 </div>
				</div>
				<div class="col-md-3">
	      			<div class="form-group">
	    				<label for="exampleFormControlSelect1">Tema</label>
			   			<input id="idT" class="form-control" type="text">
	    			</div>
				</div>
				<div class="col-md-1">
				  	<button onclick="guardarTema();" type="button" class="btn btn-primary">GUARDAR</button>
				</div>
	      	</div>
	      	<div id="contenedor" class="col-md-12">
	      		<div id="content" style="width: 100%">
		            <div class="row">
		                <div class="col-md-12">
		                    <table id="tab2" class="nowrap" style="width: 100%">
		                        <thead class="bg-primary">
		                        	<th>Codigo</th>
		                            <th>#</th>
		                            <th>Semana</th>
		                            <th>Tema</th>
		                            <th>Acción</th>
		                        </thead>
		                    </table>
		                </div>
		            </div>
		        </div>
	      	</div>
		  </div>
		  <div class="tab-pane fade" id="pills-contact" role="tabpanel" aria-labelledby="menuAct">
		  	<br>
		  	<div id="contenedor" class="col-md-12">
	    		<div class="col-md-3">
			   		<div class="form-group">
					   <label for="exampleFormControlSelect1">Unidad didactica</label>
					   <select class="form-control" id="unidadDidactica3" onchange="listarSemanas(this.value, 'semana3')">
					   </select>
					 </div>
			 	</div>				 
	      		<div class="col-md-3">
	      			<div class="form-group">
					   <label for="exampleFormControlSelect1">Semana</label>
					   <select class="form-control" id="semana3" onchange="selectTemas(this.value, 'tema3')">
					   </select>
					 </div>
				</div>
				<div class="col-md-3">
	      			<div class="form-group">
					   <label for="exampleFormControlSelect1">Tema</label>
					   <select class="form-control" id="tema3" onchange="listarActividades(this.value)">
					   </select>
					 </div>
				</div>
				<div class="col-md-6">
	      			<div class="form-group">
	    				<label for="exampleFormControlSelect1">Actividad</label>
			   			<input id="act3" class="form-control" type="text">
			   			<input type="hidden" id="acts">
	    			</div>
				</div>
				<div class="col-md-1">
				  	<button onclick="guardarActividad();" type="button" class="btn btn-primary">GUARDAR</button>
				</div>
				<div id="contenedor" class="col-md-12">
		      		<div id="content" style="width: 100%">
			            <div class="row">
			                <div class="col-md-12">
			                    <table id="tab3" class="nowrap" style="width: 100%">
			                        <thead class="bg-primary">
			                        	<th>Codigo</th>
			                            <th>#</th>
			                            <th>Tema</th>
			                            <th>Actividad</th>
			                            <th>Acción</th>
			                        </thead>
			                    </table>
			                </div>
			            </div>
			        </div>
		      	</div>			
	      	</div>
		  </div>
		</div>
      </div>      
    </div> <!-- /container -->
	

	<!-- MODALES -->
	<!-- Modal UD -->
	<div class="modal fade" id="udModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4>ACTUALIZANDO UNIDAD DIDACTICA</h4>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                </button>
	            </div>
	            <div class="modal-body">
	            		<input id="idEditIdUD" name="idEditIdUD" class="form-control" type="text" style="display:none;">
		    			<div class="form-group">
		    				<label for="exampleFormControlSelect1">Unidad didactica</label>
				   			<input id="idEditUD" name="idEditUD" class="form-control" type="text">
		    			</div>
		      			<div class="form-group">
							<label for="exampleFormControlSelect1">Cantidad de semanas</label>
							<input id="idEditCantSem" name="idEditCantSem" class="form-control" type="number">
						</div>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-dismiss="modal">CANCELAR</button>
	                <button onclick="actualizarUD();" type="button" class="btn btn-primary">GUARDAR</button>
	            </div>
	        </div>
	    </div>
	</div>
	
	<!-- Modal TEM -->
	<div class="modal fade" id="temModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4>ACTUALIZANDO TEMA</h4>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                </button>
	            </div>
	            <div class="modal-body">
		    			<div class="form-group">
		    				<label for="exampleFormControlSelect1">Semana</label>
				   			<input class="form-control" type="number" disabled>
		    			</div>
		      			<div class="form-group">
							<label for="exampleFormControlSelect1">TEMA</label>
							<input class="form-control" type="text">
						</div>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-dismiss="modal">CANCELAR</button>
	                <button type="button" class="btn btn-primary">GUARDAR</button>
	            </div>
	        </div>
	    </div>
	</div>
	
	<!-- Modal ACT -->
	<div class="modal fade" id="actModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	    <div class="modal-dialog" role="document">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4>ACTUALIZANDO ACTIVIDAD</h4>
	                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                    <span aria-hidden="true">&times;</span>
	                </button>
	            </div>
	            <div class="modal-body">
		    			<div class="form-group">
		    				<label for="exampleFormControlSelect1">Tema</label>
				   			<input class="form-control" type="text" disabled>
		    			</div>
		      			<div class="form-group">
							<label for="exampleFormControlSelect1">Actividad</label>
							<input class="form-control" type="text">
						</div>
	            </div>
	            <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-dismiss="modal">CANCELAR</button>
	                <button type="button" class="btn btn-primary">GUARDAR</button>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- MODALES -->


<%-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
 --%>



	
<!--===============================================================================================-->
	<script src="resources/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/vendor/bootstrap/js/popper.js"></script>
	<!-- <script src="resources/vendor/bootstrap/js/bootstrap.min.js"></script> -->
<!--===============================================================================================-->
	<script src="resources/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="resources/vendor/tilt/tilt.jquery.min.js"></script>
	<script >
		$('.js-tilt').tilt({
			scale: 1.1
		})
	</script>
	<script src="resources/js/main.js"></script>
	<script src="resources/js/ie-emulation-modes-warning.js"></script>
	<script src="resources/js/ie10-viewport-bug-workaround.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	
	<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.16/af-2.2.2/b-1.5.1/cr-1.4.1/fc-3.2.4/fh-3.1.3/kt-2.3.2/r-2.2.1/rg-1.0.2/rr-1.2.3/sc-1.4.4/sl-1.2.5/datatables.min.js"></script>
    
	
	<!-- FUNCIONALIDAD AUXILIAR -->
    <script>
    	$(document).ready(function () {        	
        	listarMenuOpciones();
        	$('#inicio').click(function () {
        		$("li").removeClass();
        		$("#inicio").addClass("active");                
            });
        	$('#rol1').click(function () {
        		$("li").removeClass();
                $("#rol1").addClass("active");                
            });
        	$('#rol2').click(function () {
        		$("li").removeClass();
        		$("#rol2").addClass("active");                
            });
        	$('#menuUniDid').click(function () {
        		//Se carga la unidad didáctica
        		mostrarUnidadDidactica();
            });
        	$('#menuTema').click(function () {
        		cargarUnidades("unidadDidactica2");
        		//Se carga la unidad didáctica
        		//mostrarTema();
            });
        	$('#menuAct').click(function () {
        		cargarUnidades("unidadDidactica3");
        		//Se carga la unidad didáctica
        		//mostrarActividad();
            });
        	
        });
        
    </script>
    <script src="resources/js/funciones.js"></script>
    <!--  FUNCIONALIDAD AUXILIAR -->
  </body>
</html>


			<%-- 
            // TABLA DE TEMA  
        	dataSet = new Array();
            filaset = new Array();
            
            filaset.push('0');filaset.push('1');filaset.push('SEMANA 1');filaset.push('TEMA 1');
            // filaset.push('<form method="get" action="<c:url value="registrosilabo" />"><button type="submit" class="btn btn-primary">EDITAR</button></form>');
            filaset.push('<form method="get" action="<c:url value="registrosilabo" />"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#temModal">EDITAR</button></form>');
        	dataSet.push(filaset);
            
            filaset = new Array();
            filaset.push('0');filaset.push('2');filaset.push('SEMANA 2');filaset.push('TEMA 2');
            filaset.push('<form method="post"><button type="submit" class="btn btn-primary">EDITAR</button></form>');
            dataSet.push(filaset);
            
            filaset = new Array();
            filaset.push('0');filaset.push('3');filaset.push('SEMANA 3');filaset.push('TEMA 3');
            filaset.push('<form method="post"><button type="submit" class="btn btn-primary">EDITAR</button></form>');
            dataSet.push(filaset);
            
            $('#tab2').DataTable( {
                "language": {
                  "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
                },
                data: dataSet,
                bPaginate: true,
                bInfo: false,
                searching: true,
                responsive: true,
                columns: [
                  { title: "Código", "visible": false },
                  { title: "#" },
                  { title: "Semana" },
                  { title: "Tema" },
                  { title: "Acción" }
                ]
            } );
            
            // TABLA DE ACTIVIDAD  
        	dataSet = new Array();
            filaset = new Array();
            
            filaset.push('0');filaset.push('1');filaset.push('TEMA 1');filaset.push('ACTIVIDAD 1');
            // filaset.push('<form method="get" action="<c:url value="registrosilabo" />"><button type="submit" class="btn btn-primary">EDITAR</button></form>'); 
            filaset.push('<form method="get" action="<c:url value="registrosilabo" />"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#actModal">EDITAR</button></form>');
        	dataSet.push(filaset);
            
            filaset = new Array();
            filaset.push('0');filaset.push('2');filaset.push('TEMA 2');filaset.push('ACTIVIDAD 2');
            filaset.push('<form method="post"><button type="submit" class="btn btn-primary">EDITAR</button></form>');
            dataSet.push(filaset);
            
            filaset = new Array();
            filaset.push('0');filaset.push('3');filaset.push('TEMA 3');filaset.push('ACTIVIDAD 3');
            filaset.push('<form method="post"><button type="submit" class="btn btn-primary">EDITAR</button></form>');
            dataSet.push(filaset);
            
            $('#tab3').DataTable( {
                "language": {
                  "url": "//cdn.datatables.net/plug-ins/1.10.15/i18n/Spanish.json"
                },
                data: dataSet,
                bPaginate: true,
                bInfo: false,
                searching: true,
                responsive: true,
                columns: [
                  { title: "Código", "visible": false },
                  { title: "#" },
                  { title: "Tema" },
                  { title: "Actividad" },
                  { title: "Acción" }
                ]
            } ); --%>
