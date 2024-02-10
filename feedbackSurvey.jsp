<%-- 
    Document   : feedbackSurvey
    Created on : 09-Jan-2024, 7:45:23 am
    Author     : suhan
--%>

<%-- 
    Document   : subjectRequestAllocation
    Created on : 24-Dec-2023, 11:48:55 pm
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
                background-color:#dcf2e5;
                background:linear-gradient(to right,#bce3cc,#dcf2e5);
            }
        </style>
    </head>
    <body>
        <%
            DBconnect dbc=new DBconnect();
            ResultSet result=null;
            ResultSet result2=null;
            try{Statement st=dbc.setConnection();
            Statement st2=dbc.setConnection();
            result= st.executeQuery("select * from  facultyfeedback");
            }catch(Exception e){}
        %>
     
               

        <table align="center" class="mt-5" cellpadding="20" width="70%">
            <tr class="bg-secondary">
                <th>Student Id</th>
                <th>Subject Name</th>
                <th>Faculty Name</th>
                <th>points</th>

            </tr>
            <%
            try{while(result.next()){%>
            <tr>
                <td><% out.println(result.getString("id")); %></td>
                <td><% out.println(result.getString("subName")); %></td>
                <td><% out.println(result.getString("facultyName")); %></td>
                <td><% out.println(result.getString("points")); %></td>

            </tr>
            <%}}catch(Exception e){}
            %>
        </table>
    </body>
</html>

