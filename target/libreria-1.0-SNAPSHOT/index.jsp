<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>The Forest of Words</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            background: url('./img/wall_forest.png') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Inter', sans-serif;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            overflow: hidden;
        }

        main {
            flex: 1;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: white;
            padding: 40px;
            position: relative;
            z-index: 2;
        }

        .book-opening {
            position: absolute;
            top: 0;
            left: 0;
            width: 100vw;
            height: 100vh;
            background: rgba(0,0,0,0.3);
            backdrop-filter: blur(1px);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 1;
        }

        .book-cover {
            width: 90%;
            max-width: 1000px;
            height: 90vh;
            background: linear-gradient(to right, #e8d4b0 49.5%, #d4bb9c 50.5%);
            border: 6px solid #3f2a18;
            border-radius: 12px;
            box-shadow: 0 0 60px rgba(0, 0, 0, 0.4);
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            animation: openBook 2.2s ease forwards;
        }
        .main-title {
            font-family: 'Playfair Display', serif;
            font-size: 64px;
            margin: 0;
            letter-spacing: 4px;
            text-shadow: 2px 2px 6px rgba(0,0,0,0.7);
            color: #4b2e1e;
        }

        .subtitle {
            font-family: 'Playfair Display', serif;
            font-size: 48px;
            margin: 10px 0 30px;
            letter-spacing: 6px;
            text-shadow: 2px 2px 6px rgba(0,0,0,0.7);
            color: #6b422f;
        }

        .btn a {
            background-color: #6b422f;
            color: #fff;
            padding: 14px 40px;
            border: none;
            border-radius: 30px;
            font-weight: 600;
            font-size: 18px;
            text-decoration: none;
            transition: all 0.3s ease;
            box-shadow: 0 8px 20px rgba(0,0,0,0.3);
        }

        .btn a:hover {
            background-color: #4b2e1e;
            transform: scale(1.05);
        }

        .footer {
            background-color: rgba(0,0,0,0.5);
            color: white;
            text-align: center;
            padding: 10px;
            font-size: 14px;
            z-index: 3;
            position: relative;
            margin-top: auto;
        }

        @media (max-width: 768px) {
            .main-title {
                font-size: 40px;
            }
            .subtitle {
                font-size: 30px;
            }
            .btn a {
                padding: 12px 24px; 
                font-size: 15px;
            }
        }
    </style>
</head>
<body>
    <div class="book-opening">
        <div class="book-cover">
            <main>
                <h1 class="main-title">THE FOREST OF</h1>
                <h2 class="subtitle">WORDS</h2>
                <button class="btn"><a href="index1.jsp">INGRESAR</a></button>
            </main>
        </div>
    </div>
    <footer class="footer">
        <div>Copyright &copy; Sara Aldaz & Katherin Delgado</div>
    </footer>
</body>
</html>