package main.java.ClassPackage;

import main.java.entites.Product;

import java.util.ArrayList;
import java.util.Map;

public class ShopCart {
    private ArrayList<Product>products = new ArrayList<>();
    private ArrayList<Integer>amount = new ArrayList<>();
    private int totalAmount;

    public ShopCart() { totalAmount = 0; }

    public ArrayList<Product> getProducts() {
        return products;
    }

    public void setProducts(ArrayList<Product> products) {
        this.products = products;
    }

    public ArrayList<Integer> getAmount() {
        return amount;
    }

    public void setAmount(ArrayList<Integer> amount) {
        this.amount = amount;
    }

    public int getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(int totalAmount) {
        this.totalAmount = totalAmount;
    }

    public void addProduct(Product p){

        boolean isAlreadyInCart = false;
        for(int i=0; i<products.size(); i++){
            if( p.getId() == products.get(i).getId()){
                amount.set(i, amount.get(i) + 1);
                isAlreadyInCart = true;
            }
        }
        if( !isAlreadyInCart ){
            products.add(p);
            amount.add(1);
        }
        totalAmount++;
    }

    public double getTotalPrice(){

        double total=0;
        for(int i=0; i<products.size(); i++){
            total += products.get(i).getPrice()*(double)amount.get(i);
        }
        return total;
    }
}
