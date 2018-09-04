/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * @author Carlos Sotomayor
 * @author Miguel Pasten
 */
public class Conecta {
       
    public static Connection getConexion() throws Exception{
        
        Connection conn;     
        try {
            String driver = "oracle.jdbc.OracleDriver";
            String servidor = "jdbc:oracle:thin:@localhost:1521:XE";
            String usuarioBD = "sistemaPanol";
            String claveBD = "sosoft";
            
             Class.forName(driver);
             // Se establece la conexion
             conn = DriverManager.getConnection(servidor,usuarioBD,claveBD);
             System.out.println("Conexion a Base de Datos " + usuarioBD + " Ok");
        } catch (ClassNotFoundException e) 
        {
            throw new Exception("Error ClassNotFoundException "+e.getMessage());
        } catch (SQLException e) {
            throw new Exception("Error SQLException "+e.getMessage());
        }
        return conn;  
    }
}