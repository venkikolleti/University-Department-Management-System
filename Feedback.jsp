<%-- 
    Document   : Feedback
    Created on : 08-Jan-2024, 11:54:10 pm
    Author     : suhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="con.DBconnect" %>
<%@page import="jakarta.servlet.http.HttpSession" %>
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
                margin:0px;
                
            }
        </style>
    </head>
    <body>
       
    <%
        HttpSession ss=request.getSession();
        String user=(String)ss.getAttribute("user");
        
        DBconnect db=new DBconnect();
        Statement st=db.setConnection();
        ResultSet result=st.executeQuery("select * from semregistration where id='"+user+"'");
        result.next();
        String semister=result.getString(2);
        
        
        result=st.executeQuery("select * from courseinfo where semister='"+semister+"'");
    %>
    <h1 class="text-center mt-5 text-primary"> FACULTY FEEDBACK</h1>
    <form action="feedback" method="post">
    <table class="mt-5 container" cellpadding="7">  
        
        <tr class="">
            <th scope="col">Subject Name</th>
            <th scope="col">Faculty Name</th>
            <th scope="col">1. Whether the Syllabus and the Lecture Plan are provided at beginning of the course?</th>
            <th scope="col">2. Level of Instructor’s Communication and Presentation</th>
            <th scope="col">3. Level of Instructor’s Effectiveness in organizing the class</th>
            <th scope="col">4. Whether the instructor covered entire syllabus?</th>
            <th scope="col">5. Level of Instructor’s availability to the students outside the class room</th>
            </tr>            
        </tr>
    <%   while(result.next()){
            int count=1;
            String subCode=result.getString("subCode");
            
            %>
            <tr>
                <td><% out.println(result.getString("subName"));%></td>
                <td><input type="text" name="<%out.print(result.getString("subCode"));%>" required></td>
                <td>
                    <select name="<% out.print(subCode+count); count++ ;%>" class="form-select">
                        <option>Points</option>
                        <option value="ex">Excellent</option>
                        <option value="g">Good</option>
                        <option value="avg">Average</option>
                    </select>   
                </td>
                <td>
                    <select name="<% out.print(subCode+count); count++ ;%>" class="form-select">
                        <option>Points</option>
                        <option value="ex">Excellent</option>
                        <option value="g">Good</option>
                        <option value="avg">Average</option>
                    </select>   
                </td>
                <td>
                    <select name="<% out.print(subCode+count); count++ ;%>" class="form-select">
                        <option>Points</option>
                        <option value="ex">Excellent</option>
                        <option value="g">Good</option>
                        <option value="avg">Average</option>
                    </select>   
                </td>
                <td>
                    <select name="<% out.print(subCode+count); count++ ;%>" class="form-select">
                        <option>Points</option>
                        <option value="ex">Excellent</option>
                        <option value="g">Good</option>
                        <option value="avg">Average</option>
                    </select>   
                </td>
                <td>
                    <select name="<% out.print(subCode+count); count++ ;%>" class="form-select">
                        <option>Points</option>
                        <option value="ex">Excellent</option>
                        <option value="g">Good</option>
                        <option value="avg">Average</option>
                    </select>   
                </td>
            </tr>
            
            
        <%}
        
    %>
        
    </table>   
    <center><input type="submit" value="submit" class="text-center px-5 py-2 bg-success mt-3 text-light"></center>
    </form>
    <br><br><Br><Br>
    </body>
</html>
