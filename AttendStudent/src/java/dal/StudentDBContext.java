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
import model.assignment.Student;

/**
 *
 * @author Admin
 */
public class StudentDBContext extends DBContext<Student>{
     
    public ArrayList<Student> list(int gid) {
        try {
            ArrayList<Student> students = new ArrayList<>();
            String sql = "SELECT DISTINCT s.stdid,s.stdname\n"
                    + "FROM [Session] ses \n"
                    + "	LEFT JOIN [Group] g ON g.gid = ses.gid\n"
                    + "	INNER JOIN [Student_Group] sg ON sg.gid = g.gid\n"
                    + "	INNER JOIN Student s ON sg.stdid = s.stdid\n"
                    + "WHERE g.gid = ?";
            
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, gid);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                Student student = new Student();
                student.setId(rs.getString("stdid"));
                student.setName(rs.getString("stdname"));
                students.add(student);
            }
            return students;
            
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
     public Student get(String id) {
        try {
            String sql = "SELECT stdid,stdname FROM Student WHERE stdid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, id);
            ResultSet rs = stm.executeQuery();
            if(rs.next())
            {
                Student stu = new Student();
                stu.setId(rs.getString("stdid"));
                stu.setName(rs.getString("stdname"));
                return stu;
            }
        } catch (SQLException ex) {
            Logger.getLogger(LecturerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    @Override
    public void insert(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Student get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Student> list() {
         ArrayList<Student> students = new ArrayList<>();
        String sql = "SELECT stdid,stdname FROM Student";
        try {
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                String sid = rs.getString("stdid");
                String sname = rs.getString("stdname");
                s.setId(sid);
                s.setName(sname);
                students.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return students;
    }
}