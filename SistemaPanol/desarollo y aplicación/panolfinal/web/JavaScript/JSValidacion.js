/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


//Muestra producto con sede asociada
function valida(form1){   
    var sede = document.getElementById("cbxSede").value;   
    var prod = document.getElementById("cbxProducto").value;
    
    if(prod === "Seleccione"){
         alert("Debe seleccionar producto"); 
         return false;
    } else if (sede === "Seleccione"){
         alert("Debe seleccionar la Sede");   
         return false;
    } 
    else {
        
    }
}

// Valida que el numero minimo de stock este entre 1 y 9
 function validaMinimo(numero){    
    if (!/^([0-9])*$/.test(numero)||(numero === "")){
      alert("[ERROR] Stock minimo invalido");
      document.getElementById("minimo").value="0";  
      document.getElementById("minimo").focus();
     }
  }
  
// Valida que el numero maximo de stock este entre 1 y 9  
 function validaMaximo(numero){    
    if (!/^([0-9])*$/.test(numero)||(numero === "")){
      alert("[ERROR] Stock Maximo invalido");
      document.getElementById("maximo").value= "0";       
      document.getElementById("maximo").focus();
     }
  }
  
// Valida que el numero disponible de stock este entre 1 y 9  
 function validaDisponible(numero){    
    if (!/^([0-9])*$/.test(numero)||numero === ""){
      alert("[ERROR] Stock disponible invalido");
      document.getElementById("disponible").value= "0";  
      document.getElementById("disponible").focus();
     }
  }  
  

