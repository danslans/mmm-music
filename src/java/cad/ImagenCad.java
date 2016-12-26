/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cad;

import datos.Conexion;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
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

    private final Connection c = Conexion.connectBD();
    private static final String idTbl = " id ";
    private static final String or = " or ";
    private static final String igual = "=";
    private String query = "SELECT * FROM TBL_IMG WHERE ";

    public void guardar(Imagen imagen) {
        try {
            String sql = "INSERT INTO TBL_IMG VALUES (null,'" + imagen.getNombre() + "','" + imagen.getDescripcion() + "','" + imagen.getDireccion() + "')";
            try {
                int b = c.prepareStatement(sql).executeUpdate();
            } catch (SQLException ex) {
                Logger.getLogger(ImagenCad.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (Exception e) {
            Logger.getLogger("Error objeto Imagen "+e);
        }
    }

    public void guardarAsignar(AsignarImagen ai) {
        try {
            if (buscarIdAsignar(ai.getId_img())) {
                String queryProcedure = "{call insertar(" + ai.getId_img() + ",'" + ai.getFecha() + "') }";
                try {
                    int result = c.prepareCall(queryProcedure).executeUpdate();
                } catch (SQLException ex) {
                    Logger.getLogger(ImagenCad.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        } catch (Exception e) {
            Logger.getLogger("error en objeto Asignar Imagen" + e);
        }
    }

    private boolean buscarIdAsignar(int id) {
        try {
            String sentencia = "SELECT * FROM TBL_ASIGNAR_CANCION WHERE id_img = " + id;
            ResultSet resultSet;
            resultSet = c.prepareStatement(sentencia).executeQuery();
            if (resultSet.next()) {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ImagenCad.class.getName()).log(Level.SEVERE, null, ex);
        }
        return true;
    }

    public ResultSet buscar() {
        try {
            String sql = "SELECT * FROM TBL_ASIGNAR_CANCION a inner join TBL_IMG i on a.id_img=i.id ";
            ResultSet resultSet = c.prepareStatement(sql).executeQuery();
            //  con.close();
            return resultSet;
        } catch (SQLException ex) {
            Logger.getLogger(ImagenCad.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ResultSet BuscarParam(String param) {
        try {
            String queryImg = "SELECT * FROM TBL_IMG WHERE `nombre` LIKE '%" + param + "%'";
            ResultSet resultSet = c.prepareStatement(queryImg).executeQuery();
            //connection.close();
            return resultSet;
        } catch (SQLException ex) {
            Logger.getLogger(ImagenCad.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    private ResultSet buscarIds(String cadena) {
        try {
            ResultSet resultSet = c.prepareStatement(cadena).executeQuery();
            return resultSet;
        } catch (SQLException ex) {
            Logger.getLogger(ImagenCad.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ResultSet traerLista(String cadena) throws JSONException {
        String json = "[" + cadena + "]";
        JSONArray jSONArray = new JSONArray(json);
        for (int i = 0; i < jSONArray.length(); i++) {
            JSONObject object = jSONArray.getJSONObject(i);
            int id = object.getInt("id"); 
            query = query + idTbl + igual + id + or;
        }
        query += "\'" + "\'";
        ResultSet resultSet = buscarIds(query);
        return resultSet;
    }
}
