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
            result= st.executeQuery("select * from  studentadmissionrequest where status='proccesing'");
            result2= st2.executeQuery("select * from studentadmissionrequest where status!='proccesing'");
            }catch(Exception e){}
        %>
        <table align="center" class="mt-5" cellpadding="20">
            <tr class="bg-secondary">
                <th>Name</th>
                <th>Mobile</th>
                <th>Caste</th>
                <th>Email</th>
                <th>SSC CGPA</th>
                <th>12TH CGPA</th>
                <th></th>
                <th></th>
            </tr>
            <%
            try{while(result.next()){%>
            <tr>
                <td><% out.println(result.getString("name")); %></td>
                <td><% out.println(result.getString("mobile")); %></td>
                <td><% out.println(result.getString("caste")); %></td>
                <td><% out.println(result.getString("email")); %></td>
                <td><% out.println(result.getString("ssc")); %></td>
                <td><% out.println(result.getString("puc")); %></td>
                <td><a href="admissionRequestSelect?mobile=<% out.print(result.getString("mobile"));%>" class="bg-success p-2 text-light" style="border-radius: 10px; text-decoration: none;">SELECT</button>
                <td><a href="admissionRequestNotSelect?mobile=<% out.print(result.getString("mobile"));%>" class="bg-success p-2 text-light" style="border-radius: 10px; text-decoration: none;">NOT SELECT</button>
               
            </tr>
            <%}}catch(Exception e){}
            %>
        </table>
        
               

        <table align="center" class="mt-5" cellpadding="20">
            <tr class="bg-secondary">
                <th>Name</th>
                <th>Mobile</th>
                <th>Caste</th>
                <th>Email</th>
                <th>SSC CGPA</th>
                <th>12TH CGPA</th>
                <th>STATUS</th>
            </tr>
            <%
            try{while(result2.next()){%>
            <tr>
                <td><% out.println(result2.getString("name")); %></td>
                <td><% out.println(result2.getString("mobile")); %></td>
                <td><% out.println(result2.getString("caste")); %></td>
                <td><% out.println(result2.getString("email")); %></td>
                <td><% out.println(result2.getString("ssc")); %></td>
                <td><% out.println(result2.getString("puc")); %></td>
                <td><% out.println(result2.getString("status")); %></td>
            </tr>
            <%}}catch(Exception e){}
            %>
        </table>
    </body>
</html>
