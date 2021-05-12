package main.java.servlet;

import ClassPackage.Student;
import main.java.ClassPackage.ShopCart;
import main.java.entites.Category;
import main.java.database.DatabaseConnector;
import jdk.jfr.Frequency;
import main.java.entites.Order;
import main.java.entites.Product;
import main.java.entites.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "Servlet", urlPatterns = {"/Servlet"})
@MultipartConfig(maxFileSize = 40000000)//1.5mb
public class Servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    DatabaseConnector dc = new DatabaseConnector();
    HttpSession session;

    static ArrayList<Category>categoriesList = new ArrayList<>();
    static ArrayList<Product>productList = new ArrayList<>();
    private static ShopCart shopCart = new ShopCart();
    private static User user = new User();

    public Servlet() throws SQLException, ClassNotFoundException { }

    public static User getUser() {
        return user;
    }

    public static void setUser(User user) {
        Servlet.user = user;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String page = request.getParameter("page");

        System.out.println("doGet " + page);

        if(page == null || (page.equals("index"))) {

            try {
                categoriesList = dc.getAllCategories();
                productList = dc.getAllProducts();
            } catch (SQLException e) {
                System.out.println("SQLException: " + e.getMessage());
                System.out.println("SQLState: " + e.getSQLState());
                System.out.println("VendorError: " + e.getErrorCode());
            }

            session = request.getSession();
            session.setAttribute("categoryList", categoriesList);
            session.setAttribute("productList", productList);
            session.setAttribute("shopCart", shopCart);
            session.setAttribute("user", user);

            request.getRequestDispatcher("index.jsp").forward(request, response);
        }else {
            doPost(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String page = request.getParameter("page");
        if(page == null){ page = "";}

        System.out.println("doPost " + page);

        //Selecting category
        if(page.equals("selectCategory")){

            //request.getRequestDispatcher("index.jsp").forward(request, response);

            int id = Integer.parseInt(request.getParameter("id"));
            System.out.println("id " + id);

            try {
                productList = dc.getAllProducts();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            if(id==0){

                for(int i=0; i<productList.size(); i++){
                    System.out.println(productList.get(i).getId());
                }

                    session.setAttribute("productList", productList);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }else {

                ArrayList<Product> newProductList = new ArrayList<>();

                for(int i=0; i<productList.size(); i++)
                {
                    if(productList.get(i).getId_category() == id){
                        newProductList.add(productList.get(i));
                    }
                }

                for(int i=0; i<newProductList.size(); i++){
                    System.out.println(newProductList.get(i).getId());
                }

                session.setAttribute("page", null);
                session.setAttribute("productList", newProductList);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }

        if(page.equals("addToCart")){

            int id = Integer.parseInt(request.getParameter("id"));
            System.out.println("id " + id);

            for(int i=0; i<productList.size(); i++){
                if(id == productList.get(i).getId()){
                    shopCart.addProduct(productList.get(i));
                }
            }

            System.out.println(shopCart.getTotalAmount());

            request.getRequestDispatcher("index.jsp").forward(request,response);
        }

        if(page.equals("transactions")){

            ArrayList<Order>orderList = new ArrayList<>();
            try {
                orderList = dc.getAllUserOrders(user.getId());
            } catch (SQLException e) {
                e.printStackTrace();
            }

            System.out.println(orderList.size());

            session.setAttribute("orderList", orderList);
            request.getRequestDispatcher("transactionsUser.jsp").forward(request,response);
        }

        if(page.equals("allTransactions")){

            ArrayList<Order>orderList = new ArrayList<>();
            try {
                orderList = dc.getAllOrders();
            } catch (SQLException e) {
                e.printStackTrace();
            }

            System.out.println(orderList.size());

            session.setAttribute("orderList", orderList);
            request.getRequestDispatcher("transactionsAdmin.jsp").forward(request,response);
        }


        if(page.equals("completeTransaction")){

            String email = request.getParameter("email");
            String name = request.getParameter("name");
            String surname = request.getParameter("surname");
            String phoneNumber = request.getParameter("phoneNumber");

            String street = request.getParameter("street");
            String houseNumber = request.getParameter("houseNumber");
            String apartmentNumber = request.getParameter("apartmentNumber");

            String city = request.getParameter("city");
            String ZIP = request.getParameter("ZIP");

            String address = street + " " + houseNumber + " " + apartmentNumber;
            String postalAddress = city + " " + ZIP;

            try {
                dc.createOrder( user.getId(), name, surname, email, phoneNumber, address, postalAddress, shopCart );
                shopCart = new ShopCart();
                session.setAttribute("page", "index");
                request.getRequestDispatcher("index.jsp").forward(request,response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if(page.equals("sentOrder")){
            int id = Integer.valueOf(request.getParameter("id"));
            try {
                dc.sentOrder(Integer.valueOf(request.getParameter("id")));
                session.setAttribute("page", "allTransactions");
                request.getRequestDispatcher("transactionsAdmin.jsp").forward(request,response);
                doPost(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if(page.equals("logout")){

            String p="index";

            user = new User();
            user.setStatus("");
            request.getRequestDispatcher("index.jsp").forward(request,response);
        }

        if(page.equals("productListAdmin")){

            try {
                categoriesList = dc.getAllCategories();
                productList = dc.getAllProducts();
            } catch (SQLException e) {
                System.out.println("SQLException: " + e.getMessage());
                System.out.println("SQLState: " + e.getSQLState());
                System.out.println("VendorError: " + e.getErrorCode());
            }

            session = request.getSession();
            session.setAttribute("categoryList", categoriesList);
            session.setAttribute("productList", productList);

            request.getRequestDispatcher("productList.jsp").forward(request, response);
        }

        if(page.equals("addProductPage")){
            try {
                categoriesList = dc.getAllCategories();
                productList = dc.getAllProducts();
            } catch (SQLException e) {
                System.out.println("SQLException: " + e.getMessage());
                System.out.println("SQLState: " + e.getSQLState());
                System.out.println("VendorError: " + e.getErrorCode());
            }

            session = request.getSession();
            session.setAttribute("categoryList", categoriesList);
            request.getRequestDispatcher("createProduct.jsp").forward(request, response);
        }

        if(page.equals("editProduct")){
            int id = Integer.valueOf(request.getParameter("id"));
            try {
                Product product = dc.getProduct(id);
                session.setAttribute("product", product);
                request.getRequestDispatcher("productEdit.jsp").forward(request, response);

            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        if(page.equals("createProduct")){
            try {

                double price = Double.valueOf(request.getParameter("price"));
                String name = request.getParameter("name") ;
                String description =  request.getParameter("description");

                Boolean available= false;
                if(request.getParameter("available")=="true")
                {
                    available = true;
                }

                int category_id = 1;

                String categoryName = request.getParameter("category");
                for(int i=0; i<categoriesList.size(); i++){
                    if(categoriesList.get(i).getName() == categoryName){
                        category_id = categoriesList.get(i).getId();
                    }
                }

                System.out.println(name);
                System.out.println(price);
                System.out.println(description);
                System.out.println(available);
                System.out.println(categoryName);
                System.out.println(category_id);

                //TODO
                //Part part = request.getPart("image");
                //if (part != null) {
                //    InputStream is = part.getInputStream();
                //   dc.updateProductWithImg(id,name, price, description, category_id, available, is);
                //}{
                //    dc.updateProduct(id,name, price, description, category_id, available);
                //}

                dc.addProduct(name, price, description, category_id, available);

                categoriesList = dc.getAllCategories();
                productList = dc.getAllProducts();
            } catch (SQLException e) {
                System.out.println("SQLException: " + e.getMessage());
                System.out.println("SQLState: " + e.getSQLState());
                System.out.println("VendorError: " + e.getErrorCode());
            }

            session = request.getSession();
            session.setAttribute("categoryList", categoriesList);
            session.setAttribute("productList", productList);

            request.getRequestDispatcher("productList.jsp").forward(request, response);
        }

        if(page.equals("updateProduct")) {
            try {

                int id = Integer.valueOf(request.getParameter("id"));
                double price = Double.valueOf(request.getParameter("price"));
                String name = request.getParameter("name") ;
                String description =  request.getParameter("description");

                Boolean available= false;
                if(request.getParameter("available")=="true")
                {
                    available = true;
                }

                int category_id = 1;

                String categoryName = request.getParameter("category");
                for(int i=0; i<categoriesList.size(); i++){
                    if(categoriesList.get(i).getName() == categoryName){
                        category_id = categoriesList.get(i).getId();
                    }
                }

                System.out.println(name);
                System.out.println(price);
                System.out.println(description);
                System.out.println(available);
                System.out.println(categoryName);
                System.out.println(category_id);

                //TODO
                //Part part = request.getPart("image");
                //if (part != null) {
                //    InputStream is = part.getInputStream();
                //   dc.updateProductWithImg(id,name, price, description, category_id, available, is);
                //}{
                //    dc.updateProduct(id,name, price, description, category_id, available);
                //}

                dc.updateProduct(id,name, price, description, category_id, available);

                categoriesList = dc.getAllCategories();
                productList = dc.getAllProducts();
            } catch (SQLException e) {
                System.out.println("SQLException: " + e.getMessage());
                System.out.println("SQLState: " + e.getSQLState());
                System.out.println("VendorError: " + e.getErrorCode());
            }

            session = request.getSession();
            session.setAttribute("categoryList", categoriesList);
            session.setAttribute("productList", productList);

            request.getRequestDispatcher("productList.jsp").forward(request, response);
        }

    }
}
