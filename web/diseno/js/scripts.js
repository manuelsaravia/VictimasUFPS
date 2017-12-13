/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

var laboral = 3;
var laFila = 0;

function cargar() {
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

}

function generarReporte() {
    $("#btn-descarga").addClass('hidden');
    var fi = $('#fechaini').val();
    var ff = $('#fechafin').val();
    var vfi = fi.split('-');
    var dfi = vfi[2];
    var mfi = vfi[1];
    var afi = vfi[0];
    var vff = ff.split('-');
    var dff = vff[2];
    var mff = vff[1];
    var aff = vff[0];

    console.log(aff + mff + dff + "    " + afi + mfi + dfi);
    if (afi > aff) {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": true,
            "positionClass": "toast-top-right",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
        toastr.warning("El año Inicial no puede ser mayor al Final", "");
    } else {
        if (mfi > mff) {
            toastr.options = {
                "closeButton": false,
                "debug": false,
                "newestOnTop": false,
                "progressBar": false,
                "positionClass": "toast-top-right",
                "preventDuplicates": true,
                "onclick": null,
                "showDuration": "300",
                "hideDuration": "1000",
                "timeOut": "5000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            }
            toastr.warning("El mes Inicial no puede ser mayor al Final", "");
        } else {
            if (dfi > dff && mfi === mff) {
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.warning("El año Inicial no puede ser mayor al final", "");
            } else {
                var parametros = {
                    "fechaini": afi + mfi + dfi,
                    "fechafin": aff + mff + dff
                };
                $.ajax({
                    data: parametros,
                    url: '../proc/admin/procesar.jsp',
                    type: 'post',
                    beforeSend: function () {
                        $.blockUI({css: {
                                message: 'Generando Documento',
                                border: 'none',
                                padding: '10px',
                                backgroundColor: '#000',
                                '-webkit-border-radius': '10px',
                                '-moz-border-radius': '10px',
                                opacity: .5,
                                color: '#fff'
                            }});
                        setInterval('message()', 15000);
                    },
                    success: function (response) {

                        if (response.indexOf("vacio") > -1) {
                            toastr.options = {
                                "closeButton": false,
                                "debug": false,
                                "newestOnTop": false,
                                "progressBar": true,
                                "positionClass": "toast-top-right",
                                "preventDuplicates": false,
                                "onclick": null,
                                "showDuration": "300",
                                "hideDuration": "1000",
                                "timeOut": "5000",
                                "extendedTimeOut": "1000",
                                "showEasing": "swing",
                                "hideEasing": "linear",
                                "showMethod": "fadeIn",
                                "hideMethod": "fadeOut"
                            }

                            toastr.warning("Ha ocurido un error", "");
                            $.unblockUI();
                        } else if (response.indexOf("error") > -1) {
                            toastr.options = {
                                "closeButton": false,
                                "debug": false,
                                "newestOnTop": false,
                                "progressBar": false,
                                "positionClass": "toast-top-right",
                                "preventDuplicates": true,
                                "onclick": null,
                                "showDuration": "300",
                                "hideDuration": "1000",
                                "timeOut": "5000",
                                "extendedTimeOut": "1000",
                                "showEasing": "swing",
                                "hideEasing": "linear",
                                "showMethod": "fadeIn",
                                "hideMethod": "fadeOut"
                            }
                            toastr.error("Ha ocurrido un error", "");
                            $.unblockUI();
                        } else if (response.indexOf("espacio") > -1) {
                            toastr.options = {
                                "closeButton": false,
                                "debug": false,
                                "newestOnTop": false,
                                "progressBar": false,
                                "positionClass": "toast-top-right",
                                "preventDuplicates": true,
                                "onclick": null,
                                "showDuration": "300",
                                "hideDuration": "1000",
                                "timeOut": "5000",
                                "extendedTimeOut": "1000",
                                "showEasing": "swing",
                                "hideEasing": "linear",
                                "showMethod": "fadeIn",
                                "hideMethod": "fadeOut"
                            }
                            toastr.error("Ha ocurrido un error", "");
                            $.unblockUI();
                            swal("Oops", "El archivo a generar sobrepasa los limites de capacidad del servidor, por favor intente generar uno con fechas mas cercanas", "error");
                        }
                        else {
                            $.unblockUI();
                            swal("Genial", "El archivo fue generado y esta listo para ser descargado", "success");
                            var url = "../files/" + response.trim();
                            $("#btn-descarga").removeClass('hidden');
                            $("#desc").attr('href', url);
                        }
                    }
                });
            }
        }
    }

}

function message() {
    toastr.options = {
        "closeButton": false,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-right",
        "preventDuplicates": true,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "5000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }
    toastr.success("Tranquilo, Seguimos trabajando", "");
}

function activar() {
    $('#laboral' + this.laboral).removeClass('hiddendiv');
    this.laboral = this.laboral + 1;
}

function iniciarSesion() {
    var user = $('#user').val();
    var pass = $('#pass').val();
    console.log(user);
    console.log(pass);

    if (user === "" || pass === "") {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-top-right",
            "preventDuplicates": true,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
        toastr.warning("Debe de ingresar un usuario y una contraseña", "");
    } else {
        var parametros = {
            "user": user,
            "pass": pass
        };
        $.ajax({
            data: parametros,
            url: 'proc/iniciarSesion.jsp',
            type: 'post',
            beforeSend: function () {
                $.blockUI({
                    message: 'Consultando Administrador',
                    css: {
                        border: 'none',
                        padding: '10px',
                        backgroundColor: '#000',
                        '-webkit-border-radius': '10px',
                        '-moz-border-radius': '10px',
                        opacity: .5,
                        color: '#fff'
                    }});
            },
            success: function (response) {
                if (response.trim() === "") {
                    $.unblockUI();
                    toastr.options = {
                        "closeButton": false,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": false,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                    toastr.warning("El usuario no se encuentra registrado en el sistema", "Alerta!");
                } else if (response.trim() === "error") {
                    $.unblockUI();
                    toastr.options = {
                        "closeButton": false,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": false,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                    toastr.error("Ha ocurrido un error a la hora de consultar el usuario", "Alerta!");
                } else {
                    $.unblockUI();
                    window.location.href = "view/principal.jsp";

                }
            }
        });
    }
}

function cargarRegistroEstudiante() {
    //informacion perteneciente al estudiante
    var nombres = $('#nombres').val();
    var apellidos = $('#apellidos').val();
    var codigo = $('#codigo').val();
    var documento = $('#documento').val();
    var lugarExpedicion = $('#lugarExpedicion').val();
    var fechaNac = $('#fechaNac').val();
    var municipioNacimiento = $('#municipioNacimiento').val();
    var direccionResidencia = $('#direccionResidencia').val();
    var municipioResidencia = $('#municipioResidencia').val();
    var estrato = $('#estrato').val();
    var estadoCivil = $('#estadoCivil').val();
    var numeroHijos = $('#numeroHijos').val();
    var grupoEtnico = $('#grupoEtnico').prop("checked");
    var email = $('#email').val();
    var telefono = $('#telefono').val();
    var mujerCabeza = $('#mujerCabeza').prop("checked");
    console.log(nombres);
    console.log(apellidos);
    console.log(codigo);
    console.log(documento);
    console.log(fechaNac);
    console.log(municipioNacimiento);
    console.log(direccionResidencia);
    console.log(municipioResidencia);
    console.log(estrato);
    console.log(estadoCivil);
    console.log(numeroHijos);
    console.log(grupoEtnico);
    console.log(email);
    console.log(telefono);
    console.log(mujerCabeza);

    var sordera = $('#test1').prop("checked");
    var neuromuscular = $('#test2').prop("checked");
    var audicion = $('#test3').prop("checked");
    var autismo = $('#test4').prop("checked");
    var vision = $('#test5').prop("checked");
    var retardo = $('#test6').prop("checked");
    var ceguera = $('#test7').prop("checked");
    var down = $('#test8').prop("checked");
    var mudez = $('#test9').prop("checked");
    var cerebral = $('#test10').prop("checked");
    var fisica = $('#test11').prop("checked");
    var noAplica = $('#test12').prop("checked");
    var noReporta = $('#test13').prop("checked");
    console.log(sordera);
    console.log(neuromuscular);
    console.log(audicion);
    console.log(autismo);
    console.log(vision);
    console.log(retardo);
    console.log(ceguera);
    console.log(sordera);
    console.log(down);
    console.log(mudez);
    console.log(cerebral);
    console.log(fisica);
    console.log(noAplica);
    console.log(noReporta);

    var programaAcademico = $('#programaAcademico').val();
    var modalidad = $('#modalidad').val();
    var semestreQueEntro = $('#semestreQueEntro').val();
    var jornada = $('#jornada').val();
    var hechoVictimizante = $('#hechoVictimizante').val();
    var acuerdo = $('#acuerdo').val();
    var grupoPerteneciente = $('#grupoPerteneciente').val();
    console.log(programaAcademico);
    console.log(modalidad);
    console.log(semestreQueEntro);
    console.log(jornada);
    console.log(hechoVictimizante);
    console.log(acuerdo);
    console.log(grupoPerteneciente);

    //informacion perteneciente al acudiente
    var nombresAcudiente = $('#nombresAcudiente').val();
    var apellidosAcudiente = $('#apellidosAcudiente').val();
    var telefonoAcudiente = $('#telefonoAcudiente').val();
    var direccionResidenciaAcudiente = $('#direccionResidenciaAcudiente').val();
    var municipioResidenciaAcudiente = $('#municipioResidenciaAcudiente').val();
    console.log(nombresAcudiente);
    console.log(apellidosAcudiente);
    console.log(telefonoAcudiente);
    console.log(direccionResidenciaAcudiente);

    //informacion perteneciente al funcionario responsable
    var nombresResponsable = $('#nombresResponsable').val();
    var apellidosResponsable = $('#apellidosResponsable').val();
    var telefonoResponsable = $('#telefonoResponsable').val();
    var direccionResidenciaResponsable = $('#direccionResidenciaResponsable').val();
    var municipioResidenciaResponsable = $('#municipioResidenciaResponsable').val();
    var cargoResponsable = $('#cargoResponsable').val();
    var emailResponsable = $('#emailResponsable').val();
    console.log(nombresResponsable);
    console.log(apellidosResponsable);
    console.log(telefonoResponsable);
    console.log(direccionResidenciaResponsable);
    console.log(municipioResidenciaResponsable);

    //informacion perteneciente al nucleo familiar
    var numeroHermanos = $('#numeroHermanos').val();
    var posicionHermanos = $('#posicionHermanos').val();
    var direccionResidenciaFamiliar = $('#direccionResidenciaFamiliar').val();
    var municipioResidenciaFamiliar = $('#municipioResidenciaFamiliar').val();
    var tipoViviendaFamiliar = $('#tipoViviendaFamiliar').val();
    var estratoFamiliar = $('#estratoFamiliar').val();
    var zonaUbicacionFamiliar = $('#zonaUbicacionFamiliar').val();
    var tendenciaFamiliar = $('#tendenciaFamiliar').val();
    var telefonoFamiliar = $('#telefonoFamiliar').val();
    var permanenciaVivienda = $('#permanenciaVivienda').val();
    console.log(numeroHermanos);
    console.log(posicionHermanos);
    console.log(direccionResidenciaFamiliar);
    console.log(municipioResidenciaFamiliar);
    console.log(tipoViviendaFamiliar);
    console.log(estratoFamiliar);
    console.log(zonaUbicacionFamiliar);
    console.log(tendenciaFamiliar);
    console.log(telefonoFamiliar);
    console.log(permanenciaVivienda);

    //informacion perteneciente a la situacion laboral de la familia
    var nombresLaboral1 = $('#nombresLaboral1').val();
    var parentescoLaboral1 = $('#parentescoLaboral1').val();
    var fechaNacLaboral1 = $('#fechaNacLaboral1').val();
    var ocupacionLaboral1 = $('#ocupacionLaboral1').val();
    var ingresosLaboral1 = $('#ingresosLaboral1').val();
    console.log(nombresLaboral1);
    console.log(parentescoLaboral1);
    console.log(fechaNacLaboral1);
    console.log(ocupacionLaboral1);
    console.log(ingresosLaboral1);

    //informacion complementaria de la situacion laboral de la familia
    var ingresosAdicionales = "";
    for (var i = 3; i < this.laboral; i++) {
        ingresosAdicionales += $('#nombresLaboral' + i).val() + '##';
        ingresosAdicionales += $('#parentescoLaboral' + i).val() + '##';
        ingresosAdicionales += $('#fechaNacLaboral' + i).val() + '##';
        ingresosAdicionales += $('#ocupacionLaboral' + i).val() + '##';
        ingresosAdicionales += $('#ingresosLaboral' + i).val() + '#-#';
    }
    console.log(ingresosAdicionales);

    //informacion perteneciente al sostenimiento del estudiante
    var trabaja = $('#trabaja').prop("checked");
    var lugarTrabajo = $('#lugarTrabajo').val();
    var presupuestoMensual = $('#presupuestoMensual').val();
    var comoSostiene = $('#comoSostiene').val();
    var observaciones = $('#observaciones').val();
    console.log(trabaja);
    console.log(lugarTrabajo);
    console.log(presupuestoMensual);
    console.log(comoSostiene);
    console.log(observaciones);

    //informacion perteneciente a la caracterizacion situacion psicologica del estudiante
    var situacionPsicologica = $('#situacionPsicologica').val();
    var riesgosPermanencia = $('#riesgosPermanencia').val();
    console.log(situacionPsicologica);
    console.log(riesgosPermanencia);





    if (nombres === "" || apellidos === "" || codigo === "" || documento === "" || lugarExpedicion === "" || fechaNac === "" || municipioNacimiento === "" ||
            direccionResidencia === "" || municipioResidencia === "" || estrato === null || estadoCivil === null || numeroHijos === null ||
            email === "" || telefono === "" || (!sordera && !neuromuscular && !audicion && !autismo && !vision && !retardo &&
                    !ceguera && !down && !mudez && !cerebral && !fisica && !noAplica && !noReporta) || programaAcademico === "" ||
            modalidad === null || semestreQueEntro === null || jornada === null || hechoVictimizante === "" || acuerdo === null ||
            grupoPerteneciente === "" || nombresAcudiente === "" ||
            apellidosAcudiente === "" || telefonoAcudiente === "" || direccionResidenciaAcudiente === "" || municipioResidenciaAcudiente === "" || nombresResponsable === "" ||
            apellidosResponsable === "" || telefonoResponsable === "" || direccionResidenciaResponsable === "" ||
            municipioResidenciaResponsable === "" || cargoResponsable === "" || emailResponsable === "" || numeroHermanos === null || posicionHermanos === null || direccionResidenciaFamiliar === "" ||
            municipioResidenciaFamiliar === "" || tipoViviendaFamiliar === null || estratoFamiliar === null || zonaUbicacionFamiliar === null ||
            tendenciaFamiliar === null || telefonoFamiliar === "" || permanenciaVivienda === null || nombresLaboral1 === "" || parentescoLaboral1 === null ||
            fechaNacLaboral1 === "" || ocupacionLaboral1 === "" || ingresosLaboral1 === "" || comoSostiene === "" ||
            observaciones === "" || situacionPsicologica === "" || riesgosPermanencia === "") {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-top-right",
            "preventDuplicates": true,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
        toastr.warning("Debe de ingresar todos los campos para poder continuar", "");
    } else {
        var parametros = {
            "nombres": nombres,
            "apellidos": apellidos,
            "codigo": codigo,
            "documento": documento,
            "lugarExpedicion": lugarExpedicion,
            "fechaNac": fechaNac,
            "municipioNacimiento": municipioNacimiento,
            "direccionResidencia": direccionResidencia,
            "municipioResidencia": municipioResidencia,
            "estrato": estrato,
            "estadoCivil": estadoCivil,
            "numeroHijos": numeroHijos,
            "grupoEtnico": grupoEtnico,
            "email": email,
            "telefono": telefono,
            "mujerCabeza": mujerCabeza,
            "sordera": sordera,
            "neuromuscular": neuromuscular,
            "audicion": audicion,
            "autismo": autismo,
            "vision": vision,
            "retardo": retardo,
            "ceguera": ceguera,
            "down": down,
            "mudez": mudez,
            "cerebral": cerebral,
            "fisica": fisica,
            "noAplica": noAplica,
            "noReporta": noReporta,
            "programaAcademico": programaAcademico,
            "modalidad": modalidad,
            "semestreQueEntro": semestreQueEntro,
            "jornada": jornada,
            "hechoVictimizante": hechoVictimizante,
            "acuerdo": acuerdo,
            "grupoPerteneciente": grupoPerteneciente,
            "nombresAcudiente": nombresAcudiente,
            "apellidosAcudiente": apellidosAcudiente,
            "telefonoAcudiente": telefonoAcudiente,
            "direccionResidenciaAcudiente": direccionResidenciaAcudiente,
            "municipioResidenciaAcudiente": municipioResidenciaAcudiente,
            "nombresResponsable": nombresResponsable,
            "apellidosResponsable": apellidosResponsable,
            "telefonoResponsable": telefonoResponsable,
            "direccionResidenciaResponsable": direccionResidenciaResponsable,
            "municipioResidenciaResponsable": municipioResidenciaResponsable,
            "cargoResponsable": cargoResponsable,
            "emailResponsable": emailResponsable,
            "numeroHermanos": numeroHermanos,
            "posicionHermanos": posicionHermanos,
            "direccionResidenciaFamiliar": direccionResidenciaFamiliar,
            "municipioResidenciaFamiliar": municipioResidenciaFamiliar,
            "tipoViviendaFamiliar": tipoViviendaFamiliar,
            "estratoFamiliar": estratoFamiliar,
            "zonaUbicacionFamiliar": zonaUbicacionFamiliar,
            "tendenciaFamiliar": tendenciaFamiliar,
            "telefonoFamiliar": telefonoFamiliar,
            "permanenciaVivienda": permanenciaVivienda,
            "nombresLaboral1": nombresLaboral1,
            "parentescoLaboral1": parentescoLaboral1,
            "fechaNacLaboral1": fechaNacLaboral1,
            "ocupacionLaboral1": ocupacionLaboral1,
            "ingresosLaboral1": ingresosLaboral1,
            "ingresosAdicionales": ingresosAdicionales,
            "trabaja": trabaja,
            "lugarTrabajo": lugarTrabajo,
            "presupuestoMensual": presupuestoMensual,
            "comoSostiene": comoSostiene,
            "observaciones": observaciones,
            "situacionPsicologica": situacionPsicologica,
            "riesgosPermanencia": riesgosPermanencia
        };
        $.ajax({
            data: parametros,
            url: '../proc/registrarEstudiante.jsp',
            type: 'post',
            beforeSend: function () {
                $.blockUI({
                    message: 'Registrando Estudiante',
                    css: {
                        border: 'none',
                        padding: '10px',
                        backgroundColor: '#000',
                        '-webkit-border-radius': '10px',
                        '-moz-border-radius': '10px',
                        opacity: .5,
                        color: '#fff'
                    }});
            },
            success: function (response) {
                if (response.trim() === "dupli") {
                    $.unblockUI();
                    toastr.options = {
                        "closeButton": false,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": false,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                    toastr.warning("El usuario ya se encuentra Registrado", "Alerta!");
                } else if (response.trim() === "error") {
                    $.unblockUI();
                    toastr.options = {
                        "closeButton": false,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": false,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                    toastr.error("Ha Ocurrido un error", "Alerta!");
                } else {
                    $.unblockUI();
                    $('input').val('');
                    $('textarea').val('');
                    $('input:checkbox').prop("checked", false);

                    swal({
                        title: "EN HORA BUENA!",
                        text: "REGISTRO EXITOSO",
                        icon: "success",
                        allowOutsideClick: false,
                        allowEscapeKey: false,
                        allowEnterKey: true,
                        focusConfirm: true,
                        showCloseButton: false,
                        button: "OK"
                    }).then(function () {
                        if (true) {
                            window.location.href = "principal.jsp";
                        }
                    });
                    /*swal({
                     title: "EN HORA BUENA!",
                     text: "REGISTRO EXITOSO",
                     icon: "success",
                     closeOnClickOutside: false,
                     closeOnEsc: false,
                     button: "OK"
                     },
                     function(){
                     window.location.href = "inicio.jsp";
                     });
                     */


                }
            }
        });
    }
}

function crearSemestre() {
    var fecha = $('#fecha').val();
    console.log(fecha);
    if (fecha === "") {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-top-right",
            "preventDuplicates": true,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
        toastr.warning("Debe de ingresar una fecha", "");
    } else {
        var parametros = {
            "fecha": fecha
        };
        $.ajax({
            data: parametros,
            url: '../proc/crearSemestre.jsp',
            type: 'post',
            beforeSend: function () {
                $.blockUI({
                    message: 'Creando Semestre ',
                    css: {
                        border: 'none',
                        padding: '10px',
                        backgroundColor: '#000',
                        '-webkit-border-radius': '10px',
                        '-moz-border-radius': '10px',
                        opacity: .5,
                        color: '#fff'
                    }});
            },
            success: function (response) {
                if (response.trim() === "dupli") {
                    $.unblockUI();
                    toastr.options = {
                        "closeButton": false,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": false,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                    toastr.warning("El semestre ya se encuentra registrado en el sistema", "");
                } else if (response.trim() === "error") {
                    $.unblockUI();
                    toastr.options = {
                        "closeButton": false,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": false,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                    toastr.error("Ha ocurrido un error a la hora de Crear el semestre", "");
                } else {
                    $.unblockUI();
                    swal({
                        title: "EN HORA BUENA!",
                        text: "REGISTRO EXITOSO",
                        icon: "success",
                        button: "OK"
                    });
                    $('input').val('');

                }
            }
        });
    }
}

function registrarActividad() {
    var nombre = $('#nombre').val();
    var fecha = $('#fecha').val();
    var hora = $('#hora').val();
    var lugar = $('#lugar').val();
    var obligatoriedad = $('#obligatoriedad').val();
    console.log(nombre);
    console.log(fecha);
    console.log(lugar);
    console.log(obligatoriedad);
    if (nombre === "" || fecha === "" || lugar === "" || obligatoriedad === "" || hora === "") {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-top-right",
            "preventDuplicates": true,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
        toastr.warning("Debe de completar los campos", "");
    } else {
        var parametros = {
            "nombre": nombre,
            "fecha": fecha,
            "lugar": lugar,
            "obligatoriedad": obligatoriedad,
            "hora": hora
        };
        $.ajax({
            data: parametros,
            url: '../proc/registrarActividad.jsp',
            type: 'post',
            beforeSend: function () {
                $.blockUI({
                    message: 'Registrando Actividad ',
                    css: {
                        border: 'none',
                        padding: '10px',
                        backgroundColor: '#000',
                        '-webkit-border-radius': '10px',
                        '-moz-border-radius': '10px',
                        opacity: .5,
                        color: '#fff'
                    }});
            },
            success: function (response) {
                if (response.trim() === "dupli") {
                    $.unblockUI();
                    toastr.options = {
                        "closeButton": false,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": false,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                    toastr.warning("La Actividad ya se encuentra registrado en el sistema", "");
                } else if (response.trim() === "error") {
                    $.unblockUI();
                    toastr.options = {
                        "closeButton": false,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": false,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                    toastr.error("Ha ocurrido un error a la hora de registrar la actividad", "");
                } else {
                    $.unblockUI();
                    swal({
                        title: "EN HORA BUENA!",
                        text: "REGISTRO EXITOSO",
                        icon: "success",
                        button: "OK"
                    });
                    $('input').val('');

                }
            }
        });
    }
}

function ocultar() {
    $('input').val('');
    $('input').prop("disabled", true);
    $('textarea').val('');
    $('textarea').prop("disabled", true);
    $('input:checkbox').prop("checked", false);
    $('input:checkbox').prop("disabled", true);
    //$('select').prop("disabled", true);


    $('#update').attr("disabled", true);
    $('#documentoCon').prop("disabled", false);
}

function ocultar2() {

    $('input').prop("disabled", true);
    $('textarea').prop("disabled", true);
    $('#documentoCon').prop('disabled', false);
    //$('select').prop("disabled", true);
}

function cargarEstudiante() {
    var doc = $('#documentoCon').val();
    if (doc === "") {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-top-right",
            "preventDuplicates": true,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
        toastr.warning("Debe escribir un documento", "");
        ocultar();
    } else {
        var parametros = {
            "doc": doc
        };
        $.ajax({
            data: parametros,
            url: '../proc/cargarEstudiante.jsp',
            type: 'post',
            beforeSend: function () {
                $.blockUI({
                    message: 'Cargando Estudiante ',
                    css: {
                        border: 'none',
                        padding: '10px',
                        backgroundColor: '#000',
                        '-webkit-border-radius': '10px',
                        '-moz-border-radius': '10px',
                        opacity: .5,
                        color: '#fff'
                    }});
            },
            success: function (response) {
                if (response.trim() === "vacio") {
                    $.unblockUI();
                    toastr.options = {
                        "closeButton": false,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": false,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                    toastr.warning("El Estudiante no se encuentra registrado en el sistema", "");
                    ocultar();
                } else if (response.trim() === "error") {
                    $.unblockUI();
                    toastr.options = {
                        "closeButton": false,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": false,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                    toastr.error("Ha ocurrido un error a la hora de Consultar el Estudiante", "");
                    ocultar();
                } else {
                    var x = response.trim();
                    var datos = x.split('#-#');


                    $('#nombres').val(datos[0]);
                    $('#apellidos').val(datos[1]);
                    $('#codigo').val(datos[31]);
                    $('#documento').val(datos[2]);
                    $('#lugarExpedicion').val(datos[3]);
                    $('#fechaNac').val(datos[4]);
                    $('#municipioNacimiento').val(datos[5]);
                    $('#direccionResidencia').val(datos[6]);
                    $('#municipioResidencia').val(datos[7]);
                    $('#estrato').val(datos[8]);
                    $('#estadoCivil').val(datos[9]);

                    $('#numeroHijos').val(datos[10]);
                    if (datos[11] === 'T') {
                        $('#grupoEtnico').prop("checked", true);
                    }
                    else {
                        $('#grupoEtnico').prop("checked", false);
                    }

                    if (datos[12] === 'T') {
                        $('#mujerCabeza').prop("checked", true);
                    }
                    else {
                        $('#mujerCabeza').prop("checked", false);
                    }

                    if (datos[13] === 'T') {
                        $('#test1').prop("checked", true);
                    }
                    else {
                        $('#test1').prop("checked", false);
                    }
                    if (datos[14] === 'T') {
                        $('#test2').prop("checked", true);
                    }
                    else {
                        $('#test2').prop("checked", false);
                    }
                    if (datos[15] === 'T') {
                        $('#test3').prop("checked", true);
                    }
                    else {
                        $('#test3').prop("checked", false);
                    }
                    if (datos[16] === 'T') {
                        $('#test4').prop("checked", true);
                    }
                    else {
                        $('#test4').prop("checked", false);
                    }
                    if (datos[17] === 'T') {
                        $('#test5').prop("checked", true);
                    }
                    else {
                        $('#test5').prop("checked", false);
                    }
                    if (datos[18] === 'T') {
                        $('#test6').prop("checked", true);
                    }
                    else {
                        $('#test6').prop("checked", false);
                    }
                    if (datos[19] === 'T') {
                        $('#test7').prop("checked", true);
                    }
                    else {
                        $('#test7').prop("checked", false);
                    }
                    if (datos[20] === 'T') {
                        $('#test8').prop("checked", true);
                    }
                    else {
                        $('#test8').prop("checked", false);
                    }
                    if (datos[21] === 'T') {
                        $('#test9').prop("checked", true);
                    }
                    else {
                        $('#test9').prop("checked", false);
                    }
                    if (datos[22] === 'T') {
                        $('#test10').prop("checked", true);
                    }
                    else {
                        $('#test10').prop("checked", false);
                    }
                    if (datos[23] === 'T') {
                        $('#test11').prop("checked", true);
                    }
                    else {
                        $('#test11').prop("checked", false);
                    }
                    if (datos[24] === 'T') {
                        $('#test12').prop("checked", true);
                    }
                    else {
                        $('#test12').prop("checked", false);
                    }
                    if (datos[25] === 'T') {
                        $('#test13').prop("checked", true);
                    }
                    else {
                        $('#test13').prop("checked", false);
                    }
                    $('#email').val(datos[26]);
                    $('#telefono').val(datos[27]);
                    $('#programaAcademico').val(datos[28]);
                    $('#modalidad').val(datos[29]);
                    $('#semestreQueEntro').val(datos[30]);
                    $('#jornada').val(datos[32]);
                    $('#hechoVictimizante').val(datos[33]);
                    $('#acuerdo').val(datos[63]);
                    $('#grupoPerteneciente').val(datos[34]);
                    if (datos[62] === 'T') {
                        $('#estadoActivo').prop("checked", true);
                    }
                    else {
                        $('#estadoActivo').prop("checked", false);
                    }
                    //informacion perteneciente al acudiente
                    $('#nombresAcudiente').val(datos[35].split('#-.-#')[0]);
                    $('#apellidosAcudiente').val(datos[35].split('#-.-#')[1]);
                    $('#telefonoAcudiente').val(datos[36]);
                    $('#direccionResidenciaAcudiente').val(datos[37]);
                    $('#municipioResidenciaAcudiente').val(datos[38]);

                    //informacion perteneciente al funcionario responsable
                    $('#nombresResponsable').val(datos[39].split('#-.-#')[0]);
                    $('#apellidosResponsable').val(datos[39].split('#-.-#')[1]);
                    $('#telefonoResponsable').val(datos[40]);
                    $('#direccionResidenciaResponsable').val(datos[43]);
                    $('#municipioResidenciaResponsable').val(datos[44]);
                    $('#cargoResponsable').val(datos[41]);
                    $('#emailResponsable').val(datos[42]);

                    //informacion perteneciente al nucleo familiar
                    $('#numeroHermanos').val(datos[45]);
                    $('#posicionHermanos').val(datos[46]);
                    $('#direccionResidenciaFamiliar').val(datos[47]);
                    $('#municipioResidenciaFamiliar').val(datos[48]);
                    $('#tipoViviendaFamiliar').val(datos[50]);
                    $('#estratoFamiliar').val(datos[49]);
                    $('#zonaUbicacionFamiliar').val(datos[51]);
                    $('#tendenciaFamiliar').val(datos[52]);
                    $('#telefonoFamiliar').val(datos[54]);
                    $('#permanenciaVivienda').val(datos[53]);

                    //informacion perteneciente al sostenimiento del estudiante
                    if (datos[55] === 'T') {
                        $('#trabaja').prop("checked", true);
                    }
                    else {
                        $('#trabaja').prop("checked", false);
                    }
                    $('#lugarTrabajo').val(datos[56]);
                    $('#presupuestoMensual').val(datos[57]);
                    $('#comoSostiene').val(datos[58]);
                    $('#observaciones').val(datos[59]);

                    //informacion perteneciente a la caracterizacion situacion psicologica del estudiante
                    $('#situacionPsicologica').val(datos[60]);
                    $('#riesgosPermanencia').val(datos[61]);
                    $('#tablaLaboral').html(datos[64]);
                    $('#tablaAnexos').html(datos[65]);
                    $('#acompanamiento').html(datos[66]);
                    $('#seguimiento').html(datos[67]);
                    $('#semestres').html(datos[68]);
                    $('#actividades').html(datos[69]);

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

                    $('#myTablaSems').DataTable({
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

                    $('#myTablaActs').DataTable({
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

                    ocultar2();
                    $('#update').attr("disabled", false);
                    $('#valor').attr("disabled", false);
                    var sel = $('#campo').attr('data-select-id');
                    $('input[aria-controls$="myTablaSegui"]').attr('disabled', false);
                    $('input[aria-controls$="myTablaSems"]').attr('disabled', false);
                    $('input[aria-controls$="myTablaActs"]').attr('disabled', false);
                    $('input[data-activates$="select-options-' + sel + '"]').attr('disabled', false);
                    $.unblockUI();
                }
            }
        });
    }
}

function cargarEstudiante2() {
    var doc = $('#documentoCon').val();
    if (doc === "") {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-top-right",
            "preventDuplicates": true,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
        toastr.warning("Debe escribir un documento", "");
        ocultar();
    } else {
        var parametros = {
            "doc": doc
        };
        $.ajax({
            data: parametros,
            url: '../proc/cargarEstudiante2.jsp',
            type: 'post',
            beforeSend: function () {
                $.blockUI({
                    message: 'Cargando Estudiante ',
                    css: {
                        border: 'none',
                        padding: '10px',
                        backgroundColor: '#000',
                        '-webkit-border-radius': '10px',
                        '-moz-border-radius': '10px',
                        opacity: .5,
                        color: '#fff'
                    }});
            },
            success: function (response) {
                if (response.trim() === "vacio") {
                    $.unblockUI();
                    toastr.options = {
                        "closeButton": false,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": false,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                    toastr.warning("El Estudiante no se encuentra registrado en el sistema o no esta activo", "");
                } else if (response.trim() === "error") {
                    $.unblockUI();
                    toastr.options = {
                        "closeButton": false,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": false,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                    toastr.error("Ha ocurrido un error a la hora de Consultar el Estudiante", "");
                } else {
                    var x = response.trim();
                    var datos = x.split('#-#');
                    window.location.href = "anexarExpediente.jsp";
                    $.unblockUI();
                }
            }
        });
    }
}

function cargarEstudiante3() {
    var doc = $('#documentoCon').val();
    if (doc === "") {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-top-right",
            "preventDuplicates": true,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
        toastr.warning("Debe escribir un documento", "");
        ocultar();
    } else {
        var parametros = {
            "doc": doc
        };
        $.ajax({
            data: parametros,
            url: '../proc/cargarEstudiante3.jsp',
            type: 'post',
            beforeSend: function () {
                $.blockUI({
                    message: 'Cargando Estudiante ',
                    css: {
                        border: 'none',
                        padding: '10px',
                        backgroundColor: '#000',
                        '-webkit-border-radius': '10px',
                        '-moz-border-radius': '10px',
                        opacity: .5,
                        color: '#fff'
                    }});
            },
            success: function (response) {
                if (response.trim() === "vacio") {
                    $.unblockUI();
                    toastr.options = {
                        "closeButton": false,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": false,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                    toastr.warning("El Estudiante no se encuentra registrado en el sistema", "");
                    $('#adicion').attr('disabled', true);
                    $('#btnGuardar').attr('disabled', true);
                } else if (response.trim() === "error") {
                    $.unblockUI();
                    toastr.options = {
                        "closeButton": false,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": false,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                    toastr.error("Ha ocurrido un error a la hora de Consultar el Estudiante", "");
                    $('#adicion').attr('disabled', true);
                    $('#btnGuardar').attr('disabled', true);

                } else {
                    var x = response.trim();
                    var datos = x.split('#-#');
                    $('#nombreEstudiante').html(datos[1]);
                    $('#adicion').attr('disabled', false);
                    $('#btnGuardar').attr('disabled', false);

                    $.unblockUI();
                    crearFila();
                }
            }
        });
    }
}

function cargarEstudiante4() {
    var doc = $('#documentoCon').val();
    if (doc === "") {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-top-right",
            "preventDuplicates": true,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
        toastr.warning("Debe escribir un documento", "");
        ocultar();
    } else {
        var parametros = {
            "doc": doc
        };
        $.ajax({
            data: parametros,
            url: '../proc/cargarEstudiante3.jsp',
            type: 'post',
            beforeSend: function () {
                $.blockUI({
                    message: 'Cargando Estudiante ',
                    css: {
                        border: 'none',
                        padding: '10px',
                        backgroundColor: '#000',
                        '-webkit-border-radius': '10px',
                        '-moz-border-radius': '10px',
                        opacity: .5,
                        color: '#fff'
                    }});
            },
            success: function (response) {
                if (response.trim() === "vacio") {
                    $.unblockUI();
                    toastr.options = {
                        "closeButton": false,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": false,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                    toastr.warning("El Estudiante no se encuentra registrado en el sistema", "");
                    $('#adicion').attr('disabled', true);
                    $('#btnGuardar').attr('disabled', true);
                } else if (response.trim() === "error") {
                    $.unblockUI();
                    toastr.options = {
                        "closeButton": false,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": false,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                    toastr.error("Ha ocurrido un error a la hora de Consultar el Estudiante", "");
                    $('#adicion').attr('disabled', true);
                    $('#btnGuardar').attr('disabled', true);

                } else {
                    var x = response.trim();
                    cargarSeguimiento();
                }
            }
        });
    }
}

function iniciarActividad(index) {

    if (index === "") {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-top-right",
            "preventDuplicates": true,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
        toastr.warning("Debe de completar los campos", "");
    } else {
        var parametros = {
            "index": index
        };
        $.ajax({
            data: parametros,
            url: '../proc/iniciarActividad.jsp',
            type: 'post',
            beforeSend: function () {
                $.blockUI({
                    message: 'Iniciando Actividad ',
                    css: {
                        border: 'none',
                        padding: '10px',
                        backgroundColor: '#000',
                        '-webkit-border-radius': '10px',
                        '-moz-border-radius': '10px',
                        opacity: .5,
                        color: '#fff'
                    }});
            },
            success: function (response) {
                if (response.trim() === "dupli") {
                    $.unblockUI();
                    toastr.options = {
                        "closeButton": false,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": false,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                    toastr.warning("La Actividad ya se encuentra registrado en el sistema", "");
                } else if (response.trim() === "error") {
                    $.unblockUI();
                    toastr.options = {
                        "closeButton": false,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": false,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                    toastr.error("Ha ocurrido un error a la hora de registrar la actividad", "");
                } else {
                    $.unblockUI();
                    swal({
                        title: "EN HORA BUENA!",
                        text: "INICIO EXITOSO",
                        icon: "success",
                        allowOutsideClick: false,
                        allowEscapeKey: false,
                        allowEnterKey: true,
                        focusConfirm: true,
                        showCloseButton: false,
                        button: "OK"
                    }).then(function () {
                        if (true) {
                            cargarActividades();
                            //window.location.href = "../proc/cargarActividades.jsp";
                        }
                    });

                }
            }
        });
    }
}

function finalizarActividad(index) {

    if (index === "") {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-top-right",
            "preventDuplicates": true,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
        toastr.warning("Debe de completar los campos", "");
    } else {
        var parametros = {
            "index": index
        };
        $.ajax({
            data: parametros,
            url: '../proc/finalizarActividad.jsp',
            type: 'post',
            beforeSend: function () {
                $.blockUI({
                    message: 'Finalizando Actividad ',
                    css: {
                        border: 'none',
                        padding: '10px',
                        backgroundColor: '#000',
                        '-webkit-border-radius': '10px',
                        '-moz-border-radius': '10px',
                        opacity: .5,
                        color: '#fff'
                    }});
            },
            success: function (response) {
                if (response.trim() === "dupli") {
                    $.unblockUI();
                    toastr.options = {
                        "closeButton": false,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": false,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                    toastr.warning("La Actividad ya se encuentra registrado en el sistema", "");
                } else if (response.trim() === "error") {
                    $.unblockUI();
                    toastr.options = {
                        "closeButton": false,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": false,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                    toastr.error("Ha ocurrido un error a la hora de registrar la actividad", "");
                } else {
                    $.unblockUI();
                    swal({
                        title: "EN HORA BUENA!",
                        text: "FINALIZACION EXITOSO",
                        icon: "success",
                        allowOutsideClick: false,
                        allowEscapeKey: false,
                        allowEnterKey: true,
                        focusConfirm: true,
                        showCloseButton: false,
                        button: "OK"
                    }).then(function () {
                        if (true) {
                            cargarActividades();
                            //window.location.href = "../proc/cargarActividadesFin.jsp";
                        }
                    });

                }
            }
        });
    }
}



function cargarActividades() {
    $.ajax({
        url: '../proc/cargarActividades.jsp',
        type: 'post',
        beforeSend: function () {
            $.blockUI({
                message: 'Cargando Actividades ',
                css: {
                    border: 'none',
                    padding: '10px',
                    backgroundColor: '#000',
                    '-webkit-border-radius': '10px',
                    '-moz-border-radius': '10px',
                    opacity: .5,
                    color: '#fff'
                }});
        },
        success: function (response) {
            if (response.trim() === "dupli") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.warning("La Actividad ya se encuentra registrado en el sistema", "");
            } else if (response.trim() === "error") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.error("Ha ocurrido un error a la hora de registrar la actividad", "");
            } else {
                $.unblockUI();
                /*swal({
                 title: "EN HORA BUENA!",
                 text: "FINALIZACION EXITOSO",
                 icon: "success",
                 allowOutsideClick: false,
                 allowEscapeKey: false,
                 allowEnterKey: true,
                 focusConfirm: true,
                 showCloseButton: false,
                 button: "OK"
                 }).then(function () {
                 if (true) {
                 window.location.href = "../proc/cargarActividadesFin.jsp";
                 }
                 });*/
                window.location.href = "iniciarActividad.jsp";
            }
        }
    });
}

function cargarActividadesFin() {
    $.ajax({
        url: '../proc/cargarActividadesFin.jsp',
        type: 'post',
        beforeSend: function () {
            $.blockUI({
                message: 'Cargando Actividades ',
                css: {
                    border: 'none',
                    padding: '10px',
                    backgroundColor: '#000',
                    '-webkit-border-radius': '10px',
                    '-moz-border-radius': '10px',
                    opacity: .5,
                    color: '#fff'
                }});
        },
        success: function (response) {
            if (response.trim() === "dupli") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.warning("La Actividad ya se encuentra registrado en el sistema", "");
            } else if (response.trim() === "error") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.error("Ha ocurrido un error a la hora de registrar la actividad", "");
            } else {
                $.unblockUI();
                /*swal({
                 title: "EN HORA BUENA!",
                 text: "FINALIZACION EXITOSO",
                 icon: "success",
                 allowOutsideClick: false,
                 allowEscapeKey: false,
                 allowEnterKey: true,
                 focusConfirm: true,
                 showCloseButton: false,
                 button: "OK"
                 }).then(function () {
                 if (true) {
                 window.location.href = "../proc/cargarActividadesFin.jsp";
                 }
                 });*/
                window.location.href = "finalizarActividad.jsp";
            }
        }
    });
}

function cargarActividadesHis() {
    $.ajax({
        url: '../proc/cargarActividadesHis.jsp',
        type: 'post',
        beforeSend: function () {
            $.blockUI({
                message: 'Cargando Actividades ',
                css: {
                    border: 'none',
                    padding: '10px',
                    backgroundColor: '#000',
                    '-webkit-border-radius': '10px',
                    '-moz-border-radius': '10px',
                    opacity: .5,
                    color: '#fff'
                }});
        },
        success: function (response) {
            if (response.trim() === "dupli") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.warning("La Actividad ya se encuentra registrado en el sistema", "");
            } else if (response.trim() === "error") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.error("Ha ocurrido un error a la hora de registrar la actividad", "");
            } else {
                $.unblockUI();
                /*swal({
                 title: "EN HORA BUENA!",
                 text: "FINALIZACION EXITOSO",
                 icon: "success",
                 allowOutsideClick: false,
                 allowEscapeKey: false,
                 allowEnterKey: true,
                 focusConfirm: true,
                 showCloseButton: false,
                 button: "OK"
                 }).then(function () {
                 if (true) {
                 window.location.href = "../proc/cargarActividadesFin.jsp";
                 }
                 });*/
                window.location.href = "historialActividades.jsp";
            }
        }
    });
}

function cargarActividadesLis() {
    $.ajax({
        url: '../proc/cargarTomarLista.jsp',
        type: 'post',
        beforeSend: function () {
            $.blockUI({
                message: 'Cargando Actividades ',
                css: {
                    border: 'none',
                    padding: '10px',
                    backgroundColor: '#000',
                    '-webkit-border-radius': '10px',
                    '-moz-border-radius': '10px',
                    opacity: .5,
                    color: '#fff'
                }});
        },
        success: function (response) {
            if (response.trim() === "dupli") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.warning("La Actividad ya se encuentra registrado en el sistema", "");
            } else if (response.trim() === "error") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.error("Ha ocurrido un error a la hora de registrar la actividad", "");
            } else {
                $.unblockUI();
                /*swal({
                 title: "EN HORA BUENA!",
                 text: "FINALIZACION EXITOSO",
                 icon: "success",
                 allowOutsideClick: false,
                 allowEscapeKey: false,
                 allowEnterKey: true,
                 focusConfirm: true,
                 showCloseButton: false,
                 button: "OK"
                 }).then(function () {
                 if (true) {
                 window.location.href = "../proc/cargarActividadesFin.jsp";
                 }
                 });*/
                window.location.href = "tomarLista.jsp";
            }
        }
    });
}

function tomarLista(index) {
    if (index === "") {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-top-right",
            "preventDuplicates": true,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
        toastr.warning("Debe de completar los campos", "");
    } else {
        var parametros = {
            "index": index
        };
        $.ajax({
            data: parametros,
            url: '../proc/cargarListado.jsp',
            type: 'post',
            beforeSend: function () {
                $.blockUI({
                    message: 'Cargando Listado',
                    css: {
                        border: 'none',
                        padding: '10px',
                        backgroundColor: '#000',
                        '-webkit-border-radius': '10px',
                        '-moz-border-radius': '10px',
                        opacity: .5,
                        color: '#fff'
                    }});
            },
            success: function (response) {
                if (response.trim() === "dupli") {
                    $.unblockUI();
                    toastr.options = {
                        "closeButton": false,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": false,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                    toastr.warning("La Actividad ya se encuentra registrado en el sistema", "");
                } else if (response.trim() === "error") {
                    $.unblockUI();
                    toastr.options = {
                        "closeButton": false,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": false,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                    toastr.error("Ha ocurrido un error a la hora de registrar la actividad", "");
                } else {
                    $.unblockUI();
                    /*swal({
                     title: "EN HORA BUENA!",
                     text: "FINALIZACION EXITOSO",
                     icon: "success",
                     allowOutsideClick: false,
                     allowEscapeKey: false,
                     allowEnterKey: true,
                     focusConfirm: true,
                     showCloseButton: false,
                     button: "OK"
                     }).then(function () {
                     if (true) {
                     cargarActividadesFin();
                     //window.location.href = "../proc/cargarActividadesFin.jsp";
                     }
                     });*/
                    window.location.href = "listadoEstudiantes.jsp";
                }
            }
        });
    }
}


function cerrarSesion() {
    swal({
        title: "¿DESEA SALIR?",
        text: "¿En realidad desea salir del aplicativo?",
        icon: "warning",
        allowOutsideClick: false,
        allowEscapeKey: false,
        allowEnterKey: true,
        focusConfirm: true,
        showCloseButton: false,
        showCancelButton: true,
        confirmButtonText: "SI, DESEO SALIR",
        cancelButtonText: "NO."
    }).then(function (result) {
        if (result.value) {
            window.location.href = "cerrarSesion.jsp";
        }
    });
}

function anexarExpediente() {
    var param = {
        "tipoAnexo": $('#tipoAnexo').val()
    }
    $.ajax({
        data: param,
        url: '../proc/tipoAnexo.jsp',
        type: 'post',
        beforeSend: function () {
            $.blockUI({
                message: 'Anexando al Expediente estudiantil',
                css: {
                    border: 'none',
                    padding: '10px',
                    backgroundColor: '#000',
                    '-webkit-border-radius': '10px',
                    '-moz-border-radius': '10px',
                    opacity: .5,
                    color: '#fff'
                }});
        },
        success: function (response) {
            if (response.trim() === "dupli") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.warning("La Actividad ya se encuentra registrado en el sistema", "");
                window.location.href = "anexarExpediente.jsp";
            } else if (response.trim() === "error") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.error("Ha ocurrido un error a la hora de registrar la actividad", "");
                window.location.href = "anexarExpediente.jsp";
            } else {
                $.unblockUI();
                /*swal({
                 title: "EN HORA BUENA!",
                 text: "FINALIZACION EXITOSO",
                 icon: "success",
                 allowOutsideClick: false,
                 allowEscapeKey: false,
                 allowEnterKey: true,
                 focusConfirm: true,
                 showCloseButton: false,
                 button: "OK"
                 }).then(function () {
                 if (true) {
                 window.location.href = "../proc/cargarActividadesFin.jsp";
                 }
                 });*/
            }
        }
    });
}

function actualizarEstudiante() {
    var doc = $('#documento').val();
    var campo = $('#campo').val();
    var valor = $('#valor').val();
    console.log(doc);
    console.log(campo);
    console.log(valor);
    if (doc === "" || campo === "" || valor === "") {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-top-right",
            "preventDuplicates": true,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
        toastr.warning("Debe de completar los campos", "");
    } else {
        var parametros = {
            "doc": doc,
            "campo": campo,
            "valor": valor
        };
        $.ajax({
            data: parametros,
            url: '../proc/actualizarEstudiante.jsp',
            type: 'post',
            beforeSend: function () {
                $('.modal').modal('close');
                $.blockUI({
                    message: 'Actualizando Estudiante ',
                    css: {
                        border: 'none',
                        padding: '10px',
                        backgroundColor: '#000',
                        '-webkit-border-radius': '10px',
                        '-moz-border-radius': '10px',
                        opacity: .5,
                        color: '#fff'
                    }});
            },
            success: function (response) {
                if (response.trim() === "dupli") {
                    $.unblockUI();
                    toastr.options = {
                        "closeButton": false,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": false,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                    toastr.warning("La Actividad ya se encuentra registrado en el sistema", "");
                } else if (response.trim() === "error") {
                    $.unblockUI();
                    toastr.options = {
                        "closeButton": false,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": false,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                    toastr.error("Ha ocurrido un error a la hora de registrar la actividad", "");
                } else {
                    $.unblockUI();
                    swal({
                        title: "EN HORA BUENO",
                        text: "ACTUALIZACION EXITOSA",
                        icon: "success",
                        allowOutsideClick: false,
                        allowEscapeKey: false,
                        allowEnterKey: true,
                        focusConfirm: true,
                        showCloseButton: false,
                        showCancelButton: true,
                        confirmButtonText: "OK"
                    }).then(function (result) {
                        if (result.value) {
                            $('#documentoCon').val($('#documento').val());
                            cargarEstudiante();
                        }
                    });

                }
            }
        });
    }
}

function guardarListado() {
    var can = $('#cantidadEst').val();
    var index = $('#index').val();
    var est = "";
    for (var i = 1; i <= can; i++) {
        est = est + $('#documento' + i).html() + "##" + $('#valor' + i).prop('checked') + "#-#";
        console.log(est);
    }

    var parametros = {
        "est": est,
        "indexAct": index
    };
    $.ajax({
        data: parametros,
        url: '../proc/guardarListado.jsp',
        type: 'post',
        beforeSend: function () {
            $.blockUI({
                message: 'Actualizando Estudiante ',
                css: {
                    border: 'none',
                    padding: '10px',
                    backgroundColor: '#000',
                    '-webkit-border-radius': '10px',
                    '-moz-border-radius': '10px',
                    opacity: .5,
                    color: '#fff'
                }});
        },
        success: function (response) {
            if (response.trim() === "dupli") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.warning("La Actividad ya se encuentra registrado en el sistema", "");
            } else if (response.trim() === "error") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.error("Ha ocurrido un error a la hora de registrar la actividad", "");
            } else {
                $.unblockUI();
                swal({
                    title: "EN HORA BUENO",
                    text: "ACTUALIZACION EXITOSA",
                    icon: "success",
                    allowOutsideClick: false,
                    allowEscapeKey: false,
                    allowEnterKey: true,
                    focusConfirm: true,
                    showCloseButton: false,
                    showCancelButton: true,
                    confirmButtonText: "OK"
                }).then(function (result) {
                    if (result.value) {
                        cargarActividades();
                    }
                });

            }
        }
    });

}

function crearFila() {
    console.log(this.laFila);
    this.laFila = this.laFila + 1;
    var fila = "<div class=\"row\" style=\"margin-top: 20px;\"><div class=\"input-field col s4\"><i class=\"material-icons prefix\">account_circle</i><input id=\"actividad" + this.laFila + "\" type=\"text\" class=\"validate\"><label for=\"actividad" + this.laFila + "\">Actividad</label></div><div class=\"input-field col s4\"><i class=\"material-icons prefix\">account_circle</i><input id=\"dependencia" + this.laFila + "\" type=\"text\" class=\"validate\"><label for=\"dependencia" + this.laFila + "\">Dependencia Responsable</label></div><div class=\"input-field col s4\"><i class=\"material-icons prefix\">account_circle</i><input id=\"persona" + this.laFila + "\" type=\"text\" class=\"validate\"><label for=\"persona" + this.laFila + "\">Persona Responsable</label></div></div><div class=\"row\"><div class=\"input-field col s6\"><i class=\"material-icons prefix\">mode_edit</i><textarea id=\"aspectos" + this.laFila + "\" class=\"materialize-textarea\" maxlength=\"150\" data-length=\"150\"></textarea><label for=\"aspectos" + this.laFila + "\">Aspectos a Mejorar (Academicos, Psicosociales)</label></div><div class=\"input-field col s6\"><i class=\"material-icons prefix\">account_circle</i><textarea id=\"resultados" + this.laFila + "\" class=\"materialize-textarea\" maxlength=\"150\" data-length=\"150\" rows=\"5\"></textarea><label for=\"resultados" + this.laFila + "\">Resultados Obtenidos</label></div></div><div class=\"linea\"></div></div>";

    $("#contenido").append(fila);
}

function guardarAcompanamiento() {
    var acom = "";
    for (var i = 1; i <= this.laFila; i++) {
        if ($('#actividad' + i).val() !== "" && $('#dependencia' + i).val() !== "" && $('#persona' + i).val() !== "" && $('#aspectos' + i).val() !== "" && $('#resultados' + i).val() !== "") {
            acom = acom + $('#actividad' + i).val() + "##" + $('#dependencia' + i).val() + "##" + $('#persona' + i).val() + "##" + $('#aspectos' + i).val() + "##" + $('#resultados' + i).val() + "#-#";
        }
    }
    console.log(acom);
    if (acom !== "") {
        var parametros = {
            "acom": acom
        };
        $.ajax({
            data: parametros,
            url: '../proc/guardarAcompañamiento.jsp',
            type: 'post',
            beforeSend: function () {
                $.blockUI({
                    message: 'Actualizando Estudiante ',
                    css: {
                        border: 'none',
                        padding: '10px',
                        backgroundColor: '#000',
                        '-webkit-border-radius': '10px',
                        '-moz-border-radius': '10px',
                        opacity: .5,
                        color: '#fff'
                    }});
            },
            success: function (response) {
                if (response.trim() === "dupli") {
                    $.unblockUI();
                    toastr.options = {
                        "closeButton": false,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": false,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                    toastr.warning("La Actividad ya se encuentra registrado en el sistema", "");
                } else if (response.trim() === "error") {
                    $.unblockUI();
                    toastr.options = {
                        "closeButton": false,
                        "debug": false,
                        "newestOnTop": false,
                        "progressBar": false,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                    toastr.error("Ha ocurrido un error a la hora de registrar la actividad", "");
                } else {
                    $.unblockUI();
                    swal({
                        title: "EN HORA BUENA",
                        text: "AGREGACION EXITOSA",
                        icon: "success",
                        allowOutsideClick: false,
                        allowEscapeKey: false,
                        allowEnterKey: true,
                        focusConfirm: true,
                        showCloseButton: false,
                        showCancelButton: true,
                        confirmButtonText: "OK"
                    }).then(function (result) {
                        if (result.value) {
                            window.location.href = "principal.jsp";
                        }
                    });

                }
            }
        });
    }
    else {
        toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-top-right",
            "preventDuplicates": true,
            "onclick": null,
            "showDuration": "300",
            "hideDuration": "1000",
            "timeOut": "5000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
        }
        toastr.error("No ha llenado los datos", "");
    }
}

function unitario(sem) {
    $('input:checkbox').prop('checked', false);
    $(sem).prop('checked', true);
}

function cargarSemestres() {
    $.ajax({
        url: '../proc/cargarSemestres.jsp',
        type: 'post',
        beforeSend: function () {
            $.blockUI({
                message: 'Consultando Semestres  ',
                css: {
                    border: 'none',
                    padding: '10px',
                    backgroundColor: '#000',
                    '-webkit-border-radius': '10px',
                    '-moz-border-radius': '10px',
                    opacity: .5,
                    color: '#fff'
                }});
        },
        success: function (response) {
            if (response.trim() === "dupli") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.warning("La Actividad ya se encuentra registrado en el sistema", "");
            } else if (response.trim() === "error") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.error("Ha ocurrido un error a la hora de registrar la actividad", "");
            } else {
                $.unblockUI();
                window.location.href = "activarSemestre.jsp";

            }
        }
    });
}

function guardarSemestres() {
    var can = $('#cantidad').val();
    var sems = "";
    for (var i = 1; i <= can; i++) {
        sems = sems + $('#index' + i).html() + "##" + $('#valor' + i).prop('checked') + "#-#";
        console.log(sems);
    }

    var parametros = {
        "sems": sems
    };
    $.ajax({
        data: parametros,
        url: '../proc/guardarSemestres.jsp',
        type: 'post',
        beforeSend: function () {
            $.blockUI({
                message: 'Iniciando Semestre  ',
                css: {
                    border: 'none',
                    padding: '10px',
                    backgroundColor: '#000',
                    '-webkit-border-radius': '10px',
                    '-moz-border-radius': '10px',
                    opacity: .5,
                    color: '#fff'
                }});
        },
        success: function (response) {
            if (response.trim() === "dupli") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.warning("La Actividad ya se encuentra registrado en el sistema", "");
            } else if (response.trim() === "error") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.error("Ha ocurrido un error a la hora de registrar la actividad", "");
            } else {
                //$.unblockUI();
                swal({
                    title: "EN HORA BUENO",
                    text: "ACTUALIZACION EXITOSA",
                    icon: "success",
                    allowOutsideClick: false,
                    allowEscapeKey: false,
                    allowEnterKey: true,
                    focusConfirm: true,
                    showCloseButton: false,
                    showCancelButton: false,
                    confirmButtonText: "OK"
                }).then(function (result) {
                    if (result.value) {
                        cargarEstudiantesSemestreNew();
                    }
                });

            }
        }
    });
}

function cargarEstudiantesSemestreNew() {
    $.ajax({
        url: '../proc/cargarEstudiantesSemestreNew.jsp',
        type: 'post',
        beforeSend: function () {
            $.blockUI({
                message: 'Cargando Listado de Estudiantes  ',
                css: {
                    border: 'none',
                    padding: '10px',
                    backgroundColor: '#000',
                    '-webkit-border-radius': '10px',
                    '-moz-border-radius': '10px',
                    opacity: .5,
                    color: '#fff'
                }});
        },
        success: function (response) {
            if (response.trim() === "dupli") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.warning("La Actividad ya se encuentra registrado en el sistema", "");
            } else if (response.trim() === "error") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.error("Ha ocurrido un error a la hora de registrar la actividad", "");
            } else {
                $.unblockUI();
                window.location.href = "listadoEstudiantesSem.jsp";

            }
        }
    });
}

function guardarEstudiantesSemestreNew() {
    var can = $('#cantidadEst').val();
    var est = "";
    for (var i = 1; i <= can; i++) {
        if ($('#acuerdo' + i).val() !== null) {
            est = est + $('#documento' + i).html() + "##" + $('#valor' + i).prop('checked') + "##" + $('#acuerdo' + i).val() + "#-#";
            console.log(est);
        }
    }

    var parametros = {
        "est": est
    };
    $.ajax({
        data: parametros,
        url: '../proc/guardarEstudiantesSemestreNew.jsp',
        type: 'post',
        beforeSend: function () {
            $.blockUI({
                message: 'Activando Estudiantes  ',
                css: {
                    border: 'none',
                    padding: '10px',
                    backgroundColor: '#000',
                    '-webkit-border-radius': '10px',
                    '-moz-border-radius': '10px',
                    opacity: .5,
                    color: '#fff'
                }});
        },
        success: function (response) {
            if (response.trim() === "dupli") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.warning("La Actividad ya se encuentra registrado en el sistema", "");
            } else if (response.trim() === "error") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.error("Ha ocurrido un error a la hora de registrar la actividad", "");
            } else {
                $.unblockUI();
                swal({
                    title: "EN HORA BUENO",
                    text: "ACTUALIZACION EXITOSA",
                    icon: "success",
                    allowOutsideClick: false,
                    allowEscapeKey: false,
                    allowEnterKey: true,
                    focusConfirm: true,
                    showCloseButton: false,
                    showCancelButton: false,
                    confirmButtonText: "OK"
                }).then(function (result) {
                    if (result.value) {
                        window.location.href = "principal.jsp";
                    }
                });

            }
        }
    });
}

function cargarSeguimiento() {
    $.ajax({
        url: '../proc/cargarSeguimiento.jsp',
        type: 'post',
        beforeSend: function () {
            $.blockUI({
                message: 'Cargando Estudiante  ',
                css: {
                    border: 'none',
                    padding: '10px',
                    backgroundColor: '#000',
                    '-webkit-border-radius': '10px',
                    '-moz-border-radius': '10px',
                    opacity: .5,
                    color: '#fff'
                }});
        },
        success: function (response) {
            if (response.trim() === "vacio") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.warning("El estudiante está inactivo", "");
                setInterval(function () {
                    window.location.href = "seguimiento.jsp"
                }, 1500);
            } else if (response.trim() === "error") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.error("Ha ocurrido un error a la hora de registrar la actividad", "");
            } else {
                $.unblockUI();
                window.location.href = "seguimiento.jsp";


            }
        }
    });
}

function guardarSeguimiento() {
    var txt = "";
    for (var i = 1; i <= 7; i++) {
        if ($("#materia" + i).val() !== '') {
            var id = $("#materia" + i).attr("name");
            var materia = $("#materia" + i).val();
            var primero = $("#primero" + i).val();
            var segundo = $("#segundo" + i).val();
            var tercero = $("#tercero" + i).val();
            var cuarto = $("#cuarto" + i).val();
            var observaciones = $("#observaciones" + i).val();
            txt = txt + id + "#_#" + primero + "#_#" + segundo + "#_#" + tercero + "#_#" + cuarto + "#_#" + observaciones + "#_#" + materia + "#-#";
            console.log(txt);
        }
    }
    var parametros = {
        "txt": txt
    };
    $.ajax({
        data: parametros,
        url: '../proc/guardarSeguimiento.jsp',
        type: 'post',
        beforeSend: function () {
            $.blockUI({
                message: 'Guardado Datos   ',
                css: {
                    border: 'none',
                    padding: '10px',
                    backgroundColor: '#000',
                    '-webkit-border-radius': '10px',
                    '-moz-border-radius': '10px',
                    opacity: .5,
                    color: '#fff'
                }});
        },
        success: function (response) {
            if (response.trim() === "vacio") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.warning("La Actividad ya se encuentra registrado en el sistema", "");
            } else if (response.trim() === "error") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.error("Ha ocurrido un error a la hora de registrar la actividad", "");
            } else {
                $.unblockUI();
                swal({
                    title: "EN HORA BUENO",
                    text: "ACTUALIZACION EXITOSA",
                    icon: "success",
                    allowOutsideClick: false,
                    allowEscapeKey: false,
                    allowEnterKey: true,
                    focusConfirm: true,
                    showCloseButton: false,
                    showCancelButton: false,
                    confirmButtonText: "OK"
                }).then(function (result) {
                    if (result.value) {
                        cargarSeguimiento();
                    }
                });

            }
        }
    });
}

function abrirMenu() {
    $('.tap-target').tapTarget('open');
}

function piechart() {

    $.ajax({
        url: '../proc/examplereporr.jsp',
        type: 'post',
        beforeSend: function () {
            $.blockUI({
                message: 'Guardado Datos   ',
                css: {
                    border: 'none',
                    padding: '10px',
                    backgroundColor: '#000',
                    '-webkit-border-radius': '10px',
                    '-moz-border-radius': '10px',
                    opacity: .5,
                    color: '#fff'
                }});
        },
        success: function (response) {
            if (response.trim() === "vacio") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.warning("La Actividad ya se encuentra registrado en el sistema", "");
            } else if (response.trim() === "error") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.error("Ha ocurrido un error a la hora de registrar la actividad", "");
            } else {
                $.unblockUI();
                console.log(response.trim());
                var datos = response.trim();
                // Load the Visualization API and the piechart package.
                google.charts.load('current', {'packages': ['corechart']});

                // Set a callback to run when the Google Visualization API is loaded.
                google.charts.setOnLoadCallback(drawChart);

                // Callback that creates and populates a data table, 
                // instantiates the pie chart, passes in the data and
                // draws it.
                function drawChart() {
                    console.log('datos: ' + datos);
                    // Create the data table.
                    var data = new google.visualization.DataTable();
                    data.addColumn('string', 'Topping');
                    data.addColumn('number', 'Slices');
                    var dd = datos.split('#-#');
                    for (var i = 0; i < dd.length; i++) {
                        var dx = dd[i].split('##');
                        var arr = [dx[0], parseInt(dx[1])];
                        console.log(i);
                        console.log(dx[0] + "  :::");
                        console.log(dx[1] + "  :::");
                        data.addRow(arr);
                    }

// Set chart options
                    var options = {'title': 'How Much Pizza I Ate Last Night',
                        'is3D': true,
                        'width': 400,
                        'height': 300};

                    // Instantiate and draw our chart, passing in some options.
                    var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
                    chart.draw(data, options);
                }
            }
        }
    });


}

function barraschart() {

    $.ajax({
        url: '../proc/examplerepor.jsp',
        type: 'post',
        beforeSend: function () {
            $.blockUI({
                message: 'Guardado Datos   ',
                css: {
                    border: 'none',
                    padding: '10px',
                    backgroundColor: '#000',
                    '-webkit-border-radius': '10px',
                    '-moz-border-radius': '10px',
                    opacity: .5,
                    color: '#fff'
                }});
        },
        success: function (response) {
            if (response.trim() === "vacio") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.warning("La Actividad ya se encuentra registrado en el sistema", "");
            } else if (response.trim() === "error") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.error("Ha ocurrido un error a la hora de registrar la actividad", "");
            } else {
                $.unblockUI();
                console.log(response.trim());
                var datos = response.trim();
                google.charts.load('current', {'packages': ['corechart']});
                google.charts.setOnLoadCallback(drawVisualization);

                function drawVisualization() {
                    // Some raw data (not necessarily accurate)
                    var data = new google.visualization.DataTable();

                    data.addColumn('string', 'Month');
                    data.addColumn('number', 'Bolivia');
                    var dd = datos.split('#-#');
                    for (var i = 0; i < dd.length; i++) {
                        var dx = dd[i].split('##');
                        var arr = [dx[0], parseInt(dx[1])];
                        console.log(i);
                        console.log(dx[0] + "  :::");
                        console.log(dx[1] + "  :::");
                        data.addRow(arr);
                    }


                    var options = {
                        title: 'Monthly Coffee Production by Country',
                        vAxis: {title: 'Cups'},
                        hAxis: {title: 'Month'},
                        seriesType: 'bars',
                        series: {5: {type: 'line'}}
                    };

                    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
                    chart.draw(data, options);
                }
            }
        }
    });
}

function asistenciasxactividad() {

    $.ajax({
        url: '../proc/asistenciasxactividad.jsp',
        type: 'post',
        beforeSend: function () {
            $.blockUI({
                message: 'Guardado Datos   ',
                css: {
                    border: 'none',
                    padding: '10px',
                    backgroundColor: '#000',
                    '-webkit-border-radius': '10px',
                    '-moz-border-radius': '10px',
                    opacity: .5,
                    color: '#fff'
                }});
        },
        success: function (response) {
            if (response.trim() === "vacio") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.warning("No existe reporte en el sistema", "");
            } else if (response.trim() === "error") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.error("Ha ocurrido un error a la hora de registrar la actividad", "");
            } else {
                $.unblockUI();
                console.log(response.trim());
                var datos = response.trim();
                google.charts.load('current', {'packages': ['corechart']});
                google.charts.setOnLoadCallback(drawVisualization);

                function drawVisualization() {
                    // Some raw data (not necessarily accurate)
                    var data = new google.visualization.DataTable();

                    data.addColumn('string', 'Actividad');
                    data.addColumn('number', 'Estudintes');
                    var dd = datos.split('#-#');
                    for (var i = 0; i < dd.length; i++) {
                        var dx = dd[i].split('##');
                        var arr = [dx[0], parseInt(dx[1])];
                        console.log(i);
                        console.log(dx[0] + "  :::");
                        console.log(dx[1] + "  :::");
                        data.addRow(arr);
                    }


                    var options = {
                        title: 'Estadisticas de la cantidad de Asistencias por Actividad/Reunion Semestre Actual',
                        vAxis: {title: 'Cantidad Alumnos'},
                        hAxis: {title: 'Actividad/Reunion'},
                        seriesType: 'bars',
                        series: {5: {type: 'line'}}
                    };

                    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
                    chart.draw(data, options);
                }
            }
        }
    });
}

function asistenciasxactividadHis() {

    $.ajax({
        url: '../proc/asistenciasxactividadHis.jsp',
        type: 'post',
        beforeSend: function () {
            $.blockUI({
                message: 'Guardado Datos   ',
                css: {
                    border: 'none',
                    padding: '10px',
                    backgroundColor: '#000',
                    '-webkit-border-radius': '10px',
                    '-moz-border-radius': '10px',
                    opacity: .5,
                    color: '#fff'
                }});
        },
        success: function (response) {
            if (response.trim() === "vacio") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.warning("No existe reporte en el sistema", "");
            } else if (response.trim() === "error") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.error("Ha ocurrido un error a la hora de registrar la actividad", "");
            } else {
                $.unblockUI();
                console.log(response.trim());
                var datos = response.trim();
                google.charts.load('current', {'packages': ['corechart']});
                google.charts.setOnLoadCallback(drawVisualization);

                function drawVisualization() {
                    // Some raw data (not necessarily accurate)
                    var data = new google.visualization.DataTable();

                    data.addColumn('string', 'Actividad');
                    data.addColumn('number', 'Estudintes');
                    var dd = datos.split('#-#');
                    for (var i = 0; i < dd.length; i++) {
                        var dx = dd[i].split('##');
                        var arr = [dx[0], parseInt(dx[1])];
                        console.log(i);
                        console.log(dx[0] + "  :::");
                        console.log(dx[1] + "  :::");
                        data.addRow(arr);
                    }


                    var options = {
                        title: 'Estadisticas de la cantidad de Asistencias por Actividad/Reunion Historico',
                        vAxis: {title: 'Cantidad Alumnos'},
                        hAxis: {title: 'Actividad/Reunion'},
                        seriesType: 'bars',
                        series: {5: {type: 'line'}}
                    };

                    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
                    chart.draw(data, options);
                }
            }
        }
    });
}

function actividadesxsemestre() {

    $.ajax({
        url: '../proc/actividadesxsemestre.jsp',
        type: 'post',
        beforeSend: function () {
            $.blockUI({
                message: 'Guardado Datos   ',
                css: {
                    border: 'none',
                    padding: '10px',
                    backgroundColor: '#000',
                    '-webkit-border-radius': '10px',
                    '-moz-border-radius': '10px',
                    opacity: .5,
                    color: '#fff'
                }});
        },
        success: function (response) {
            if (response.trim() === "vacio") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.warning("No existe reporte en el sistema", "");
            } else if (response.trim() === "error") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.error("Ha ocurrido un error a la hora de registrar la actividad", "");
            } else {
                $.unblockUI();
                console.log(response.trim());
                var datos = response.trim();
                google.charts.load('current', {'packages': ['corechart']});
                google.charts.setOnLoadCallback(drawVisualization);

                function drawVisualization() {
                    // Some raw data (not necessarily accurate)
                    var data = new google.visualization.DataTable();

                    data.addColumn('string', 'Actividad');
                    data.addColumn('number', 'Reuniones');
                    data.addColumn('number', 'Actividades');
                    var dd = datos.split('#-#');
                    for (var i = 0; i < dd.length; i++) {
                        var dx = dd[i].split('##');
                        var arr = [dx[0], parseInt(dx[1]),parseInt(dx[2])];
                        console.log(i);
                        console.log(dx[0] + "  :::");
                        console.log(dx[1] + "  :::");
                        data.addRow(arr);
                    }


                    var options = {
                        title: 'Estadistica de la cantidad de actividades y reuniones por semestre',
                        vAxis: {title: 'Cantidad Actividades y Reuniones'},
                        hAxis: {title: 'Semestre'},
                        seriesType: 'bars',
                        series: {5: {type: 'line'}}
                    };

                    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
                    chart.draw(data, options);
                }
            }
        }
    });
}
function estudiantesxsemestre() {

    $.ajax({
        url: '../proc/estudiantesxsemestre.jsp',
        type: 'post',
        beforeSend: function () {
            $.blockUI({
                message: 'Guardado Datos   ',
                css: {
                    border: 'none',
                    padding: '10px',
                    backgroundColor: '#000',
                    '-webkit-border-radius': '10px',
                    '-moz-border-radius': '10px',
                    opacity: .5,
                    color: '#fff'
                }});
        },
        success: function (response) {
            if (response.trim() === "vacio") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.warning("El reporte no se encuentra en el sistema", "");
            } else if (response.trim() === "error") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.error("Ha ocurrido un error a la hora de registrar la actividad", "");
            } else {
                $.unblockUI();
                console.log(response.trim());
                var datos = response.trim();
                google.charts.load('current', {'packages': ['corechart']});
                google.charts.setOnLoadCallback(drawVisualization);

                function drawVisualization() {
                    // Some raw data (not necessarily accurate)
                    var data = new google.visualization.DataTable();

                    data.addColumn('string', 'Sesmtres');
                    data.addColumn('number', 'Estudiantes');
                    var dd = datos.split('#-#');
                    for (var i = 0; i < dd.length; i++) {
                        var dx = dd[i].split('##');
                        var arr = [dx[0], parseInt(dx[1])];
                        console.log(i);
                        console.log(dx[0] + "  :::");
                        console.log(dx[1] + "  :::");
                        data.addRow(arr);
                    }


                    var options = {
                        title: 'Estadisticas de la cantidad de estudiantes activados por cada semestre',
                        vAxis: {title: 'Cantidad de Estudiantes'},
                        hAxis: {title: 'Semestres'},
                        seriesType: 'bars',
                        series: {5: {type: 'line'}}
                    };

                    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
                    chart.draw(data, options);
                }
            }
        }
    });
}

function estudiantesAprobados() {
    $.ajax({
        url: '../proc/examplereport.jsp',
        type: 'post',
        beforeSend: function () {
            $.blockUI({
                message: 'Guardado Datos   ',
                css: {
                    border: 'none',
                    padding: '10px',
                    backgroundColor: '#000',
                    '-webkit-border-radius': '10px',
                    '-moz-border-radius': '10px',
                    opacity: .5,
                    color: '#fff'
                }});
        },
        success: function (response) {
            if (response.trim() === "vacio") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.warning("La Actividad ya se encuentra registrado en el sistema", "");
            } else if (response.trim() === "error") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.error("Ha ocurrido un error a la hora de registrar la actividad", "");
            } else {
                $.unblockUI();
                console.log(response.trim());
                var datos = response.trim();
                google.charts.load('current', {'packages': ['table']});
                google.charts.setOnLoadCallback(drawTable);

                function drawTable() {
                    var data = new google.visualization.DataTable();
                    data.addColumn('string', 'Nombre');
                    data.addColumn('string', 'Documento');
                    data.addColumn('string', 'Cantidad Horas Beca');
                    data.addColumn('string', 'Cantidad Actividades');
                    data.addColumn('boolean', 'Aprobado');
                    var dd = datos.split('#-#');
                    for (var i = 0; i < dd.length-1; i++) {
                        var dx = dd[i].split('##');
                        var sw = false;
                        if(dx[4] === "true"){
                            sw=true;
                        }
                        var arr = [dx[0],dx[1],dx[2],dx[3],sw];
                        console.log(i);
                        console.log(dx[0] + "  :::");
                        console.log(dx[1] + "  :::");
                        data.addRow(arr);
                    }
                    

                    var table = new google.visualization.Table(document.getElementById('chart_div'));

                    table.draw(data, {showRowNumber: true, width: '100%', height: '100%'});
                }
            }
        }
    });
}

function listadoEstudiantes() {
    $.ajax({
        url: '../proc/listadoEstudiantes.jsp',
        type: 'post',
        beforeSend: function () {
            $.blockUI({
                message: 'Guardado Datos   ',
                css: {
                    border: 'none',
                    padding: '10px',
                    backgroundColor: '#000',
                    '-webkit-border-radius': '10px',
                    '-moz-border-radius': '10px',
                    opacity: .5,
                    color: '#fff'
                }});
        },
        success: function (response) {
            if (response.trim() === "vacio") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.warning("No se encuentra reporte en el sistema", "");
            } else if (response.trim() === "error") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.error("Ha ocurrido un error a la hora de registrar la actividad", "");
            } else {
                $.unblockUI();
                console.log(response.trim());
                var datos = response.trim();
                google.charts.load('current', {'packages': ['table']});
                google.charts.setOnLoadCallback(drawTable);

                function drawTable() {
                    var data = new google.visualization.DataTable();
                    data.addColumn('string', 'Nombres');
                    data.addColumn('string', 'Apellidos');
                    data.addColumn('string', 'Documento');
                    data.addColumn('boolean', 'Estado');
                    var dd = datos.split('#-#');
                    for (var i = 0; i < dd.length-1; i++) {
                        var dx = dd[i].split('##');
                        var sw = false;
                        if(dx[3] === "T"){
                            sw=true;
                        }
                        var arr = [dx[0],dx[1],dx[2],sw];
                        console.log(i);
                        console.log(dx[0] + "  :::");
                        console.log(dx[1] + "  :::");
                        data.addRow(arr);
                    }
                    

                    var table = new google.visualization.Table(document.getElementById('chart_div'));

                    table.draw(data, {showRowNumber: true, width: '100%', height: '100%'});
                }
            }
        }
    });
}

function listadoEstudiantesAct() {
    $.ajax({
        url: '../proc/listadoEstudiantesAct.jsp',
        type: 'post',
        beforeSend: function () {
            $.blockUI({
                message: 'Guardado Datos   ',
                css: {
                    border: 'none',
                    padding: '10px',
                    backgroundColor: '#000',
                    '-webkit-border-radius': '10px',
                    '-moz-border-radius': '10px',
                    opacity: .5,
                    color: '#fff'
                }});
        },
        success: function (response) {
            if (response.trim() === "vacio") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.warning("No se encuentra reporte en el sistema", "");
            } else if (response.trim() === "error") {
                $.unblockUI();
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": true,
                    "onclick": null,
                    "showDuration": "300",
                    "hideDuration": "1000",
                    "timeOut": "5000",
                    "extendedTimeOut": "1000",
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                }
                toastr.error("Ha ocurrido un error a la hora de registrar la actividad", "");
            } else {
                $.unblockUI();
                console.log(response.trim());
                var datos = response.trim();
                google.charts.load('current', {'packages': ['table']});
                google.charts.setOnLoadCallback(drawTable);

                function drawTable() {
                    var data = new google.visualization.DataTable();
                    data.addColumn('string', 'Nombres');
                    data.addColumn('string', 'Apellidos');
                    data.addColumn('string', 'Documento');
                    data.addColumn('boolean', 'Estado');
                    var dd = datos.split('#-#');
                    for (var i = 0; i < dd.length-1; i++) {
                        var dx = dd[i].split('##');
                        var sw = false;
                        if(dx[3] === "T"){
                            sw=true;
                        }
                        var arr = [dx[0],dx[1],dx[2],sw];
                        console.log(i);
                        console.log(dx[0] + "  :::");
                        console.log(dx[1] + "  :::");
                        data.addRow(arr);
                    }
                    

                    var table = new google.visualization.Table(document.getElementById('chart_div'));

                    table.draw(data, {showRowNumber: true, width: '100%', height: '100%'});
                }
            }
        }
    });
}

function pintar(x){
    $(x).css('background-color','#ecf0f1');
}

function despintar(x){
    $(x).css('background-color','white');
}



