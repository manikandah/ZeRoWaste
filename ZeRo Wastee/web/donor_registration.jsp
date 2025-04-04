<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Donor - Register</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
        <link rel="short icon" href="logo2.png" type="image/x-icon">
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: 'Poppins', sans-serif;
                background: linear-gradient(135deg, #d0f0c0, #98e8fc);
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }

            .container {
                background: rgba(255, 255, 255, 0.85);
                backdrop-filter: blur(12px);
                padding: 45px 35px;
                border-radius: 16px;
                box-shadow: 0 15px 40px rgba(0, 0, 0, 0.2);
                width: 420px;
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

            h2 {
                color: #ff5722;
                margin-bottom: 20px;
                font-size: 27px;
            }
            h3 {
                color: #ff5722;
                margin-bottom: 20px;
                font-size: 20px;
            }

            form input, form select {
                width: 90%;
                padding: 12px;
                margin: 10px 0;
                border: 1px solid #ccc;
                border-radius: 8px;
                font-size: 15px;
                transition: border-color 0.3s;
            }

            form input:focus, form select:focus {
                border-color: #ff9800;
                box-shadow: 0 0 10px rgba(255, 152, 0, 0.4);
                outline: none;
            }

            .phone-input {
                display: flex;
                gap: 5px;
                align-items: center;
                justify-content: center;
                margin-left: 7px;
                margin-right: 7px


            }

            .phone-input {
                display: flex;
                justify-content: center;
                gap: 5px;
                margin-bottom: 10px;
               
            }
            .phone-input select {
                width: 35%;
            }
            .phone-input input {
                width: 87%;
            }

            .password-container {
                position: relative;
            }

            .toggle-password {
                position: absolute;
                right: 10px;
                top: 50%;
                transform: translateY(-50%);
                cursor: pointer;
                font-size: 18px;
                color: #888;
            }

            .password-error {
                color: red;
                font-size: 13px;
                margin-bottom: 5px;
                display: none;
            }

            input[type="submit"] {
                width: 70%;
                padding: 14px;
                background: linear-gradient(135deg, #2ecc71, #7cfc00);
                color: white;
                border: none;
                border-radius: 10px;
                font-size: 17px;
                cursor: pointer;
                transition: transform 0.3s, box-shadow 0.3s;
            }

            input[type="submit"]:hover {
                transform: scale(1.05);
                box-shadow: 0 15px 30px rgba(46, 204, 113, 0.4);
            }

            .donation-message {
                margin-top: 20px;
                color: #444;
                font-size: 14px;
            }

            .login-link {
                display: block;
                margin-top: 15px;
                color: #ff5722;
                text-decoration: none;
                font-weight: bold;
                transition: color 0.3s;
            }

            .login-link:hover {
                color: #28a745;
            }

            @media (max-width: 450px) {
                .container {
                    width: 90%;
                    padding: 35px 25px;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Join ZeRo Waste Organization</h2>
            <h3>Donor Registration</h3>

            <form id="registrationForm" action="donorservleturl" method="post">
                <input type="hidden" name="action" value="register">
                <input type="text" name="name" placeholder="Full Name" required>

                <div class="phone-input">
                    <select name="countryCode" required>
                        <option value="+1">+1 (US)</option>
                        <option value="+44">+44 (UK)</option>
                        <option value="+91" selected>+91 (IN)</option>
                        <option value="+61">+61 (AU)</option>
                    </select>
                    <input type="tel" name="phone" placeholder="Phone Number" required>
                </div>

                <input type="email" name="email" placeholder="Email Address" required>
                <input type="text" name="address" placeholder="Address" required>

                <div class="password-container">
                    <input type="password" id="password1" name="password1" placeholder="Password" required>
                    <span class="toggle-password" onclick="togglePassword('password1')"></span>
                </div>

                <div class="password-container">
                    <input type="password" id="password2" name="password2" placeholder="Confirm Password" required>
                    <span class="toggle-password" onclick="togglePassword('password2')"></span>
                </div>

                <div class="password-error" id="passwordError">Passwords do not match!</div>

                <input type="submit" value="Sign Up">
            </form>

            <div class="donation-message">
                Thank you for joining our mission to reduce food waste and help communities!
            </div>
            

        </div>

        <script>
            function togglePassword(id) {
                const passwordField = document.getElementById(id);
                passwordField.type = passwordField.type === "password" ? "text" : "password";
            }

            document.getElementById("registrationForm").addEventListener("submit", function (event) {
                const password1 = document.getElementById("password1").value;
                const password2 = document.getElementById("password2").value;
                const errorMessage = document.getElementById("passwordError");

                if (password1 !== password2) {
                    event.preventDefault();
                    errorMessage.style.display = "block";
                } else {
                    errorMessage.style.display = "none";
                }
            });
        </script>
    </body>
</html> 