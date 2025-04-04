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
import java.sql.*;
import jakarta.servlet.http.HttpSession;


/**
 *
 * @author Manikandan
 */
public class recipientservlet extends HttpServlet {

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
                    String countryCode = request.getParameter("countryCode");
                    String phone = request.getParameter("phone");
                    String email = request.getParameter("email");
                    String address = request.getParameter("address");
                    String quantity = request.getParameter("quantity");
                    String password1 = request.getParameter("password1");
                    String password2 = request.getParameter("password2");

                    String query = "INSERT INTO recipientregister (name, country_code, phone, email, address,quantity, password,confirmpassword) VALUES (?,?,?,?,?,?,?,?)";

                    PreparedStatement ps = con.prepareStatement(query);

                    ps.setString(1, name);
                    ps.setString(2, countryCode);
                    ps.setString(3, phone);
                    ps.setString(4, email);
                    ps.setString(5, address);
                    ps.setString(6, quantity);
                    ps.setString(7, password1);
                    ps.setString(8, password2);

                    int status = ps.executeUpdate();
                    if (status > 0) {
                        out.println("<h2>Donation successfully submitted!</h2>");
                    }
                    else {
                        out.println("<h2>Failed to submit donation. Please try again.</h2>");
                    }

                  
                    response.sendRedirect("message.jsp");
                }
                case "login" -> {
                    ResultSet login = st.executeQuery("select * from recipientregister;");
                    String email = request.getParameter("email");
                    String password = request.getParameter("password");
                    boolean valid = false;
                    
                    session.setAttribute("id", email);
                    while (login.next()) {

                        if (email.equals(login.getString(5)) && password.equals(login.getString(9))) {

                            valid = true;
                            
                        }
                    }
                    if (valid) {
                        response.sendRedirect("recipient_main.jsp");
                        
                    } else {
                        out.println("<script type='text/javascript'>");
                        out.println("alert('Invalid Credentials');");
                        out.println("window.location.href = 'foodrecipient.jsp';");
                        out.println("</script>");
                    }
                }
                case "receipient_update" ->{
                    
                    String name = request.getParameter("name");
                    String countryCode = request.getParameter("countryCode");
                    String phone = request.getParameter("phone");
                    String email = (String) session.getAttribute("id");
                    String address = request.getParameter("address");
                    String quantity = request.getParameter("quantity");
                    String password1 = request.getParameter("password1");
                    String password2 = request.getParameter("password2");

                    String query = "update recipientregister set name=?, country_code=?, phone=?,  address=? ,quantity=?, password=?, confirmpassword=? where email=? ";

                    PreparedStatement ps = con.prepareStatement(query);

                    ps.setString(1, name);
                    ps.setString(2, countryCode);
                    ps.setString(3, phone);
                    
                    ps.setString(4, address);
                    ps.setString(5, quantity);
                    ps.setString(6, password1);
                    ps.setString(7, password2);
                    ps.setString(8, email);
                    ps.executeUpdate();
                     response.sendRedirect("recipient_main.jsp");
                }
                case "recipient_request" ->{
                    String donationid = request.getParameter("donation_id");
                    String email = (String) session.getAttribute("id");

                    if (donationid != null && email != null) {
                        String sql = "UPDATE donations SET accepted = ?, recipient_id = ? WHERE donation_id = ?";

                        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
                            pstmt.setString(1, "yes");
                            pstmt.setString(2, email);
                            pstmt.setInt(3, Integer.parseInt(donationid));

                            int updatedRows = pstmt.executeUpdate();
                            if (updatedRows > 0) {
                                out.println("<script type='text/javascript'>");
                            
                                out.println("window.location.href = 'recipient_main.jsp';");
                                out.println("</script>");
                            } else {
                                    
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        } catch (NumberFormatException e) {
                            System.out.println("Invalid donation ID format.");
                        }
                        } 
                }
                case "feedback" ->{
                    String fb=request.getParameter("feedback");
                    String donid=request.getParameter("donid");
                    if (donid != null && fb != null) {
                        String sql = "UPDATE donations SET feedback = ? WHERE donation_id = ?";

                        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
                            pstmt.setString(1, fb);
                            pstmt.setInt(2, Integer.parseInt(donid));

                            int updatedRows = pstmt.executeUpdate();
                            if (updatedRows > 0) {
                                out.println("<script type='text/javascript'>");
                                out.println("window.location.href = 'recipient_menu_requeststatus.jsp';");
                                out.println("</script>");
                            } else {

                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        } catch (NumberFormatException e) {
                            System.out.println("Invalid donation ID format.");
                        }
                    }
                }
            }
        }
            catch (ClassNotFoundException ex) {
            out.println(" CLASS NOT FOUND EXCEPTION");
        }
            catch (SQLException ex) {
            out.println("SQL EXCEPTION"+ex.getMessage());
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