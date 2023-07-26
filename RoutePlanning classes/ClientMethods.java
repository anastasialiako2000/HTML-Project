package routePlanning_classes;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClientMethods {

    // getClients() --> gets all clients the user has inserted - returns list

    public List<Client> getClients(String userName) throws Exception {

        List<Client> clients = new ArrayList<Client>();

        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM Clients WHERE (userName=?);";

        try {

            con = db.getConnection();
            stmt = con.prepareStatement(sql);
            stmt.setString(1, userName);

            rs = stmt.executeQuery();

            while (rs.next()) {
                clients.add(new Client(rs.getString("clientName"), rs.getString("clientAddress"),
                        rs.getString("clientWarehouse"), rs.getString("userName")));
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

        return clients;

    }

    // addClient() --> adds new client to DB

    public void addClient(Client client) throws Exception {

        String clientName = client.getClientName();
        String clientAddress = client.getClientAddress();
        String clientWarehouse = client.getClientWarehouse();
        String userName = client.getUserName();

        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        PreparedStatement stmt2 = null;
        ResultSet rs = null;

        // new client

        String sql = "INSERT INTO `Clients` (`clientName`,`clientAddress`,`clientWarehouse`,`userName`) VALUES (?,?,?,?);"; // put
                                                                                                                            // names
        // check if client exists

        String sql2 = "SELECT * FROM Clients WHERE (clientName=? AND userName=?);";

        try {

            con = db.getConnection();

            stmt = con.prepareStatement(sql);
            stmt.setString(1, clientName);
            stmt.setString(2, clientAddress);
            stmt.setString(3, clientWarehouse);
            stmt.setString(4, userName);

            stmt2 = con.prepareStatement(sql2);
            stmt2.setString(1, clientName);
            stmt2.setString(2, userName);

            rs = stmt2.executeQuery();

            if (!rs.next()) {

                stmt.executeUpdate();

            } else {

                rs.close();
                stmt.close();
                throw new Exception("Client " + clientName + " has already been added.");

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
    } //

    // deleteClient() --> deletes client from DB

    public void deleteClient(String clientName, String userName) throws Exception {

        DB db = new DB();
        Connection con = null;
        PreparedStatement stmt = null;
        PreparedStatement stmt2 = null;
        ResultSet rs = null;

        String sql = " DELETE FROM `Clients` WHERE (clientName=? AND userName=?);";
        String sql2 = "SELECT * FROM Clients WHERE (clientName=? AND userName=?);";

        try {

            con = db.getConnection();

            stmt = con.prepareStatement(sql);
            stmt.setString(1, clientName);
            stmt.setString(2, userName);

            stmt2 = con.prepareStatement(sql2);
            stmt2.setString(1, clientName);
            stmt2.setString(2, userName);

            rs = stmt2.executeQuery();

            if (!rs.next()) {

                rs.close();
                stmt.close();
                throw new Exception("Client " + clientName + " not found.");

            } else {

                stmt.executeUpdate();

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

    }

    public String getClientsAddress(String userName, String clientName) throws Exception {
        String clientAddress = null;
        DB db = new DB();
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String sql = "SELECT clientAddress FROM clients WHERE userName=? and clientName =?;";

        try {
            connection = db.getConnection();
            stmt = connection.prepareStatement(sql);
            stmt.setString(1, userName);
            stmt.setString(2, clientName);
            rs = stmt.executeQuery();
            while (rs.next()) {
                clientAddress = (rs.getString("clientAddress"));
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
                throw new Exception(e.getMessage());
            }
        }
        return clientAddress;

    }
}
