<%-- 
    Document   : facultyDetails
    Created on : 23-Dec-2023, 9:05:34 pm
    Author     : suhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="con.DBconnect" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <style>
            body{
                    background:linear-gradient(to right,#bce3cc,#dcf2e5);
            }
            .dept-faculty{
                background-color: white;
                border-radius: 20px;
            }
        </style>
    </head>
    <body><br>
        <h1 class="text-primary text-center">FACULTY IN THE DEPARTMENT</h1>
        <%
            try{
                DBconnect dbc=new DBconnect();
                Statement st=dbc.setConnection();
                ResultSet result=st.executeQuery("select * from facultyadmission");

            

            while(result.next()){
           %>
        <div class="dept-faculty row col-md-6 mx-auto p-3 mt-5">
                <div class="col col-md-4 ms-3">
                    <img src="Images/profile.png" width="200px" height="150px" style="border-radius:20px;">
                </div>
                <div class="col col-md-5 mt-2 ms-3" style="line-height: 36px;">
                    
                    <b>NAME : </b> <% out.println(result.getString("name"));%> <br>
                    <b>EDUCATION : </b><% out.println(result.getString("qualification"));%>  <br>
                    <b>EMAIL : </b> <% out.println(result.getString("email"));%><br>
                    <b>Role : <% out.println("role");%></b>
                </div>
        </div> 
        
        <%}            
         }catch(Exception e){}%>
        
    </body>
</html>
