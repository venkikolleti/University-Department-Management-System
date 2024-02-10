<%-- 
    Document   : NotResolveQuery
    Created on : 14-Dec-2023, 12:40:33 pm
    Author     : suhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .card{
                width:400px;
                height:270px;
                background-color: skyblue;
                text-align: center;

                
            }
        </style>       
    </head>
    <body>
        <%
            String queryno=request.getParameter("queryno");
            Connection conn=null;
            Statement st=null;
            ResultSet result=null;
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","1234");
                st=conn.createStatement();            
            }catch(Exception e){}
        %>
        
        
        
        <div class="card mx-auto my-5 p-3">
            <h5 class="card-title"><% out.println("QUERY NUMBER: "+queryno); %></h5>
            <h5 class="card-title">not resolve</h5>
            <div class="card-body">
                
                <form action="NotResolveQuery" method="post">
                    <input type="text" class="form-control py-3" name="description" placeholder="description about query" required/><!-- comment --><br><br>
                    <input type="text" name="queryno" value="<% out.print(queryno); %>" style="display: none;" >
                    <input type="submit" value="Resolve" class="w-50 mx-auto form-control bg-success ">
                </form>                            
            </div>
        </div>

    </body>
</html>
