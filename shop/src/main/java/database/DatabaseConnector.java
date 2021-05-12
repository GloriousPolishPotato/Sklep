package main.java.database;

import main.java.ClassPackage.ShopCart;
import main.java.entites.Category;
import main.java.entites.Order;
import main.java.entites.Product;
import main.java.servlet.Servlet;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.Base64;

public class DatabaseConnector {

    private static Connection db;
    private static Statement st;

    public DatabaseConnector() throws ClassNotFoundException, SQLException
    {
        //sterownik do MySQL
        Class.forName("com.mysql.cj.jdbc.Driver");

        //lokalizacja i dostęp do bazy danych
        String url = "jdbc:mysql://localhost:3306/aplikacjebazodanowejavaee";
        String user = "root";
        String passwd = "";

        //nawiązanie połączenia
        db = DriverManager.getConnection(url, user, passwd);
        if(db != null)
        {
            System.out.println("Connected to database");
        }

        //db.setAutoCommit(false);

        //utworzenie obiektu typu Statement, który odpowiada za generowanie zapytań do bazy
        st = db.createStatement();
    }

    public void closeConnection() throws SQLException {
        st.close();
        db.close();
    }

    public ArrayList<Category> getAllCategories() throws SQLException{
        ResultSet rs = st.executeQuery("select * from categories");
        ArrayList <Category> categories = new ArrayList<Category>();

        while (rs.next())
        {
            System.out.println(rs.getString(1)+" "+rs.getString(2));
            categories.add(new Category(Integer.parseInt(rs.getString(1)), rs.getString(2)));
        }
        rs.close();
        return categories;
    }

    public Product getProduct(int product_id) throws SQLException, IOException {
        String sql = "Select * from products where id = ?";
        PreparedStatement st = db.prepareStatement(sql);
        st.setString(1, String.valueOf(product_id));
        ResultSet rs = st.executeQuery();

        int id;
        int id_category;
        double price;
        String name;
        String description;
        byte[] img;
        Boolean available;

        Blob blob;
        InputStream inputStream;
        ByteArrayOutputStream outputStream;
        byte[] buffer;
        int bytesRead;
        byte[] imageBytes;
        String base64Image;

        Product product = new Product();

        while (rs.next())
        {
            id = rs.getInt("id");
            id_category = rs.getInt("id_category");
            price = rs.getDouble("price");
            name = rs.getString("name");
            description = rs.getString("description");
            img = rs.getBytes("img");
            available = rs.getBoolean("available");

            blob = rs.getBlob("img");
            inputStream = blob.getBinaryStream();
            outputStream = new ByteArrayOutputStream();
            buffer = new byte[4096];
            bytesRead = -1;

            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }

            imageBytes = outputStream.toByteArray();
            base64Image = Base64.getEncoder().encodeToString(imageBytes);
            inputStream.close();
            outputStream.close();

            product = new Product(id, id_category, price, name, description, img, base64Image, available);
        }
        return product;
    }

    public ArrayList<Product> getAllProducts() throws SQLException, IOException {
        ResultSet rs = st.executeQuery("select * from products");
        ArrayList <Product> products = new ArrayList<Product>();

        int id;
        int id_category;
        double price;
        String name;
        String description;
        byte[] img;
        Boolean available;

        Blob blob;
        InputStream inputStream;
        ByteArrayOutputStream outputStream;
        byte[] buffer;
        int bytesRead;
        byte[] imageBytes;
        String base64Image;

        while (rs.next())
        {
            //System.out.println(rs.getString(1)+" "+rs.getString(2)+" "+rs.getString(3));

            id = rs.getInt("id");
            id_category = rs.getInt("id_category");
            price = rs.getDouble("price");
            name = rs.getString("name");
            description = rs.getString("description");
            img = rs.getBytes("img");
            available = rs.getBoolean("available");

            blob = rs.getBlob("img");
            inputStream = blob.getBinaryStream();
            outputStream = new ByteArrayOutputStream();
            buffer = new byte[4096];
            bytesRead = -1;

            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }

            imageBytes = outputStream.toByteArray();
            base64Image = Base64.getEncoder().encodeToString(imageBytes);
            inputStream.close();
            outputStream.close();

            System.out.println( id + " " + id_category + " " + price + " " + name + " " + description + " "  + " " + img);
            System.out.println(base64Image);

            products.add(new Product(id, id_category, price, name, description, img, base64Image, available));
        }
        return products;
    }

    public void addProduct(String name, double price, String description, int id_category, boolean available) throws SQLException {

        String sql = "Insert into products(name,price,id_category,description,available) values(?,?,?,?,?)";
        PreparedStatement st = db.prepareStatement(sql);
        st.setString(1, name);
        st.setDouble(2, price);
        st.setInt(3, id_category);
        st.setString(4, description);
        st.setBoolean(5,available );
        st.executeUpdate();
    }


        public void updateProduct(int id, String name, double price, String description, int id_category, boolean available) throws SQLException {

        String sql = "update products set name=?,price=?,id_category=?,description=?, available=? where id=?";
        PreparedStatement st = db.prepareStatement(sql);
        st.setString(1, name);
        st.setDouble(2, price);
        st.setInt(3, id_category);
        st.setString(4, description);
        st.setBoolean(5,available );
        st.setInt(6, id);
        st.executeUpdate();
    }

    public void updateProductWithImg(int id, String name, double price, String description, int id_category, boolean available, InputStream is) throws SQLException {


        System.out.println("$$$$$$$$$$$$$$$$$ " + id_category);

        String sql = "update products set name=?,price=?,id_category=?,description=?, available=?, img=?  where id=?";
        PreparedStatement st = db.prepareStatement(sql);
        st.setString(1, name);
        st.setDouble(2, price);
        st.setInt(3, id_category);
        st.setString(4, description);
        st.setBoolean(5,available);
        st.setBlob(6, is);
        st.setInt(7, id);
        st.executeUpdate();
    }

    public void createUser(String email, String password) throws SQLException, IOException {

        System.out.println( email + " " + password );

        String sql = "Insert into users(email,password) values(?,?)";
        PreparedStatement st = db.prepareStatement(sql);

        st.setString(1, email);
        st.setString(2, password);
        st.executeUpdate();
    }

    public int checkUser(String email, String password) throws SQLException {
        String sql = "Select * from users where email = ? and password = ?";
        PreparedStatement st = db.prepareStatement(sql);

        st.setString(1, email);
        st.setString(2, password);

        ResultSet rs = st.executeQuery();

        int id=0;
        while(rs.next()) {
            id = rs.getInt("id");
        }

        //st.close();
        return id;
    }

    public void createOrder(int id, String name, String surname, String email, String phoneNumber, String address, String postalAddress,  ShopCart shopCart ) throws SQLException {

        String sql;

        if(id == 0){
            sql = "Insert into orders(user_name, user_surname, email, phoneNumber, address, postalAddress ) values(?,?,?,?,?,?)";
            PreparedStatement st = db.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, surname);
            st.setString(3, email);
            st.setString(4, phoneNumber);
            st.setString(5, address);
            st.setString(6, postalAddress);
            st.executeUpdate();
        }else {
            sql = "Insert into orders(id_user, user_name, user_surname, email, phoneNumber, address, postalAddress ) values(?,?,?,?,?,?,?)";
            PreparedStatement st = db.prepareStatement(sql);
            st.setInt (1, id);
            st.setString(2,name);
            st.setString(3, surname);
            st.setString(4, email);
            st.setString(5, phoneNumber);
            st.setString(6, address);
            st.setString(7, postalAddress);
            st.executeUpdate();
        }

        int order_id=0;
        ResultSet rs = st.executeQuery("SELECT LAST_INSERT_ID()");
        while (rs.next())
        {
            System.out.println(rs.getInt(1));
            order_id = rs.getInt(1);
        }


        for(int i=0; i<shopCart.getProducts().size(); i++){
            sql = "Insert into order_items( id_order, id_product, quantity) values(?,?,?)";
            PreparedStatement st = db.prepareStatement(sql);
            st.setInt (1, order_id);
            st.setInt(2, shopCart.getProducts().get(i).getId());
            st.setInt(3, shopCart.getAmount().get(i));
            st.executeUpdate();
        }
        //st.close();
    }

    public ShopCart getOrderProducts(int order_id) throws SQLException, IOException {

        String sql = "Select * from order_items where id_order = ?";
        PreparedStatement st = db.prepareStatement(sql);
        st.setString(1, String.valueOf(order_id));
        ResultSet rs = st.executeQuery();

        ShopCart products = new ShopCart();
        Product p;
        int quantity;

        while (rs.next())
        {
            p = getProduct(rs.getInt("id_product"));
            quantity = rs.getInt("quantity");
            products.getProducts().add(p);
            products.getAmount().add(quantity);
        }
        return products;
    }

    public ArrayList<Order> getAllUserOrders(int user_id) throws SQLException, IOException {

        String sql = "Select * from orders where id_user = ?";
        PreparedStatement st = db.prepareStatement(sql);
        st.setString(1, String.valueOf(user_id));
        ResultSet rs = st.executeQuery();

        ArrayList<Order> orders = new ArrayList<>();

        int i=0;
        while (rs.next())
        {
            orders.add(new Order());
            orders.get(i).setId(rs.getInt("id"));
            orders.get(i).setTimestamp(rs.getTimestamp("time"));
            orders.get(i).setId_user(rs.getInt("id_user"));
            orders.get(i).setUser_name(rs.getString("user_name"));
            orders.get(i).setUser_surname(rs.getString("user_surname"));
            orders.get(i).setEmail(rs.getString("email"));
            orders.get(i).setPhone(rs.getString("phoneNumber"));
            orders.get(i).setAddress(rs.getString("address"));
            orders.get(i).setPostalAddress(rs.getString("postalAddress"));
            orders.get(i).setSent(rs.getBoolean("sent"));

            orders.get(i).setOrderedProducts(
                    getOrderProducts(rs.getInt("id"))
            );

            i++;
        }
        return orders;
    }

    public ArrayList<Order> getAllOrders() throws SQLException, IOException {

        String sql = "Select * from orders";
        PreparedStatement st = db.prepareStatement(sql);
        ResultSet rs = st.executeQuery();

        ArrayList<Order> orders = new ArrayList<>();

        int i=0;
        while (rs.next())
        {
            orders.add(new Order());
            orders.get(i).setId(rs.getInt("id"));
            orders.get(i).setTimestamp(rs.getTimestamp("time"));
            orders.get(i).setId_user(rs.getInt("id_user"));
            orders.get(i).setUser_name(rs.getString("user_name"));
            orders.get(i).setUser_surname(rs.getString("user_surname"));
            orders.get(i).setEmail(rs.getString("email"));
            orders.get(i).setPhone(rs.getString("phoneNumber"));
            orders.get(i).setAddress(rs.getString("address"));
            orders.get(i).setPostalAddress(rs.getString("postalAddress"));
            orders.get(i).setSent(rs.getBoolean("sent"));

            orders.get(i).setOrderedProducts(
                    getOrderProducts(rs.getInt("id"))
            );

            i++;
        }
        return orders;
    }


    public Boolean isAdmin(int id_user) throws SQLException {

        String sql = "Select * from admins where id_user = ?";
        PreparedStatement st = db.prepareStatement(sql);

        st.setString(1, String.valueOf(id_user));

        ResultSet rs = st.executeQuery();

        int id=0;
        while(rs.next()) {
            id = rs.getInt("id");
        }

        if(id==0){
            return false;
        }else {
            return true;
        }
    }

    public void sentOrder(int id_order) throws SQLException {

        String sql = "update orders set sent=? where id=?";
        PreparedStatement st = db.prepareStatement(sql);
        st.setBoolean(1, true);
        st.setInt(2, id_order);

        st.executeUpdate();
    }

}
