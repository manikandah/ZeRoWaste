<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recipient - Login</title>
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
            flex-direction: column;
            justify-content: center;
            align-items: center;
            overflow: hidden;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(12px);
            padding: 30px 40px;
            border-radius: 20px;
            box-shadow: 0 25px 60px rgba(0, 0, 0, 0.2);
            width: 350px;
            text-align: center;
            animation: fadeIn 1.2s ease forwards;
            transform: translateY(40px);
            opacity: 0;
            position: relative;
            z-index: 10;
        }

        @keyframes fadeIn {
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        h1 {
            color: #ff5722;
            margin-bottom: 20px;
            font-size: 28px;
            letter-spacing: 1px;
        }
        p {



                  
                font-size: 30px;
                text-align: center;
                color: linear-gradient(135deg, #ff5722, #ff9800);
                margin-bottom: 10px;
                margin-right: 20px;
                font-weight: bold;
                animation: fadeIn 1.2s ease forwards;
                transform: translateY(40px);
                opacity: 0
                
                 

            }

        .zero-waste {
           
            margin: 20px;
            padding: 20px;
            font-size: 80px;
            font-weight: bold;
            color: #ff5722;
            margin-bottom: 15px;
        }

        form input {
            width: 100%;
            padding: 14px;
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
            width: 100%;
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

        .bubbles {
            position: absolute;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: 1;
        }

        .bubbles span {
            position: absolute;
            bottom: -100px;
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
                transform: translateY(-100vh) scale(0.4);
                opacity: 0;
            }
        }

        @media (max-width: 450px) {
            .login-container {
                width: 90%;
                padding: 35px 25px;
            }
        }
    </style>
</head>
<body>
    <div class="bubbles">
        <span></span><span></span><span></span><span></span><span></span>
    </div>
     <div class="zero-waste">Zero Waste - Food Donation Portal <br><p> If everyone shares a little, no one will be poor</p></div>
               <div class="login-container">
       
        <h1>Recipient Login</h1>
        <form action="recipientservleturl" method="post">
            <input type="hidden" name="action" value="login">
            <input type="email" name="email" placeholder="Email Address" required>
            <input type="password" name="password" placeholder="Password" required>
            <a href="#" class="forgot-password">Forgot Password?</a>
            <button type="submit">Login</button>
            <a href="recipient_registration.jsp" class="login-link">Don't have an account? Sign up here</a>
        </form>
    </div>
</body>
</html>
