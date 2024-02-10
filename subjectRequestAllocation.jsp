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
            Statement st=dbc.setConnection();
            Statement st2=dbc.setConnection();
            ResultSet result= st.executeQuery("select * from subjectallocation where status='processing'");
            ResultSet result2= st2.executeQuery("select * from subjectallocation where status!='processing'");
        %>
        <table align="center" class="mt-5" cellpadding="20">
            <tr class="bg-secondary">
                <th>SUBJECT CODE</th>
                <th>SUBJECT NAME</th>
                <th>FACUTLY NAME</th>
                <th>FACULTY ID</th>
                <th></th>
                <th></th>
            </tr>
            <%
            while(result.next()){%>
            <tr>
                <td><% out.println(result.getString("subCode")); %></td>
                <td><% out.println(result.getString("subName")); %></td>
                <td><% out.println(result.getString("facultyName")); %></td>
                <td><% out.println(result.getString("facultyId")); %></td>
                <td><a href="subjectAllocation?sno=<% out.print(result.getInt("sno"));%>" class="bg-success p-2 text-light" style="border-radius: 10px; text-decoration: none;">ALLOCATE</button>
                <td><a href="subjectNotAllocation?sno=<% out.print(result.getInt("sno"));%>" class="bg-success p-2 text-light" style="border-radius: 10px; text-decoration: none;">NOT ALLOCATE</button>
               
            </tr>
            <%}
            %>
        </table>
        
               

        <table align="center" class="mt-5" cellpadding="20">
            <tr class="bg-secondary">
                <th>SUBJECT CODE</th>
                <th>SUBJECT NAME</th>
                <th>FACUTLY NAME</th>
                <th>FACULTY ID</th>
                <th>STATUS</th>
                <th></th>
            </tr>
            <%
            while(result2.next()){%>
            <tr>
                <td><% out.println(result2.getString("subCode")); %></td>
                <td><% out.println(result2.getString("subName")); %></td>
                <td><% out.println(result2.getString("facultyName")); %></td>
                <td><% out.println(result2.getString("facultyId")); %></td>
                <td><% out.println(result2.getString("status")); %></td>

            </tr>
            <%}
            %>
        </table>
    </body>
</html>
