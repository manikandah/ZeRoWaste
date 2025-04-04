<%-- 
    Document   : recipient_menu_requeststatus
    Created on : 31-Mar-2025, 6:15:54 pm
    Author     : Manikandan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*;"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Request Status</title>
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





        </style>
    </head>
    <body>
        <div class="container">
            <h1>Request accepted</h1>
            <table >
                <thead>
                    <tr>
                        <th>Donation ID</th>
                        <th>Donar</th>
                        <th>Location</th>
                        <th>Type of Food</th>
                        <th>Quantity of Food</th>
                        <th>Prepared Date</th>
                        <th>Prepared Time</th>
                        <th> Donation Accepted </th>
                    </tr>
                </thead>
                <tbody>
                    <%    
                     Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/zerowastedb", "root", "");
                    Statement st = con.createStatement(); 
                    String email = (String) session.getAttribute("id");
                    ResultSet list=st.executeQuery("select * from donations where accepted='yes' and recipient_id= '"+email+"' ;");
                    while(list.next())
                    {
                    %>
                    <tr>
                        <td><%= list.getInt(1)%></td>
                        <td><%= list.getString(2)%></td>
                        <td><%= list.getString(3)%></td>
                        <td><%= list.getString(4)%></td>
                        <td><%= list.getInt(5)%></td>
                        <td><%= list.getString(6) %></td>
                        <td><%= list.getString(7) %></td>
                        <td><%= list.getString(9)%></td>
                    </tr>
                    <%  }  %>
                </tbody>
            </table>
            <h1>Donations received </h1>
            <table>
                <thead>
                    <tr>
                        <th>Donation ID</th>
                        <th>Donar</th>
                        <th>Location</th>
                        <th>Type of Food</th>
                        <th>Quantity of Food</th>
                        <th>Prepared Date</th>
                        <th>Prepared Time</th>
                        <th>Received</th>
                        <th>Feedback</th>
                    </tr>
                </thead>
                <tbody>
                    <%    
                      
                     list=st.executeQuery("select * from donations where send=1 and recipient_id= '"+email+"' ;");
                    while(list.next())
                    {
                    %>
                    <tr>
                        <td><%= list.getInt(1)%></td>
                        <td><%= list.getString(2)%></td>
                        <td><%= list.getString(3)%></td>
                        <td><%= list.getString(4)%></td>
                        <td><%= list.getInt(5)%></td>
                        <td><%= list.getString(6) %></td>
                        <td><%= list.getString(7) %></td>
                        <td><%= list.getString(9)%></td>
                        <td><form action="recipientservleturl"><input type="hidden" name="action" value="feedback">
                                <input type="hidden" name="donid" value="<%= list.getInt(1)%>" >
                                <input type="text" name="feedback" placeholder="Enter the Feedback" value="<%=  list.getString(11) != null ? list.getString(11) : ""   %>" onchange="this.form.submit()" >
                            </form>
                    </tr>
                    <%  }  %>
                </tbody>
            </table>
        </div>

    </body>
</html>

