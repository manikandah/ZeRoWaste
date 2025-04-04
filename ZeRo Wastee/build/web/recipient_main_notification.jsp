<%-- 
    Document   : recipient_main_notification
    Created on : 28-Mar-2025, 5:24:38 pm
    Author     : Manikandan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : donor_menu_notification
    Created on : 28-Mar-2025, 3:45:17 pm
    Author     : Manikandan
--%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notifications</title>
    <link rel="short icon" href="logo2.png" type="image/x-icon">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
            margin: 0;
            padding: 20px;
        }
        .container {
            max-width: 800px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #ff6600;
        }
        .notification {
            padding: 15px;
            border-bottom: 1px solid #ddd;
        }
        .notification:last-child {
            border-bottom: none;
        }
        .notification p {
            margin: 5px 0;
            color: #666;
        }
        .mark-read {
            display: inline-block;
            padding: 5px 10px;
            background: #ff6600;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            cursor: pointer;
            border: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Notifications</h2>
        <div id="notification-list"></div>
    </div>

    <script>
        const notifications = [
            { message: "Your donation has been received!", timestamp: "March 28, 2025" },
            { message: "New organization added near you.", timestamp: "March 27, 2025" },
            { message: "Reminder: Your food donation is scheduled for tomorrow.", timestamp: "March 26, 2025" }
        ];

        const notificationList = document.getElementById("notification-list");

        notifications.forEach((notif, index) => {
            const notifDiv = document.createElement("div");
            notifDiv.classList.add("notification");
            notifDiv.innerHTML = `
                <p><strong>${notif.message}</strong></p>
                <p><small>${notif.timestamp}</small></p>
                <button class="mark-read" onclick="markAsRead(${index})">Mark as Read</button>
            `;
            notificationList.appendChild(notifDiv);
        });

        function markAsRead(index) {
            notifications.splice(index, 1);
            notificationList.innerHTML = "";
            notifications.forEach((notif, i) => {
                const notifDiv = document.createElement("div");
                notifDiv.classList.add("notification");
                notifDiv.innerHTML = `
                    <p><strong>${notif.message}</strong></p>
                    <p><small>${notif.timestamp}</small></p>
                    <button class="mark-read" onclick="markAsRead(${i})">Mark as Read</button>
                `;
                notificationList.appendChild(notifDiv);
            });
        }
    </script>
</body>
</html>

