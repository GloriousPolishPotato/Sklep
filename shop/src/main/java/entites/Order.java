package main.java.entites;

import main.java.ClassPackage.ShopCart;

import java.sql.Timestamp;
import java.util.ArrayList;

public class Order {

    int id;
    Timestamp timestamp;
    int id_user;
    String user_name;
    String user_surname;
    String email;
    String phone;
    String address;
    String postalAddress;
    Boolean sent;
    ShopCart orderedProducts;


    public Order() {}

    public Order(int id, Timestamp timestamp, int id_user, String user_name, String user_surname, String email, String phone, String address, String postalAddress, Boolean sent, ShopCart orderedProducts) {
        this.id = id;
        this.timestamp = timestamp;
        this.id_user = id_user;
        this.user_name = user_name;
        this.user_surname = user_surname;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.postalAddress = postalAddress;
        this.sent = sent;
        this.orderedProducts = orderedProducts;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Timestamp getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Timestamp timestamp) {
        this.timestamp = timestamp;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getUser_surname() {
        return user_surname;
    }

    public void setUser_surname(String user_surname) {
        this.user_surname = user_surname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPostalAddress() {
        return postalAddress;
    }

    public void setPostalAddress(String postalAddress) {
        this.postalAddress = postalAddress;
    }

    public Boolean getSent() {
        return sent;
    }

    public void setSent(Boolean sent) {
        this.sent = sent;
    }

    public ShopCart getOrderedProducts() {
        return orderedProducts;
    }

    public void setOrderedProducts(ShopCart orderedProducts) {
        this.orderedProducts = orderedProducts;
    }

    public String getFullName(){
        return getUser_name() + " " + getUser_surname();
    }
}
