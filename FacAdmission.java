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
public class FacAdmission extends HttpServlet {

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
        
        DBConnect dbc=new DBConnect();
        Statement st=dbc.setConnection();

         String fname=request.getParameter("fname");
        String date=request.getParameter("date");
        String gender=request.getParameter("gender");
        String email=request.getParameter("email");
        String pwd=request.getParameter("password");
        String phno=request.getParameter("number");
        String status=request.getParameter("status");
        String address=request.getParameter("address");
        String qualification=request.getParameter("qualification");
        String experience=request.getParameter("experience");

        
        String facultyid=phno+"rkv";
        String fpassword=pwd;
        String query="insert into facultyadmission values('"+fname+"','"+date+"','"+gender+"','"+email+"','"+pwd+"','"+phno+"','"+status+"','"+address+"','"+qualification+"','"+experience+"','"+facultyid+"','"+fpassword+"')";
        int statu=st.executeUpdate(query);
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet FacAdmission</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println(statu);
            //out.println(fname+" "+date+" "+gender+" "+email+" "+pwd+" "+phno+" "+status+" "+address+" "+qualification+" "+experience+" "+facultyid+" "+fpassword);
            out.println("<h2>Use this id and password for the logins </h2>");
            out.println("<h3>Faculty ID: </h3>");
            out.println(facultyid);
            out.println("<h3>password: </h3>");
            out.println(fpassword);
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
            Logger.getLogger(FacAdmission.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(FacAdmission.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(FacAdmission.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(FacAdmission.class.getName()).log(Level.SEVERE, null, ex);
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
