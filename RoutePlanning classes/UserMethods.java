import java.util.*;
import java.sql.*;

public class UserMethods {

    // authenticate() --> user sign in
    public User authenticate(String userName, String password) throws Exception {

        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM Users WHERE (userName=? AND userPassword=?);";

        try {

            con = db.getConnection();
            stmt = con.prepareStatement(sql);

            stmt.setString(1, userName);
            stmt.setString(2, password);

            rs = stmt.executeQuery();

            if (!rs.next()) {

                rs.close();
                stmt.close();
                throw new Exception("Wrong username or password. Please try again.");

            }
            
            User user = new User(rs.getString("companyName"), rs.getString("phone"), rs.getString("email"),
                    rs.getString("address"), rs.getString("userName"), rs.getString("password"));

            rs.close();
            stmt.close();
            db.close();

            return user;

        } catch (Exception e) {

            throw new Exception(e.getMessage());

        } finally {

            try {
                db.close();
            } catch (Exception e) {

            }

        }

    } // End of authenticate

    // register()
    public void register(User user) throws Exception { // correct names
        String companyName = user.getCompanyName();
        String phone = user.getPhone();
        String email = user.getEmail();
        String address = user.getAddress();
        String userName = user.getUserName();
        String password = user.getPassword();

        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        PreparedStatement stmt2 = null;
        ResultSet rs = null;

        // new registration
        String sql = "INSERT INTO `Users` (`companyName`,`phone`,`email`,`address`,`userName`,`userPassword`) VALUES (?,?,?,?,?,?);";
        // check if user exists
        String sql2 = "SELECT * FROM Users WHERE (userName=? OR email=?);";

        try {

            con = db.getConnection();

            stmt = con.prepareStatement(sql);
            stmt.setString(1, companyName);
            stmt.setString(2, phone);
            stmt.setString(3, email);
            stmt.setString(4, address);
            stmt.setString(5, userName);
            stmt.setString(6, password);

            stmt2 = con.prepareStatement(sql2);
            stmt2.setString(1, userName);
            stmt2.setString(2, email);

            rs = stmt2.executeQuery();

            if (!rs.next()) {

                stmt.executeUpdate();

            } else {

                rs.close();
                stmt.close();
                throw new Exception("Username or email is already register.");

            }

            rs.close();
            stmt.close();
            db.close();

        } catch (Exception e) {

            throw new Exception(e.getMessage());

        } finally {

            try {
                db.close();
            } catch (Exception e) {

            }

        }
    } // End of register()

    public String getUserAddress(String userName) throws Exception {
		String address = null;

		DB db = new DB();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT address FROM users WHERE userName=?;";

        try {

            connection = db.getConnection();
            stmt = connection.prepareStatement(sql);

            stmt.setString(1, userName);

            rs = stmt.executeQuery();

            while ( rs.next() ) {

                 address = (rs.getString("address"));			

            }

            rs.close(); 
            stmt.close(); 
            db.close(); 
            

        } catch (Exception e) {
            
            throw new Exception(e.getMessage());

        } finally {

            try {
                db.close();
            } catch (Exception e) {
                
            }

        }
        
        return address;

    }
}