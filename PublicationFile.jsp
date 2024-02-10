<%-- 
    Document   : PublicationFile
    Created on : 15-Dec-2023, 3:16:57 pm
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
            String projectno=request.getParameter("projectno");
            Connection conn=null;
            Statement st=null;
            ResultSet result=null;
            String projecttitle=null;
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","1234");
                st=conn.createStatement();
                result=st.executeQuery("select title from projectspublication where projectno='"+projectno+"';");
                result.next();
                projecttitle=result.getString(1);
            }catch(Exception e){}
        %>
        
        
        
        <div class="card mx-auto my-5 p-3">
            <h5 class="card-title"><% out.println("ProjectTitle: "+projecttitle); %></h5>
            
            <div class="card-body">
                
                <form action="p" method="post" enctype="multipart/form-data">
                    <input type="text" class="form-control py-3" name="result" placeholder="Result of the project" required/><!-- comment --><br>
                    <input type="file" name="photo"><br>
                    <input type="text" name="projectno" value="<% out.print(projectno); %>" style="display: none;" ><br>
                    <input type="submit" value="Publication" class="w-50 mx-auto form-control bg-success ">
                </form>                            
            </div>
        </div>

    </body>
</html>

