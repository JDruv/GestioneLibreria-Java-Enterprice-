package web;

import applicazione.collegamentoDAO;
import applicazione.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/VisualizzaProdotti")
public class VisualizzaProdotti extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("[VisualizzaProdotti] doGet chiamato");

        collegamentoDAO dao = new collegamentoDAO();
        List<Product> prodotti = null;

        try {
            prodotti = dao.getAndPrintAllProducts();

            System.out.println("[VisualizzaProdotti] Numero prodotti ricevuti dal DAO: " + (prodotti == null ? "null" : prodotti.size()));
            if (prodotti != null) {
                for (Product p : prodotti) {
                    System.out.println("[VisualizzaProdotti] Prodotto: " + p);
                }
            }

            request.setAttribute("prodotti", prodotti);
            System.out.println("[VisualizzaProdotti] Attributo 'prodotti' settato nella request");

            request.getRequestDispatcher("/home.jsp").forward(request, response);

        } catch (SQLException e) {
            System.err.println("[VisualizzaProdotti] Errore durante il recupero prodotti: " + e.getMessage());
            e.printStackTrace();

            request.setAttribute("errore", "Errore nel caricamento prodotti: " + e.getMessage());
            request.getRequestDispatcher("/home.jsp").forward(request, response);
        }
    }
}