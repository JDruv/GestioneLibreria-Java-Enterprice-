package web;

import applicazione.collegamentoDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/EliminaProdotto") // <-- Usa "EliminaProdotto" con la E maiuscola!
public class EliminaProdotto extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        System.out.println("[EliminaProdotto] Richiesta di eliminazione per ID: " + idParam);

        if (idParam != null && !idParam.isEmpty()) {
            try {
                int id = Integer.parseInt(idParam);
                collegamentoDAO dao = new collegamentoDAO();
                dao.deleteProductById(id);
                System.out.println("[EliminaProdotto] Prodotto eliminato con successo (ID: " + id + ")");
            } catch (NumberFormatException e) {
                System.err.println("[EliminaProdotto] ID non valido: " + idParam);
            } catch (SQLException e) {
                System.err.println("[EliminaProdotto] Errore SQL: " + e.getMessage());
            }
        }

        // Reindirizza alla lista aggiornata
        response.sendRedirect("VisualizzaProdotti");
    }
}
