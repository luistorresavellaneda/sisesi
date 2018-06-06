<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
 -->
<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="resources/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="resources/vendor/bootstrap/css/bootstrap.min.css">
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
	<link rel="stylesheet" type="text/css" href="resources/css/main.css">
<!--===============================================================================================-->
<title>SISESI</title>
</head>
<body>	
	
	<div class="app-header navbar-md white box-shadow">
     	<div class="navbar">
     		<ul class="nav navbar-nav pull-right">
     			<li class="nav-item dropdown">
     			<a data-toggle="dropdown" aria-expanded="false" class="nav-link dropdown-toggle clear non-user-select">
     				</i>&nbsp;
            			Usuario: ${ usuario }
            	</a>
            	<div class="dropdown-menu pull-right dropdown-menu-scale">
            		<a class="dropdown-item">
            			<i aria-hidden="true" class="fa fa-sign-out text-warning">
            			</i>&nbsp;&nbsp;
            			Salir
            		</a>
            	</div>
            </li>
          </ul>
        </div>
       </div>
       
       
    <!-- <div class="wrapper">
        <div id="content" style="width: 80%">
            <div class="row">
                <div class="col-md-12">
                    <table id="tab1" class="nowrap" style="width: 100%">
                        <thead class="bg-primary">
                            <th>#</th>
                            <th>Escuela</th>
                            <th>Ciclo</th>
                            <th>Curso</th>
                            <th>Docente</th>
                            <th>Grupo</th>
                            <th>Acción</th>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div> -->
    
    <!-- jQuery -->
    <!-- <script src="vendors/jquery/jquery.min.js"></script> -->
    <!-- Bootstrap Core JavaScript -->
    <!-- <script src="vendors/bootstrap/js/bootstrap.min.js"></script> -->
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    
    <%-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	 --%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.16/af-2.2.2/b-1.5.1/cr-1.4.1/fc-3.2.4/fh-3.1.3/kt-2.3.2/r-2.2.1/rg-1.0.2/rr-1.2.3/sc-1.4.4/sl-1.2.5/datatables.min.js"></script>
    
    <!-- FUNCIONALIDAD AUXILIAR -->
    <script>
        $(document).ready(function () {        	
        	listarMenuOpciones();
        	
        });
        
        function listarMenuOpciones(){
        	//con esto muestro las opciones según el perfil del usuario...
        	console.log("listarMenuOpciones();");
        	$.ajax({
        		type : 'GET',
        		dataType : 'json',
        		url : 'listarMenuOpciones', //'web/endes16/act_meses',
        		success : function(result) 
        		{
        			result["decano"] 
           			
        		},
        		error : function(xhr, ajaxOptions, thrownError) {
          			alert(xhr.status + ' ' + thrownError);
        		}
        	});
        }
    </script>
    <!--  FUNCIONALIDAD AUXILIAR -->
    
</body>
</html>

<!--  var json2 = jQuery.parseJSON(result);           			
           			$('#'+div).empty();
        	   		$('#'+div).append('<option value="0" selected="selected">TODOS</option>');
        	   		$.each(json2, function(j, result2) 
           	   		{
        	    		$('#'+div).append($('<option>').text(result2.mes).attr('value', result2.id));
           	   		}); --> 







<!--         var dataSet = new Array();
            var filaset = new Array();
            
            filaset.push('0');filaset.push('1');filaset.push('I');filaset.push('ALGORÍTMICA I');filaset.push('GUERRA GRADOS');
            filaset.push('1');filaset.push('<form method="post" action="validarSemana.html"><button type="submit" class="btn btn-primary">VALIDAR</button></form>');
            dataSet.push(filaset);
            
            filaset = new Array();
            filaset.push('0');filaset.push('2');filaset.push('II');filaset.push('ALGORÍTMICA II');filaset.push('NEHIL MUÑOZ');
            filaset.push('3');filaset.push('<button disabled type="submit" class="btn btn-danger">VALIDAR</button>');
            dataSet.push(filaset);
            
            filaset = new Array();
            filaset.push('0');filaset.push('3');filaset.push('III');filaset.push('ALGORÍTMICA III');filaset.push('ESPINOZA ESPINOZA');
            filaset.push('2');filaset.push('<button type="submit" class="btn btn-primary">VALIDAR</button>');
            dataSet.push(filaset);
            
            filaset = new Array();
            filaset.push('0');filaset.push('4');filaset.push('IV');filaset.push('BASE DE DATOS');filaset.push('LUZMILA PRO CONCEPCIÓN');
            filaset.push('1');filaset.push('<button disabled type="submit" class="btn btn-danger">VALIDAR</button>');
            dataSet.push(filaset);
            
            $('#tab1').DataTable( {
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
                  { title: "Ciclo" },
                  { title: "Curso" },
                  { title: "Docente" },
                  { title: "Grupo" },
                  { title: "Acción" }
                ]
            } ); -->

