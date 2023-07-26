public void addRoute(int route) throws Exception {

    String routeID = route.getrouteID();
    String scheduleDate = route.getScheduleDate();

    DB db = new DB();
    Connection con = null;
    PreparedStatement stmt = null;
    PreparedStatement stmt2 = null;
    ResultSet rs = null;

    // new client

    String sql = "INSERT INTO `route` (`routeID`,`ScheduleDate`) VALUES (?,?);"; // put
                                                                                                                        // names
    // check if client exists

    String sql2 = "SELECT * FROM route WHERE (routeID=?);";

    try {

        con = db.getConnection();

        stmt = con.prepareStatement(sql);
        stmt.setString(1, routeID);
        stmt.setString(2, ScheduleDate);

        stmt2 = con.prepareStatement(sql2);
        stmt2.setString(1, routeID);

        rs = stmt2.executeQuery();

        if (!rs.next()) {

            stmt.executeUpdate();

        } else {

            rs.close();
            stmt.close();
            throw new Exception("Route " + routeID + " has already been added.");

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
