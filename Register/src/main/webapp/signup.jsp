<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
	<link rel="stylesheet" href="style.css">
    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
    <style>
    
    	#user_password{
    		-webkit-text-security: disc;
    	}
    
    </style>
         
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col m6 offset-m3">
				<div class="card">
					<div class="card-content">
						<h3 class="center-align">Register Here</h3>
						<h6 id="msg" class="center-align"></h6>
						
							<div class="form">
								
								<form action="register" method="post" id="myform">
									<input type="text" name="user_name" placeholder="Enter Name Here">
									<div class="input-box">
									<input type="text" name="user_password" id="user_password" placeholder="Enter Password Here">
									<img src="eye-close.png" alt="img" id="eyeicon">
									</div>
									<input type="email" name="user_email" placeholder="Enter Email Here">
									<button type="submit" class="btn red">Submit</button>
									<button type="reset" class="rbtn">Reset</button>
									<a href="login.jsp" class="center-align">Login here</a>
 								</form>
								
							</div>
							 
							<div class="loader center-align" style="margin-top:10px; display:none" >
							
										<div class="preloader-wrapper big active">
									      <div class="spinner-layer spinner-blue">
									        <div class="circle-clipper left">
									          <div class="circle"></div>
									        </div><div class="gap-patch">
									          <div class="circle"></div>
									        </div><div class="circle-clipper right">
									          <div class="circle"></div>
									        </div>
									      </div>
									
									      <div class="spinner-layer spinner-red">
									        <div class="circle-clipper left">
									          <div class="circle"></div>
									        </div><div class="gap-patch">
									          <div class="circle"></div>
									        </div><div class="circle-clipper right">
									          <div class="circle"></div>
									        </div>
									      </div>
									
									      <div class="spinner-layer spinner-yellow">
									        <div class="circle-clipper left">
									          <div class="circle"></div>
									        </div><div class="gap-patch">
									          <div class="circle"></div>
									        </div><div class="circle-clipper right">
									          <div class="circle"></div>
									        </div>
									      </div>
									
									      <div class="spinner-layer spinner-green">
									        <div class="circle-clipper left">
									          <div class="circle"></div>
									        </div><div class="gap-patch">
									          <div class="circle"></div>
									        </div><div class="circle-clipper right">
									          <div class="circle"></div>
									        </div>
									      </div>
									    </div>
									    
									    <h4>Please Wait...</h4>
							
							</div>
						
					</div>
				</div>
			</div>
		</div>
		
	</div>
	
	
	
	
	<script
  src="https://code.jquery.com/jquery-3.7.1.min.js"
  integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
  crossorigin="anonymous"></script>
  
  <script>
  let eyeicon = document.getElementById("eyeicon");
  let password = document.getElementById("user_password");
  let count = 1;
  eyeicon.onclick = function(){
	  	console.log("clicked....")
	  	
	  if(count % 2 == 1){
		  password.innerHTML = `<style>
		    
	    	#user_password{
	    		-webkit-text-security: none;
	    	}
	    
	    </style>
		  
		  `;
		  
		  eyeicon.src = "eye-open.png";
		  count++;
		  
	  }
	  else{
		  password.innerHTML = `<style>
			    
		    	#user_password{
		    		-webkit-text-security: disc;
		    	}
		    
		    </style>
			  
			  `;
			  
			  eyeicon.src = "eye-close.png";
			  count++;
	  }
	  
	  
	  
  }
  
  </script>
  
  
  
  
  <script>
  
  		
  		$(document).ready(function(){
  			console.log("Its Working...")
  			
  			$("#myform").on('submit', function(e){
  				e.preventDefault();
  				
  				var f = $(this).serialize();
  				
  				$(".loader").show();
  				$(".form").hide();
  				
  				$.ajax({
  					url: "register",
  					data: f,
  					type: "POST",
  					success: function(data){
  						console.log(data);
  						console.log("Success...........");
  						$(".loader").hide();
  		  				$(".form").show();
  		  				
  		  				$("#msg").html("Successfully Registered...");
  		  				$("#msg").addClass("green-text");
  					},
  					error: function(data){
  						console.log(data);
  						console.log("error............");
  						$(".loader").hide();
  		  				$(".form").show();
  		  				$("#msg").html("Something went Wrong...");
  		  				$("#msg").addClass("red-text");

  					}
  				})
  			})
  			
  			
  		})
  		
  
  </script>
  
  <script>
  
  window.onbeforeunload = function(e) {
	  return "Do you want to exit this page?";
	};
  
  </script>
	
	
</body>
</html>