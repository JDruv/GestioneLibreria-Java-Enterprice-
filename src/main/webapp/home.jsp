<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="applicazione.Product" %>
<%
    HttpSession sessione = request.getSession(false);
    String username = (sessione != null) ? (String) sessione.getAttribute("username") : null;
    List<Product> prodotti = (List<Product>) request.getAttribute("prodotti");
%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Home - SocialAI</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap + Font Awesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #283c86, #45a247);
            color: #fff;
        }

        .navbar {
            background-color: rgba(0, 0, 0, 0.6);
            backdrop-filter: blur(10px);
        }

        .hero-section {
            padding: 80px 20px 40px;
            text-align: center;
        }

        .table-container {
            background: rgba(255, 255, 255, 0.08);
            padding: 30px;
            border-radius: 15px;
            margin-top: 30px;
            color: white;
        }

        .table th, .table td {
            color: #fff;
        }

        .btn-action {
            margin-right: 5px;
        }

        .footer {
            text-align: center;
            padding: 30px 0;
            color: #eee;
            font-size: 0.9em;
            background-color: rgba(0, 0, 0, 0.3);
            margin-top: 50px;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="#"><i class="fas fa-network-wired me-2"></i>DruvDB</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto text-uppercase fw-semibold">
                <li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="VisualizzaProdotti">Visualizza Prodotti</a></li>
                <li class="nav-item"><a class="nav-link" href="inserisciProdotto.jsp">Inserisci un Prodotto</a></li>
                <li class="nav-item"><a class="nav-link" href="index.jsp"><i class="fas fa-sign-out-alt me-1"></i>Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Contenuto Principale -->
<section class="hero-section">
    <div class="container">
        <h1>Benvenuto <%= username != null ? username : "ospite" %></h1>
        <p>
            Gestisci i tuoi prodotti in modo semplice. Puoi visualizzarli o eliminarli dal sistema.
        </p>
<div class="mb-3 text-start">
    <input type="text" id="searchInput" class="form-control" placeholder="Cerca prodotto, marca o made in...">
</div>

        <div class="table-container">
            <h3 class="mb-4"><i class="fas fa-box-open me-2"></i>Lista Prodotti</h3>

            <% if (prodotti != null && !prodotti.isEmpty()) { %>
                <table class="table table-hover table-bordered table-dark align-middle">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nome</th>
                            <th>Marca</th>
                            <th>Made In</th>
                            <th>Prezzo (€)</th>
                            <th>Azioni</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Product p : prodotti) { %>
                            <tr>
                                <td><%= p.getId() %></td>
                                <td><%= p.getName() %></td>
                                <td><%= p.getBrand() %></td>
                                <td><%= p.getMadein() %></td>
                                <td><%= String.format("%.2f", p.getPrice()) %></td>
                                <td>
                                    <form style="display:inline;" action="EliminaProdotto" method="post" onsubmit="return confirm('Sei sicuro di voler eliminare questo prodotto?');">
                                        <input type="hidden" name="id" value="<%= p.getId() %>"/>
                                        <button type="submit" class="btn btn-sm btn-danger btn-action">
                                            <i class="fas fa-trash-alt"></i> Elimina
                                        </button>
                                    </form>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            <% } else { %>
                <p>Nessun prodotto da mostrare.</p>
            <% } %>
        </div>
    </div>
</section>
<script>
    const searchInput = document.getElementById('searchInput');
    const table = document.querySelector('.table tbody');

    searchInput.addEventListener('input', function() {
        const filter = this.value.toLowerCase();
        const rows = table.getElementsByTagName('tr');

        for (let row of rows) {
            const name = row.cells[1].textContent.toLowerCase();
            const brand = row.cells[2].textContent.toLowerCase();
            const madein = row.cells[3].textContent.toLowerCase();

            if (name.includes(filter) || brand.includes(filter) || madein.includes(filter)) {
                row.style.display = '';
            } else {
                row.style.display = 'none';
            }
        }
    });
</script>

<!-- Footer -->
<div class="footer">
    &copy; 2025 SocialAI - Tutti i diritti riservati.
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
