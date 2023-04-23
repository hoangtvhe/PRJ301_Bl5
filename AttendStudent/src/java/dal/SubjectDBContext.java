/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.assignment.Subject;

/**
 *
 * @author DELL
 */
public class SubjectDBContext extends DBContext<Subject>{

    public ArrayList<Subject> list(String stdCode) {
        String sql = "Select c.subid,c.subname from [Group] g\n"
                + "                INNER JOIN Student_Group gs ON g.gid = gs.gid\n"
                + "                INNER JOIN Subject c ON g.subid = c.subid\n"
                + "               WHERE gs.stdid = ?";
        ArrayList<Subject> sub = new ArrayList<>();
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, stdCode);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {                
                Subject c = new Subject();
                c.setId(rs.getInt("subid"));
                c.setName(rs.getString("subname"));
                sub.add(c);
            }
            return sub;
        } catch (SQLException ex) {
            Logger.getLogger(SubjectDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    @Override
    public void insert(Subject model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Subject model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Subject model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Subject get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Subject> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
