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
        <h1 class="text-center mt-5">LEAVE REQUESTS</h1>
        <%
            DBconnect dbc=new DBconnect();
            Statement st=dbc.setConnection();
            Statement st2=dbc.setConnection();
            ResultSet result= st.executeQuery("select * from facultyleave");
        %>
        <table align="center" class="mt-5" cellpadding="20" width="70%">
            <tr class="bg-secondary">
                <th>FACULTY ID</th>
                <th>FACULTY NAME</th>
                <th>FROM DATE</th>
                <th>TO DATE</th>
            </tr>
            <%
            while(result.next()){%>
            <tr>
                <% String id=result.getString("id"); %>
                <td><% out.println(id); %></td>
                <% ResultSet result2=st2.executeQuery("select * from  facultyadmission where facultyid='"+id+"'");
                    while(result2.next()){
                %>
                <td><% out.println(result2.getString("name")); %></td>
                <%}%>
                <td><% out.println(result.getString("fromdate")); %></td>
                <td><% out.println(result.getString("todate")); %></td>
            </tr>
            <%}
            %>
        </table>

    </body>
</html>
