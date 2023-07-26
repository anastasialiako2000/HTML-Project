
public class Client {

    private String clientName;
    private String clientAddress;
    private String clientWarehouse;
    private String userName;

    public Client(String clientName, String clientAddress, String clientWarehouse, String userName) {
        this.clientName = clientName;
        this.clientAddress = clientAddress;
        this.clientWarehouse = clientWarehouse;
        this.userName = userName;
    }

    public String getClientName() {
        return clientName;
    }

    public void setClientName(String clientName) {
        this.clientName = clientName;
    }

    public String getClientAddress() {
        return clientAddress;
    }

    public void setClientAddress(String clientAddress) {
        this.clientAddress = clientAddress;
    }

    public String getClientWarehouse() {
        return clientWarehouse;
    }

    public void setClientWarehouse(String clientWarehouse) {
        this.clientWarehouse = clientWarehouse;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    } 
}