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
public class uploadMarks extends HttpServlet {

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
        String subject=request.getParameter("subjectsDropdown");
        String tests=request.getParameter("tests");
        String sem=request.getParameter("semsDropdown");
        Statement st=dbc.setConnection();
        Statement st2=dbc.setConnection();
        Statement st3=dbc.setConnection();
        ResultSet result=null;
        ResultSet result2=null;
        int status=0;
        String marks=null,id=null,query=null;
        String exitstatus=null;
        result=st.executeQuery("select id from semregistration where year='"+sem+"'");
        //String name=request.getParameter("r190003");
        while(result.next()){
            id=result.getString(1);
            marks=request.getParameter(id);
            result2=st3.executeQuery("select * from marks where subject='"+subject+"' and id='"+id+"'");
            while(result2.next()){
                exitstatus=result2.getString("id");
            }
            if(exitstatus==null){
                query="insert into marks(id,subject,"+tests+") values ('"+id+"','"+subject+"','"+marks+"')";
            }
            else{
                query="update marks set "+tests+"='"+marks+"' where id='"+id+"' and subject='"+subject+"'";
            }
            status=st2.executeUpdate(query);
        }
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet uploadMarks</title>");            
            out.println("</head>");
            out.println("<body>");
            //out.println(subject+" "+tests+" "+status+" "+exitstatus);
            out.println(subject+" "+tests);
            response.sendRedirect("Faculty.jsp");
            out.println("<h1>Servlet uploadMarks at " + request.getContextPath() + "</h1>");
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
            Logger.getLogger(uploadMarks.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(uploadMarks.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(uploadMarks.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(uploadMarks.class.getName()).log(Level.SEVERE, null, ex);
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
