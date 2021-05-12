package main.java.entites;

import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.Base64;

public class Product {
    int id;
    int id_category;
    double price;
    String name;
    String description;
    byte[] img;
    String base64Image;
    Boolean available;

    public Product() {}

    public Product(int id, int id_category, double price, String name, String description, byte[] img, String base64Image, Boolean available) {
        this.id = id;
        this.id_category = id_category;
        this.price = price;
        this.name = name;
        this.description = description;
        this.img = img;
        this.base64Image = base64Image;
        this.available = available;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_category() {
        return id_category;
    }

    public void setId_category(int id_category) {
        this.id_category = id_category;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Boolean getAvailable() {
        return available;
    }

    public void setAvailable(Boolean available) {
        this.available = available;
    }

    public byte[] getImg() {
        return img;
    }

    public void setImg(byte[] img) throws UnsupportedEncodingException {

        /*
        user.setFileName(fileData.getOriginalFilename());
        user.setImageFile(bytes);
        byte[] encodeBase64 = Base64.encodeBase64(img);
        String base64Encoded = new String(encodeBase64, "UTF-8");
        user.setBase64image(base64encoded);
         */
        this.img = img;
    }

    public String getBase64Image() {
        return base64Image;
    }

    public void setBase64Image(String base64Image) {
        this.base64Image = base64Image;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", id_category=" + id_category +
                ", price=" + price +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", img=" + Arrays.toString(img) +
                ", base64Image='" + base64Image + '\'' +
                ", available=" + available +
                '}';
    }
}
