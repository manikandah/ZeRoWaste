<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>ZeRo Waste - Find Food Donors </title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="short icon" href="logo2.png" type="image/x-icon">
        <style>
            body {
                margin: 0;
                font-family: 'Poppins', sans-serif;
                background: linear-gradient(135deg, rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.7)), url('./re_user.webp') no-repeat center center/cover;
                min-height: 100vh;
                overflow-x: hidden;
                color: #fff;
            }
            header {
                background: transparent;
                padding: 20px 40px;
                display: flex;
                justify-content: space-between;
                align-items: center;
                position: fixed;
                top: 0;
                width: 100%;
                z-index: 1000;
                box-shadow: none;
            }


            header h1 {
                color: #ff5722;
                font-size: 36px;
                font-weight: 700;
                animation: slideDown 1s ease-out;
            }
            @keyframes slideDown {
                from {
                    opacity: 0;
                    transform: translateY(-40px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
            header nav .btn-primary {
                background-color: #ff5722;
                border: none;
                box-shadow: 0 4px 15px rgba(255, 87, 34, 0.4);
                transition: transform 0.3s;
            }
            header nav .btn-primary:hover {
                background-color: #ff9800;
                transform: scale(1.05);
            }
            main {
                display: flex;
                justify-content: center;
                align-items: center;
                padding-top: 160px;
                padding-bottom: 60px;
            }
            .container {
                background: rgba(255, 255, 255, 0.12);
                backdrop-filter: blur(30px);
                padding: 40px;
                border-radius: 25px;
                box-shadow: 0 25px 55px rgba(0, 0, 0, 0.3);
                width: 100%;
                max-width: 500px;
                text-align: center;
                animation: fadeUp 1.2s ease forwards;
            }
            @keyframes fadeUp {
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
                font-size: 30px;
                font-weight: 300;
                margin-bottom: 10px;
            }
            h4 {
                color: #fff;
                margin-bottom: 25px;
            }
            form input, form textarea, form label {
                width: 100%;
                margin-bottom: 15px;
            }
            form input[type="text"], form input[type="date"], form input[type="time"], textarea {
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 12px;
                font-size: 16px;
                transition: all 0.3s ease;
                color: #333;
            }
            form input:focus, textarea:focus {
                border-color: #ff9800;
                box-shadow: 0 0 10px rgba(255, 152, 0, 0.5);
                outline: none;
            }
            input[type="submit"] {
                background: linear-gradient(135deg, #ff5722, #ff9800);
                color: #fff;
                border: none;
                padding: 14px;
                border-radius: 14px;
                cursor: pointer;
                font-size: 18px;
                width: 100%;
                transition: all 0.3s;
                box-shadow: 0 6px 20px rgba(255, 87, 34, 0.4);
            }
            input[type="submit"]:hover {
                transform: scale(1.05);
                box-shadow: 0 18px 40px rgba(255, 87, 34, 0.6);
            }
            .geolocate-btn {
                margin-bottom: 15px;
                background-color: #2196f3;
                border: none;
                padding: 10px;
                border-radius: 10px;
                color: #fff;
                cursor: pointer;
                width: 100%;
            }
            .geolocate-btn:hover {
                background-color: #1976d2;
            }
            #countdown {
               
                font-weight: bold;
                margin-bottom: 10px;
                color: #ffeb3b;
            }
            .floating-circles span {
                position: absolute;
                width: 20px;
                height: 20px;
                background: rgba(255, 255, 255, 0.1);
                border-radius: 50%;
                animation: floatUp 30s linear infinite;
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
            .floating-circles span:nth-child(1) {
                left: 15%;
                animation-delay: 0s;
            }
            .floating-circles span:nth-child(2) {
                left: 35%;
                animation-delay: 2s;
            }
            .floating-circles span:nth-child(3) {
                left: 50%;
                animation-delay: 4s;
            }
            .floating-circles span:nth-child(4) {
                left: 70%;
                animation-delay: 6s;
            }
            .floating-circles span:nth-child(5) {
                left: 90%;
                animation-delay: 8s;
            }
            @media (max-width: 600px) {
                header h1 {
                    font-size: 30px;
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
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="recipient_menu_profile.jsp">Update Profile</a></li>
                        <li><a class="dropdown-item" href="recipient_menu_requeststatus.jsp">Request Status</a></li>
                        
                        <li><a class="dropdown-item" href="recipient_menu_donorlist.jsp">Donor List & Details</a></li>
                        <li><a class="dropdown-item" href="recipient_menu_help.jsp">Help & Support</a></li>
                        <li><a class="dropdown-item" href="index.html">Logout</a></li>
                    </ul>
                </div>
            </nav>
        </header>
        <main>
            <div class="container">
                <h2>Receive Food from Donors</h2>
                <h4>Fill Delivery Preferences</h4>
                <form action="recipient_main_donorlist.jsp" method="" onsupostbmit="showThankYou(event)">
                    <input type="text" id="location" name="location" placeholder="Your Location" required>
                    <input type="text" name="quantityoffoodneeded" placeholder="Quantity of Food Needed" required>
                    <label>Preferred Date & Time</label>
                    <div class="d-flex gap-2">
                        <input type="date" id="receivedDate" name="receivedDate" required>
                        <input type="time" id="receivedTime" name="receivedTime" required>
                    </div>
                    <div id="countdown"></div>
                    <input type="submit" value="Find Donors">
                </form>
            </div>
        </main>
        <div class="floating-circles">
            <span></span><span></span><span></span><span></span><span></span>
        </div>

        <!-- Thank you modal -->
        <div class="modal fade" id="thankYouModal" tabindex="-1" aria-labelledby="thankYouModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content" style="background: linear-gradient(135deg, #ff5722, #ff9800); color: white;">
                    <div class="modal-header">
                        <h5 class="modal-title" id="thankYouModalLabel">Thank You!</h5>
                    </div>
                    <div class="modal-body">
                        Your request has been submitted successfully. A donor will be matched soon.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-light" data-bs-dismiss="modal">Close</button>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            let prevScrollpos = window.pageYOffset;
            window.addEventListener("scroll", function () {
                const navbar = document.getElementById("navbar");
                let currentScrollPos = window.pageYOffset;
                navbar.style.top = (prevScrollpos > currentScrollPos) ? "0" : "-100px";
                prevScrollpos = currentScrollPos;
            });

            function getLocation() {
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition((position) => {
                        document.getElementById('location').value = `Lat: ${position.coords.latitude.toFixed(4)}, Lng: ${position.coords.longitude.toFixed(4)}`;
                    });
                } else {
                    alert("Geolocation not supported.");
                }
            }

            function updateCountdown() {
                const date = document.getElementById("receivedDate").value;
                const time = document.getElementById("receivedTime").value;
                if (date && time) {
                    const countdownDate = new Date(`${date}T${time}`).getTime();
                                const now = new Date().getTime();
                                const diff = countdownDate - now;
                                if (diff > 0) {
                                    const hrs = Math.floor((diff / (1000 * 60 * 60)) % 24);
                                    const mins = Math.floor((diff / (1000 * 60)) % 60);
                                    const secs = Math.floor((diff / 1000) % 60);
                                    document.getElementById("countdown").innerText = `Time left: ${hrs}h ${mins}m ${secs}s`;
                                } else {
                                    document.getElementById("countdown").innerText = "Time has passed!";
                                }
                            }
                        }
                        setInterval(updateCountdown, 1000);

                        function showThankYou(event) {
                            event.preventDefault();
                            const modal = new bootstrap.Modal(document.getElementById('thankYouModal'));
                            modal.show();
                            setTimeout(() => {
                                event.target.submit();
                            }, 2500);
                        }
        </script>
    </body>
</html>
