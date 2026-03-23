<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - My WebApp</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #1e3c72, #2a5298);
            animation: backgroundShift 10s infinite alternate;
        }

        @keyframes backgroundShift {
            0% { background-position: left; }
            100% { background-position: right; }
        }

        .login-container {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            border-radius: 15px;
            padding: 40px;
            width: 350px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.2);
            animation: fadeIn 1s ease-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.95); }
            to { opacity: 1; transform: scale(1); }
        }

        .login-container h2 {
            text-align: center;
            color: #fff;
            margin-bottom: 20px;
        }

        .login-container input {
            width: 100%;
            padding: 12px 15px;
            margin: 10px 0;
            border: none;
            border-radius: 10px;
            outline: none;
            transition: 0.3s;
        }

        .login-container input:focus {
            background-color: #eef2f7;
        }

        .login-container button {
            width: 100%;
            padding: 12px;
            margin-top: 20px;
            background: #4facfe;
            border: none;
            border-radius: 10px;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s;
        }

        .login-container button:hover {
            background: #00f2fe;
        }

        .login-container .register-link {
            margin-top: 15px;
            text-align: center;
            color: #eee;
            font-size: 0.9em;
        }

        .login-container .register-link a {
            color: #fff;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Accesso Utente</h2>
        <form action="${pageContext.request.contextPath}/gestioneLogin" method="post">
    <input type="hidden" name="action" value="login">
    <label>Username: <input type="text" name="username" required></label><br><br>
    <label>Password: <input type="password" name="password" required></label><br><br>
    <input type="submit" value="Accedi">
</form>
        <div class="register-link">
            Non hai un account? <a href="registrati.jsp">Registrati</a>
        </div>
    </div>
</body>
</html>
