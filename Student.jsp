<%-- 
    Document   : Student
    Created on : 13-Dec-2023, 10:11:34 pm
    Author     : suhan
--%>
<%@ page import="java.io.*, java.util.Base64" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="con.DBconnect" %>
<%@page import="jakarta.servlet.http.HttpSession" %>
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
                margin:0px;
                
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
            .card{
                padding:1.5em .5em .5em;
                text-align:center;
                border-radius:2em;
                
                box-shadow:0 5px 10px rgba(0,0,0, .2);
            }    
            .container-main{
                margin-top: 100px;
            }
            .query-container{
            margin-top: 150px; 
            margin-left: 250px ;
            max-height: 250vh;
            padding: 50px;
            width: 800px;
            border-top-right-radius: 35px;
            border-bottom-left-radius: 35px;
            box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.5);
           
            
        }
        .bg-blur{
            
            background-color:rgba(116, 100, 100, 0.3);
            backdrop-filter:blur(10px);
            box-shadow: antiquewhite;
        }
        .submit-btn{
            position: relative;

        }
        #attendance-main tr{
            border:2px solid black;
            text-align: center;       
        }

        

        </style>
            
    </head>
    <body>
        <%  
            HttpSession ss=request.getSession();
            String user=(String)ss.getAttribute("user");
            DBconnect db=new DBconnect();
            ResultSet res=null;
            try{
                Statement stmt1=db.setConnection();
                res=stmt1.executeQuery("select * from admission where idnumber='"+user+"'");
                res.next();
                
            }catch(Exception e){
            }
        %>
        
        <nav class="navbar navbar-expand-lg " id="navbar">
                        <p class="nav-item ms-3 mt-3 me-3"><a href="#" class="nav-link" id="home" title="Home"><b><i class="fas fa-home"></i></b></a></p>

                <div class="container-fluid ">
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-col" >
                    <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse" id="navbar-col">
                    <ul class="navbar-nav navbar-pills mx-auto">
                      
                        <li class="nav-item me-3">
                            <a href="#" class="nav-link" id="sem-registration"><b>Sem Registration</b></a>
                        </li>
                        <li class="nav-item me-3">
                            <a href="#" class="nav-link " id="course-info"><b>Course Info</b></a>
                        </li>
                        <li class="nav-item me-3">
                            <a href="#" class="nav-link " id="exam-results"><b>Exam Results</b></a>
                        </li>
                        <li class="nav-item me-3">
                            <a href="#" class="nav-link " id="attendance"><b>Attendance</b></a>
                        </li>
                        <li class="nav-item me-3">
                            <a href="#" class="nav-link " id="request-fund"><b>Request Fund</b></a>
                        </li>
                        <li class="nav-item me-3">
                            <a href="#" class="nav-link " id="query"><b>Raise A Query</b></a>
                        </li>
                        <li class="nav-item me-3">
                            <a href="#" class="nav-link " id="faculty-feedback"><b>Faculty Feedback</b></a>
                        </li>

                    </ul>
                  </div>
                    
                  <p class="nav-item ms-auto mt-3 me-3"><a href="#" class="nav-link" id="user-icon"><b><i class="fas fa-user"></i></b></a></p>
                   
                </div>
            </nav>

        
        <div id="sem-registration-main" >
            <div class="container container-main">
            
                <div class="row gy-3">
                    <div class="col-sm">
                        <div class="card h-100">
                            <div class="card-body">
                                <img src="Images/S_letter.jpeg" class="img-fluid" alt="...">
                            <h5 class="card-title">AY2023-2024</h5>
                            <p class="card-text">SEM REGISTRATION</p>
                            <a href="sem.jsp" class="btn btn-primary">Click here to Register</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm">
                    <div class="card h-100" >
                        <div class="card-body">
                            <img src="Images/r.webp" class="image-fluid" alt="...." height="250">
                         <h5 class="card-title">REMEDIAL REGISTRATION</h5>
                         <p class="card-text">If is there any Remedials you have then you can register here...!</p>
                        <a href="#" class="btn btn-primary">Click here to Register</a>
                        </div>
                    </div>
                </div>
                <div class="col-sm">
                    <div class="card h-100">
                        <div class="card-body">
                            <img src="Images/reg.webp" class="image-fluid" alt="....">
                            <h5 class="card-title">Registered Now</h5>
                        </div> 
                    </div>
                </div>
                
                </div>
            </div>
        </div>
        
        <div id="course-info-main" >
          <div class="container container-main text-center">
  <div class="row">
    <div class="col-sm">
      <div class="card  offset-2" style="width: 24rem;" >
          <div class="card-body">
              <div class="card-img-top">
                    <div>
                                    <% String url = "jdbc:mysql://localhost:3306/project";
                                    String username = "root";
                                    String password = "1234";

                                    Connection connection = null;
                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        connection = DriverManager.getConnection(url, username, password);

                                        // Replace "your_table" and "image_column" with your actual table and column names
                                        String sql = "SELECT photo FROM profiles where id='"+user+"'";
                                        try (PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
                                            // Set the image ID (replace 1 with the actual image ID)
                                            //preparedStatement.setInt(1, 1);

                                            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                                                if (resultSet.next()) {
                                                    // Retrieve image data
                                                    byte[] imageData = resultSet.getBytes("photo");

                                                    // Convert image data to Base64
                                                    String base64Image = Base64.getEncoder().encodeToString(imageData);

                                                    // Display the image on the web page
                                %>
                                <img src="data:image/jpeg;base64,<%= base64Image %>" class="card-img-top" alt="..." width="150px" height="300px">
                                <%
                                                } else {
                                                    out.println("Image not found");
                                                }
                                            }
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>
                        </div>
                            
                            
              </div>
                       
                         
                            <h5 class="card-title">PROFILE</h5>
                            <p class="card-text"><b>Name : </b><% out.println( res.getString("name"));%><br><b>ID NO : </b><% out.println( res.getString("idnumber"));%><br><b> DOB : </b><% out.println( res.getString("dob"));%></p>
                
                <button type="button" class="btn btn-success btn-large" data-bs-toggle="modal" data-bs-target="#staticBack">
                  Update Profile
                </button>

                <!-- Modal -->
                <div class="modal fade" id="staticBack" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackLabel" aria-hidden="true">
                  <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                      <div class="modal-header">
                          <h5 class="modal-title" id="staticBackLabel"><center>Upload Profile</center></h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                      </div>
                      <div class="modal-body">
                          <form action="uploadStudentProfile" method="post" enctype="multipart/form-data">
                              <b>Upload the profile pic :</b><input type="file" name="photo"><br><br>
                              <input type="submit" value="Update" class="w-50 mt-5 mx-auto form-control bg-success ">
                          </form>
                      </div>

                    </div>
                  </div>
                </div>
                
                
                          </div>
                    </div>
    </div>
    <div class="col-lg">
      <table class="table" width="150px" height="500" style="margin-top:50px">
            <thead>
              <tr>  
                <th scope="col">SUBCODE</th>
                <th scope="col">SUBJETS</th>
                <th scope="col">CREDITS</th>
                
              </tr>
            </thead>
            <tbody>

              <% try{
                  Statement stmt2=db.setConnection();
                  ResultSet res2=stmt2.executeQuery("select * from semregistration where id='"+user+"'");
                  res2.next();
                  String year=res2.getString("year");
                  out.println("<h3>CURRENT STUDYING "+year+"</h3>");
                  ResultSet res3=stmt2.executeQuery("select * from courseinfo where semister='"+year+"'");
                  
                  while(res3.next()){%>
                  <tr>
                      <td><% out.println(res3.getString("subCode")); %></td>
                      <td><% out.println(res3.getString("subName")); %></td>
                      <td><% out.println(res3.getString("credits")); %></td>
                  </tr>
                  <%}
              }catch(Exception e){
                  
               }%>
            </tbody>
          </table>
            </div>
          </div>
    
  </div>
</div>
            
        </div>
        </div><!-- comment -->
        
        
        <div id="exam-results-main">
           
            <div class="container">
                <table class="table" style="margin-top:50px">
                  <thead>
                    <tr>  
                      <th scope="col">SUBJECT CODE</th>
                      <th scope="col">SUBJECT</th>
                      <th>AT-1</th>
                      <th>AT-2</th>
                      <th>BO-ATs</th>
                      <th>MID-1</th>
                      <th>MID-2</th>
                      <th>MID-3</th>
                      <th>BOM</th>
                      <th>SEM</th>

                    </tr>
                  </thead>
                  <tbody>

                    <% try{
                        Statement stmt2=db.setConnection();
                        Statement stmt3=db.setConnection();

                        ResultSet res3=stmt2.executeQuery("select * from marks where id='"+user+"'");
                        
                        while(res3.next()){%>
                        <tr>
                            <%
                                int at1=res3.getInt("at1");
                                int at2=res3.getInt("at2");
                                int mid1=res3.getInt("mid1");
                                int mid2=res3.getInt("mid2");
                                int mid3=res3.getInt("mid3");
                                int sem=res3.getInt("sem");

                            %>
                            <td><% 
                                    String subcode=res3.getString("subject");
                                    ResultSet res4=stmt3.executeQuery("select * from courseinfo where subCode='"+subcode+"'");
                                    out.println(subcode);
                                %></td>
                            <td><% while(res4.next()){
                                        out.println(res4.getString("subName"));
                                   }

                            %></td>

                            <td><% 
                                   if(at1!=0){
                                    out.println(at1);
                                    }
                                %>
                            </td>
                            <td><% 
                                   if(at2!=0){
                                    out.println(at2);
                                    }
                                %>
                            </td>

                            <td>
                                <%int boats=0;
                                if(at1>=at2){
                                    boats+=at1;
                                }
                                else{
                                    boats+=at2;
                                }
                               
                                out.println(boats);%>
                            </td>
                            
                            <td><% 
                                   if(mid1!=0){
                                    out.println(mid1);
                                    }
                                %>
                            </td>
                            <td><% 
                                   if(mid2!=0){
                                    out.println(mid2);
                                    }
                                %>
                            </td>
                            <td><% 
                                   if(mid3!=0){
                                    out.println(mid3);
                                    }
                                %>
                            </td>
                            <td>
                                <%int bomds=0;
                                if(mid1>mid2 && mid1>mid3){
                                    bomds+=mid1;
                                    if(mid2>mid3){
                                        bomds+=mid2;
                                    }
                                    else{
                                        bomds+=mid3;
                                    }
                                }
                                else if(mid2>mid1 && mid2>mid3){
                                    bomds+=mid2;
                                    if(mid1>mid3){
                                        bomds+=mid1;
                                    }
                                    else{
                                        bomds+=mid3;
                                    }
                                }
                                else if(mid3>mid1 && mid3>mid1){
                                    bomds+=mid3;
                                    if(mid1>mid2){
                                        bomds+=mid1;
                                    }
                                    else{
                                        bomds+=mid2;
                                    }
                                }                                
                                out.println(bomds);%>
                            </td>
                            <td><% 
                                   if(sem!=0){
                                    out.println(sem);
                                    }
                                %>
                            </td>
                            

                        </tr>
                        <%}
                    }catch(Exception e){

                     }%>
                  </tbody>
                </table>
            </div>
        </div><!-- comment -->
        
        
        
        <div id="attendance-main">
            
           <%
               Statement stmte1=db.setConnection();
               Statement stmte2=db.setConnection();
               ResultSet resul=stmte1.executeQuery("select * from semregistration where id='"+user+"'");
               String studsem=null;
               while(resul.next()){
                    studsem=resul.getString("year");
               }
               ResultSet resul2=stmte1.executeQuery("select * from courseinfo where semister='"+studsem+"'");
           %> 
           <table align="center" cellpadding="10" class="mt-5">
               <tr class="bg-secondary">
                   <th>SubjectName</th>
                   <th>SubjectCode</th>
                   <th>Total Number Of classes</th>
                   <th>Number Of Classes Present</th>
                   <th>Number Of classes Absent</th>
                   <th>Percentage</th>
               </tr>
               <%
                   while(resul2.next()){%>
                   <tr>
                       <% String subcode=resul2.getString("subCode");%>
                       <td><% out.println(resul2.getString("subName")); %></td>
                       <td><% out.println(subcode); %></td>
                       <% 
                           ResultSet resul3=null;
                           resul3=stmte2.executeQuery("select count(*) from attendance where studentid='"+user+"' and subject='"+subcode+"'"); 
                           resul3.next();
                           int no_of_classes=resul3.getInt(1);
                           
                           resul3=stmte2.executeQuery("select count(*) from attendance where studentid='"+user+"' and subject='"+subcode+"' and status='present'"); 
                           resul3.next();
                           int no_of_presents=resul3.getInt(1);
                           
                           float percentage=(float)no_of_presents/no_of_classes*100;
                       %>
                       <td><% out.println(no_of_classes);%></td>
                       <td><% out.println(no_of_presents);%></td>
                       <td><% out.println(no_of_classes-no_of_presents);%></td>
                       <td><% out.println(percentage);%></td>
                   </tr>
                   <%}
               %>
           </table> 
            

        </div>
           
           
           
           
    <!--Fund request-->
        <div id="request-fund-main">
            <div class="container query-container bg-blur">
        
        <!-- <h3>Raise Your Query!</h3> -->
        <form action="sample2" method="post">
                <h2 class="text-center">Request for funds</h2><br>
              <div class="mb-3">
                  
                <div class="mb-3">
                    <label for="eventName" class="form-label" ><h5>Event Name</h5></label>
                    <input type="text" class="form-control" id="eventName" name="eventName" required>
                  </div>
                  <div class="mb-3">
                      <label for="purpose" class="form-label"><h5>Purpose</h5></label>
                    <textarea class="form-control" id="purpose" rows="5" name="purpose" required></textarea>
                  </div>
                  <div class="mb-3">
                    <label for="amount" class="form-label"><h5>Amount</h5></label>
                    <input type="number" step="1000" class="form-control" id="amount" name="amount" required>
                  </div>
                  <div class="d-flex justify-content-end">
                    <button type="submit" class="btn btn-primary  mt-3">Request Fund</button>
                </div>
              </div>
                
        </form>
        
        <table align="center" class="mt-5" cellpadding="20" width="100%">
            <tr class="bg-secondary">
                <th>event</th>
                <th>purpose</th>
                <th>amount</th>
                <th>description</th>
                <th>status</th>
            </tr>
            <%
            try{
           
                Statement stmt5=db.setConnection();
                ResultSet res5=stmt5.executeQuery("select * from requestfunds where id='"+user+"'");
                while(res5.next()){%>
                <tr class="text-center" style="border:1px solid black;">
                        <td><% out.println(res5.getString("event")) ; %></td>
                        <td><% out.println(res5.getString("purpose")) ; %></td>
                        <td><% out.println(res5.getString("amount")) ; %></td>
                        <td><% out.println(res5.getString("description")) ; %></td>
                        <td><% out.println(res5.getString("status")) ; %></td>
                        
                </tr>
                <%}
            }catch(Exception e){}
            %>
        </table>
    </div>
        </div><!-- comment -->
        
        
        
        
        
        
        
        
        <div id="raise-query-main">
            <div class="container query-container bg-blur">
        
        <!-- <h3>Raise Your Query!</h3> -->
        <form action="saveQuery" method="post">
            
              <div class="mb-3">
                <label for="FormControlTextarea" class="form-label"><h3>Raise a Query</h3></label>
                <textarea class="form-control" id="FormControlTextarea" rows="8" required name="queryField"></textarea>
                <div class="d-flex justify-content-end">
                    <button type="submit" class="btn btn-primary  mt-3">Submit the Query</button>
                </div>
              </div>
        </form>
        
        <table align="center" class="mt-5" cellpadding="20" width="100%">
            <tr class="bg-secondary">
                <th>Query</th>
                <th>Description</th>
                <th>Status</th>
            </tr>
            
            <%
            try{
                Statement stmt6=db.setConnection();
                ResultSet res6=stmt6.executeQuery("select * from studqueries where studentid='"+user+"'");
                while(res6.next()){%>
                <tr class="text-center" style="border:1px solid black;">
                        <td><% out.println(res6.getString("query")) ; %></td>
                        <td><% out.println(res6.getString("description")) ; %></td>
                        
                        <td><% out.println(res6.getString("status")) ; %></td>
                        
                </tr>
                <%}
            }catch(Exception e){}
            %>
        </table>

        
            </div>
        </div>
        
        
        
        
        
        
        <div id="faculty-feedback-main">
            <div class="container container-main text-center">
  <div class="row">
    <div class="col-sm">
      <div class="card  offset-4" style="width: 24rem;" >
          <div class="card-body">
              <h5 class="card-title">Faculty Feedback</h5>
              <div class="card-img-top">
                  <img src="Images/fax-1889009_640.jpg" class="card-img-top" alt="..." width="12rem">
              </div>
                    
                    <a href="Feedback.jsp" class="btn btn-primary">Give Feedback</a>
            </div>
                    </div>
    </div>
   </div>
        </form>
    </div>
        </div>
        
        <script>
            var sem=document.getElementById('sem-registration');
            var course=document.getElementById('course-info');
            var exam=document.getElementById('exam-results');
            var attendance=document.getElementById('attendance');
            var fund=document.getElementById('request-fund');
            var query=document.getElementById('query');
            var feedback=document.getElementById("faculty-feedback");

            
                document.getElementById('sem-registration-main').style.display="none";
                document.getElementById('course-info-main').style.display="flex";
                document.getElementById('exam-results-main').style.display="none";
                document.getElementById('attendance-main').style.display="none";
                document.getElementById('request-fund-main').style.display="none";
                document.getElementById('raise-query-main').style.display="none";
                document.getElementById('faculty-feedback-main').style.display="none";
                sem.style.color="white";
                course.style.color="#c0c2c0";
                exam.style.color="white";
                attendance.style.color="white";
                fund.style.color="white";
                query.style.color="white";
                feedback.style.color="white";
            sem.addEventListener('click',e=>{
                sem.style.color="white";
                course.style.color="#c0c2c0";
                exam.style.color="#c0c2c0";
                attendance.style.color="#c0c2c0";
                fund.style.color="#c0c2c0";
                query.style.color="#c0c2c0";
                feedback.style.color="#c0c2c0";
                document.getElementById('sem-registration-main').style.display="flex";
                document.getElementById('course-info-main').style.display="none";
                document.getElementById('exam-results-main').style.display="none";
                document.getElementById('attendance-main').style.display="none";
                document.getElementById('request-fund-main').style.display="none";
                document.getElementById('raise-query-main').style.display="none";
                document.getElementById('faculty-feedback-main').style.display="none";
            });
            
            course.addEventListener('click',e=>{
                sem.style.color="#c0c2c0";
                course.style.color="white";
                exam.style.color="#c0c2c0";
                attendance.style.color="#c0c2c0";
                fund.style.color="#c0c2c0";
                query.style.color="#c0c2c0";
                feedback.style.color="#c0c2c0";
                document.getElementById('sem-registration-main').style.display="none";
                document.getElementById('course-info-main').style.display="flex";
                document.getElementById('exam-results-main').style.display="none";
                document.getElementById('attendance-main').style.display="none";
                document.getElementById('request-fund-main').style.display="none";
                document.getElementById('raise-query-main').style.display="none";
                document.getElementById('faculty-feedback-main').style.display="none";
            });  
            
            exam.addEventListener('click',e=>{
                sem.style.color="#c0c2c0";
                course.style.color="#c0c2c0";
                exam.style.color="white";
                attendance.style.color="#c0c2c0";
                fund.style.color="#c0c2c0";
                query.style.color="#c0c2c0";
                feedback.style.color="#c0c2c0";
                document.getElementById('sem-registration-main').style.display="none";
                document.getElementById('course-info-main').style.display="none";
                document.getElementById('exam-results-main').style.display="flex";
                document.getElementById('attendance-main').style.display="none";
                document.getElementById('request-fund-main').style.display="none";
                document.getElementById('raise-query-main').style.display="none";
                document.getElementById('faculty-feedback-main').style.display="none";
            });  
            
            attendance.addEventListener('click',e=>{
                sem.style.color="#c0c2c0";
                course.style.color="#c0c2c0";
                exam.style.color="#c0c2c0";
                attendance.style.color="white";
                fund.style.color="#c0c2c0";
                query.style.color="#c0c2c0";
                feedback.style.color="#c0c2c0";
                document.getElementById('sem-registration-main').style.display="none";
                document.getElementById('course-info-main').style.display="none";
                document.getElementById('exam-results-main').style.display="none";
                document.getElementById('attendance-main').style.display="flex";
                document.getElementById('request-fund-main').style.display="none";
                document.getElementById('raise-query-main').style.display="none";
                document.getElementById('faculty-feedback-main').style.display="none";
            });  
            
            fund.addEventListener('click',e=>{
                sem.style.color="#c0c2c0";
                course.style.color="#c0c2c0";
                exam.style.color="#c0c2c0";
                attendance.style.color="#c0c2c0";
                fund.style.color="white";
                query.style.color="#c0c2c0";
                feedback.style.color="#c0c2c0";
                document.getElementById('sem-registration-main').style.display="none";
                document.getElementById('course-info-main').style.display="none";
                document.getElementById('exam-results-main').style.display="none";
                document.getElementById('attendance-main').style.display="none";
                document.getElementById('request-fund-main').style.display="flex";
                document.getElementById('raise-query-main').style.display="none";
                document.getElementById('faculty-feedback-main').style.display="none";
            }); 
            query.addEventListener('click',e=>{
                  sem.style.color="#c0c2c0";
                course.style.color="#c0c2c0";
                exam.style.color="#c0c2c0";
                attendance.style.color="#c0c2c0";
                fund.style.color="#c0c2c0";
                query.style.color="white";
                feedback.style.color="#c0c2c0";
                document.getElementById('sem-registration-main').style.display="none";
                document.getElementById('course-info-main').style.display="none";
                document.getElementById('exam-results-main').style.display="none";
                document.getElementById('attendance-main').style.display="none";
                document.getElementById('request-fund-main').style.display="none";
                document.getElementById('raise-query-main').style.display="flex";
                document.getElementById('faculty-feedback-main').style.display="none";
            });
            feedback.addEventListener('click',e=>{
                  sem.style.color="#c0c2c0";
                course.style.color="#c0c2c0";
                exam.style.color="#c0c2c0";
                attendance.style.color="#c0c2c0";
                fund.style.color="#c0c2c0";
                query.style.color="#c0c2c0";
                feedback.style.color="white";         
                document.getElementById('sem-registration-main').style.display="none";
                document.getElementById('course-info-main').style.display="none";
                document.getElementById('exam-results-main').style.display="none";
                document.getElementById('attendance-main').style.display="none";
                document.getElementById('request-fund-main').style.display="none";
                document.getElementById('raise-query-main').style.display="none";
                document.getElementById('faculty-feedback-main').style.display="flex";
                
            });
             
        </script>
    </body>
</html>


