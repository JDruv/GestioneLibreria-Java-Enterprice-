<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <title>Errore - SocialAI</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap + Font Awesome -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #283c86, #45a247);
            color: #fff;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
        }

        .container {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
            text-align: center;
        }

        h2 {
            font-weight: 700;
            margin-bottom: 20px;
            text-shadow: 1px 1px 4px rgba(0,0,0,0.5);
        }

        p.error-msg {
            color: #ff6b6b;
            font-weight: 600;
            font-size: 1.2rem;
            margin-bottom: 30px;
            text-shadow: 1px 1px 3px rgba(0,0,0,0.4);
        }

        a.btn-return {
            text-decoration: none;
            background-color: #ff6b6b;
            color: white;
            padding: 10px 25px;
            border-radius: 25px;
            font-weight: 600;
            transition: background-color 0.3s ease;
            box-shadow: 0 4px 10px rgba(255, 107, 107, 0.6);
        }
        a.btn-return:hover {
            background-color: #e04e4e;
            color: #fff;
            text-decoration: none;
        }

        footer {
            text-align: center;
            padding: 15px 0;
            background-color: rgba(0, 0, 0, 0.3);
            font-size: 0.9em;
            color: #eee;
        }
    </style>
</head>
<body>

<div class="container">
    <h2><i class="fas fa-exclamation-triangle me-2"></i>Si è verificato un errore</h2>
    <p class="error-msg"><%= request.getAttribute("error") != null ? request.getAttribute("error") : "Errore sconosciuto." %></p>
    <a href="index.jsp" class="btn-return"><i class="fas fa-arrow-left me-1"></i> Torna al login</a>
</div>

<footer>
    &copy; 2025 SocialAI - Tutti i diritti riservati.
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
