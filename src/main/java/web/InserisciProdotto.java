package web;

import applicazione.Product;
import applicazione.collegamentoDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/inserisciProdotto")
public class InserisciProdotto extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private collegamentoDAO dao;

    @Override
    public void init() throws ServletException {
        dao = new collegamentoDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Recupera dati dal form
        String name = request.getParameter("name");
        String brand = request.getParameter("brand");
        String madein = request.getParameter("madein");
        String priceStr = request.getParameter("price");

        float price;
        try {
            price = Float.parseFloat(priceStr);
        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Prezzo non valido.");
            request.getRequestDispatcher("inserisciProdotto.jsp").forward(request, response);
            return;
        }

        Product prodotto = new Product(name, brand, madein, price);

        boolean successo = dao.inserisciProdotto(prodotto);

        if (successo) {
            // Inserimento OK, redirect alla lista prodotti
            response.sendRedirect("VisualizzaProdotti");
        } else {
            // Inserimento fallito, mostra errore
            request.setAttribute("errorMessage", "Errore durante l'inserimento del prodotto.");
            request.getRequestDispatcher("inserisciProdotto.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Reindirizza al JSP di inserimento se accedi con GET
        request.getRequestDispatcher("inserisciProdotto.jsp").forward(request, response);
    }
}
