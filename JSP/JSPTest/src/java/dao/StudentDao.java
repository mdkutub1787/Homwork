package dao;

import java.sql.Array;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Student;
import util.DBUtil;

public class StudentDao {

    static Student s = new Student();

    static PreparedStatement ps;
    static ResultSet rs;
    static String sql = "";

    public static int saveStudent(Student s) {
        int status = 0;
        sql = "insert into student(name,address)values(?,?)";
        try {
            ps = DBUtil.getCon().prepareStatement(sql);
            ps.setString(1, s.getName());
            ps.setString(2, s.getAddress());

            status = ps.executeUpdate();
            System.out.println(status);

            ps.close();
            DBUtil.getCon().close();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return status;

    }

    public static List<Student> viewAllStudent() {
        List<Student> stList = new ArrayList<>();

        sql = "select * from student ";
        try {
            ps = DBUtil.getCon().prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Student s = new Student(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("address")
                );

                stList.add(s);
            }
            rs.close();
            ps.close();
            DBUtil.getCon().close();

        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return stList;

    }

    public static void deleteStudent(Student s) {
        sql = "delete from student where id=?";
        try {
            ps = DBUtil.getCon().prepareStatement(sql);
            ps.setInt(1, s.getId());
            ps.executeUpdate();

            ps.close();
            DBUtil.getCon().close();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
