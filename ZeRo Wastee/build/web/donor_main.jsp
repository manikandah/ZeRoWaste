<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ZeRo Waste - Find Food Recipient</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="short icon" href="logo2.png" type="image/x-icon">
        <style>
            body {
                margin: 0;
                font-family: 'Poppins', sans-serif;
                background: linear-gradient(135deg, rgba(0,0,0,0.6), rgba(0,0,0,0.7)), url('./do_user.webp') no-repeat center center/cover;
                min-height: 100vh;
                overflow-x: hidden;
                color: #fff;
            }
            header {
                position: fixed;
                top: 0;
                width: 100%;
                padding: 20px 40px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                transition: top 0.3s;
                z-index: 1000;
                background: transparent; /* removed background blur or color */
            }
            header h1 {
                font-size: 36px;
                font-weight: 700;
                color: #ff5722;
                animation: slideDown 1s ease;
            }
            @keyframes slideDown {
                from {
                    opacity: 0;
                    transform: translateY(-30px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
            header nav .btn-primary {
                background-color: #ff5722;
                border: none;
                transition: 0.3s;
            }
            header nav .btn-primary:hover {
                background-color: #ff9800;
                transform: scale(1.05);
            }
            main {
                display: flex;
                justify-content: center;
                align-items: center;
                padding-top: 150px;
                padding-bottom: 60px;
            }
            .container {
                background: rgba(255, 255, 255, 0.12);
                backdrop-filter: blur(25px);
                padding: 40px;
                border-radius: 25px;
                box-shadow: 0 25px 60px rgba(0, 0, 0, 0.4);
                width: 100%;
                max-width: 550px;
                text-align: center;
                animation: fadeInUp 1s ease;
            }
            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(40px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
            h2 {
                color: #ff5722;
                font-size: 32px;
                margin-bottom: 10px;
            }
            h4 {
                color: #fff;
                margin-bottom: 25px;
            }
            form input, form select, form label {
                width: 100%;
                margin-bottom: 15px;
            }
            form input[type="text"], form input[type="date"], form input[type="time"], form select {
                padding: 12px;
                border: none;
                border-radius: 12px;
                font-size: 16px;
                transition: all 0.3s;
                color: #333;
            }
            form input[type="text"]:focus, form input[type="date"]:focus, form input[type="time"]:focus, form select:focus {
                outline: none;
                box-shadow: 0 0 8px rgba(255, 152, 0, 0.7);
            }
            input[type="submit"] {
                background: linear-gradient(135deg, #ff5722, #ff9800);
                color: #fff;
                border: none;
                padding: 14px;
                border-radius: 14px;
                cursor: pointer;
                font-size: 18px;
                margin-top: 20px;
                transition: all 0.3s;
                box-shadow: 0 6px 20px rgba(255, 87, 34, 0.4);
            }
            input[type="submit"]:hover {
                transform: scale(1.05);
                box-shadow: 0 18px 45px rgba(255, 87, 34, 0.6);
            }
            .image-container {
                position: relative;
                margin-top: 10px;
            }
            .image-preview {
                width: 100%;
                max-height: 250px;
                border-radius: 10px;
                object-fit: cover;
                margin-top: 10px;
                border: 2px solid rgba(255, 255, 255, 0.2);
            }
            .reset-btn-overlay {
                position: absolute;
                top: 5px;
                right: 5px;
                background-color: rgba(0, 0, 0, 0.6);
                color: #fff;
                border: none;
                border-radius: 50%;
                width: 30px;
                height: 30px;
                cursor: pointer;
                font-weight: bold;
            }
            .bubbles span {
                position: absolute;
                width: 20px;
                height: 20px;
                background: rgba(255, 255, 255, 0.1);
                border-radius: 50%;
                animation: floatUp 25s linear infinite;
                bottom: -150px;
            }
            @keyframes floatUp {
                0% {
                    transform: translateY(0) scale(1);
                    opacity: 1;
                }
                100% {
                    transform: translateY(-1200px) scale(0.5);
                    opacity: 0;
                }
            }
            .bubbles span:nth-child(1) {
                left: 10%;
                animation-delay: 0s;
            }
            .bubbles span:nth-child(2) {
                left: 30%;
                animation-delay: 3s;
            }
            .bubbles span:nth-child(3) {
                left: 50%;
                animation-delay: 1s;
            }
            .bubbles span:nth-child(4) {
                left: 70%;
                animation-delay: 5s;
            }
            .bubbles span:nth-child(5) {
                left: 90%;
                animation-delay: 2s;
            }
            @media (max-width: 600px) {
                header h1 {
                    font-size: 28px;
                }
                .container {
                    padding: 30px 20px;
                }
            }
        </style>
    </head>
    <body>
        <header id="navbar">
            <h1>ZeRo Waste</h1>
            <nav>
                <div class="dropdown">
                    <button class="btn btn-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Menu
                    </button>
                    <ul class="dropdown-menu dropdown-menu-dark">
                        <li><a class="dropdown-item" href="donor_menu_profile.jsp">Update Profile</a></li>
                        <li><a class="dropdown-item" href="donor_menu_mydonations.jsp">My Donations</a></li>
                        <li><a class="dropdown-item" href="donor_menu_vieworganization.jsp">View Organization</a></li>
                        <li><a class="dropdown-item" href="donorfoodsafety.jsp">Food Safety Guidelines</a></li>
                        <li><a class="dropdown-item" href="donor_menu_help.jsp">Help & Support</a></li>

                        <li><a class="dropdown-item" href="index.html">Logout</a></li>
                    </ul>
                </div>
            </nav>
        </header>
        <main>
            <div class="container">
                <h2>Find Organizations</h2>
                <h4>Near You</h4>
                <form action="donorservleturl" method="post" >
                    <input type="hidden" name="action" value="donate">
                    <input type="text" name="location" placeholder="Enter Your Location" required>
                    <input type="text" name="foodtype" placeholder="Type of Food" required>
                    <input type="text" name="foodquantity" placeholder="Quantity of Food" required>
                    <label class="mt-3 mb-1">Prepared Date & Time:</label>
                    <div class="d-flex gap-2">
                        <input type="date" name="date1" required>
                        <input type="time" name="time1" required>
                    </div>
                    
                    <div class="image-container" id="imageContainer" style="display: none;">
                        <button type="button" class="reset-btn-overlay" onclick="resetImage()">x</button>
                        <img id="imagePreview" class="image-preview" alt="Image Preview"/>
                    </div>
                    <input type="submit" value="Donate">
                </form>
            </div>
        </main>
        <div class="bubbles">
            <span></span><span></span><span></span><span></span><span></span>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                            let prevScrollpos = window.pageYOffset;
                            window.addEventListener("scroll", function () {
                                let currentScrollPos = window.pageYOffset;
                                const navbar = document.getElementById("navbar");
                                navbar.style.top = (prevScrollpos > currentScrollPos) ? "0" : "-120px";
                                prevScrollpos = currentScrollPos;
                            });

                            function previewImage(event) {
                                const reader = new FileReader();
                                reader.onload = function () {
                                    document.getElementById('imagePreview').src = reader.result;
                                    document.getElementById('imageContainer').style.display = 'block';
                                };
                                reader.readAsDataURL(event.target.files[0]);
                            }

                            function resetImage() {
                                document.getElementById('imageInput').value = '';
                                document.getElementById('imageContainer').style.display = 'none';
                            }
        </script>
    </body>
</html>
