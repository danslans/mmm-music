/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cad;

import com.mysql.jdbc.PreparedStatement;
import datos.Conexion;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.concurrent.Callable;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.AsignarImagen;
import model.Imagen;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author danslans
 */
public class ImagenCad {

    private Conexion c = new Conexion();
    private static final String idTbl = " id ";
    private static final String or = " or ";
    private static final String igual = "=";
    private String query = "SELECT * FROM TBL_IMG WHERE ";

    public void guardar(Imagen imagen) throws ClassNotFoundException, InstantiationException, IllegalAccessException, IllegalAccessException {
        try {
            Connection con = c.connection();
            Imagen i = imagen;
            String sql = "INSERT INTO TBL_IMG VALUES (null,'" + i.getNombre() + "','" + i.getDescripcion() + "','" + i.getDireccion() + "')";
            //System.out.println(sql);
            int b = con.prepareStatement(sql).executeUpdate();
            con.close();
            c.disconect();
        } catch (SQLException ex) {
            Logger.getLogger(ImagenCad.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void guardarAsignar(AsignarImagen ai) {
        try {
            Connection connection;
            connection = c.connection();
            if(buscarIdAsignar(ai.getId_img())){
              String queryProcedure = "{call insertar(" + ai.getId_img() + ",'" + ai.getFecha() + "') }";
            int result = connection.prepareCall(queryProcedure).executeUpdate();  
            }
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(ImagenCad.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private boolean buscarIdAsignar(int id) {
        try {
            Connection con=c.connection();
            String sentencia="SELECT * FROM TBL_ASIGNAR_CANCION WHERE id_img = "+id;
            ResultSet resultSet;
            resultSet=con.prepareStatement(sentencia).executeQuery();
            if(resultSet.next()){
                return false;
            }
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(ImagenCad.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }

    public ResultSet buscar() {
        // ArrayList<Imagen> arrayList=new ArrayList<>();
        try {
            Connection con = c.connection();
            String sql = "SELECT * FROM TBL_ASIGNAR_CANCION a inner join TBL_IMG i on a.id_img=i.id ";
            ResultSet resultSet = con.prepareStatement(sql).executeQuery();
            //  con.close();
            return resultSet;
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(ImagenCad.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ResultSet BuscarParam(String param) {
        try {
            Connection connection = c.connection();
            String query = "SELECT * FROM TBL_IMG WHERE `nombre` LIKE '%" + param + "%'";
            ResultSet resultSet = connection.prepareStatement(query).executeQuery();
            //connection.close();
            return resultSet;
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(ImagenCad.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    private ResultSet buscarIds(String cadena) {
        try {
            Connection con = c.connection();
            ResultSet resultSet = con.prepareStatement(cadena).executeQuery();
            return resultSet;
        } catch (ClassNotFoundException | InstantiationException | IllegalAccessException | SQLException ex) {
            Logger.getLogger(ImagenCad.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ResultSet traerLista(String cadena) throws ClassNotFoundException {
        try {
            try {
                try (Connection connection = c.connection()) {
                    String json = "[" + cadena + "]";
                    JSONArray jSONArray = new JSONArray(json);
                    for (int i = 0; i < jSONArray.length(); i++) {
                        JSONObject object = jSONArray.getJSONObject(i);
                        int id = object.getInt("id");
                        query = query + idTbl + igual + id + or;
                    }
                    query += "\'" + "\'";
                    ResultSet resultSet = buscarIds(query);
                    // System.out.println(query);
                    return resultSet;
                }
            } catch (InstantiationException | IllegalAccessException | SQLException ex) {
                Logger.getLogger(ImagenCad.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (JSONException ex) {
            Logger.getLogger(ImagenCad.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
