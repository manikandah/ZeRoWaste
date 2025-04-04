<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Registration Success</title>
  <link rel="short icon" href="logo2.png" type="image/x-icon">
  <style>
    body {
      font-family: Arial, sans-serif;
      background: linear-gradient(135deg, #f9d423, #ff4e50);
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }
    .success-container {
      background: #ffffff;
      padding: 40px;
      border-radius: 20px;
      box-shadow: 0 8px 30px rgba(0, 0, 0, 0.1);
      text-align: center;
      width: 400px;
    }
    h1 {
      color: #28a745;
      font-size: 32px;
      margin-bottom: 10px;
    }
    p {
      color: #555;
      font-size: 18px;
      margin-bottom: 30px;
    }
    .heart {
      font-size: 50px;
      color: red;
      animation: pulse 1s infinite;
    }
    @keyframes pulse {
      0% { transform: scale(1); }
      50% { transform: scale(1.2); }
      100% { transform: scale(1); }
    }
    a {
      display: inline-block;
      margin-top: 20px;
      padding: 10px 20px;
      background-color: #28a745;
      color: #fff;
      border-radius: 8px;
      text-decoration: none;
      transition: background-color 0.3s;
    }
    a:hover {
      background-color: #218838;
    }
  </style>
</head>
<body>
  <div class="success-container">
    
    <h1>Registration Successful!</h1>
    <p>Thank you for joining our food-sharing community. Together, we make a difference!</p>
    <a href="fooddonor.jsp">Back to Login</a>