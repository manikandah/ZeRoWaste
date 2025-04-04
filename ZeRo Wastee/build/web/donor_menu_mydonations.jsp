<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>My Donations</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
        <link rel="short icon" href="logo2.png" type="image/x-icon">
        <style>
            body {
                font-family: 'Poppins', sans-serif;
                background: linear-gradient(135deg, #ff6f00, #ff9a3c);
                text-align: center;
                display: flex;
                justify-content: center;
                align-items: center;
                min-height: 100vh;
                margin: 0;
            }
            .container {
                width: 100%;
                max-width: 1200px;
                background: white;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.3);
            }
            h2 {
                color: #ff6f00;
                margin-bottom: 20px;
            }
            input {
                width: 98%;
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid #ccc;
                border-radius: 5px;
                transition: 0.3s;
            }
            input:focus {
                border-color: #ff6f00;
                outline: none;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                overflow: hidden;
                border-radius: 10px;
                text-align: center;
              



            }
            th, td {
                padding: 12px;
                border: 1px solid #ddd;
                text-align: left;
            }
            th {
                background: #ff6f00;
                color: white;
            }
            tr:nth-child(even) {
                background: #f9f9f9;
            }
            tr:hover {
                background: #ffebcc;
                transition: 0.3s;
            }
            input[type="submit"] {
                background: #ff6f00;
                color: white;
                border: none;
                padding: 8px 12px;
                cursor: pointer;
                border-radius: 5px;
                transition: 0.3s;
            }
            input[type="submit"]:hover {
                background: #e65c00;
            }



        </style>
    </head>
    <body>
        <div class="container">
            <h2>My Donation Records</h2>
            <h2>Donation Accepted by Organization</h2>
            <input type="text" id="search" placeholder="Search records..." onkeyup="filterTable()">
            <table>
                <thead>
                    <tr>
                        <th>Donation ID</th>
                        <th>Location</th>
                        <th>Type of Food</th>
                        <th>Quantity</th>
                        <th>Prepared Date</th>
                        <th>Prepared Time</th>
                        <th>Accepted</th>
                        <th>Recipient Name</th>
                        <th>Send Food</th>
                        <th>Feedback</th>
                    </tr>
                </thead>
                <tbody id="recordsTable">
                    <%@ page import="java.sql.*" %>
                    <%   
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/zerowastedb", "root", "");
                    Statement st = con.createStatement();
                    String id = (String) session.getAttribute("id");
                    
                    ResultSet list = st.executeQuery("SELECT * FROM donations WHERE emailid='" + id + "' AND accepted='yes' and send !=1 order by donation_id desc;");
                    while(list.next()) { %>
                    <tr>
                        <td><%= list.getInt(1) %></td>
                        <td><%= list.getString(3) %></td>
                        <td><%= list.getString(4) %></td>
                        <td><%= list.getInt(5) %></td>
                        <td><%= list.getString(6) %></td>
                        <td><%= list.getString(7) %></td>
                        <td><%= list.getString(9) %></td>
                        <td><%= list.getString(10) %></td>
                        <td>
                            <form action="donorservleturl">
                                <input type="hidden" name="action" value="send_food">
                                <input type="hidden" name="donid" value="<%= list.getInt(1) %>">
                                <input type="submit" value="Send Food">
                            </form>
                        </td>
                        <td><%= list.getString(11) %></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <h2>Donation Not Yet Accepted by oraganization</h2>
            <input type="text" id="search" placeholder="Search records..." onkeyup="filterTable()">
            <table>
                <thead>
                    <tr>
                        <th>Donation ID</th>
                        <th>Location</th>
                        <th>Type of Food</th>
                        <th>Quantity</th>
                        <th>Prepared Date</th>
                        <th>Prepared Time</th>
                        <th>Accepted</th>
                        
                        <th>Delete</th>
                        
                    </tr>
                </thead>
                <tbody id="recordsTable">
                    <%@ page import="java.sql.*" %>
                    <%   
                    
                    
                    
                    list = st.executeQuery("SELECT * FROM donations WHERE emailid='" + id + "' AND accepted='no' order by donation_id desc;");
                    while(list.next()) { %>
                    <tr>
                        <td><%= list.getInt(1) %></td>
                        <td><%= list.getString(3) %></td>
                        <td><%= list.getString(4) %></td>
                        <td><%= list.getInt(5) %></td>
                        <td><%= list.getString(6) %></td>
                        <td><%= list.getString(7) %></td>
                        <td><%= list.getString(9) %></td>
                        
                        <td>
                            <form action="donorservleturl">
                                <input type="hidden" name="action" value="delete_food">
                                <input type="hidden" name="donid" value="<%= list.getInt(1) %>">
                                <input type="submit" value="Delete">
                            </form>
                        </td>
                        
                    </tr>
                    <% } %>
                </tbody>
            </table>
                <h2>ALL DONATIONS</h2>
            <input type="text" id="search" placeholder="Search records..." onkeyup="filterTable()">
            <table>
                <thead>
                    <tr>
                        <th>Donation ID</th>
                        <th>Location</th>
                        <th>Type of Food</th>
                        <th>Quantity</th>
                        <th>Prepared Date</th>
                        <th>Prepared Time</th>
                        <th>Accepted</th>
                        <th>Recipient</th>
                        <th>Feedback</th>
                        
                        
                    </tr>
                </thead>
                <tbody id="recordsTable">
                    <%@ page import="java.sql.*" %>
                    <%   
                    
                    
                    
                    list = st.executeQuery("SELECT * FROM donations WHERE emailid='" + id + "' order by donation_id desc;");
                    while(list.next()) { %>
                    <tr>
                        <td><%= list.getInt(1) %></td>
                        <td><%= list.getString(3) %></td>
                        <td><%= list.getString(4) %></td>
                        <td><%= list.getInt(5) %></td>
                        <td><%= list.getString(6) %></td>
                        <td><%= list.getString(7) %></td>
                        <td><%= list.getString(9) %></td>
                        <td><%= list.getString(10) %></td>
                        <td><%= list.getString(11) %></td>
                        
                        
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <script>
            function filterTable() {
                let input = document.getElementById("search").value.toUpperCase();
                let table = document.getElementById("recordsTable");
                let tr = table.getElementsByTagName("tr");
                for (let i = 0; i < tr.length; i++) {
                    let td = tr[i].getElementsByTagName("td")[1];
                    if (td) {
                        let txtValue = td.textContent || td.innerText;
                        tr[i].style.display = txtValue.toUpperCase().indexOf(input) > -1 ? "" : "none";
                    }
                }
            }
        </script>
    </body>
</html>
