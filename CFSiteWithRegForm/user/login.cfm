﻿	
<!---Intialize values--->
<cfset errorMessages = {}>
<cfloop collection="#form#" item="fields">
	<cfset #StructInsert(errorMessages,fields,"")#>
</cfloop>

<cfset errorFlag = false>

<html>
 <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        
        <link href='https://fonts.googleapis.com/css?family=Nunito:400,300' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" href="../stylesheet/main.css">
       	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  </head>


  <body>
	
      <cfform action="login.cfm" method="post">
      
        <h1>Login</h1>
        <h3 id="errorHeader" style="color:red;text-align:center;"></h3>
        <fieldset>
          <label for="email" class="required">Email Address:</label>
		  
		  <cfinput type="text" id="email_address" name="user_email" placeholder="Email Address" class="required"/>
           
          <label for="password" class="required">Password:</label>
          <cfinput type="password" id="password" name="user_password" placeholder="Password" class="required">
    
		  <button type="submit" id="submitbttn" >Login</button>
		</fieldset>
      </cfform>
      	 <script src="../js/login.js"></script>
    		
	</body>
	
	
</html>      
          