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
/**
 *
 * @author suhan
 */
public class SearchStudent extends HttpServlet {

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
        DBConnect dbc=new DBConnect();
        ResultSet result=null;
        String name=request.getParameter("search");
        try{
            Statement st=dbc.setConnection();
            String query="select * from admission where idnumber='"+name+"' ";
            result=st.executeQuery(query);
        }catch(Exception e){
            System.out.println(e);
        }
        
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SearchStudent</title>");            
            out.println("<style>"
                    + "body{background-color:#baf4f5;}"
                    + "h1{text-align:center;"
                    + "color:red;}"
                    + "th{color:blue;}"
                    + "</style>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Student Details Searched</h1>");
            boolean found=false;
            try{
                out.println("<table border=1>");
                out.println("<tr>"
                        
                        + "<th>NAME</th> "
                        + "<th>ID NUMBER</th> "
                        + "<th>DATE OF BIRTH</th>"
                        + "<th>STUDENT CONTACT</th>"
                        + "<th>FATHER NAME</th>"
                        + "<th>FATHER CONTACT</th>"
                        + "<th>DISTRICT</th>"
                        + "<th>COLLAGE MAIL</th>"
                        + "<th>PASSWORD</th></tr>"
                        
                );
                while(result.next()){
                    out.println("<tr>");
                    
                    out.println("<td>"+result.getString("name")+"</td>");
                    out.println("<td>"+result.getString("idnumber")+"</td>");
                    
                    out.println("<td>"+result.getString("dob")+"</td>");
                    out.println("<td>"+result.getString("mobile")+"</td>");
                    out.println("<td>"+result.getString("father")+"</td>");
                    out.println("<td>"+result.getString("parentcontact")+"</td>");
                    out.println("<td>"+result.getString("district")+"</td>");
                    
                    out.println("<td>"+result.getString("clgmail")+"</td>");
                    out.println("<td>"+result.getString("clgpassword")+"</td>");
                    out.println("</tr>");
                    found=true;
                }
                out.println("</table>");
                if(!found){
                    out.println("<h3>Student You Searched Id number Not Found</h3>");
                }
                

            }catch(Exception e){
                System.out.println(e);
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
