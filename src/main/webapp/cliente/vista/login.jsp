<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Iniciar Sesión</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f8f9fa; /* Fallback color */
        }

        #background-video {
            position: fixed;
            right: 0;
            bottom: 0;
            min-width: 100%;
            min-height: 100%;
            width: auto;
            height: auto;
            z-index: -100;
            background-size: cover;
            overflow: hidden;
        }

        .video-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* Adjust transparency as needed */
            z-index: -99;
        }

        .login-container {
            background-color: rgba(255, 255, 255, 0.8); /* Fondo blanco semi-transparente */
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
            z-index: 1; /* Ensure the login container is above the video */
        }

        .login-title {
            color: #333;
            margin-bottom: 30px;
            font-size: 24px;
            font-weight: 500;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-size: 16px;
            text-align: left;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }

        .form-control:focus {
            outline: none;
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        .text-center {
            display: flex;
            gap: 10px;
            justify-content: center;
        }

        .btn {
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .btn-primary {
            background-color: #007bff;
            color: white;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            background-color: #6c757d;
            color: white;
        }

        .btn-secondary:hover {
            background-color: #545b62;
        }

        .error-message {
            color: #dc3545;
            margin-top: 15px;
            font-size: 14px;
        }
    </style>
</head>

<body>
    <video autoplay loop muted id="background-video">
        <source src="${pageContext.request.contextPath}/cliente/vista/fondos/fondo.mp4" type="video/mp4">
        Tu navegador no soporta la reproducción de videos.
    </video>
    <div class="video-overlay"></div>
    <div class="login-container">
        <h2 class="login-title">Iniciar Sesión</h2>
        <form action="validar.jsp" method="post">
            <label for="usuario" class="form-label">Usuario:</label>
            <input type="text" id="usuario" name="usuario" class="form-control" required><br>

            <label for="contrasena" class="form-label">Contraseña:</label>
            <input type="password" id="contrasena" name="contrasena" class="form-control" required><br>

            <div class="text-center">
                <input type="submit" value="Iniciar Sesión" class="btn btn-primary">

            </div>
        </form>
        <%-- Puedes agregar aquí un mensaje de error si la validación falla --%>
        <% if (request.getAttribute("error") != null) { %>
            <p class="error-message"><%= request.getAttribute("error") %></p>
        <% } %>
    </div>
</body>
</html>