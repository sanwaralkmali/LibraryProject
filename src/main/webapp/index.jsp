<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login & Sign Up Form</title>
<meta http-equiv="Pragma" content="no-cache">
            <meta http-equiv="Expires" content="0">
            <meta http-equiv="cache-control" content="no-cache, no-store, must-revalidate">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
   
  <link rel="stylesheet" href="login_css/style.css">
<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Open+Sans:400,300'>
<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
<link rel="stylesheet" href="style.css">
 <script type="text/javascript">
            function validate()
            {
                var username = document.getElementById("userR");
                var email = document.getElementById("emailR");
                var password = document.getElementById("passR");
                var confpass = document.getElementById("confirmPassR");
                var passCheck = document.getElementById("passwordCheck");
                var valid = true;
                if(email.value.length<=0 || username.value.length<=0 || confpass.value=="" || password.value=="")   
                    {
                	 valid = false;
                        alert("Don't leave the field empty!");
                       
                    }
                    else if(password.value != confpass.value)  
                   {
                    	 valid = false;
                    	// confirm_password.setCustomValidity("Passwords Don't Match");
                           passCheck.textContent="Password do not match!";
                           passCheck.style.color="red";    
                    }
                
                return valid;
            };
        </script>


<script type="text/javascript">
            function validateLogin()
            {
               
                var email = document.getElementById("email");
                var password = document.getElementById("upass").value;
               
                var valid = true;
                if(email.value.length<=0 || password.length<=0)
                    {
                        alert("Don't leave the field empty!");
                        valid = false;
                    }
                
                return valid;
            };
        </script>

</head>
<body>
<div class="cotn_principal">
<div class="cont_centrar">

  <div class="cont_login">
<div class="cont_info_log_sign_up">
      <div class="col_md_login">
<div class="cont_ba_opcitiy">
        
        <h2>LOGIN</h2>  
  <p>Please Enter your credential to get access to the books.</p> 
  <button class="btn_login" onclick="cambiar_login()">LOGIN</button>
  </div>
  </div>
<div class="col_md_sign_up">
<div class="cont_ba_opcitiy">
  <h2>SIGN UP</h2>

  
  <p>Please create a new account if you do not have it.</p>

  <button class="btn_sign_up" onclick="cambiar_sign_up()">SIGN UP</button>
</div>
  </div>
       </div>

    
    <div class="cont_back_info">
       <div class="cont_img_back_grey">
       <img src="https://images.unsplash.com/42/U7Fc1sy5SCUDIu4tlJY3_NY_by_PhilippHenzler_philmotion.de.jpg?ixlib=rb-0.3.5&q=50&fm=jpg&crop=entropy&s=7686972873678f32efaf2cd79671673d" alt="" />
       </div>
       
    </div>
<div class="cont_forms" >
    <div class="cont_img_back_">
       <img src="https://images.unsplash.com/42/U7Fc1sy5SCUDIu4tlJY3_NY_by_PhilippHenzler_philmotion.de.jpg?ixlib=rb-0.3.5&q=50&fm=jpg&crop=entropy&s=7686972873678f32efaf2cd79671673d" alt="" />
       </div>
       <form action="Login" method="post" >
 <div class="cont_form_login">

   <h2>LOGIN</h2>
 <input type="text" placeholder="Email" id="email"  name="email" /> <br/>

<input type="password" placeholder="Password" id="upass" name="upass" />

<button class="btn_login" id=loginRequest onclick="return validateLogin();"  >LOGIN</button>
  </div>
  </form>
   
   <form action="Main" method="post">
   <div class="cont_form_sign_up">
   
  
   
  <a href="#" onclick="ocultar_login_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
     <h2>SIGN UP</h2>

<input type="text" placeholder="User" name="name" id="userR"/>
<input type="text" placeholder="Email" name="email" id="emailR" />
<input type="password" placeholder="Password" name="pass" id="passR"/>
<input type="password" placeholder="Confirm Password" id="confirmPassR"/>
<span id="passwordCheck"></span>
<button class="btn_sign_up" id="SignUpRequest"  onclick="return validate();">SIGN UP</button>
   
   
  
  </div>
 </form>
    </div>
    
  </div>
 </div>
</div>
  
  
    
    <script  src="index.js"></script>
    



</body>
</html>