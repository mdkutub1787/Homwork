package testjdbc1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author MD KUTUB UDDIN
 */
public class TestJDBC1 {

    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/table1";
        String user = "root";
        String password = "1234";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, user, password);
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM employees;");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                System.out.println(rs.getInt("Id") + " " + 
                        rs.getString("Name") + " " + rs.getInt("Salary"));
            }

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TestJDBC1.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
