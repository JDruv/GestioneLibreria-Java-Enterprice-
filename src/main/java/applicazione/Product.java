package applicazione;

public class Product {
    private int id;
    private String name;
    private String brand;
    private String madein;
    private float price;

    // Costruttore per prodotti letti da DB (con id)
    public Product(int id, String name, String brand, String madein, float price) {
        this.id = id;
        this.name = name;
        this.brand = brand;
        this.madein = madein;
        this.price = price;
    }

    // Costruttore per nuovo prodotto senza id
    public Product(String name, String brand, String madein, float price) {
        this.name = name;
        this.brand = brand;
        this.madein = madein;
        this.price = price;
    }

    // Getter
    public int getId() { return id; }
    public String getName() { return name; }
    public String getBrand() { return brand; }
    public String getMadein() { return madein; }
    public float getPrice() { return price; }

    @Override
    public String toString() {
        return "Product{id=" + id + ", name='" + name + "', brand='" + brand + "', madein='" + madein + "', price=" + price + "}";
    }
}
