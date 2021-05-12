package main.java.servlet;

import main.java.database.DatabaseConnector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "SingUpServlet", urlPatterns = {"/SingUpServlet"})
public class SingUpServlet extends HttpServlet {

    DatabaseConnector dc = new DatabaseConnector();

    public SingUpServlet() throws SQLException, ClassNotFoundException { }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if(password.length() < 6){
            request.setAttribute("test", "TEST pass");
            request.setAttribute("email", email);
            request.setAttribute("password", password);
            request.setAttribute("confirmPassword", confirmPassword);
            request.setAttribute("errorMsg", 2);
            request.getRequestDispatcher("signUp.jsp").forward(request, response);
        }else{
            if(password.equals(confirmPassword)){

                //TODO: utworzyć usera w bazie

                try {
                    dc.createUser(email, password);
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                request.setAttribute("errorMsg", 2);
                request.getRequestDispatcher("logIn.jsp").forward(request, response);
            }else {
                request.setAttribute("test", "TEST pass");
                request.setAttribute("email", email);
                request.setAttribute("password", password);
                request.setAttribute("confirmPassword", confirmPassword);
                request.setAttribute("errorMsg", 1);
                request.getRequestDispatcher("signUp.jsp").forward(request, response);
            }
        }
    }
}
