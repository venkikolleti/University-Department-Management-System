<%-- 
    Document   : forgot
    Created on : 16-Dec-2023, 10:03:56 PM
    Author     : harish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
        <title>JSP Page</title>
<style>
    body{
        
    }
.container-big-1 a{
    color: white;
}

.container-1{
    
    border-radius:20px 0px 0px 20px;
    background-image: linear-gradient(rgba(0,0,0,0.6),rgba(0,0,0,0.6)),url("images/b4.jpg");
    background-size: cover;
    background-position: center;
    background-attachment: fixed;

}
.container-2{
   
    border-radius:0px 20px 20px 0px;
    background:linear-gradient(rgba(255, 255, 255, 0.3),rgba(255, 255, 255, 0.5));
    box-shadow: inset 0 0 5px rgb(0,0,0.4) , 0 0 50px rgba(153, 184, 180, 0.9);
}
.form-control{
    height:-20px;
    border:0px;
    background:linear-gradient(rgba(255, 255, 255, 0),rgba(255, 255, 255, 0));
    border-bottom:2px solid black;

}

.container-big-1 .navbar{
                background:linear-gradient(to right,#079440,#07b34c);

                box-shadow: inset 0 0 5px rgb(0,0,0.4) , 0 0 10px rgba(153, 184, 180, 0.4);


}
.container-1 .quote h5{
    color:#a5b5b2;
}

.container-2 .heading{
    border:2px solid green;
    width:400px;
    margin:auto;
    background:linear-gradient(to right,#ff105f,#ffad06);
    box-shadow: inset 0 0 5px rgb(0,0,0.4) , 0 0 50px rgba(153, 184, 180, 0.9);  
    border-radius:70px 5px 70px 5px;
}
.container-2 .submit-btn{
    border-radius:40px;
    background:linear-gradient(to right,#52c441,#48bf36,#62eb4d);
        box-shadow: inset 0 0 5px rgb(0,0,0.4) , 0 0 50px rgba(153, 184, 180, 0.9);  

}
.container-reg{
    background-color:#baf4f5;
    background-size: cover;
    background-position: center;
    background-attachment: fixed;
    width: 100%;

}
.error{
    color:red;
}
</style>
        
    </head>
    <body> 
        
        <div class="container-big-1">
            <nav class="navbar navbar-expand-lg">
                <div class="container-fluid">
                  <a class="navbar-brand ms-3" href="#"><img src="" width="40px"></a>
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbar-col" >
                    <span class="navbar-toggler-icon"></span>
                  </button>
                  <div class="collapse navbar-collapse" id="navbar-col">
                    <ul class="navbar-nav nav-underline ms-auto me-3">
                        <li class="nav-item me-3">
                            <a href="#" class="nav-link"><b>Home</b></a>
                        </li>
                        <li class="nav-item me-3">
                            <a href="#" class="nav-link"><b>Register</b></a>
                        </li>
                    </ul>
                  </div>
                </div>
            </nav>
        </div>
        
    <div class="container-reg">       
        <div class="container justify-content-center py-5 d-flex">
            <div class="container-1 col-md-5" >
                <div class="quote text-center m-5 text-light "><br><br><Br><Br>
                    <h4>Everything's always ending... But</h4><h4> everything's always beginning,</h4><h4> too...</h4><br>
                    <h5 >It's time to begin.</h5><br>
                    <br><br><Br>
                    <h2> Let's Login</h2>

                </div>
            </div>
            
            <div class="container-2 col-md-5 text-center align-items-center justify-content-center">
                <br><h3 class="text-center mt-5 heading p-2">FORGOT PASSWORD</h3><br>
                <form class="m-4" method="post" action="forgotPassword">
                  <div class="form-floating mb-3 col-md-12 mt-3">
                      <input type="text" class="form-control"  name="id" placeholder="idnumber" id="id" required>
                    <label for="idnumber" class="label">Id Number</label>
                  </div>
                  <div class="form-floating mb-3 col-md-12 mt-5">
                      <input type="tel" class="form-control"  name="number" placeholder="Mobile Number" id="number" required>
                    <label for="number" class="label">Mobile Number</label>
                  </div><!-- comment -->
                  <div class="form-floating mb-3 col-md-12 mt-5">
                    <input type="password" class="form-control"  name="npassword" placeholder="New Pasword" id="npass">
                    <label for="npassword" class="label">Create New Password</label>
                    <span id="npasserr" class="error"></span>
                  </div>
                  <div class="form-floating mb-3 col-md-12 mt-5">
                    <input type="password" class="form-control"  name="cpassword" placeholder="Confirm Pasword" id="cpass">
                    <label for="cpassword" class="label">Confirm New Password</label>
                    <span id="cpasserr" class="error"></span>
                  </div>
                  <br>
                  <button type="submit"  class="col-md-7 mt-3 py-2 submit-btn" id="submit-btn">Submit</button>                          
                </form>
            </div>
            
        </div>
    </div> 
    </body>
    <script>
         var btn=document.getElementById('submit-btn');
         
         btn.addEventListener('click',e=>{
                 if(!validate()){
                     e.preventDefault();
                 }
             });
         var npass=document.getElementById('npass').value="";
         var cpass=document.getElementById('cpass').value="";
         function validate(){
             var npass=document.getElementById('npass').value.trim();
             var cpass=document.getElementById('cpass').value.trim();
             var npasserr=document.getElementById('npasserr');
             var cpasserr=document.getElementById('cpasserr');
             let passchk=/(^\w{1,}\W{1,}\d{1,})$/;
             var isnpassword=false;
             var iscpassword=false;
             var isvalid=false;
             
              if(npass===""){
                    npasserr.innerText="Please Enter The Password";
                    document.getElementById('npass').style.border="1px solid red";  
                }
                else if(!passchk.test(npass)){
                    npasserr.innerText="Please Enter the Strong Password...Password must be followed by any case alphabets ,special character ended with of digits";
                    document.getElementById('npass').style.border="1px solid red";  
                }
                else if(npass.length<8){
                    npasserr.innerText="Password length must be atleast 8 characters";
                    document.getElementById('npass').style.border="1px solid red";  
                }
                else{
                    npasserr.innerText="";
                    isnpassword=true;
                    document.getElementById('npass').style.border="3px solid green";  
                }
                
                if(cpass===""){
                    cpasserr.innerText="Please Enter The Password";
                    document.getElementById('cpass').style.border="1px solid red";  
                }
                else if(cpass!==npass){
                     cpasserr.innerText="New Password and Confirm Password Must Be Same";
                     document.getElementById('cpass').style.border="1px solid red";
                }else{
                    cpasserr.innerText="";
                    iscpassword=true;
                    document.getElementById('cpass').style.border="3px solid green";  
                } 
                 if(isnpassword && iscpassword ){
                    isvalid=true;
                }

                return isvalid;
         }
    </script>
    
</html>
