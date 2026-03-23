package applicazione;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class collegamentoDAO {

    private static final String URL = "jdbc:postgresql://localhost:5432/dbesame";
    private static final String USER = "postgres";
    private static final String PASSWORD = "admin";

    public Connection getConnection() throws SQLException {
        System.out.println("[DAO] Tentativo di connessione al database: " + URL);
        try {
            Class.forName("org.postgresql.Driver");
            System.out.println("[DAO] Driver PostgreSQL caricato correttamente.");
            Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("[DAO] Connessione al database riuscita!");
            return conn;
        } catch (ClassNotFoundException e) {
            System.err.println("[DAO] Driver PostgreSQL non trovato: " + e.getMessage());
            throw new SQLException("Driver non trovato", e);
        }
    }

    public List<Product> getAndPrintAllProducts() throws SQLException {
        System.out.println("[DAO] Inizio metodo getAndPrintAllProducts");
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM product";
        System.out.println("[DAO] Query da eseguire: " + sql);

        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            int count = 0;
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String brand = rs.getString("brand");
                String madein = rs.getString("madein");
                float price = rs.getFloat("price");

                Product p = new Product(id, name, brand, madein, price);
                products.add(p);

                System.out.printf("[DAO] Prodotto #%d: ID=%d, Nome=%s, Brand=%s, MadeIn=%s, Prezzo=%.2f%n",
                        count + 1, id, name, brand, madein, price);
                count++;
            }

            System.out.println("[DAO] Totale prodotti recuperati: " + count);

        } catch (SQLException e) {
            System.err.println("[DAO] Errore durante la query: " + e.getMessage());
            throw e;
        }

        System.out.println("[DAO] Fine metodo getAndPrintAllProducts");
        return products;
    }

    public void deleteProductById(int id) throws SQLException {
        String sql = "DELETE FROM product WHERE id = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("[DAO] Prodotto con ID " + id + " eliminato correttamente.");
            } else {
                System.out.println("[DAO] Nessun prodotto trovato con ID " + id + ".");
            }

        } catch (SQLException e) {
            System.err.println("[DAO] Errore durante l'eliminazione del prodotto: " + e.getMessage());
            throw e;
        }
    }
    
    public boolean inserisciProdotto(Product p) {
        String sql = "INSERT INTO product (name, brand, madein, price) VALUES (?, ?, ?, ?)";

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, p.getName());
            ps.setString(2, p.getBrand());
            ps.setString(3, p.getMadein());
            ps.setFloat(4, p.getPrice());

            int righe = ps.executeUpdate();
            return righe > 0;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


}
