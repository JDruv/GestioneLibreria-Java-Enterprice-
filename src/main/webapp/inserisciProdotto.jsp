<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Inserisci Prodotto</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap + Animate.css + FontAwesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #283c86, #45a247);
            color: #fff;
            min-height: 100vh;
            margin: 0;
            padding-top: 70px;
        }
        .navbar {
            background-color: rgba(0, 0, 0, 0.6);
            backdrop-filter: blur(10px);
        }
        .form-container {
            background: rgba(255, 255, 255, 0.08);
            backdrop-filter: blur(10px);
            max-width: 500px;
            margin: 40px auto;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 8px 32px rgba(0,0,0,0.37);
            color: white;
        }
        input[type="text"], input[type="number"] {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 10px;
            margin-top: 15px;
            background: #eef2f7;
            color: #333;
            font-size: 1rem;
        }
        .btn-submit {
            background-color: #11998e;
            color: white;
            padding: 12px;
            border: none;
            width: 100%;
            border-radius: 10px;
            font-weight: 700;
            margin-top: 25px;
            transition: background-color 0.3s ease;
        }
        .btn-submit:hover {
            background-color: #38ef7d;
        }
        .alert {
            margin-top: 10px;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark fixed-top shadow animate__animated animate__fadeInDown">
    <div class="container">
        <a class="navbar-brand d-flex align-items-center" href="home.jsp">
            <i class="fas fa-box me-2"></i> Gestione Prodotti
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto text-uppercase fw-semibold">
                <li class="nav-item"><a class="nav-link" href="home.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Modifica</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Rimuovi</a></li>
                <li class="nav-item"><a class="nav-link active" href="inserisciProdotto.jsp">Inserisci</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="form-container animate__animated animate__fadeInUp">
    <h2 class="text-center mb-4">Inserisci un nuovo prodotto</h2>

    <% String errorMessage = (String) request.getAttribute("errorMessage");
       if (errorMessage != null) { %>
        <div class="alert alert-danger" role="alert"><%= errorMessage %></div>
    <% } %>

    <form action="inserisciProdotto" method="post">
        <input type="text" name="name" placeholder="Nome prodotto" required>
        <input type="text" name="brand" placeholder="Marca" required>
        <input type="text" name="madein" placeholder="Made in..." required>
        <input type="number" step="0.01" name="price" placeholder="Prezzo (€)" required>
        <button type="submit" class="btn-submit">Inserisci</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
