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

@WebServlet(name = "LogInServlet", urlPatterns = {"/LogInServlet"})
public class LogInServlet extends HttpServlet {

    DatabaseConnector dc = new DatabaseConnector();

    public LogInServlet() throws SQLException, ClassNotFoundException { }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        String email = request.getParameter("email");
        String password = request.getParameter("password");

        int id = 0;
        try {
            id = dc.checkUser(email, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if(id != 0){
            Servlet.getUser().setEmail(email);
            Servlet.getUser().setId(id);
            Servlet.getUser().setStatus("user");

            boolean isAdmin = false;
            //TODO zapytać o admina

            try {
                if(dc.isAdmin(id)){
                    Servlet.getUser().setStatus("admin");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }


            request.setAttribute("page", "index");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }else{
            request.setAttribute("errorMsg", 1);
            request.getRequestDispatcher("logIn.jsp").forward(request, response);
        }
    }
}
