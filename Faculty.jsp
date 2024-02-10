<%-- 
    Document   : Faculty
    Created on : 15-Dec-2023, 2:08:39 pm
    Author     : suhan
--%>
<%@ page import="java.io.*, java.util.Base64" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="con.DBconnect" %>
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
            .query-container{
            margin: 80px 0px; 
            margin-left: 250px ;
            max-height: 150vh;
            padding: 30px;
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
        .project-publication tr{
            border:1px solid black;
            text-align: center;
        }
        #publicationsbtn{
            text-decoration: none;
            border-radius: 10px;
        }
        .sub-request{
            text-align: center;
            border:2px solid black;
            border-radius:40px;
        }
        </style>
            
    </head>
    <body>
        
        <%
                HttpSession ss=request.getSession();
                String faculty=(String)ss.getAttribute("faculty");
            DBconnect db=new DBconnect();
            
            Connection conn=null;
            Statement st=null;
            ResultSet result=null;
            ResultSet result1=null;
            try{
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","1234");
                st=conn.createStatement();            
            }catch(Exception e){}
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
                            <a href="#" class="nav-link" id="Projects-Publications"><b>Profile</b></a>
                        </li>
                        <li class="nav-item me-3">
                            <a href="#" class="nav-link " id="Request-to-Leave"><b>Request to Leave</b></a>
                        </li>
                        <li class="nav-item me-3">
                            <a href="#" class="nav-link " id="Upload-Marks"><b>Upload Marks</b></a>
                        </li>
                        <li class="nav-item me-3">
                            <a href="#" class="nav-link " id="Upload-Attendance"><b>Upload Attendance</b></a>
                        </li>
                        <li class="nav-item me-3">
                            <a href="#" class="nav-link " id="Request-fund"><b>Request Fund</b></a>
                        </li>
                        <li class="nav-item me-3">
                            <a href="#" class="nav-link " id="Request-subject"><b>Request Subject</b></a>
                        </li>
                    </ul>
                  </div>
                  <p class="nav-item ms-auto mt-3 me-3"><a href="#" class="nav-link" id="user-icon"><b><i class="fas fa-user"></i></b></a></p>
                  
                </div>
            </nav>

                    
                    
        <%
            ResultSet resu=null;
            ResultSet resu2=null;
            try{
                Statement stmte1=db.setConnection();
                Statement stmte2=db.setConnection();

                resu=stmte1.executeQuery("select * from facultyadmission where facultyid='"+faculty+"'");
                resu.next();
                resu2=stmte2.executeQuery("select * from subjectallocation where facultyid='"+faculty+"' and status='allocated'" );
                
            }catch(Exception e){}
        %>
        <div id="projects & publications-main" class="project-publication mx-auto">
            
            <div class="text-center mx-auto mt-5">
                <div class=" text-center mx-auto" style="width:500px" >
                        <div class="row bg-light p-3" style="border-radius:20px">
                            
                            <div class="col col-md-5">
                                    <% String url = "jdbc:mysql://localhost:3306/project";
                                    String username = "root";
                                    String password = "1234";

                                    Connection connection = null;
                                    try {
                                        Class.forName("com.mysql.cj.jdbc.Driver");
                                        connection = DriverManager.getConnection(url, username, password);

                                        // Replace "your_table" and "image_column" with your actual table and column names
                                        String sql = "SELECT photo FROM profiles where id='"+faculty+"'";
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
                                <img src="data:image/jpeg;base64,<%= base64Image %>" class="card-img-top" alt="..." width="150px" height="150px">
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

                            <div class="col col-md-5">
                            <h5 class="card-title">PROFILE</h5>
                            <p class="card-text mt-2"><b>Name : </b><% out.println( resu.getString("name"));%><br><b>ID : </b><% out.println( resu.getString("facultyid"));%><br><b> DOB : </b><% out.println( resu.getString("dob"));%></p>
                            <p><b>Subjects:</b> <% while(resu2.next()){
                                    out.println(resu2.getString("subName")+", ");
                                }%>
                            </p>
                            <button type="button" class="btn btn-success btn-large" data-bs-toggle="modal" data-bs-target="#profileblock">
                                Update profile
                            </button>
                                <div class="modal fade" id="profileblock" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackLabel" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered">
                                  <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackLabel"><center>Add Profile Photo</center></h5>
                                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <form method="post" action="uploadProfile" enctype="multipart/form-data">
                                            Upload File:
                                            <input type="file" name="photo" class="form-control py-2"/><br>
                                            <input type="submit" value=" Update ">

                                        </form>
                                    </div>

                                  </div>
                                </div>
                              </div>
                            
                            
                            </div>
                          </div>
                </div>           
                              <br><br>
          <div class="mt-5">
            <h1>Projects And Publications</h1>
            <table  align="center" cellpadding="20" class="mx-auto my-5" width="100%" >

                <tr class="bg-secondary">
                    <th>Project Title</th>
                    <th>Project Description</th><!-- comment -->
                    <th>Result</th>
                    <th>status</th>
                    <th></th><!-- comment -->
                    <th></th>
                </tr>
                <%try{
                    result=st.executeQuery("select * from projectspublication where status='currently working'");
                    Statement st2=conn.createStatement();
                    result1=st2.executeQuery("select * from projectspublication where status!='currently working'");
                    while(result.next()){%>
                    <tr>
                        <td><b><% out.println(result.getString("title")); %></b></td>
                        <td><b><% out.println(result.getString("description")); %></b></td>
                        <td><b><% out.println(result.getString("result")); %></b></td>
                        <td><b><% out.println(result.getString("status")); %></b></td>
                        <td><a href="PublicationFile.jsp?projectno=<%out.print(result.getInt("projectno")); %>" id="publicationsbtn" class="bg-success p-2 list-style-none text-dark"><b>publication</b></a></td>
                    </tr>
                <% }
                    while(result1.next()){%>
                    <tr>
                        <td><b><% out.println(result1.getString("title")); %></b></td>
                        <td><b><% out.println(result1.getString("description")); %></b></td>
                        <td><b><% out.println(result1.getString("result")); %></b></td>
                        <td><b><% out.println(result1.getString("status")); %></b></td>
                        <td><a href="downloadFile?projectno=<%out.print(result1.getInt("projectno")); %>" id="publicationsbtn" class="bg-warning p-2 list-style-none text-dark">Source Code</a></td>
                    </tr>                  
                    <%}
                
                }catch(Exception e){}                    
%>   <br> 
                 
                 <button type="button" class="btn btn-success btn-large" data-bs-toggle="modal" data-bs-target="#staticBack">
                    Add New Project
                  </button>

                  <div class="modal fade" id="staticBack" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                      <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="staticBackLabel"><center>Add Project Details</center></h5>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="AddProject" method="post">
                                      <input type="text" class="form-control py-2" name="ptitle" placeholder="Project Title" required/><br><br>
                                      <input type="text" class="form-control py-2" name="pdescription" placeholder="Project Description" required>
                                      <input type="submit" value="Update" class="w-50 mt-5 mx-auto form-control bg-success ">
                            </form>
                        </div>

                      </div>
                    </div>
                  </div>                 

                 
                 
            </table>
            </div>
          </div>

<div class="image-profile" id="image-profile">
    
</div>


        </div>
            
            
            
        <div id="request-to-leave-main">
            <div class="container query-container bg-blur">
        
        <!-- <h3>Raise Your Query!</h3> -->
        <form action="requestLeave" method="post">
                <h2 class="text-center">Request Leave</h2><br>
              <div class="mb-3">
                <div class="mb-3">
                    <div class="row gx-3">
                        <div class="col-md-6">
                            <label for="fromDate" class="form-label"><h5>From: </h5></label>
                            <input type="date" class="form-control" id="fromDate" name="fromdate">
                        </div>
                        <div class="col-md-6">
                            <label for="toDate" class="form-label"><h5>To: </h5></label>
                            <input type="date" class="form-control" id="toDate" name="todate" >
                        </div>
                    </div>
                    
                    
                  </div>
                  <div class="mb-3">
                    <label for="purpose" class="form-label">Purpose for the Leave</label>
                    <textarea class="form-control" id="purpose" rows="5" name="purpose"></textarea>
                  </div>
                  
                  <div class="d-flex justify-content-end">
                    <button type="submit" class="btn btn-primary  mt-3">Request Leave</button>
                </div>
              </div>

        </form>
                <table align="center" class="mt-5" cellpadding="20" width="100%">
                    <tr class="bg-secondary">
                        <th>From Date</th>
                        <th>To Date</th>
                        <th>purpose</th><!-- comment -->
                    </tr>
                    <%
                        result=st.executeQuery("select * from facultyleave where id='"+faculty+"'");
                        while(result.next()){%>
                        <tr>
                            <td><%out.println(result.getString("fromdate")); %></td>
                            <td><%out.println(result.getString("todate")); %></td>
                            <td><%out.println(result.getString("purpose")); %></td>
                        </tr>
                        <%}
                    %>
                </table>
    </div>


           
        </div><!-- comment -->
        <div id="upload-marks-main">
           <div class="container query-container bg-blur">
        
        <!-- <h3>Raise Your Query!</h3> -->
        <form action="uploadMarks" method="post">
                <h2 class="text-center">Upload Marks of the Student</h2><br>
              <div class="mb-3">
                
                  <div class="mb-3">
                      
                    <select class="form-select" id="semmarks" name="semsDropdown" onchange="marksChange()">
                      <option>SEMISTER</option>
                    <option value="E1S1">E1S1</option>
                    <option value="E1S2">E1S2</option>
                    <option value="E2S1">E2S1</option>
                    <option value="E2S2">E2S2</option>
                    <option value="E3S1">E3S1</option>
                    <option value="E3S2">E3S2</option>
                    <option value="E4S1">E4S1</option>
                    <option value="E4S2">E4S2</option>
                  </select>
                    <br>
                  <div id="subjectsDrop">
                      <select id="subjectmarks" name="subjectsDropdown" class="form-select">
                          <option>Subjects</option>
                      </select>
                  </div>
                    
                    
                    <!--<label for="subject" class="form-label"><h5>Subject :</h5></label>
                    <select name="subject" class="form-select select-style" style="display :inline-block;">
                        <optgroup label="SUBJECTS">
                          <option value="se ">se</option>
                          <option value="os">os</option>
                          <option value="cn">cn</option>
                          <option value="mfds">mfds</option>
                          <option value="dm">dm</option>
                          
                        </optgroup>
                        <optgroup label="LABS">
                          <option value="os_lab">os_lab</option>
                          <option value="se_lab">se_lab</option>
                          <option value="cn_lab">cn_lab</option>
                          
                        </optgroup>
                        
                      </select>-->
                      
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                        <div class="mb-3">
                            <select name="tests" class="form-select select-style" onchange="marksStudentChange()" style="display :inline-block;">
                                <option>EXAM</option>
                                <optgroup label="ATs">
                                    <option value="at1">AT1</option>
                                    <option value="at2">AT2</option>
                                    
                                </optgroup>
                                <optgroup label="Mids">
                                  <option value="mid1">Mid1</option>
                                  <option value="mid2">Mid2</option>
                                  <option value="mid3">Mid3</option>
                                </optgroup>
                                <option value="sem">SEM</option>  
                            </select>    
                        </div>
                    </div>
                    
            <%try{
                Statement stmt=db.setConnection();
                ResultSet res=stmt.executeQuery("select * from semregistration");
                while(res.next()){%>
                <div class="gy-2" id="studentmarks">
                    <b><%//out.println(res.getString("id")+" : ");%></b>                    
                    <!--<input type="number" style="width:200px" class="ms-3" name="<%//out.print(res.getString("id"));%>">-->
                </div>   
                <br>
               <%}
           }catch(Exception e){
           }%>                     
                      
                      
                      
                      
                </div>
                  
                  
                    
                  </div>
                  <div class="d-flex justify-content-end">
                    <button type="submit" class="btn btn-primary  mt-3">Upload Marks</button>
                </div>
              </div>

        </form>
    </div>
        </div><!-- comment -->
        <div id="upload-attendance-main">
           <div class="container query-container bg-blur" style="width:600px;margin: auto;margin-top: 130px;margin-bottom: 130px;">
        
        <!-- <h3>Raise Your Query!</h3> -->
       <!-- <form action="#" method="post">
                <h2 class="text-center">Upload Attendance</h2><br>
              <div class="mb-3">
                <div class="mb-3">
                    <label for="sid" class="form-label"><h5>Student's Id :</h5></label>
                    <input type="text" class="form-control" id="sid" >
                  </div>
                  <div class="mb-3">
                    
                        <label for="subject" class="form-label"><h5>Subject :</h5></label>
                        <select class="form-select select-style" style="display :inline-block;">
                            <optgroup label="SUBJECTS">
                              <option>se</option>
                              <option>os</option>
                              <option>cn</option>
                              <option>mfds</option>
                              <option>dm</option>
                              
                            </optgroup>
                            <optgroup label="LABS">
                              <option>os</option>
                              <option>se</option>
                              <option>cn</option>
                              
                            </optgroup>
                            
                          </select>
                          
                     
                  </div>
                  <div class="mb-3">
                            <label for="attDate" class="form-label"><h5>Date: </h5></label>
                            <input type="date" class="form-control" id="attDate" >     
                  </div>
                  <div class="mb-3">

                    <span><h5>Status :</h5></span>
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="status" id="present" value="option1" checked>
                                <label class="form-check-label" for="present">
                                  Present
                                </label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="status" id="absent" value="option2">
                                <label class="form-check-label" for="absent">
                                  Absent
                                </label>
                            </div>
                        </div>
                    </div>
                    
                      
                  </div>
                    
                  </div>
                  <div class="d-flex justify-content-end">
                    <button type="submit" class="btn btn-primary  mt-3">Upload Attendance</button>
                </div>
              </div>

        </form>-->
       
       <form action="uploadAttendance" method="post">
           
           <select class="form-select" id="semattendance" name="semsDropdown" onchange="attendanceChange()">
                      <option>SEMISTER</option>
                    <option value="E1S1">E1S1</option>
                    <option value="E1S2">E1S2</option>
                    <option value="E2S1">E2S1</option>
                    <option value="E2S2">E2S2</option>
                    <option value="E3S1">E3S1</option>
                    <option value="E3S2">E3S2</option>
                    <option value="E4S1">E4S1</option>
                    <option value="E4S2">E4S2</option>
                  </select>
                    <br>
                  <div id="subjectsDrop">
                      <select id="subjectattendance" name="subjectsDropdown" class="form-select" onchange="studentattendanceChange()">
                          <option>Subjects</option>
                      </select>
                  </div>
                    
                    
            <div class="form-floating mb-3 col-md-12 mt-3">
                    <input type="date" class="form-control"  name="date" placeholder="Username or Id No">
                    <label for="username" class="label">date</label>
            </div>
            <div id="studentsAttendance">
                        
            </div>
           
           <%try{
                Statement stmt=db.setConnection();
                ResultSet res=stmt.executeQuery("select * from semregistration");
                while(res.next()){%>
                <b><%//out.println(res.getString("id")+" : ");%></b>
                    
                    <!--<select  style="width:200px" class="p-1" name="<%//out.print(res.getString("id"));%>">
                        <option value="present">present</option>
                        <option value="absent">absent</option>
                    </select>-->
                        
               <%}
           }catch(Exception e){
           }%>
           <br><br><input type="submit" value="upload" class="form-control col-md-4"/>
       </form>
           
    </div>
        </div>
        <div id="request-fund-main">
            <div class="container query-container bg-blur">
        
        <!-- <h3>Raise Your Query!</h3> -->
        <form action="sample3" method="post">
                <h2 class="text-center">Request for funds</h2><br>
              <div class="mb-3">
                <div class="mb-3">
                    <label for="eventName" class="form-label"><h5>Event Name</h5></label>
                    <input type="text" class="form-control" id="eventName" name="eventName">
                  </div>
                  <div class="mb-3">
                    <label for="purpose" class="form-label">Purpose</label>
                    <textarea class="form-control" id="purpose" rows="5" name="purpose"></textarea>
                  </div>
                  <div class="mb-3">
                    <label for="amount" class="form-label"><h5>Amount</h5></label>
                    <input type="number" step="1000" class="form-control" id="amount" name="amount">
                  </div>
                  <div class="d-flex justify-content-end">
                    <button type="submit" class="btn btn-primary  mt-3">Request Fund</button>
                </div>
              </div>

        </form>
        
         <table align="center" class="mt-5" cellpadding="20">
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
                ResultSet res5=stmt5.executeQuery("select * from requestfunds where id='"+faculty+"'");
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
        
        <div id="request-subject-main">
            <div class="container">
            <div class="container sub-request col-md-3  p-5 mt-5">
                <h4>Select The Subject</h4><br><br>
                <form action="subjectRequestSends" method="post">
                    <select class="form-select" id="semsDropdown" name="semsDropdown" onchange="SubjectsChange()">
                      <option>SEMISTER</option>
                    <option value="E1S1">E1S1</option>
                    <option value="E1S2">E1S2</option>
                    <option value="E2S1">E2S1</option>
                    <option value="E2S2">E2S2</option>
                    <option value="E3S1">E3S1</option>
                    <option value="E3S2">E3S2</option>
                    <option value="E4S1">E4S1</option>
                    <option value="E4S2">E4S2</option>
                  </select>
                    <br>
                  <div id="subjectsDrop">
                      <select id="subjectsDropdown" name="subjectsDropdown" class="form-select">
                          <option>Subjects</option>
                      </select>
                  </div>
                    
                    <br><Br>
                    <button type="submit" class="form-control bg-success"><b class="text-light">select</b></button>
                </form>
                
            </div>    
                
                
                <%
                    Statement stmt1=db.setConnection();
                    ResultSet res1=stmt1.executeQuery("select * from subjectallocation where facultyid='"+faculty+"'");
                %>
                <table align="center" class="mt-5" cellpadding="17">
                    <tr class="bg-secondary">
                        <th>SUBJECT CODE</th>
                        <th>SUBJECT NAME</th>
                        <th>STATUS</th>
                    </tr>
                    <%
                        while(res1.next()){%>
                        <tr>
                            <td><%out.println(res1.getString("subCode")); %></td>
                            <td><%out.println(res1.getString("subName")); %></td>
                            <td><%out.println(res1.getString("status")); %></td>
                        </tr>
                        <%}
                    %>
                </table>
                
                
                </div>
        </div>
            
            
        <script>
            var Projects=document.getElementById('Projects-Publications');
            var leave=document.getElementById('Request-to-Leave');
            var marks=document.getElementById('Upload-Marks');
            var attendance=document.getElementById('Upload-Attendance');
            var fund=document.getElementById('Request-fund');
            var subject=document.getElementById('Request-subject');
                        
                document.getElementById('projects & publications-main').style.display="flex";
                document.getElementById('request-to-leave-main').style.display="none";
                document.getElementById('upload-marks-main').style.display="none";
                document.getElementById('upload-attendance-main').style.display="none";
                document.getElementById('request-fund-main').style.display="none";
                document.getElementById('request-subject-main').style.display="none";
                
                Projects.style.color="#c0c2c0";
                leave.style.color="white";
                marks.style.color="white";
                attendance.style.color="white";
                fund.style.color="white";
                subject.style.color="white";
                
            Projects.addEventListener('click',e=>{
                Projects.style.color="white";
                leave.style.color="#c0c2c0";
                marks.style.color="#c0c2c0";
                attendance.style.color="#c0c2c0";
                fund.style.color="#c0c2c0";
                subject.style.color="#c0c2c0";
                
                document.getElementById('projects & publications-main').style.display="flex";
                document.getElementById('request-to-leave-main').style.display="none";
                document.getElementById('upload-marks-main').style.display="none";
                document.getElementById('upload-attendance-main').style.display="none";
                document.getElementById('request-fund-main').style.display="none";
                document.getElementById('request-subject-main').style.display="none";
            });
            
            leave.addEventListener('click',e=>{
                Projects.style.color="#c0c2c0";
                leave.style.color="white";
                marks.style.color="#c0c2c0";
                attendance.style.color="#c0c2c0";
                fund.style.color="#c0c2c0";
                subject.style.color="#c0c2c0";
                
                document.getElementById('projects & publications-main').style.display="none";
                document.getElementById('request-to-leave-main').style.display="flex";
                document.getElementById('upload-marks-main').style.display="none";
                document.getElementById('upload-attendance-main').style.display="none";
                document.getElementById('request-fund-main').style.display="none";
                document.getElementById('request-subject-main').style.display="none";

            });  
            
            marks.addEventListener('click',e=>{
                Projects.style.color="#c0c2c0";
                leave.style.color="#c0c2c0";
                marks.style.color="white";
                attendance.style.color="#c0c2c0";
                fund.style.color="#c0c2c0";
                subject.style.color="#c0c2c0";
                
                document.getElementById('projects & publications-main').style.display="none";
                document.getElementById('request-to-leave-main').style.display="none";
                document.getElementById('upload-marks-main').style.display="flex";
                document.getElementById('upload-attendance-main').style.display="none";
                document.getElementById('request-fund-main').style.display="none";
                document.getElementById('request-subject-main').style.display="none";

            });  
            
            attendance.addEventListener('click',e=>{
                Projects.style.color="#c0c2c0";
                leave.style.color="#c0c2c0";
                marks.style.color="#c0c2c0";
                attendance.style.color="white";
                fund.style.color="#c0c2c0";
                subject.style.color="#c0c2c0";
                
                document.getElementById('projects & publications-main').style.display="none";
                document.getElementById('request-to-leave-main').style.display="none";
                document.getElementById('upload-marks-main').style.display="none";
                document.getElementById('upload-attendance-main').style.display="flex";
                document.getElementById('request-fund-main').style.display="none";
                document.getElementById('request-subject-main').style.display="none";
               
            });  
            
            fund.addEventListener('click',e=>{
                Projects.style.color="#c0c2c0";
                leave.style.color="#c0c2c0";
                marks.style.color="#c0c2c0";
                attendance.style.color="#c0c2c0";
                fund.style.color="white";
                subject.style.color="#c0c2c0";
                
                document.getElementById('projects & publications-main').style.display="none";
                document.getElementById('request-to-leave-main').style.display="none";
                document.getElementById('upload-marks-main').style.display="none";
                document.getElementById('upload-attendance-main').style.display="none";
                document.getElementById('request-fund-main').style.display="flex";
                document.getElementById('request-subject-main').style.display="none";
                
            }); 
            subject.addEventListener('click',e=>{
                Projects.style.color="#c0c2c0";
                leave.style.color="#c0c2c0";
                marks.style.color="#c0c2c0";
                attendance.style.color="#c0c2c0";
                fund.style.color="#c0c2c0";
                subject.style.color="white";
                
                document.getElementById('projects & publications-main').style.display="none";
                document.getElementById('request-to-leave-main').style.display="none";
                document.getElementById('upload-marks-main').style.display="none";
                document.getElementById('upload-attendance-main').style.display="none";
                document.getElementById('request-fund-main').style.display="none";
                document.getElementById('request-subject-main').style.display="flex";
                
            }); 
            
            
            function SubjectsChange(){
                var semsSub=document.getElementById("semsDropdown").value;
                fetch('subjectRequest?search='+semsSub)
                        .then(response=>response.text())
                        .then(data=>{
                            document.getElementById('subjectsDropdown').innerHTML=data;
                        })
                        .catch(error=>console.error("Error",error));
            }
            subjectsChange();
            
            function marksChange(){
                var semmarks=document.getElementById("semmarks").value;
                fetch('subjectRequest?search='+semmarks)
                        .then(response=>response.text())
                        .then(data=>{
                            document.getElementById('subjectmarks').innerHTML=data;
                        })
                        .catch(error=>console.error("Error",error));
            }
            marksChange();
            function attendanceChange(){
                var semattendance=document.getElementById("semattendance").value;
                fetch('subjectRequest?search='+semattendance)
                        .then(response=>response.text())
                        .then(data=>{
                            document.getElementById('subjectattendance').innerHTML=data;
                        })
                        .catch(error=>console.error("Error",error));
            }
            attendanceChange();

            function studentattendanceChange(){
                var semattendance=document.getElementById("semattendance").value;
                fetch('uploadAttendanceRequest?search='+semattendance)
                        .then(response=>response.text())
                        .then(data=>{
                            document.getElementById('studentsAttendance').innerHTML=data;
                        })
                        .catch(error=>console.error("Error",error));
            }
            studentattendanceChange();
            function marksStudentChange(){
                var semmarks=document.getElementById("semmarks").value;
                fetch('uploadMarksRequest?search='+semmarks)
                        .then(response=>response.text())
                        .then(data=>{
                            document.getElementById('studentmarks').innerHTML=data;
                        })
                        .catch(error=>console.error("Error",error));
            }
            marksStudentChange(); 
            

        </script>
    </body>
</html>

