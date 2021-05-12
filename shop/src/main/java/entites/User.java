package main.java.entites;

public class User {

    private int id;
    private String email;
    private String status;

    public User() {
        this.id=0;
        this.email = "";
        this.status = "";
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
