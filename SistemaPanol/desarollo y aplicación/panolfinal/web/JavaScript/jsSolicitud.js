/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function () {
    bloqueaInicio();
    /* Al soltar el boton en el ingreso de cantidad debe ser numerico o reemplaza por "" */
    $('#txtSolicitado').keyup(function () {
        this.value = (this.value + '').replace(/[^0-9]/g, '');
    });
});

/* Obtiene la fecha actual para registrarla en el sistema */
function obtenerFecha() {
    var meses = new Array("Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre");
    var f = new Date();
    var fecha = (f.getDate() + " de " + meses[f.getMonth()] + " de " + f.getFullYear());
    document.getElementById("txtFecha").value = fecha;
}

// Bloquear funciones de la pagina Solicitud de Productos
function bloqueaInicio() {
    // Bloquea datos de encabezado
    document.frmSolicitud.btnGraba.disabled = false;      //Deshabilitado   
    document.frmSolicitud.btnModificar.disabled = true;   //Deshabilitado    
    document.frmSolicitud.txtComentario.disabled = false; //Deshabilitado 
    // Bloquea los campos del detalle
    document.getElementById("cbxProd").disabled = true;   //Deshabilitado    
    document.frmSolicitud.txtProd.disabled = true;        //Deshabilitado
    document.frmSolicitud.txtActual.disabled = true;      //Deshabilitado
    document.frmSolicitud.txtSolicitado.disabled = true;  //Deshabilitado  
    document.frmSolicitud.btnRegistrar.disabled = true;   //Deshabilitado
}

// Limpiar el detalle y habilitar botones del encabezado de la solicitud
function limpiaDetalle() {
    alert('El detalle de su Solicitud debe ser Reingresado');
    // Encabezado Solicitud
    document.getElementById("cbxSede").disabled = false;  //Habilitado
    document.frmSolicitud.txtActual.value = "";
    document.frmSolicitud.txtProd.value = "";
    document.frmSolicitud.txtSolicitado.value = "";
    document.getElementById("cbxProd").selectedIndex = 0;
    bloqueaInicio();
}


// Valida la seleccion de una sede para poder pasar al detalle dela solicitud
function disable() {
    var x = document.getElementById("cbxSede").selectedIndex;
    if (x === 0) {
        alert('Falta ingresar la Sede');
    } else {
        document.frmSolicitud.btnModificar.disabled = false;       //Habilitado
        document.frmSolicitud.btnGraba.disabled = true;            //Deshabilitado
        document.getElementById("cbxSede").disabled = true;        //Deshabilitado
        document.frmSolicitud.txtComentario.disabled = true;       //Deshabilitado
        /* Desbloqueo de botones */
        document.getElementById("cbxProd").disabled = false;   //Habilitado
        document.frmSolicitud.txtSolicitado.disabled = false;  //Habilitado
        document.frmSolicitud.btnRegistrar.disabled = false;   //Habilitado
    }
}

// Utilizacion de Ajax oara revisar stock del producto elegido en segundo plano
jQuery(document).ready(
        function () {
            $("#cbxProd").change(function () {
                var valor = document.getElementById("cbxProd").value;
                var valor2 = document.getElementById("cbxSede").value;
                $.get("ServletAccion", {prod: valor, sed: valor2}, function (data) {
                    document.frmSolicitud.txtActual.value = data;
                    document.frmSolicitud.txtProd.value = valor;
                    document.getElementById("txtSolicitado").focus();
                });
            });
        });


// Se validan los datos para realizar la insercion del registro
function guardarRegistro() {

    var cbx = document.getElementById("cbxProd").selectedIndex;
    var actual = document.getElementById("txtActual").value;
    var solicitado = document.getElementById("txtSolicitado").value;

    /* Parsea los valores para compara stock actual v/s solicitado  */
    valorAct = parseInt(actual);
    valorSol = parseInt(solicitado);

    // Valida que este elegido la sede y la cantidad.
    if (solicitado == 0) {
        alert('[ERROR] Stock Solicitado no puede estar en Cero.');
        document.getElementById("txtSolicitado").focus();
        return false;        
    } else if (solicitado == null || solicitado.trim() == "" || cbx === 0) {
        alert('[ERROR] Faltan datos en el Detalle');
        return false;
        // Validad que el stock solicitado no sea mayor al del sistema  
    } else if (valorSol > valorAct) {
        alert('[ERROR] Stock Solicitado Mayor al Actual.');
        document.getElementById("txtSolicitado").focus();
        return false;
    } else {
        // Si las validacion estan correctas se enviara la creacion del registros 
        alert('Registro creado Exitosamente!! Puede revisar su estado en:\n\nMovimientos->Solicitudes->Mis Solicitudes');
        // Habilia los campos antes de enviar el formulario, ya que al estar en estado bloqueado no captura los datos
        document.frmSolicitud.txtComentario.disabled = false; //Habilitado
        document.getElementById("cbxSede").disabled = false;  //Habilitado          
        document.frmSolicitud.txtSolicitado.disabled = false; //Habilitado 
        document.frmSolicitud.txtActual.disabled = false; //Habilitado         
        return true;
    }
}







