/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
 
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import static java.lang.System.out;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.*;
@WebServlet("/uploadServlet")
@MultipartConfig(maxFileSize = 16177215)    // upload file's size up to 16MB
public class p extends HttpServlet {
     
    // database connection settings
   
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        
        String projectno=request.getParameter("projectno");
        //getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);

        InputStream inputStream = null; // input stream of the upload file
         
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
         
        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client
         
        try {
             HttpSession ss=request.getSession();
        String faculty=(String)ss.getAttribute("faculty");

            // connects to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
           
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","1234");
 
            // constructs SQL statement
            Statement st=conn.createStatement();

            
            String sql="update projectspublication set file=?,status='completed' where projectno='"+projectno+"'";
            
            //sql = "INSERT INTO profiles(id,photo) values ('"+faculty+"',?)";
            PreparedStatement statement = conn.prepareStatement(sql);
             
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(1, inputStream);
            }
 
            // sends the statement to the database server
            int row = statement.executeUpdate();
            //int row=2;
            if (row > 0) {
                response.sendRedirect("Faculty.jsp");
                getServletContext().getRequestDispatcher("/Message.jsp").forward(request, response);

                message = "File uploaded and saved into database";
                 }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(uploadServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(uploadServlet.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope

            // forwards to the message page
        }
    }
}
