package ClassPackage;

import java.util.ArrayList;

public class Student {

    public String login;
    public String haslo;

    public Student(String login, String haslo) {
        this.login = login;
        this.haslo = haslo;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getHaslo() {
        return haslo;
    }

    public void setHaslo(String hasło) {
        this.haslo = hasło;
    }
}
