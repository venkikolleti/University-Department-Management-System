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
public class NewAdmission extends HttpServlet {

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
        String acedamic=request.getParameter("acedamic-year");
          String name=request.getParameter("name");
        String dob=request.getParameter("dob");
        String gender=request.getParameter("gender");
        String mobile=request.getParameter("mobile");
        String email=request.getParameter("email");
        String password=request.getParameter("password");
        
        String fname=request.getParameter("fname");
        String mname=request.getParameter("mname");
        String pcontact=request.getParameter("parentcontact");
        String occupation=request.getParameter("occupation");
        
        String village=request.getParameter("village");
        String pincode=request.getParameter("pincode");
        String mandal=request.getParameter("mandal");
        String district=request.getParameter("district");
        String state=request.getParameter("state");

DBConnect dbc=new DBConnect();
        int status=0;
        ResultSet idnum=null;
        
        String id;
        switch (acedamic) {
            case "2020-21":
                id="R180000";
                break;
            case "2021-22":
                id="R190000";
                break;
            case "2022-23":
                id="R200000";
                break;
            default:
                id="R210000";
                break;
        }
        String str2=null;
        String clgmail=null;
        String clgpassword=null;
        try {
            Statement st=dbc.setConnection();
            
            String check="select * from admission where mobile='"+mobile+"' or email='"+email+"' ;";
            
            ResultSet checked=st.executeQuery(check);
            String val=null;
            while(checked.next()){
                val=checked.getString("name");
            }
            
            if(val==null){

                String query1="select * from admission where acedamic='"+acedamic+"' order by idnumber desc limit 1;";
                idnum=st.executeQuery(query1);
                while(idnum.next()){
                    id=idnum.getString("idnumber");
                }
                String str1=id.substring(1);
                int num=Integer.parseInt(str1);
                num++;
                str2="R"+num;
                clgmail=str2+"@rguktrkv.ac.in";
                clgpassword=str2+"rkv";
                String query="insert into admission values('"+name+"','"+dob+"','"+gender+"','"+mobile+"','"+email+"','"+password+"','"+fname+"','"+mname+"','"+pcontact+"','"+occupation+"','"+village+"','"+pincode+"','"+mandal+"','"+district+"','"+state+"','"+str2+"','"+clgmail+"','"+clgpassword+"','"+acedamic+"');";
                status=st.executeUpdate(query);
            
            }
            
            
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(admission.class.getName()).log(Level.SEVERE, null, ex);
        }        
        
        
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewAdmission</title>");            
            out.println("</head>");
            out.println("<body>");
            if(status==1){    
            out.println("<h4>Show the Idnumber, Collage Gmail and password to the  Student <br> this Idnumber or email and password is used for logins and others..<br></h4>");
            out.println("<h3>Name: </h3>"+name);
            out.println("<br>");
            out.println("<h3>Idnumber :</h3>"+ str2);
            out.println("<br>");
            out.println("<h3>Collage Gmail: </h3>"+clgmail);
            out.println("<br>");
            out.println("<h3>Password: </h3>"+clgpassword);
            out.println("<br><br>");
            out.println(acedamic);
        }
        else{
            out.println("<h3>Entered Something wrong.. Either Mobile Number or Personal Gmail is Already have another student</h3>");
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
