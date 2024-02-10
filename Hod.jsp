<%-- 
    Document   : Hod
    Created on : 14-Dec-2023, 9:06:54 am
    Author     : suhan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
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
    background:linear-gradient(to right,#52c441,#48bf36,#62eb4d);
    background:linear-gradient(to right,#07b34c,#079440,#07b34c);
    box-shadow: inset 0 0 5px rgb(0,0,0.4) , 0 0 10px rgba(153, 184, 180, 0.4);
}
.navbar .fas{
    font-size:30px;
}


.admission a{
    text-decoration: none;
    color:black;
    font-size:30px;
    background: linear-gradient(to right, skyblue,#32a852);
    background: linear-gradient(to right, skyblue, #DF2771);
    border-radius: 30px;
}
.admission input{
    border-radius: 30px;
    background: linear-gradient(to right, skyblue,#32a852);
    border:4px solid #4287f5;               
}
#raise-query-main tr{
    border:2px solid black;
    text-align: center;     
}
#raise-query-main a{
    text-decoration: none;
    border-radius: 10px;
}
.card{
                padding:1.5em .5em .5em;
                text-align:center;
                border-radius:2em;
                padding-top: 2em;
                box-shadow:0 5px 10px rgba(0,0,0, .2);
            }
.container-main{
                margin-top: 100px;
            }
        </style>
            
    </head>
    <body>
        <%
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
                            <a href="#" class="nav-link" id="sem-registration"><b>Faculty Information</b></a>
                        </li>
                        <li class="nav-item me-3">
                            <a href="#" class="nav-link " id="course-info"><b>Student Information</b></a>
                        </li>
                        <li class="nav-item me-3">
                            <a href="#" class="nav-link " id="inventory-details"><b>Inventory Details</b></a>
                        </li>
                        <li class="nav-item me-3">
                            <a href="#" class="nav-link " id="courses"><b>Courses Information</b></a>
                        </li>
                        <li class="nav-item me-3">
                            <a href="#" class="nav-link " id="request-fund"><b>Funds Information</b></a>
                        </li>
                        <li class="nav-item me-3">
                            <a href="#" class="nav-link " id="query"><b>Resolve Queries</b></a>
                        </li>

                    </ul>
                  </div>

                  <p class="nav-item ms-auto mt-3 me-3"><a href="#" class="nav-link" id="user-icon"><b><i class="fas fa-user"></i></b></a></p>
                  
                </div>
            </nav>

        
        <div id="sem-registration-main">
<!--            <div class="container">
                <div class="admission text-center mt-5">
                    <a href="" class="col-md-4 py-3 px-5"><b>New Admission</b></a><br><Br><br> comment 
                    <a href="" class="col-md-4 py-3 px-5"><b>Faculty Details</b></a> comment 
                    <br><br><br><br>
                    <form action="SearchStudent" method="post">
                        <input type="text" name="search" placeholder="search Faculty with Id" class="p-3">&nbsp &nbsp
                        <input type="submit" value="Search" class="p-2">
                    </form>
                </div>    
            </div>-->
            
            <div class="container container-main">
                <div class="admission text-center col-md-7 mx-auto">
                 <form action="SearchStudent" class='mx-auto mb-3' align='center' method="post">
                        <input type="text" name="search" placeholder="search Faculty with Id" class="p-3 col-md-10" style='border-radius:10px;'>&nbsp &nbsp &nbsp
                        <input type="submit" value="Search" class="p-3" style='border-radius:10px;background-color: hotpink;'>
                    </form>
                </div>
                <div class="row gy-3 mt-5 mx-auto">
                    <div class="col col-md-3 ms-5 justify-content-center">
                        <div class="card col-md-12 ms-5">
                            <div class="card-body">
                                <img src="Images/S_letter.jpeg" class="img-fluid" alt="..." width="100px" height="100px">
                            <h5 class="card-title">Admissions Open</h5>
                            
                            <a href="facultyAdmission.html" class="btn btn-primary">Click here to Register</a>
                        </div>
                    </div>
                </div>
                <div class="col col-md-3 ms-5">
                    <div class="card col-md-12 ms-5" >
                        <div class="card-body">
                            <img src="Images/r.webp" class="image-fluid" alt="...." width="100px" height="100px">
                         <h5 class="card-title">Faculty Details</h5>
<!--                         <p class="card-text">If is there any Remedials you have then you can register here...!</p>-->
                        <a href="facultyDetails.jsp" class="btn btn-primary">Click here to see</a>
                        </div>
                    </div>
                </div>
                <div class="col col-md-3 ms-5">
                    <div class="card col-md-12 ms-5" >
                        <div class="card-body">
                            <img src="Images/S_letter.jpeg" class="image-fluid" alt="...." width="100px" height="100px">
                         <h5 class="card-title">SUBJECT ALLOCATION</h5>
<!--                         <p class="card-text">If is there any Remedials you have then you can register here...!</p>-->
                        <a href="subjectRequestAllocation.jsp" class="btn btn-primary">Click here to see</a>
                        </div>
                    </div>
                </div>                   
                   
                <div class="col col-md-3 mx-5">
                    <div class="card col-md-12 ms-5" >
                        <div class="card-body">
                            <img src="Images/S_letter.jpeg" class="image-fluid" alt="...." width="100px" height="100px">
                         <h5 class="card-title">FACULTY LEAVE</h5>
<!--                         <p class="card-text">If is there any Remedials you have then you can register here...!</p>-->
                        <a href="requestLeave.jsp" class="btn btn-primary">Click here to see</a>
                        </div>
                    </div>
                </div>                  
                    
                <div class="col col-md-3 ms-5">
                    <div class="card col-md-12 " >
                        <div class="card-body">
                            <img src="Images/S_letter.jpeg" class="image-fluid" alt="...." width="100px" height="100px">
                         <h5 class="card-title">FACULTY FEEDBACK SURVEY</h5>
<!--                         <p class="card-text">If is there any Remedials you have then you can register here...!</p>-->
                        <a href="feedbackSurvey.jsp" class="btn btn-primary">Click here to see</a>
                        </div>
                    </div>
                </div> 
                    
                </div>
            </div>
        </div>
        
        <div id="course-info-main">

            <div class="container container-main">
                
                <div class="admission text-center col-md-7 mx-auto">
                    <form action="SearchStudent" method="post">
                        <input type="text" name="search" placeholder="search Faculty with Id" class="p-3 col-md-10">&nbsp &nbsp
                        <input type="submit" value="Search" class="p-2">
                    </form>
                </div>  
                
                <div class="row gy-3 mt-5 ">
                    <div class="col col-md-3 ms-5">
                        <div class="card">
                            <div class="card-body">
                                <img src="Images/S_letter.jpeg" class="img-fluid" alt="..."  width="100px" height="100px">
                            <h5 class="card-title">Admission Open</h5>
                            
                            <a href="admission.html" class="btn btn-primary">Click here to Register</a>
                        </div>
                    </div>
                </div>
                <div class="col col-md-3 ms-2">
                    <div class="card col-md-12 ms-5" >
                        <div class="card-body">
                            <img src="Images/r.webp" class="image-fluid" alt="...." width="100px" height="100px">
                         <h5 class="card-title">Studentd Details</h5>
<!--                         <p class="card-text">If is there any Remedials you have then you can register here...!</p>-->
                        <a href="StudentDetails" class="btn btn-primary">Click here to see</a>
                        </div>
                    </div>
                </div>

                <div class="col col-md-3 ms-5">
                    <div class="card col-md-12 ms-5" >
                        <div class="card-body">
                            <img src="Images/r.webp" class="image-fluid" alt="...." width="100px" height="100px">
                         <h5 class="card-title">New Admission Requests</h5>
<!--                         <p class="card-text">If is there any Remedials you have then you can register here...!</p>-->
                        <a href="studentAdmissionRequest.jsp" class="btn btn-primary">Click here to see</a>
                        </div>
                    </div>
                </div>                    
                    
                </div>
            </div>
           
        </div><!-- comment -->
        
           
        
        <!-- inventory start -->
        <div id="inventory-details-main">
            <div class="container " id="inventory">
                <div class="row" style="margin-top: 25px;">
                    <div class="col-md-12">
                        
           <table  align="center" cellpadding="10" class="mx-auto my-3 table table-hover table-bordered border-success table-light" width="70%" border="1" >
               <h3 align="center">Inventory Details</h3 >
               
               <center>
                   
                <tr class="table-danger" >
                    <th>Item Name</th>
                    <th colspan="2" style="text-align:center">Quantity</th><!-- comment -->
                    <th>Cost</th> 
                    <th></th>
                    <th></th>
                </tr>
                <tr class="table-warning">
                    <th></th>
                    <th style="text-align:center">Working</th>
                    <th style="text-align:center">Not Working</th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                <%try{
                    result=st.executeQuery("select * from inventories;");
                    while(result.next()){%>
                    <tr>
                        <td><b><% out.println(result.getString("item_name")); %></b></td>
                        <td style="text-align:center"><b><% out.println(result.getString("working")); %></b></td>
                        <td style="text-align:center"><b><% out.println(result.getString("not_working")); %></b></td>
                        <td><b><% out.println(result.getString("amount")); %></b></td>
                        <td><!-- Button trigger modal -->
<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
  Update
</button>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="staticBackdropLabel">Update Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form action="update_inventory" method="post">
            <input type="text" class="form-control py-3" name="item" placeholder="Item name" required/><br>
            <input type="text" class="form-control py-3" name="quantity" placeholder="Quantity" required/><!-- comment --><br>
            <input type="text" class="form-control py-3" name="amount" placeholder="Amount"value="" required><br>
                    
                    <input type="submit" value="Update" class="w-50 mx-auto form-control bg-success ">
                </form> 
      </div>
      
    </div>
  </div>
</div></td>
<td>
    <!-- Button trigger modal -->   
<button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal1">
  Remove
</button>

<!-- Modal -->
<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModal1Label" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered"">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModal1Label">Remove Details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
           <form action="remove_inventory" method="post">
               <input type="text" class="form-control py-3" name="item" placeholder="Item name" required/><br><br>
          <input type="text" class="form-control py-3" name="quantity" placeholder="Quantity" required/><br>
                     <input type="submit" value="Update" class="w-50 mx-auto form-control bg-success ">
            </form> 
      </div>
      
    </div>
  </div>
</div>
</td>
                       
                    </tr>
                    
                    <%}
                
                }catch(Exception e){}                    
                 %>
                 <tr>
                       <th colspan="5"></th>
                       <th>
                           <!-- Button trigger modal -->
<button type="button" class="btn btn-success btn-large" data-bs-toggle="modal" data-bs-target="#staticBack">
  Add items
</button>

<!-- Modal -->
<div class="modal fade" id="staticBack" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
          <h5 class="modal-title" id="staticBackLabel"><center>Add Item Details</center></h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
          <form action="AddItem" method="post">
                    <input type="text" class="form-control py-2" name="item" placeholder="Item name" required/><br><br>
                    <input type="text" class="form-control py-2" name="working" placeholder="Working" required/><!-- comment --><br><br>
                    <input type="text" class="form-control py-2" name="notworking" placeholder="Not Working"value="" required><br><br>
                    <input type="text" class="form-control py-2" name="amount" placeholder="Amount"value="" required>
                    
                    <input type="submit" value="Update" class="w-50 mt-5 mx-auto form-control bg-success ">
                </form>
      </div>
      
    </div>
  </div>
</div>
                       </th>
                   </tr> 
                 
                   
                 </center>
                 
           </table>
           
                    </div>
                </div>
            </div>
        </div>
           
           <!-- courses information start -->
        <div id="courses-info-main">
            <div class="container " id="Course_info">
                <div class="row" style="margin-top: 25px;">
                    <div class="col-md-12">
           
                        <%
                          String semister[]={"E1S1","E1S2","E2S1","E2S2","E3S1","E3S2","E4S1","E4S2"};
                          for(String sem:semister){
                                //out.println(sem);
                              
                        %>
           <table  align="center" cellpadding="10" class="mx-auto my-3" width="70%" >
               <h5 align="center"><% out.println(sem); %></h5>
                <tr class="bg-secondary">
                    <th>SUB_CODE</th>
                    <th>SUBJECT_NAME</th><!-- comment -->
                    <th>CREDITS</th> 
                </tr>
                <%try{
                    result=st.executeQuery("select * from courseinfo where semister='"+sem+"'");
                    while(result.next()){%>
                    <tr>
                        <td><b><% out.println(result.getString("subCode")); %></b></td>
                        <td><b><% out.println(result.getString("subName")); %></b></td>
                        <td><b><% out.println(result.getString("credits")); %></b></td>
                        
                       
                    </tr>
                    <%}
                
                }catch(Exception e){}                    
                }   %>
           </table>
            </div>
            </div>
            </div>
        </div>
           
           
           
        <div id="request-fund-main">
            <!--<h1>request fund</h1>-->
            <table  align="center" cellpadding="10" class="mx-auto my-5" width="70%" >

                <tr class="bg-secondary">
                    
                    <th>Student Id</th><!-- comment -->
                    <th>event</th>
                    <th>Purpose</th>
                    <th>Amount</th>
                    <th>status</th>
                    <th></th><!-- comment -->
                    <th></th>
                </tr>
                <%try{
                    result=st.executeQuery("select * from requestfunds where status='not approved'");
                    Statement st2=conn.createStatement();
                    result1=st2.executeQuery("select * from requestfunds where status!='not approved'");
                    while(result.next()){%>
                    <tr>
                        <td><b><% out.println(result.getString("id")); %></b></td>
                        <td><b><% out.println(result.getString("event")); %></b></td>
                        <td><b><% out.println(result.getString("purpose")); %></b></td>
                        <td><b><% out.println(result.getString("amount")); %></b></td>
                        <td><b><% out.println(result.getString("status")); %></b></td>
                        <td><a href="Approve.jsp?event=<%out.print(result.getString("event")); %>" style="text-decoration:none;border-radius:10px;" class="bg-success p-2 text-dark"><b>Approve </b></a></td>
                        <td><a href="NotApprov.jsp?event=<%out.print(result.getString("event")); %>" style="text-decoration:none;border-radius:10px;" class="bg-warning p-2 text-dark"><b>Not Approve</b></a></td>
                    </tr>
                <% }
                    while(result1.next()){%>
                    <tr>
                        <td><b><% out.println(result1.getString("id")); %></b></td>
                        <td><b><% out.println(result1.getString("event")); %></b></td>
                        <td><b><% out.println(result1.getString("purpose")); %></b></td>
                        <td><b><% out.println(result1.getString("amount")); %></b></td>
                        <td><b><% out.println(result1.getString("status")); %></b></td>
                        
                    </tr>                  
                    <%}
                
                }catch(Exception e){}                    
                 %>              
            </table>
        </div><!-- comment -->
        <div id="raise-query-main">
            <table  align="center" cellpadding="10" class="mx-auto my-5" width="70%" >

                <tr class="bg-secondary">
                    <th>Query No</th>
                    <th>Student Id</th><!-- comment -->
                    <th>Query</th>
                    <th>status</th>
                    <th></th><!-- comment -->
                    <th></th>
                </tr>
                <%try{
                    result=st.executeQuery("select * from studqueries where status='not resolved'");
                    Statement st2=conn.createStatement();
                    result1=st2.executeQuery("select * from studqueries where status!='not resolved'");
                    while(result.next()){%>
                    <tr>
                        <td><b><% out.println(result.getString("queryno")); %></b></td>
                        <td><b><% out.println(result.getString("studentid")); %></b></td>
                        <td><b><% out.println(result.getString("query")); %></b></td>
                        <td><b><% out.println(result.getString("status")); %></b></td>
                        <td><a href="ResolveQuery.jsp?queryno=<%out.print(result.getInt("queryno")); %>" class="bg-success p-2 text-dark"><b>Resolve </b></a></td>
                        <td><a href="NotResolveQuery.jsp?queryno=<%out.print(result.getInt("queryno")); %>" class="bg-warning p-2 text-dark"><b>Not Resolve</b></a></td>
                    </tr>
                <% }
                    while(result1.next()){%>
                    <tr>
                        <td><b><% out.println(result1.getString("queryno")); %></b></td>
                        <td><b><% out.println(result1.getString("studentid")); %></b></td>
                        <td><b><% out.println(result1.getString("query")); %></b></td>
                        <td><b><% out.println(result1.getString("status")); %></b></td>
                        
                    </tr>                  
                    <%}
                
                }catch(Exception e){}                    
                 %>              
            </table>
        </div>
        
        <script>
            var sem=document.getElementById('sem-registration');
            var course=document.getElementById('course-info');
            var inventory=document.getElementById('inventory-details');
            var courses=document.getElementById('courses');
            var fund=document.getElementById('request-fund');
            var query=document.getElementById('query');


            
                document.getElementById('sem-registration-main').style.display="none";
                document.getElementById('course-info-main').style.display="flex";
                document.getElementById('inventory-details-main').style.display="none";
                document.getElementById('courses-info-main').style.display="none";
                document.getElementById('request-fund-main').style.display="none";
                document.getElementById('raise-query-main').style.display="none";
                sem.style.color="white";
                course.style.color="#c0c2c0";
                inventory.style.color="white";
                courses.style.color="white";
                fund.style.color="white";
                query.style.color="white";

            sem.addEventListener('click',e=>{
                sem.style.color="white";
                course.style.color="#c0c2c0";
                inventory.style.color="#c0c2c0";
                courses.style.color="#c0c2c0";
                fund.style.color="#c0c2c0";
                query.style.color="#c0c2c0";
                document.getElementById('sem-registration-main').style.display="flex";
                document.getElementById('course-info-main').style.display="none";
                document.getElementById('inventory-details-main').style.display="none";
                document.getElementById('courses-info-main').style.display="none";
                document.getElementById('request-fund-main').style.display="none";
                document.getElementById('raise-query-main').style.display="none";
            });
            
            course.addEventListener('click',e=>{
                sem.style.color="#c0c2c0";
                course.style.color="white";
                inventory.style.color="#c0c2c0";
                courses.style.color="#c0c2c0";
                fund.style.color="#c0c2c0";
                query.style.color="#c0c2c0";
                document.getElementById('sem-registration-main').style.display="none";
                document.getElementById('course-info-main').style.display="flex";
                document.getElementById('inventory-details-main').style.display="none";
                document.getElementById('courses-info-main').style.display="none";
                document.getElementById('request-fund-main').style.display="none";
                document.getElementById('raise-query-main').style.display="none";
            });  
            
            inventory.addEventListener('click',e=>{
                sem.style.color="#c0c2c0";
                course.style.color="#c0c2c0";
                inventory.style.color="white";
                courses.style.color="#c0c2c0";
                fund.style.color="#c0c2c0";
                query.style.color="#c0c2c0";
                document.getElementById('sem-registration-main').style.display="none";
                document.getElementById('course-info-main').style.display="none";
                document.getElementById('inventory-details-main').style.display="flex";
                document.getElementById('courses-info-main').style.display="none";
                document.getElementById('request-fund-main').style.display="none";
                document.getElementById('raise-query-main').style.display="none";
            });  
            
            courses.addEventListener('click',e=>{
                sem.style.color="#c0c2c0";
                course.style.color="#c0c2c0";
                inventory.style.color="#c0c2c0";
                courses.style.color="white";
                fund.style.color="#c0c2c0";
                query.style.color="#c0c2c0";
                document.getElementById('sem-registration-main').style.display="none";
                document.getElementById('course-info-main').style.display="none";
                document.getElementById('inventory-details-main').style.display="none";
                document.getElementById('courses-info-main').style.display="flex";
                document.getElementById('request-fund-main').style.display="none";
                document.getElementById('raise-query-main').style.display="none";
            });  
            
            fund.addEventListener('click',e=>{
                sem.style.color="#c0c2c0";
                course.style.color="#c0c2c0";
                inventory.style.color="#c0c2c0";
                courses.style.color="#c0c2c0";
                fund.style.color="white";
                query.style.color="#c0c2c0";
                document.getElementById('sem-registration-main').style.display="none";
                document.getElementById('course-info-main').style.display="none";
                document.getElementById('inventory-details-main').style.display="none";
                document.getElementById('courses-info-main').style.display="none";
                document.getElementById('request-fund-main').style.display="flex";
                document.getElementById('raise-query-main').style.display="none";
            }); 
            query.addEventListener('click',e=>{
                  sem.style.color="#c0c2c0";
                course.style.color="#c0c2c0";
                inventory.style.color="#c0c2c0";
                courses.style.color="#c0c2c0";
                fund.style.color="#c0c2c0";
                query.style.color="white";         
                document.getElementById('sem-registration-main').style.display="none";
                document.getElementById('course-info-main').style.display="none";
                document.getElementById('inventory-details-main').style.display="none";
                document.getElementById('courses-info-main').style.display="none";
                document.getElementById('request-fund-main').style.display="none";
                document.getElementById('raise-query-main').style.display="flex";
            });              
        </script>
    </body>
</html>

