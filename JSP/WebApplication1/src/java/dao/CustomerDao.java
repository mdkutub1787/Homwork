package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Customer;
import util.DBUtil;

public class CustomerDao {

    Customer c = new Customer();

    static PreparedStatement ps;
    static ResultSet rs;
    static String sql = "";

    public static int saveCustomer(Customer c) {
        int status = 0;

        sql = "insert into customer (name,address,phone) values(?,?,?)";
        try {
            ps = DBUtil.getCon().prepareStatement(sql);
            ps.setString(1, c.getName());
            ps.setString(2, c.getAddress());
            ps.setString(3, c.getPhone());

            status = ps.executeUpdate();

            ps.close();
            DBUtil.getCon().close();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return status;
    }

    public static List<Customer> showCustomer() {
        List<Customer> cList = new ArrayList<>();

        sql = "select * from customer";
        try {
            ps = DBUtil.getCon().prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Customer c = new Customer(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getString("phone")
                );

                cList.add(c);
            }

            rs.close();
            ps.close();
            DBUtil.getCon().close();

        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cList;

    }

    public static void deleteCustomer(Customer c) {
        sql = "delete from customer where id=?";
        try {
            ps = DBUtil.getCon().prepareStatement(sql);
            ps.setInt(1, c.getId());
            ps.executeUpdate();

            ps.close();
            DBUtil.getCon().close();

        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public static void updateCustomer(Customer c) {
        sql = "update customer  set name=?,address=?,phone=? "
                + "where id=?";
        try {
            ps = DBUtil.getCon().prepareStatement(sql);
            ps.setString(1, c.getName());
            ps.setString(2, c.getAddress());
            ps.setString(3, c.getPhone());
            ps.setInt(4, c.getId());

            ps.executeUpdate();

            ps.close();
            DBUtil.getCon().close();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static Customer getById(int id) {
        Customer c = null;

        sql = "select * from customer where id=?";
        try {
            ps = DBUtil.getCon().prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                c = new Customer(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("address"),
                        rs.getString("phone")
                );
            }

            rs.close();
            ps.close();
            DBUtil.getCon().close();

        } catch (SQLException ex) {
            Logger.getLogger(CustomerDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }
}
