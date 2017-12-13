<%-- 
    Document   : inicio
    Created on : 3/10/2017, 08:58:30 AM
    Author     : j_saravia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" type="text/css" href="../diseno/css/materialize.css" media="screen,projection"/> 
        <!--<link rel="stylesheet" type="text/css" href="../diseno/css/bootstrap.css">
        <link rel="stylesheet" type="text/css" href="../diseno/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="../diseno/css/bootstrap-grid.css">  
        <link rel="stylesheet" type="text/css" href="../diseno/css/bootstrap-reboot.css">   -->
        <link rel="stylesheet" type="text/css" href="../diseno/css/toastr.min.css">
        <link rel="stylesheet" type="text/css" href="../diseno/css/estilos.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="icon" href="http://www.cccucuta.org.co/template/images/favicon.png" type="image/png" />
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <!-- DataTables -->
        <link rel="stylesheet" type="text/css" href="../diseno/DataTables/datatables.css">
        <link rel="stylesheet" type="text/css" href="../diseno/DataTables/DataTables-1.10.16/css/jquery.dataTables.css">
        <title>VICTIMAS</title>
        <style>
            input { 
                text-transform: uppercase;
            }
            ::-webkit-input-placeholder { /* WebKit browsers */
                text-transform: none;
            }
            :-moz-placeholder { /* Mozilla Firefox 4 to 18 */
                text-transform: none;
            }
            ::-moz-placeholder { /* Mozilla Firefox 19+ */
                text-transform: none;
            }
            :-ms-input-placeholder { /* Internet Explorer 10+ */
                text-transform: none;
            }
        </style>
    </head>
    <body onload="ocultar();">
        <%
            if(session.getAttribute("idAdministrador") == null || session.getAttribute("idAdministrador").toString().isEmpty()){
                response.sendRedirect("../index.jsp");
            }
            %>
        <jsp:include page="head.jsp" />
        <div>
            <jsp:include page="nav.jsp" />
        </div>
        <div class="row" style="margin-top: 10px;">
            <div class="col m2 offset-m8 input-field">
                <i class="material-icons prefix">search</i>
                <input id="documentoCon" type="number" class="validate">
                <label for="documentoCon">DOCUMENTO</label>
            </div>
            <div class="col m2" >
                <a class="btn waves-effect waves-light grey lighten-1" onclick="cargarEstudiante()" style="margin-top: 15px;"><i class="material-icons prefix">search</i></a>
                <a id="update" class="btn waves-effect waves-light orange lighten-1  modal-trigger" style="margin-top: 15px;" href="#modalAct"><i class="material-icons prefix">update</i></a>
            </div>
        </div>
        <div id="modalAct" class="modal" style="height: 500px;">
            <div class="modal-content" >
                <div class="row">
                    <div class="col s4">
                        <div class="input-field">
                            <i class="material-icons prefix">account_box</i>
                            <select id="campo">
                                <option value="" disabled selected>Campo a Actualizar</option>
                                <optgroup label="Estudiante"></optgroup>
                                <option value="1">Nombre</option>
                                <option value="2">Apellido</option>
                                <option value="3">Codigo</option>
                                <option value="4">Direccion Residencia</option>
                                <option value="5">Municipio Residencia</option>
                                <option value="6">Estrato</option>
                                <option value="7">Estado Civil</option>
                                <option value="8">Numero de Hijos</option>
                                <option value="9">¿Sordera Profunda?</option>
                                <option value="10">¿Lesion Muscular?</option>
                                <option value="11">¿Hipoacusia?</option>
                                <option value="12">¿Autismo?</option>
                                <option value="13">¿Baja Vision?</option>
                                <option value="14">¿Retraso?</option>
                                <option value="15">¿Ceguera?</option>
                                <option value="16">¿Down?</option>
                                <option value="17">¿Mudez?</option>
                                <option value="18">¿Paralisis Cerebral?</option>
                                <option value="19">¿Paraliss Fisica?</option>
                                <option value="20">¿No Aplica?</option>
                                <option value="21">¿No informa?</option>
                                <option value="22">Email</option>
                                <option value="23">Telefono</option>
                                <option value="24">Programa Academico</option>
                                <option value="25">Grupo Victima</option>
                                <optgroup label="Acudiente"></optgroup>
                                <option value="26">Nombre Acudiente</option>
                                <option value="27">Telefono Acudiente</option>
                                <option value="28">Direccion Residencia Acudiente</option>
                                <option value="29">Municipio Residencia Acudiente</option>
                                <optgroup label="Responsable"></optgroup>
                                <option value="30">Nombre Responsable</option>
                                <option value="31">Telefono Responsable</option>
                                <option value="32">Direccion Residencia Responsable</option>
                                <option value="33">Municipio Residencia Responsable</option>
                                <option value="34">Cargo Funcionario</option>
                                <option value="35">Email Funcionario</option>
                                <optgroup label="Familiar"></optgroup>
                                <option value="36">Numero de Hermanos</option>
                                <option value="37">Posicion de Hermanos</option>
                                <option value="38">Direccion de Residencia Familiar</option>
                                <option value="39">Municipio de Residencia Familiar</option>
                                <option value="40">Tipo de Vivienda</option>
                                <option value="41">Estrato</option>
                                <option value="42">Zona de Vivienda</option>
                                <option value="43">Tendencia Familiar</option>
                                <option value="44">Telefono Familiar</option>
                                <option value="45">Tiempo de Permanencia</option>
                                <optgroup label="Sostenimiento"></optgroup>
                                <option value="46">¿Trabaja?</option>
                                <option value="47">Lugar de Trabajo</option>
                                <option value="48">Presupuesto Mensual</option>
                                <option value="49">Como se sostiene</option>
                                <optgroup label="Psicosocial">Psicosocial</optgroup>
                                <option value="51">Situacion Psicologica</option>
                                <option value="52">Riesgos de No Permanencia</option>
                            </select>
                            <label>Campo a Actualizar</label>
                        </div> 
                    </div>
                    <div class="col s6">
                        <div class="input-field">
                            <i class="material-icons prefix">account_circle</i>
                            <input id="valor" type="text" class="validate">
                            <label for="valor">Valor</label>
                        </div>
                    </div>
                    <div align="center">
                        <a class="btn blue-grey lighten-2" style="margin-top:15px;" onclick="actualizarEstudiante();">ACTUALIZAR</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="margin-top: 10px;">
            <div class="col xl11 l11 m11 s11 offset-05">
                <div class="panel panel-danger">
                    <div class="panel-heading registro">
                        <h3 class="panel-title">ACTUALIZACION DEL ESTUDIANTE</h3>
                    </div>
                    <div class="panel-body">
                        <ul class="collapsible popout" data-collapsible="accordion">
                            <li>
                                <div class="collapsible-header registro"><i class="material-icons">assignment_ind</i>Datos Generales del Estudiante</div>
                                <div class="collapsible-body">
                                    <div class="row">

                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">account_circle</i>
                                            <input id="nombres" type="text" class="validate" placeholder="">
                                            <label for="nombres">Nombres</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="apellidos" type="text" class="validate" placeholder="">
                                            <label for="apellidos">Apellidos</label>
                                        </div>
                                        <!--<div class="input-field col s6">
                                            <i class="material-icons prefix">account_box</i>
                                            <select>
                                                <option value="" disabled selected>Tipo de Documento</option>
                                                <option value="1">Option 1</option>
                                                <option value="2">Option 2</option>
                                                <option value="3">Option 3</option>
                                            </select>
                                            <label>Materialize Select</label>
                                        </div>    maxlength="100" data-length="100"   -->
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="codigo" type="number" class="validate" placeholder="">
                                            <label for="codigo">Codigo</label>
                                        </div>
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="documento" type="text" class="validate" placeholder="">
                                            <label for="documento">Documento</label>
                                        </div>
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix">textsms</i>
                                            <input type="text" id="lugarExpedicion" class="autocomplete" placeholder="">
                                            <label for="lugarExpedicion">Lugar de Expedicion</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">account_box</i>
                                            <label>Fecha Nacimiento</label>
                                            <input type="text" name="fechaNac" id="fechaNac" placeholder="">
                                        </div>
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">textsms</i>
                                            <input type="text" id="municipioNacimiento" class="autocomplete" placeholder="">
                                            <label for="municipioNacimiento">Municipiio Nacimiento</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="direccionResidencia" type="text" class="validate" placeholder="">
                                            <label for="direccionResidencia">Direccion de Residencia</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">textsms</i>
                                            <input type="text" id="municipioResidencia" class="autocomplete" placeholder="">
                                            <label for="municipioResidencia">Municipiio Residencia</label>
                                        </div>
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="estrato" type="number" class="validate" placeholder="" maxlength="1" data-length="1">
                                            <label for="estrato">Estrato</label>
                                        </div>
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="estadoCivil" type="text" class="validate" placeholder="" maxlength="45" data-length="45">
                                            <label for="estadoCivil">Estado Civil</label>
                                        </div>
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="numeroHijos" type="text" class="validate" placeholder="" maxlength="2" data-length="2">
                                            <label for="numeroHijos">Numero de Hijos</label>
                                        </div>
                                        <!--<div class="input-field col s4">
                                            <i class="material-icons prefix">account_box</i>
                                            <select id="estrato">
                                                <option value="" disabled selected>Estrato</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                            </select>
                                            <label>Estrato</label>
                                        </div>
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix">account_box</i>
                                            <select id="estadoCivil" name="estadoCivil">
                                                <option value="0" disabled selected>Estado Civil</option>
                                                <option value="1">Soltero</option>
                                                <option value="2">Casado</option>
                                                <option value="3">Viudo</option>
                                                <option value="4">Divorciado</option>
                                            </select>
                                            <label>Estado Civil</label>
                                        </div>
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix">account_box</i>
                                            <select id="numeroHijos">
                                                <option value="" disabled selected>Numero de Hijos</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">+5</option>
                                            </select>
                                            <label>Numero de Hijos</label>
                                        </div>-->

                                        <div class="input col s2">
                                            <i class="material-icons prefix">account_box</i>
                                            <label for="icon_prefix" style="margin-left: 0px;">Grupo Etnico</label>
                                            <div class="switch">
                                                <label>
                                                    No
                                                    <input type="checkbox" id="grupoEtnico">
                                                    <span class="lever"></span>
                                                    Si
                                                </label>
                                            </div>
                                        </div>
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="email" type="email" class="validate" placeholder="">
                                            <label for="email">Email</label>
                                        </div>
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="telefono" type="number" class="validate" placeholder="">
                                            <label for="telefono">Telefono</label>
                                        </div>
                                        <div class="input col s2">
                                            <i class="material-icons prefix">account_box</i>
                                            <label for="mujerCabeza" style="margin-left: 0px;">Mujer Cabeza de Familia</label>
                                            <div class="switch">
                                                <label>
                                                    No
                                                    <input type="checkbox" id="mujerCabeza">
                                                    <span class="lever"></span>
                                                    Si
                                                </label>
                                            </div>
                                        </div>
                                        <div class="input col s12" >
                                            <i class="material-icons prefix">account_box</i>
                                            <label for="icon_prefix" style="margin-left: 0px;">Discapacidades</label>
                                            <div style="border: 1px solid #ecf0f1;">
                                                <div class="row" style="margin-top: 10px;">
                                                    <div class="col s2">
                                                        <input type="checkbox" id="test1" />
                                                        <label for="test1">Sordera Profunda</label>
                                                    </div>
                                                    <div class="col s2">
                                                        <input type="checkbox" id="test2" />
                                                        <label for="test2">Lesion Neuromuscular</label>
                                                    </div>
                                                    <div class="col s2">
                                                        <input type="checkbox" id="test3" />
                                                        <label for="test3">Baja Audicion</label>
                                                    </div>
                                                    <div class="col s2">
                                                        <input type="checkbox" id="test4" />
                                                        <label for="test4">Autismo</label>
                                                    </div>
                                                    <div class="col s2">
                                                        <input type="checkbox" id="test5" />
                                                        <label for="test5">Baja Vision</label>
                                                    </div>
                                                    <div class="col s2">
                                                        <input type="checkbox" id="test6" />
                                                        <label for="test6">Retardo Mental</label>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col s2">
                                                        <input type="checkbox" id="test7" />
                                                        <label for="test7">Ceguera</label>
                                                    </div>
                                                    <div class="col s2">
                                                        <input type="checkbox" id="test8" />
                                                        <label for="test8">Sindrome Down</label>
                                                    </div>
                                                    <div class="col s2">
                                                        <input type="checkbox" id="test9" />
                                                        <label for="test9">Mudez</label>
                                                    </div>
                                                    <div class="col s2">
                                                        <input type="checkbox" id="test10" />
                                                        <label for="test10">Paralisis Cerebral</label>
                                                    </div>
                                                    <div class="col s2">
                                                        <input type="checkbox" id="test11" />
                                                        <label for="test11">Paralisis Fisica</label>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col s2">
                                                        <input type="checkbox" id="test12" />
                                                        <label for="test12">No Aplica</label>
                                                    </div>
                                                    <div class="col s2">
                                                        <input type="checkbox" id="test13" />
                                                        <label for="test13">No Reporta</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">textsms</i>
                                            <input type="text" id="programaAcademico" class="autocomplete" placeholder="">
                                            <label for="programaAcademico">Programa Academico</label>
                                        </div>
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="modalidad" type="text" class="validate" placeholder="">
                                            <label for="modalidad">modalidad</label>
                                        </div>
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="semestreQueEntro" type="text" class="validate" placeholder="">
                                            <label for="semestreQueEntro">semestreQueEntro</label>
                                        </div>
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="jornada" type="text" class="validate" placeholder="">
                                            <label for="jornada">jornada</label>
                                        </div>
                                        <!--<div class="input-field col s3">
                                            <i class="material-icons prefix">account_box</i>
                                            <select id="modalidad">
                                                <option value="" disabled selected>Modalidad</option>
                                                <option value="1">Diurna</option>
                                                <option value="2">Nocturna</option>
                                            </select>
                                            <label>Modalidad</label>
                                        </div>
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">account_box</i>
                                            <select id="semestreQueEntro">
                                                <option value="" disabled selected>Semestre en que entró</option>
                                                <option value="1">2017-1</option>
                                            </select>
                                            <label>Semestre que Entró</label>
                                        </div>
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">account_box</i>
                                            <select id="jornada">
                                                <option value="" disabled selected>Jornada</option>
                                                <option value="1">Diurna</option>
                                                <option value="2">Nocturna</option>
                                                <option value="3">Distancia</option>
                                            </select>
                                            <label>Jornada</label>
                                        </div>-->
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="hechoVictimizante" type="text" class="validate" placeholder="">
                                            <label for="hechoVictimizante">Hecho Victimizante</label>
                                        </div>
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="acuerdo" type="text" class="validate" placeholder="">
                                            <label for="acuerdo">Acuerdo</label>
                                        </div>
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="grupoPerteneciente" type="text" class="validate" placeholder="">
                                            <label for="grupoPerteneciente">Grupo Perteneciente</label>
                                        </div>
                                        <!--<div class="input-field col s3">
                                            <i class="material-icons prefix">account_box</i>
                                            <select id="acuerdo">
                                                <option value="" disabled selected>Acuerdo</option>
                                                <option value="1">nº 1 octubre</option>
                                            </select>
                                            <label>Acuerdo</label>
                                        </div>
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix">account_box</i>
                                            <select id="grupoPerteneciente">
                                                <option value="" disabled selected>Grupo Perteneciente</option>
                                                <option value="1">Normal</option>
                                                <option value="2">Especial</option>
                                            </select>
                                            <label>Grupo Perteneciente</label>
                                        </div>-->
                                        <div class="input col s2">
                                            <i class="material-icons prefix">account_box</i>
                                            <label for="icon_prefix" style="margin-left: 0px;">Activo</label>
                                            <div class="switch">
                                                <label>
                                                    No
                                                    <input type="checkbox" id="estadoActivo">
                                                    <span class="lever"></span>
                                                    Si
                                                </label>
                                            </div>
                                        </div>
                                    </div>    
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header registro"><i class="material-icons">supervisor_account</i>Informacion del Acudiente</div>
                                <div class="collapsible-body">
                                    <div class="row">
                                        <div class="input-field col s5">
                                            <i class="material-icons prefix">account_circle</i>
                                            <input id="nombresAcudiente" type="text" class="validate" placeholder="">
                                            <label for="nombresAcudiente">Nombres</label>
                                        </div>
                                        <div class="input-field col s5">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="apellidosAcudiente" type="text" class="validate" placeholder="">
                                            <label for="apellidosAcudiente">Apellidos</label>
                                        </div>
                                        <!--<div class="input-field col s6">
                                            <i class="material-icons prefix">account_box</i>
                                            <select>
                                                <option value="" disabled selected>Tipo de Documento</option>
                                                <option value="1">Option 1</option>
                                                <option value="2">Option 2</option>
                                                <option value="3">Option 3</option>
                                            </select>
                                            <label>Materialize Select</label>
                                        </div>-->
                                        <div class="input-field col s2">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="telefonoAcudiente" type="text" class="validate" placeholder="">
                                            <label for="tenefonoAcudiente">Telefono Acudiente</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="direccionResidenciaAcudiente" type="text" class="validate" placeholder="">
                                            <label for="direccionResidenciaAcudiente">Direccion de Residencia</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">textsms</i>
                                            <input type="text" id="municipioResidenciaAcudiente" class="autocomplete" placeholder="">
                                            <label for="municipioResidenciaAcudiente">Municipiio Residencia</label>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header registro"><i class="material-icons">visibility</i>Funcionario Responsable</div>
                                <div class="collapsible-body">
                                    <div class="row">
                                        <div class="input-field col s5">
                                            <i class="material-icons prefix">account_circle</i>
                                            <input id="nombresResponsable" type="text" class="validate" placeholder="">
                                            <label for="nombresResponsable">Nombres</label>
                                        </div>
                                        <div class="input-field col s5">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="apellidosResponsable" type="text" class="validate" placeholder="">
                                            <label for="apellidosResponsable">Apellidos</label>
                                        </div>
                                        <!--<div class="input-field col s6">
                                            <i class="material-icons prefix">account_box</i>
                                            <select>
                                                <option value="" disabled selected>Tipo de Documento</option>
                                                <option value="1">Option 1</option>
                                                <option value="2">Option 2</option>
                                                <option value="3">Option 3</option>
                                            </select>
                                            <label>Materialize Select</label>
                                        </div>-->
                                        <div class="input-field col s2">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="telefonoResponsable" type="number" class="validate" placeholder="">
                                            <label for="telefonoResponsable">Telefono</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="direccionResidenciaResponsable" type="text" class="validate" placeholder="">
                                            <label for="direccionResidenciaResponsable">Direccion de Residencia</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">textsms</i>
                                            <input type="text" id="municipioResidenciaResponsable" class="autocomplete" placeholder="">
                                            <label for="municipioResidenciaResponsable">Municipiio Residencia</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="emailResponsable" type="email" class="validate" placeholder="">
                                            <label for="emailResponsable">Email</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">account_box</i>
                                            <input type="text" id="cargoResponsable" placeholder="">
                                            <label for="cargoResponsable">Cargo</label>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header registro"><i class="material-icons">wc</i>Descripcion Nucleo Familiar</div>
                                <div class="collapsible-body">
                                    <div class="row">
                                        <div class="input-field col s2">
                                            <i class="material-icons prefix">account_box</i>
                                            <input type="text" id="numeroHermanos" placeholder="">
                                            <label for="numeroHermanos">numeroHermanos</label>
                                        </div>

                                        <!--<div class="input-field col s2">
                                            <i class="material-icons prefix">account_box</i>
                                            <select id="numeroHermanos">
                                                <option value="" disabled selected>Numero de Hermanos</option>
                                                <option value="1">Option 1</option>
                                                <option value="2">Option 2</option>
                                                <option value="3">Option 3</option>
                                            </select>
                                            <label>Materialize Select</label>
                                        </div>-->
                                        <div class="input-field col s2">
                                            <i class="material-icons prefix">account_box</i>
                                            <input type="text" id="posicionHermanos" placeholder="">
                                            <label for="posicionHermanos">posicionHermanos</label>
                                        </div>
                                        <!--<div class="input-field col s2">
                                            <i class="material-icons prefix">account_box</i>
                                            <select id="posicionHermanos">
                                                <option value="" disabled selected>Posicion entre Hermanos</option>
                                                <option value="1">Option 1</option>
                                                <option value="2">Option 2</option>
                                                <option value="3">Option 3</option>
                                            </select>
                                            <label>Materialize Select</label>
                                        </div>-->

                                        <div class="input-field col s4">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="direccionResidenciaFamiliar" type="text" class="validate" placeholder="">
                                            <label for="direccionResidenciaFamiliar">Direccion de Residencia</label>
                                        </div>
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix">textsms</i>
                                            <input type="text" id="municipioResidenciaFamiliar" class="autocomplete" placeholder="">
                                            <label for="municipioResidenciaFamiliar">Municipiio Residencia</label>
                                        </div>
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">account_box</i>
                                            <input type="text" id="tipoViviendaFamiliar" placeholder="">
                                            <label for="tipoViviendaFamiliar">tipoViviendaFamiliar</label>
                                        </div>
                                        <!--<div class="input-field col s3">
                                            <i class="material-icons prefix">account_box</i>
                                            <select id="tipoViviendaFamiliar">
                                                <option value="" disabled selected>Tipo de Vivienda</option>
                                                <option value="1">Propia</option>
                                                <option value="2">Arrendada</option>
                                            </select>
                                            <label>Tipo Vivienda</label>
                                        </div>-->
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">account_box</i>
                                            <input type="text" id="estratoFamiliar" placeholder="">
                                            <label for="estratoFamiliar">estratoFamiliar</label>
                                        </div>
                                        <!--<div class="input-field col s3">
                                            <i class="material-icons prefix">account_box</i>
                                            <select id="estratoFamiliar">
                                                <option value="" disabled selected>Estrato</option>
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                                <option value="6">6</option>
                                            </select>
                                            <label>Estrato</label>
                                        </div>-->
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">account_box</i>
                                            <input type="text" id="zonaUbicacionFamiliar" placeholder="">
                                            <label for="zonaUbicacionFamiliar">zonaUbicacionFamiliar</label>
                                        </div>
                                        <!--<div class="input-field col s3">
                                            <i class="material-icons prefix">account_box</i>
                                            <select id="zonaUbicacionFamiliar">
                                                <option value="" disabled selected>Zona Ubicacion</option>
                                                <option value="1">Urbana</option>
                                                <option value="2">Rural</option>
                                            </select>
                                            <label>Zona Ubicacion</label>
                                        </div>-->
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">account_box</i>
                                            <input type="text" id="tendenciaFamiliar" placeholder="">
                                            <label for="tendenciaFamiliar">tendenciaFamiliar</label>
                                        </div>
                                        <!--<div class="input-field col s3">
                                            <i class="material-icons prefix">account_box</i>
                                            <select id="tendenciaFamiliar">
                                                <option value="" disabled selected>Tendencia ¿?¿?</option>
                                                <option value="1">Option 1</option>
                                                <option value="2">Option 2</option>
                                                <option value="3">Option 3</option>
                                            </select>
                                            <label>Materialize Select</label>
                                        </div>-->
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">textsms</i>
                                            <input type="number" id="telefonoFamiliar" placeholder="">
                                            <label for="telefonoFamiliar">Telefono</label>
                                        </div>
                                        <div class="input-field col s3">
                                            <i class="material-icons prefix">account_box</i>
                                            <input type="text" id="permanenciaVivienda" placeholder="">
                                            <label for="permanenciaVivienda">permanenciaVivienda</label>
                                        </div>
                                        <!--<div class="input-field col s3">
                                            <i class="material-icons prefix">textsms</i>
                                            <select id="permanenciaVivienda">
                                                <option value="" disabled selected>Permanencia</option>
                                                <option value="1">1 año</option>
                                                <option value="2">2 años</option>
                                                <option value="3">3 años</option>
                                            </select>
                                            <label>Tiempo de permanencia en la vivienda</label>
                                        </div>-->
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header registro"><i class="material-icons">recent_actors</i>Situacion Laboral de la Familia</div>
                                <div class="collapsible-body">
                                    <div class="row">
                                        <div class="col s12">
                                            <table class="striped">
                                                <thead>
                                                    <tr>
                                                        <th>Nombre</th>
                                                        <th>Parentesco</th>
                                                        <th>Fecha Nacimiento</th>
                                                        <th>Ocupacion</th>
                                                        <th>Ingresos</th>
                                                    </tr>
                                                </thead>

                                                <tbody id="tablaLaboral">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>

                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header registro"><i class="material-icons">attach_money</i>Sostenimiento del Estudiante</div>
                                <div class="collapsible-body">
                                    <div class="row">
                                        <div class="input col s2">
                                            <i class="material-icons prefix">account_box</i>
                                            <label for="icon_prefix" style="margin-left: 0px;">Trabaja</label>
                                            <div class="switch">
                                                <label>
                                                    No
                                                    <input type="checkbox" id="trabaja">
                                                    <span class="lever"></span>
                                                    Si
                                                </label>
                                            </div>
                                        </div>
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="lugarTrabajo" type="text" class="validate" placeholder="">
                                            <label for="lugarTrabajo">Lugar de Trabajo</label>
                                        </div>
                                        <div class="input-field col s4">
                                            <i class="material-icons prefix">account_box</i>
                                            <input id="presupuestoMensual" type="text" class="validate" placeholder="">
                                            <label for="presupuestoMensual">Presupuesto Mensual</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">mode_edit</i>
                                            <textarea id="comoSostiene" class="materialize-textarea" maxlength="150" data-length="150" placeholder=""></textarea>
                                            <label for="comoSostiene">Como se Sostiene?</label>
                                        </div>
                                        <div class="input-field col s6">
                                            <i class="material-icons prefix">mode_edit</i>
                                            <textarea id="observaciones" class="materialize-textarea" maxlength="150" data-length="150" placeholder=""></textarea>
                                            <label for="observaciones">Observaciones</label>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header registro"><i class="material-icons">event_seat</i>Caracterizacion Situacion Psicologica del Estudiante</div>
                                <div class="collapsible-body">
                                    <div class="row">
                                        <div class="input-field col s12">
                                            <i class="material-icons prefix">mode_edit</i>
                                            <textarea id="situacionPsicologica" class="materialize-textarea" maxlength="1000" data-length="1000" placeholder=""></textarea>
                                            <label for="situacionPsicologica">Situacion Psicosocial del Estudiante</label>
                                        </div>
                                        <div class="input-field col s12">
                                            <i class="material-icons prefix">mode_edit</i>
                                            <textarea id="riesgosPermanencia" class="materialize-textarea" maxlength="100" data-length="100" placeholder=""></textarea>
                                            <label for="riesgosPermanencia">Riesgos que puedan afectar la permanencia del estudiante</label>
                                        </div>

                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header registro"><i class="material-icons">toc</i>Anexos</div>
                                <div class="collapsible-body">
                                    <div class="row" id="tablaAnexos">

                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header registro"><i class="material-icons">view_agenda</i>Acompañamiento</div>
                                <div class="collapsible-body">
                                    <div id="acompanamiento">

                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header registro"><i class="material-icons">view_quilt</i>Seguimiento</div>
                                <div class="collapsible-body">
                                    <div id="seguimiento">

                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header registro"><i class="material-icons">watch_later</i>Semestres</div>
                                <div class="collapsible-body">
                                    <div id="semestres">

                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="collapsible-header registro"><i class="material-icons">work</i>Actividades</div>
                                <div class="collapsible-body">
                                    <div id="actividades">

                                    </div>
                                </div>
                            </li>
                        </ul>

                    </div>
                </div>
            </div>

        </div>
        <jsp:include page="foot.jsp"></jsp:include>
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="../diseno/js/materialize.min.js"></script>
        <script type="text/javascript" src="../diseno/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../diseno/js/blockUI.js"></script>
        <script type="text/javascript" src="../diseno/js/toastr.min.js"></script>
        <script type="text/javascript" src="../diseno/js/scripts.js"></script>
        <!--<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.3/sweetalert2.all.js"></script>

        <script type="text/javascript">
                            $(document).ready(function () {
                                $('.collapsible').collapsible();
                                $('select').material_select();
                            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $('select').material_select();
            });
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $(document).ready(function () {
                    $('select').material_select();
                });
                $('.datepicker').pickadate({
                    selectMonths: true, // Creates a dropdown to control month
                    selectYears: 100, // Creates a dropdown of 15 years to control year
                    // Strings and translations
                    monthsFull: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
                    monthsShort: ['Ene', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
                    weekdaysFull: ['Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado'],
                    weekdaysShort: ['Dom', 'Lun', 'Mar', 'Mier', 'Jue', 'Vie', 'Sab'],
                    showMonthsShort: undefined,
                    showWeekdaysFull: undefined,
                    weekdaysLetter: ['D', 'L', 'M', 'X', 'J', 'V', 'S'],
                    format: 'yyyy-mm-dd',
                    format_submit: false,
// Buttons
                    today: 'Hoy',
                    clear: 'Limpiar',
                    close: 'Aceptar',
// Accessibility labels
                    labelMonthNext: 'Mes Siguiente',
                    labelMonthPrev: 'Mes Anterior',
                    labelMonthSelect: 'Seleccione un Mes',
                    labelYearSelect: 'Seleccione un Año'
                });
            });
        </script>

        <script type="text/javascript">
            $(document).ready(function () {
                $('input.autocomplete').autocomplete({
                    data: {
                        "Cucuta": null,
                        "Villa del Rosario": null,
                        "Los Patios": null
                    },
                    limit: 20, // The max amount of results that can be shown at once. Default: Infinity.
                    onAutocomplete: function (val) {
                        // Callback function when value is autcompleted.
                    },
                    minLength: 1, // The minimum length of the input for the autocomplete to start. Default: 1.
                });
            });
        </script>

        <script type="text/javascript">
            $(document).ready(function () {
                // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
                $('.modal').modal();
            });
        </script>

        <!-- Datatables -->

        <script type="text/javascript" src="../diseno/DataTables/datatables.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                $('#myTablaSegui').DataTable({
                    "language": {
                        "sProcessing": "Procesando...",
                        "sLengthMenu": "Mostrar _MENU_ registros",
                        "sZeroRecords": "No se encontraron resultados",
                        "sEmptyTable": "Ningún dato disponible en esta tabla",
                        "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                        "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                        "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                        "sInfoPostFix": "",
                        "sSearch": "Buscar:",
                        "sUrl": "",
                        "sInfoThousands": ",",
                        "sLoadingRecords": "Cargando...",
                        "oPaginate": {
                            "sFirst": "Primero",
                            "sLast": "Último",
                            "sNext": "Siguiente",
                            "sPrevious": "Anterior"
                        },
                        "oAria": {
                            "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                        }
                    }
                });
            });
        </script>
    </body>
</html>
