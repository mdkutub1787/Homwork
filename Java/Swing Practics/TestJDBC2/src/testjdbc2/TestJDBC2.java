package testjdbc2;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * @author MD KUTUB UDDIN
 */
public class TestJDBC2 {

    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/table2";
        String user = "root";
        String password = "1234";
        String Driver="com.mysql.cj.jdbc.Driver";
        try {
            Class.forName(Driver);
            Connection connection = DriverManager.getConnection(url, user, password);
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM teacher;");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                System.out.println(rs.getInt("Id") + " " + 
                        rs.getString("Name") + " " + rs.getString("City"));
            }

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(TestJDBC2.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
