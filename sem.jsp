<%-- 
    Document   : sem
    Created on : 18-Dec-2023, 12:48:54 pm
    Author     : suhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="con.DBconnect" %>
<%@page import="jakarta.servlet.http.HttpSession" %>
<%@page import="java.util.*,java.text.*"%>
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Comaptible" content="IE=edge">
        <title>UDMS</title>
        <meta name="desciption" content="Coding collegues">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <style>
            body{
                background-color:#dcf2e5;
                background:linear-gradient(to right,#bce3cc,#dcf2e5);

            }
            
            .navbar{

                background:linear-gradient(to right,#079440,#07b34c,#1bc41b);
                background:linear-gradient(to right,#079440,#07b34c,#1bc41b);
    background:linear-gradient(to right,#52c441,#48bf36,#62eb4d);

                box-shadow: inset 0 0 5px rgb(0,0,0.4) , 0 0 10px rgba(153, 184, 180, 0.4);

            }
            .navbar .fas{
                font-size:30px;
            }
        </style>
        <script>
            
        </script>
      
    </head>
    <body>
        
        <% 
            HttpSession ss=request.getSession();
            String user=(String)ss.getAttribute("user");
            DBconnect db=new DBconnect();
            ResultSet res=null;
            String batch=user.substring(0,3);
            String year=null;
            String currentdate="";
            java.util.Date thisDate=new java.util.Date();
            SimpleDateFormat dateForm=new SimpleDateFormat("dd/MM/YYYY");
            currentdate=dateForm.format(thisDate);
            currentdate="02/07/23";
            //out.println(currentdate);
            
            String[] dateSplit=currentdate.split("/");
            int todayDate=Integer.parseInt(dateSplit[0]);
            int currentMonth=Integer.parseInt(dateSplit[1]);
            //out.println(todayDate+" "+currentMonth);
            String semister="";
            if(currentMonth>=1 && currentMonth<=6){
                semister="S2";
            }
            else{
                semister="S1";
            }
            //out.println(semister);
            if(batch.equals("R21") || batch.equals("r21")){
                year="E1"+semister;
            }
            else if(batch.equals("R20") || batch.equals("r20")){
                year="E2"+semister;
            }
            else if(batch.equals("R19") || batch.equals("r19")){
                year="E3"+semister;
            }
            else if(batch.equals("R18") || batch.equals("r18")){
                year="E4"+semister;
            }
            //out.println(year+" "+batch);
            String idnumber=null;
            try{
                Statement stmt1=db.setConnection();
                Statement stmt2=db.setConnection();
                ResultSet res2=null;
                res2=stmt2.executeQuery("select * from semregistration where id='"+user+"' and year='"+year+"'");
                while(res2.next()){
                    idnumber=res2.getString(1);
                }
                res=stmt1.executeQuery("select * from courseinfo where semister='"+year+"'");

            }catch(Exception e){}
        %>
                    <nav class="navbar navbar-expand-lg " id="navbar">
                        <p class="nav-item ms-3 mt-3 me-3"><a href="navbar.html#sem-registration-main" class="nav-link" id="home" title="Home"><b><i class="fas fa-home"></i></b></a></p>

                <div class="container-fluid ">
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-col" >
                    <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse" id="navbar-col">
                    <ul class="navbar-nav navbar-pills mx-auto">
                      
                        

                    </ul>
                  </div>
                  
                </div>
            </nav>
       
        <center>
            <div class="card mt-5" style="width: 45rem;">
                <div class="card-body">
                    <h3 class="card-title">SEM REGISTRATION <% out.println(year); %></h3>
             
            <%
            try{
                if(idnumber!=null){
                    out.println("<h3>Already Registerd</h3>");
                }
                while(res.next()){%>
             <select class="form-select mt-3 " style="background-color:#dcf2e5"aria-label="Default select example">
                <option selected>  &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <% out.print(res.getString("subName")+" -"+res.getString("credits")); %> credits &nbsp;  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </option>
                
             </select><br>

             
             <%}}
             catch(Exception e){}%>

            <% if(idnumber==null){%>
                <a href="semRegistration?year=<% out.print(year);%> ">Register</a>   
            <%}
            %>


                    
                </div>
            </div>
       
        </center>

    </body>
</html>

