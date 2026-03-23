package web;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/gestioneLogin")
public class gestioneLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public gestioneLogin() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("[gestioneLogin] Action richiesta: " + action);

        if ("login".equals(action)) {
            gestisciLogin(request, response);
        } else if ("register".equals(action)) {
            gestisciRegistrazione(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Azione non valida");
        }
    }

    private void gestisciLogin(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println("[gestioneLogin] Tentativo login per utente: " + username);

        HttpSession session = request.getSession(false);
        if (session == null) {
            session = request.getSession(true);
        }

        String userRegistrato = (String) session.getAttribute("username");
        String passRegistrata = (String) session.getAttribute("password");

        if (userRegistrato == null || passRegistrata == null ||
            !username.equals(userRegistrato) || !password.equals(passRegistrata)) {

            System.out.println("[gestioneLogin] Credenziali non valide o utente non registrato");
            request.setAttribute("error", "Credenziali non valide o utente non registrato.");
            request.getRequestDispatcher("errore.jsp").forward(request, response);
            return;
        }

        session.setAttribute("username", username);
        response.sendRedirect("VisualizzaProdotti");
    }

    private void gestisciRegistrazione(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");

        System.out.println("[gestioneLogin] Registrazione utente: " + username + ", email: " + email);

        HttpSession session = request.getSession(true);
        session.setAttribute("username", username);
        session.setAttribute("password", password);
        session.setAttribute("email", email);

        response.sendRedirect("VisualizzaProdotti");
    }
}
