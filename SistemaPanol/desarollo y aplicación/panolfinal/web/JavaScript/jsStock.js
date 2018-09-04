/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
// Utilizacion de Ajax oara revisar stock del producto elegido en segundo plano
$(document).ready(function () {
    var s = document.getElementById("txtSolicitado").value;
    var p = document.getElementById("txtPrestamo").value;
    // res -> Corresponde al resultado de lo solicitado vs Prestado.
    res = s-p;
    document.frmFichaSolicitud.txtSaldo.value=res;
    
    $("#btnRechazar").click(function(){
        var estado = parseInt(document.getElementById("txtSaldo").value);
        if((document.getElementById("txtEstado").value == ("RECHAZADO") || estado <= 0)){
            alert('Solicitud ya se encuentra rechazada o Saldo Pendiente es Cero');
        } else {
        alert('La solicitud Nº'+document.getElementById("txtNumero").value+" a sido 'Rechazada'");
        window.location.href = "ServletSolicitudUpdate?num="+document.getElementById("txtNumero").value;
         }
    });
});

jQuery(document).ready(             
        function () {
            $("#btnPrestamo").click(function () {
                var valor = document.getElementById("txtCodigo").value;
                var valor2 = document.getElementById("txtCodSede").value;
                var saldo = document.getElementById("txtSaldo").value;
                var num = document.getElementById("txtNumero").value;
                
                $.get("ServletAccion", {prod: valor, sed: valor2}, function (data) {
              
                   if(saldo > parseInt(data)){
                       alert('No puede generar el prestamo total,\nLa cantidad actual en stock es'+data);
                   } else {
                       window.location.href = "ServletPrestamoCre?num="+num+"&cp="+valor+"&cs="+valor2+"&saldo="+saldo;
                   }
                });
            });
            $("#btnStockSede").click(function () {
                var valor = document.getElementById("txtCodigo").value;
                var valor2 = document.getElementById("txtCodSede").value;
                $.get("ServletAccion", {prod: valor, sed: valor2}, function (data) {
              
                alert('Su Stock Actual es: '+data);

                });
            });            
            
        });


/* Funcion de Mis Solicitudes */
function cambiarPagina2() {
    window.location.href = "ListaSolicitud.jsp"; 
}

/* Listado general de solicitudes  */
function verPaginaStock() {
    window.location.href = "ServletStock?cod=" + document.getElementById("txtCodigo").value;
}

/* Funcion de Mis Solicitudes */
function cambiarPagina() {
    window.location.href = "MisSolicitudes.jsp";
}