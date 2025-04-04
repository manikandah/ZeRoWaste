/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.sql.*;

/**
 *
 * @author Manikandan
 */
public class donorservlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/zerowastedb", "root", "");
            Statement st = con.createStatement();
            String action = request.getParameter("action");
            HttpSession session = request.getSession();

            switch (action) {

                case "register" -> {
                    String name = request.getParameter("name");
                    String countrycode = request.getParameter("countryCode");
                    String phone = request.getParameter("phone");
                    String email = request.getParameter("email");
                    String address = request.getParameter("address");
                    String password1 = request.getParameter("password1");
                    String password2 = request.getParameter("password2");

                    String query = "INSERT INTO donorregister ( name, country_code, phone, email, address, password, confirmpassword) VALUES (?,?,?,?,?,?,?)";

                    PreparedStatement ps = con.prepareStatement(query);

                    ps.setString(1, name);
                    ps.setString(2, countrycode);
                    ps.setString(3, phone);
                    ps.setString(4, email);
                    ps.setString(5, address);
                    ps.setString(6, password1);
                    ps.setString(7, password2);

                    int status = ps.executeUpdate();
                    if (status > 0) {
                        out.println("<h2>Donation successfully submitted!</h2>");
                    } else {
                        out.println("<h2>Failed to submit donation. Please try again.</h2>");
                    }

                    response.sendRedirect("message.jsp");
                }

                case "login" -> {

                    ResultSet login = st.executeQuery("select * from donorregister ;");
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");
                    boolean valid = false;

                    session.setAttribute("id", email);
                    while (login.next()) {

                        if (email.equals(login.getString(5)) && password.equals(login.getString(8))) {

                            valid = true;
                            session.setAttribute("name",login.getString(2));

                        }
                    }
                    if (valid) {
                        response.sendRedirect("donor_main.jsp");

                    } else {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Invalid Credentials');");
                        out.println("window.location.href = 'fooddonor.jsp';");
                        out.println("</script>");
                    }
                }
                case "donate" -> {
                    String id = (String) session.getAttribute("id");
                    String name = (String) session.getAttribute("name");
                    String location = request.getParameter("location");
                    String foodtype = request.getParameter("foodtype");
                    String foodquantity = request.getParameter("foodquantity");
                    String date = request.getParameter("date1");
                    String time = request.getParameter("time1");

                    st.executeUpdate("Insert into donations (emailid,location,food_type,food_quantity,prepared_date,prepared_time,image_path) values('" + id + "','" + location + "','" + foodtype + "'," + foodquantity + ",'" + date + "','" + time + "','path' ) ;");
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Donation added to the database');");
                    out.println("window.location.href = 'donor_main.jsp';");
                    out.println("</script>");

                }
                case "profileupdate" -> {
                    String name = request.getParameter("name");
                    String countrycode = request.getParameter("countryCode");
                    String phone = request.getParameter("phone");
                    String id = (String) session.getAttribute("id");
                    String address = request.getParameter("address");
                    String password1 = request.getParameter("password1");
                    String password2 = request.getParameter("password2");

                    String query = "UPDATE donorregister SET name = ?, country_code = ?, phone = ?, address = ?, password = ?, confirmpassword = ? WHERE email = ?";

                    PreparedStatement stmt = con.prepareStatement(query);
                    stmt.setString(1, name);
                    stmt.setString(2, countrycode);
                    stmt.setString(3, phone);
                    stmt.setString(4, address);
                    stmt.setString(5, password1);
                    stmt.setString(6, password2);
                    stmt.setString(7, id);  // Email to identify which record to update

                    stmt.executeUpdate();

                }
                case "send_food" ->{
                    
                    String donid=request.getParameter("donid");
                    st.executeUpdate("update donations set send=1 where donation_id="+donid+" ;");
                    out.println("<script type='text/javascript'>");
                    out.println("window.location.href = 'donor_main.jsp';");
                    out.println("</script>");
                }
                case "delete_food" ->{
                    String donid=request.getParameter("donid");
                    st.executeUpdate("delete from donations where donation_id="+donid+" ;");
                    out.println("<script type='text/javascript'>");
                    out.println("window.location.href = 'donor_main.jsp';");
                    out.println("</script>");
                }
                case "forgot_password" ->{
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");
                    int n=st.executeUpdate("update donorregister set password='"+password+"' , confirmpassword='"+password+"' where email='"+email+"' ;");
                    if(n==0){
                        out.println("<script type='text/javascript'>");
                    out.println("alert('Please enter correct email id');");
                    out.println("window.location.href = 'fooddonor.jsp';");
                    out.println("</script>");
                    }
                    else{
                        out.println("<script type='text/javascript'>");
                    out.println("alert('Sucessfully updated');");
                    out.println("window.location.href = 'fooddonor.jsp';");
                    out.println("</script>");
                    }
                }

            }
        } catch (ClassNotFoundException ex) {
            out.println(" CLASS NOT FOUND EXCEPTION");
        } catch (SQLException ex) {
            out.println("SQL EXCEPTION" + ex.getMessage());
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
