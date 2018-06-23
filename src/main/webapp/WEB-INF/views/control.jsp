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
              <li id="rol1"><a href="<c:url value="registro" />">Registro de silabo</a></li>
              <li id="rol2" class="active"><a href="<c:url value="control" />">Control de avance de silabo</a></li>
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
      	<h4 style="text-align:center;color:blue;">CONTROL DE AVANCE DEL SILABO</h4>
      	<div class="col-md-12">
      		<div class="col-md-3">
      			<div class="form-group">
				   <label for="exampleFormControl">Turno</label>
				   <select class="form-control" id="turno3" onchange="ActionTurno(document.getElementById('semana3').value, document.getElementById('tema3').value, this.value)">
				   		<option value="t">Teorico</option>
				   		<option value="p">Practico</option>
				   </select>
				 </div>
      		</div>
      		<div class="col-md-3">
      			<div class="form-group">
				   <label for="exampleFormControlSelect1">Unidad didactica</label>
				   <select class="form-control" id="unidadDidactica3" onchange="listarSemanas(this.value, 'semana3')"></select>
				 </div>
      		</div>
      		<div class="col-md-3">
      			<div class="form-group">
				   <label for="exampleFormControlSelect1">Semana</label>
				   <select class="form-control" id="semana3" onchange="ActionSemana(this.value, 'tema3')"></select>
				 </div>
      		</div>
      		<div class="col-md-3">
      			<div class="form-group">
				   <label for="exampleFormControlSelect1">Tema</label>
				   <select class="form-control" id="tema3" onchange="listarActividades2(document.getElementById('semana3').value, this.value, document.getElementById('turno3').value)"></select>
				 </div>
      		</div>
      	</div>
      	<!-- <div class="wrapper"> -->
	        <div id="content" style="width: 100%">
	            <div class="row">
	                <div class="col-md-12">
	                    <table id="tab2" class="nowrap" style="width: 100%">
	                        <thead class="bg-primary">
	                        	<th>Codigo</th>
	                            <th>#</th>
	                            <th>Actividad</th>
	                            <th>Validar</th>
	                        </thead>
	                    </table>	                    
	                </div>
	                <div class="col-md-12 form-group">
					    <label for="exampleTextarea">Observaciones</label>
					    <textarea class="form-control" id="observaciones" rows="3"></textarea>
					</div>
	                <div class="col-md-2">
	                	<button type="button" class="btn btn-primary">REGRESAR</button>
	                </div>
	                <div class="col-md-8">
	                </div>
	                <div class="col-md-2">
	                	<button type="button" class="btn btn-primary" onclick="post_obs(document.getElementById('observaciones').value)">GUARDAR</button>
	                </div>
	            </div>
	        </div>
	    <!-- </div> -->
      </div>

    </div> <!-- /container -->
	
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
        	cargarUnidades("unidadDidactica3");
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
        });
        
        function listarMenuOpciones(){
        	$("#rol1").hide();
        	//con esto muestro las opciones según el perfil del usuario...
        	$.ajax({
        		type : 'GET',
        		dataType : 'json',
        		url : 'listarMenuOpciones',
        		success : function(result) 
        		{
        			if(result["coordinador"]){
        				$("#rol1").show();
        			}
        		},
        		error : function(xhr, ajaxOptions, thrownError) {
          			alert(xhr.status + ' ' + thrownError);
        		}
        	});
        }
    </script>
    <script src="resources/js/funciones.js"></script>
    <!--  FUNCIONALIDAD AUXILIAR -->
  </body>  
	
</html>