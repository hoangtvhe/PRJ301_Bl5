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
import model.assignment.Attendance;

import model.assignment.Session;
import model.assignment.Student;


/**
 *
 * @author HP
 */
public class AttendanceDBContext extends DBContext<Attendance>{
    public ArrayList<Attendance> getAttendance(int id){
    ArrayList<Attendance> attlist = new ArrayList<>();
     try {
            String sql = "SELECT st.stdname,ses.date,ses.sesid,st.stdid,att.present,att.description,att.record_time FROM Attendance att INNER JOIN Student st ON att.stdid=st.stdid \n"
                 + "INNER JOIN Session ses ON att.sesid=ses.sesid\n"
                 + "WHERE ses.sesid=?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Attendance att = new Attendance();
                att.setDescription(rs.getString("description"));
                att.setPresent(rs.getBoolean("present"));
                att.setRecord_time(rs.getTimestamp("record_time"));
                Student stu = new Student();
                stu.setId(rs.getString("stdid"));
                stu.setName(rs.getString("stdname"));
                att.setStudent(stu);
                Session se = new Session();
                se.setId(id);
                se.setDate(rs.getDate("date"));
                att.setSession(se);
                attlist.add(att);
            }
        } catch (SQLException ex) {
            Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.close();
            } catch (SQLException ex) {
                Logger.getLogger(AttendanceDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return attlist;
    }

    @Override
    public void insert(Attendance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Attendance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Attendance model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Attendance get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Attendance> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}