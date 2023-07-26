public void addSchedule(int schedule) throws Exception {

    String scheduleDate = schedule.getScheduleDate();
    String companyName = schedule.getCompanyName();
    String userName = schedule.getUserName();

    DB db = new DB();
    Connection con = null;
    PreparedStatement stmt = null;
    PreparedStatement stmt2 = null;
    ResultSet rs = null;

    // new client

    String sql = "INSERT INTO `schedules` (`scheduleName`,`companyName`,`userName`) VALUES (?,?,?);"; // put
                                                                                                                        // names
    // check if client exists

    String sql2 = "SELECT * FROM schedules WHERE (scheduleDate=?);";

    try {

        con = db.getConnection();

        stmt = con.prepareStatement(sql);
        stmt.setString(1, scheduleName);
        stmt.setString(2, companyName);
        stmt.setString(3, userName);

        stmt2 = con.prepareStatement(sql2);
        stmt2.setString(1, scheduleDate);

        rs = stmt2.executeQuery();

        if (!rs.next()) {

            stmt.executeUpdate();

        } else {

            rs.close();
            stmt.close();
            throw new Exception("Schedule at" + scheduleDate + " has already been added.");

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
