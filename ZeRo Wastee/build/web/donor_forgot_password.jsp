<%-- 
    Document   : donor_forgot_password
    Created on : 01-Apr-2025, 6:59:56 pm
    Author     : Manikandan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ZeRo Waste-Login</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <link rel="short icon" href="logo2.png" type="image/x-icon">
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #f7ffe0, #b4f0c0, #98e8fc);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(12px);
            padding: 50px 40px;
            border-radius: 20px;
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.2);
            width: 350px;
            text-align: center;
            animation: fadeIn 1.2s ease forwards;
            transform: translateY(40px);
            opacity: 0;
        }

        @keyframes fadeIn {
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        h1 {
            color: #ff5722;
            margin-bottom: 30px;
            font-size: 32px;
            letter-spacing: 1px;
        }

        form input {
            width: 100%;
            padding: 12px;
            margin: 12px 0;
            border: 1px solid #ccc;
            border-radius: 12px;
            font-size: 15px;
            transition: 0.3s;
        }

        form input:focus {
            border-color: #ff9800;
            box-shadow: 0 0 10px rgba(255, 152, 0, 0.4);
            outline: none;
        }

        button {
            width:90%;
            padding: 14px;
            margin-top: 20px;
            background: linear-gradient(135deg, #ff5722, #ff9800);
            border: none;
            border-radius: 14px;
            color: white;
            font-size: 17px;
            cursor: pointer;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        button:hover {
            transform: scale(1.05);
            box-shadow: 0 15px 30px rgba(255, 87, 34, 0.4);
        }

        .forgot-password {
            display: block;
            margin-top: 5px;
            margin-bottom: 20px;
            font-size: 13px;
            color: #555;
            text-decoration: none;
            text-align: right;
        }

        .forgot-password:hover {
            color: #ff5722;
        }

        .login-link {
            display: inline-block;
            margin-top: 18px;
            font-size: 14px;
            color: #444;
            text-decoration: none;
            transition: color 0.3s;
        }

        .login-link:hover {
            color: #ff9800;
        }

        .bubbles span {
            position: absolute;
            bottom: -150px;
            width: 25px;
            height: 25px;
            background: rgba(255, 255, 255, 0.3);
            border-radius: 50%;
            animation: bubbleUp 20s linear infinite;
        }

        @keyframes bubbleUp {
            0% {
                transform: translateY(0) scale(1);
                opacity: 1;
            }
            100% {
                transform: translateY(-1200px) scale(0.4);
                opacity: 0;
            }
        }

        .bubbles span:nth-child(1) { left: 15%; animation-delay: 0s; }
        .bubbles span:nth-child(2) { left: 30%; animation-delay: 2s; }
        .bubbles span:nth-child(3) { left: 45%; animation-delay: 4s; }
        .bubbles span:nth-child(4) { left: 60%; animation-delay: 6s; }
        .bubbles span:nth-child(5) { left: 75%; animation-delay: 8s; }

        @media (max-width: 450px) {
            .login-container {
                width: 90%;
                padding: 35px 25px;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h1>ZeRo Waste : Donar </h1>
        <h5> Enter the Registered email id and new password</h5>
        <form action="donorservleturl" method="post">
            <input type="hidden" name="action" value="forgot_password">
            <input type="email" name="email" placeholder="Email Address" required>
            <input type="password" name="password" placeholder="Password" required>
            
            <button type="submit">SAVE</button>
            
        </form>
    </div>
    <div class="bubbles">
        <span></span><span></span><span></span><span></span><span></span>
    </div>
</body>
</html>
