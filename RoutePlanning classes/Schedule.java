package routePlanning_classes;

public class Schedule {
    private String companyName;
    private String scheduleDate;

    public Schedule(String companyName, String scheduleDate) {
        this.companyName = companyName;
        this.scheduleDate = scheduleDate;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getScheduleDate() {
        return scheduleDate;
    }

    public void setScheduleDate(String scheduleDate) {
        this.scheduleDate = scheduleDate;
    }

}
