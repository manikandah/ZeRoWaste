
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Donor List & Details</title>
        <link rel="short icon" href="logo2.png" type="image/x-icon">
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="flex items-center justify-center min-h-screen bg-orange-50 p-6">
        <div class="w-full max-w-6xl bg-white p-8 rounded-lg shadow-xl border-4 border-orange-500">
            <h1 class="text-4xl font-extrabold text-center text-orange-600 mb-6">Donation Requests</h1>

            <table class="w-full border-collapse border border-orange-500 shadow-lg rounded-lg overflow-hidden">
                <thead class="bg-orange-500 text-white text-lg">
                    <tr>
                        <th class="border border-orange-500 px-6 py-4">Donation ID</th>
                        <th class="border border-orange-500 px-6 py-4">Email Id</th>
                        <th class="border border-orange-500 px-6 py-4">Location</th>
                        <th class="border border-orange-500 px-6 py-4">Type of Food</th>
                        <th class="border border-orange-500 px-6 py-4">Quantity</th>
                        <th class="border border-orange-500 px-6 py-4">Prepared Date</th>
                        <th class="border border-orange-500 px-6 py-4">Prepared Time</th>
                        
                        <th class="border border-orange-500 px-6 py-4">Accept</th>
                    </tr>
                </thead>
                
                <tbody>
                    <%   
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/zerowastedb", "root", "");
                        Statement st = con.createStatement();
                        String location=request.getParameter("location");
                        String qty =request.getParameter("quantityoffoodneeded");
                        String date=request.getParameter("receivedDate");
                        ResultSet list=st.executeQuery(" select * from donations where location like '%"+location+"%' and food_quantity >= "+qty+" and prepared_date >= '"+date+"' and accepted='no'  ;");
                        while(list.next())
                        {
                    %>
               
                    <tr class="text-center bg-white hover:bg-orange-100 transition duration-300">
                
                         <td class="border border-orange-500 px-6 py-4"><%= list.getInt(1)%></td>
                         <td class="border border-orange-500 px-6 py-4"><%= list.getString(2)%></td>
                         <td class="border border-orange-500 px-6 py-4"><%= list.getString(3)%></td>
                         <td class="border border-orange-500 px-6 py-4"><%= list.getString(4)%></td>
                         <td class="border border-orange-500 px-6 py-4"><%= list.getInt(5)%></td>
                         <td class="border border-orange-500 px-6 py-4"><%= list.getString(6) %></td>
                         <td class="border border-orange-500 px-6 py-4"><%= list.getString(7) %></td>
                        
                        <td class="border border-orange-500 px-6 py-4"><form action="recipientservleturl">
                                <input type="hidden" value="recipient_request" name="action" >
                                <input type="hidden" value="<%= list.getInt(1)%>" name="donation_id" >
                                <input type="submit" value="Send Request" class="bg-orange-600 text-white px-6 py-2 rounded-lg shadow-md hover:bg-orange-700 transition duration-300"></form></td>
                
                    </tr>
                    <% } %>
                </tbody>
            </table>


</body>
</html>
