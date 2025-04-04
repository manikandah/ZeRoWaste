<%-- 
    Document   : recipient_menu_donorlist
    Created on : 31-Mar-2025, 7:18:17 pm
    Author     : Manikandan
--%>


<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*;"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Organizations</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="short icon" href="logo2.png" type="image/x-icon">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f4f4;
            padding: 20px;
            text-align: center;
        }
        .container {
            max-width: 900px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        }
        h2 {
            color: #ff6f00;
        }
        input[type="text"] {
            width: 80%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type="submit"] {
            background: #ff6f00;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .organization {
            background: #fff;
            padding: 15px;
            margin-top: 15px;
            border-radius: 5px;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
            text-align: left;
        }
        .organization p {
            margin: 5px 0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Find Organizations Near You</h2>
        <form method="GET">
            <input type="text" name="orgname" placeholder="Enter donor name" >
            <input type="submit" value="Search">
            <input type="text" name="location" placeholder="Enter location" >
            <input type="submit" value="Search">
        </form>
        <div id="organization-list">
            <%  
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/zerowastedb", "root", "");
                Statement st = con.createStatement();
                String location = request.getParameter("location");
                String name=request.getParameter("orgname");
                if (location != null && !location.trim().isEmpty()) {
                    ResultSet list = st.executeQuery("SELECT * FROM donorregister WHERE address LIKE '%" + location + "%' or name like '%" + name +" %' ;");
                    while (list.next()) {
            %>
            <div class="organization">
                <p><strong>Name:</strong> <%= list.getString(2) %></p>
                <p><strong>Contact:</strong> <%= list.getString(4) %></p>
                <p><strong>Email:</strong> <%= list.getString(5) %></p>
                <p><strong>Location:</strong> <%= list.getString(6) %></p>
                
            </div>
            <%      }
                }
                con.close();
            } catch (Exception e) {
                out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
            }
            %>
        </div>
    </div>
</body>
</html>

