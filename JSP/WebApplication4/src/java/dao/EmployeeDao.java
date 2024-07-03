package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Employee;
import util.DBUtil;

/**
 * @author MD KUTUB UDDIN
 */
public class EmployeeDao {

    Employee e = new Employee();

    static PreparedStatement ps;
    static ResultSet rs;
    static String sql = "";

    public static int saveEmployee(Employee e) {
        int status = 0;

        sql = "insert into employee (name,email,address,cell) values(?,?,?,?)";
        try {
            ps = DBUtil.getCon().prepareStatement(sql);
            ps.setString(1, e.getName());
            ps.setString(2, e.getEmail());
            ps.setString(3, e.getAddress());
            ps.setString(4, e.getCell());

            status = ps.executeUpdate();

            ps.close();
            DBUtil.getCon().close();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return status;
    }

    public static List<Employee> viewAllEmployee() {
        List<Employee> eList = new ArrayList<>();

        sql = "select * from employee";
        try {
            ps = DBUtil.getCon().prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Employee e = new Employee(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("address"),
                        rs.getString("cell")
                );
                eList.add(e);
            }
            rs.close();
            ps.close();
            DBUtil.getCon().close();

        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return eList;
    }

    public static void deleteEmployee(Employee e) {
        sql = "delete from employee where id=?";
        try {
            ps = DBUtil.getCon().prepareStatement(sql);
            ps.setInt(1, e.getId());
            ps.executeUpdate();

            ps.close();
            DBUtil.getCon().close();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void updateEmployee(Employee e) {
        sql = "update employee set name=?,email=?,address=?,cell=? where id=?";
        try {
            ps = DBUtil.getCon().prepareStatement(sql);
            ps.setString(1, e.getName());
            ps.setString(2, e.getEmail());
            ps.setString(3, e.getAddress());
            ps.setString(4, e.getCell());
            ps.setInt(5, e.getId());

            ps.executeUpdate();

            ps.close();
            DBUtil.getCon().close();

        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static Employee getById(int id) {
        Employee e = null;
        sql = "select * from employee where id=?";
        try {
            ps = DBUtil.getCon().prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                e = new Employee(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("email"),
                        rs.getString("address"),
                        rs.getString("cell")
                );

            }
            rs.close();
            ps.close();
            DBUtil.getCon().close();
        } catch (SQLException ex) {
            Logger.getLogger(EmployeeDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return e;

    }

}
