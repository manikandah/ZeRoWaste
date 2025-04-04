<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Recipient - Register</title>
        <link rel="short icon" href="logo2.png" type="image/x-icon">
        <style>
            body {
                font-family: 'Poppins', sans-serif;
                background: radial-gradient(circle, #ffecd2, #fcb69f);
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .container {
                background: #fff;
                width: 450px;
                padding: 40px 30px;
                border-radius: 20px;
                box-shadow: 0 12px 30px rgba(0, 0, 0, 0.1);
                text-align: center;
                caret-color: transparent;
                user-select: none;
            }
            h2 {
                color: #ff6600;
                margin-bottom: 12px;
                font-size: 30px;
            }
            h3 {
                color: #ff6600;
                margin-bottom: 25px;
                font-weight: normal;
            }
            form input, form select {
                width: 90%;
                padding: 12px;
                margin: 8px 0;
                border: 1px solid #ccc;
                border-radius: 10px;
                font-size: 14px;
                transition: all 0.3s;
            }
            form input:focus, form select:focus {
                border-color: #ff6600;
                outline: none;
                box-shadow: 0 0 5px rgba(255, 102, 0, 0.4);
            }
            .phone-input {
                display: flex;
                justify-content: center;
                gap: 5px;
                margin-bottom: 10px;
                padding-left: 10px;
                padding-right: 10px;
            }
            .phone-input select {
                width: 25%;
            }
            .phone-input input {
                width: 77%;
            }
            input[type="submit"] {
                width: 60%;
                background: linear-gradient(45deg, #ff6600, #ff9933);
                color: white;
                border: none;
                padding: 12px;
                margin-top: 15px;
                border-radius: 10px;
                cursor: pointer;
                font-size: 16px;
                transition: all 0.3s;
            }
            input[type="submit"]:hover {
                background: linear-gradient(45deg, #28a745, #42d47a);
            }
            .thank-message {
                margin-top: 30px;
                color: #555;
                font-size: 16px;
            }
            .heart {
                font-size: 32px;
                color: red;
                animation: beat 1s infinite;
                margin-top: 10px;
            }
            @keyframes beat {
                0%, 100% {
                    transform: scale(1);
                }
                50% {
                    transform: scale(1.3);
                }
            }
            .error-message {
                color: red;
                font-size: 13px;
                margin-bottom: 10px;
            }
            .login-link {
                display: block;
                margin-top: 20px;
                color: #ff6600;
                text-decoration: none;
                font-weight: bold;
                transition: color 0.3s;
            }
            .login-link:hover {
                color: #28a745;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Join ZeRo Waste Organization</h2>
            <h3>Recipient Registration</h3>
            <form id="registrationForm" action="recipientservleturl" method="post" >
                <input type="hidden" name="action" value="register">
                <input type="text" name="name" placeholder="Organization Name" required>
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
                <input type="text" name="quantity" placeholder="Number of Beneficiary" required>
                <input type="password" id="password1" name="password1" placeholder="Password" required>
                <input type="password" id="password2" name="password2" placeholder="Confirm Password" required>
                <div id="passwordError" class="error-message"></div>
                <input type="submit" value="Register">
            </form>
            <div class="thank-message">
                Thank you for registering as a food recipient and supporting the fight against food waste!<br>


            </div>

            <script>
                function validatePasswords() {
                    const pass1 = document.getElementById('password1').value;
                    const pass2 = document.getElementById('password2').value;
                    const errorDiv = document.getElementById('passwordError');

                    if (pass1 !== pass2) {
                        errorDiv.textContent = "Passwords do not match. Please re-enter.";
                        return false;
                    } else if (pass1.length < 6) {
                        errorDiv.textContent = "Password must be at least 6 characters long.";
                        return false;
                    } else {
                        errorDiv.textContent = "";
                        return true;
                    }
                }
            </script>
    </body>
</html>
