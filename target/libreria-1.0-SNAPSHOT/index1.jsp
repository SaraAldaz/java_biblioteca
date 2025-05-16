<%@page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Biblioteca: El Árbol de las Palabras</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            font-family: 'Inter', sans-serif;
            background: url('./img/wall_forest.png') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            flex-direction: column;
            height: 100vh;
        }

        header {
            background: rgba(255, 255, 255, 0.95);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .logo {
            height: 100px;
            filter: drop-shadow(2px 4px 6px rgba(0,0,0,0.4));
        }

        main {
            flex-grow: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .buttons-container {
            display: flex;
            gap: 80px;
            flex-wrap: wrap;
            justify-content: center;
            padding: 20px;
        }

        .icon-button {
            background: rgba(255, 255, 255, 0.85);
            border-radius: 20px;
            padding: 25px;
            width: 170px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            cursor: pointer;
            perspective: 1000px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .icon-button:hover {
            transform: rotateY(8deg) scale(1.05);
            background-color: #fff;
            box-shadow: 0 14px 28px rgba(0,0,0,0.3);
        }

        .icon-button img {
            width: 110px;
            height: 110px;
            border-radius: 15px;
            margin-bottom: 10px;
        }

        .icon-label {
            font-size: 18px;
            font-weight: 700;
            color: #3c2b1e;
        }

        a {
            text-decoration: none;
            color: inherit;
        }

        footer {
            background: rgba(0, 0, 0, 0.7);
            color: #fff;
            text-align: center;
            padding: 15px;
            font-size: 14px;
            letter-spacing: 1px;
        }

        @media (max-width: 768px) {
            .logo {
                height: 70px;
            }

            .buttons-container {
                flex-direction: column;
                gap: 30px;
            }

            .icon-button {
                width: 200px;
            }
        }
    </style>
</head>
<body>

    <header>
        <img src="img/lo.png" alt="Logo Biblioteca" class="logo">
    </header>

    <main>
        <div class="buttons-container">
            <a href="./libros.jsp">
            <div class="icon-button" onclick="accionBoton('libros')">
                <img src="img/boton_1.png" alt="Libros">
                <div class="icon-label">Libros</div>
            </div>
            </a>
            <a href="./crud.jsp">
                <div class="icon-button">
                    <img src="img/boton_2.png" alt="Lectores">
                    <div class="icon-label">Lectores</div>
                </div>
            </a>

            <a href="./login.jsp">
                <div class="icon-button">
                    <img src="img/boton_4.png" alt="Administrador">
                    <div class="icon-label">Administrador</div>
                </div>
            </a>
        </div>
    </main>

    <footer>
        Creado por: Sara Aldaz & Katherin Delgado &copy; 2025
    </footer>

</body>
</html>
