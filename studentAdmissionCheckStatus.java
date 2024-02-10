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
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author suhan
 */
public class studentAdmissionCheckStatus extends HttpServlet {

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
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        
        String mobile=request.getParameter("mobile");
        DBConnect dbc=new DBConnect();
        Statement st=dbc.setConnection();
        
        ResultSet result=st.executeQuery("select * from studentadmissionrequest where mobile='"+mobile+"'");
        
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet studentAdmissionCheckStatus</title>");            
            out.println("</head>");
            out.println("<body>");
            while(result.next()){
            out.println("<table align='center' cellpadding='20'>"
                    + "<tr style='background-color:grey;'>"
                    + "<th>Name</th>"
                    + "<th>Mobile</th>"
                    + "<th>caste</th>"
                    + "<th>Email</th>"
                    + "<th>SSC</th>"
                    + "<th>12TH CGPA</th>"
                    + "<th>STATUS</th>"
                    + "</tr>"
                    + "<td>"+result.getString("name")+"</td>"
                    + "<td>"+result.getString("mobile")+"</td>"
                    + "<td>"+result.getString("caste")+"</td>"
                    + "<td>"+result.getString("email")+"</td>"       
                    + "<td>"+result.getString("ssc")+"</td>"
                    + "<td>"+result.getString("puc")+"</td>"
                    + "<td>"+result.getString("status")+"</td>"
                    + "<tr>"
                     +"</tr>"
                    
                    + "</table>");
                if(result.getString("status").equals("selected")){
                    out.println("<a href='admission.html'>GET ADMISSION</a>");
                }
            }
            out.println("</body>");
            out.println("</html>");
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(studentAdmissionCheckStatus.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(studentAdmissionCheckStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(studentAdmissionCheckStatus.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(studentAdmissionCheckStatus.class.getName()).log(Level.SEVERE, null, ex);
        }
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
