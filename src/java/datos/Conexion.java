/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package datos;



import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author danslans
 */
public class Conexion {
    private static final  Conexion conexion=new Conexion();
    private static final String URL =  "jdbc:mysql://node147185-themusic.j.layershift.co.uk/music";
    private static final String USER="root";
    private static final String PASS="TNFsyh82256";
    private static final String URLLOCAL="jdbc:mysql://localhost:3306/music";
    private static final String USERLOCAL="root";
    private static final String PASSLOCAL="";
//DriverManager.getConnection(URL, user_name, user_password);
    private static Connection c=null;
    private  Connection connection() throws ClassNotFoundException, InstantiationException, IllegalAccessException, SQLException{
       Class.forName("com.mysql.jdbc.Driver").newInstance();
        c= (Connection) DriverManager.getConnection(URLLOCAL,USERLOCAL,PASSLOCAL);
        //c= (Connection) DriverManager.getConnection(URL,USER,PASS);
       return  c;
    }   
    public static Connection connectBD(){
        try {
            return conexion.connection();
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    protected  void disconect(){
        try {
            c.close();
        } catch (SQLException ex) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
     
    private Conexion() {
        
    }
    
}
