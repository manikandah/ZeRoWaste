<%-- 
    Document   : donor_help_support
    Created on : 28-Mar-2025, 12:58:11 pm
    Author     : Manikandan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Help & Support</title>
    <link rel="short icon" href="logo2.png" type="image/x-icon">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }
        body {
            background: linear-gradient(to right, #ff9966, #ff5e62);
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            max-width: 800px;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            animation: fadeIn 1s ease-in-out;
        }
        h1 {
            color: #ff5722;
            text-align: center;
            font-size: 28px;
            text-transform: uppercase;
            margin-bottom: 20px;
        }
        h2 {
            margin-top: 20px;
            color: #333;
            font-size: 22px;
        }
        p {
            margin: 10px 0;
            line-height: 1.8;
            font-size: 16px;
            color: #555;
        }
        .highlight {
            font-weight: bold;
            color: #ff5722;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Guidelines for Using the Zero Waste Donation Page</h1>
        <h2>Step 1: Enter Your Location</h2>
        <p>Type in your current location or the location where the food is available for pickup.</p>
        
        <h2>Step 2: Provide Food Details</h2>
        <p><span class="highlight">Type of Food:</span> Specify the kind of food you are donating (e.g., rice, vegetables, cooked meals, etc.).</p>
        <p><span class="highlight">Quantity of Food:</span> Mention how much food you are donating (e.g., number of servings, weight, or volume).</p>
        
        <h2>Step 3: Set the Prepared Date & Time</h2>
        <p>Select the date and time when the food was prepared to ensure it is still fresh and safe for consumption.</p>
        
         
        <h2>Step4 : Click the "Donate" Button</h2>
        <p>Once all details are filled in, click the <span class="highlight">"Donate"</span> button to submit your donation request.</p>
        
        <h2>Additional Options</h2>
        <p>The <span class="highlight">"Menu"</span> button at the top-right may provide more options, such as tracking your donations or learning about participating organizations.</p>
    </div>
</body>
</html>
