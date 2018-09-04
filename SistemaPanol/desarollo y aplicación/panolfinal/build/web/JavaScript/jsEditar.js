/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/* Editar la categoria */
        function editarCategoria(id)
        {
            window.location.href="ServletCategoriaUpdate?id="+id;
        }

// Opcion Editar de listar en ListaProducto.jsp
function editarProducto(id)
        {
            window.location.href="ServletProductoUpdate?id="+id;
        }