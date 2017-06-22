﻿<cfquery datasource="Project_DataSource" result="rsUserExsists">
	SELECT *
	FROM dbo.Users_Details
	WHERE EmailAddress = '#form.user_email#'
</cfquery>

<cfif rsUserExsists.RecordCount EQ 0>
<!---Input values in the databsse---> 
<cfquery datasource="Project_DataSource" result="rsInterestInfo">
	
	<!---Insert Data in User_Details--->
	INSERT INTO dbo.Users_Details
		(FirstName,LastName,EmailAddress,Password,isActive)
		values
		('#form.firstname#','#form.lastname#','#form.user_email#','#form.user_password#',0)
</cfquery>		
	
<cfquery datasource="Project_DataSource" result="rsUserAddress">

	<!---Insert Data into User_Address--->
	INSERT INTO dbo.User_Address
		(uid,CurrentAddress,PermanentAddress,Country,State,City)
		values
		((select uid from dbo.Users_Details where EmailAddress = '#form.user_email#' ),'#form.caddress#','#form.paddress#','#form.country#','#form.state#','#form.city#')
</cfquery>

<cfquery datasource="Project_DataSource" result="rsAdditionalInfo">
	<!---Insert Data into User_Additional_Info--->
	INSERT INTO dbo.Users_Additional_Info
		(uid,Gender,subscription)
		values
		((select uid from dbo.Users_Details where EmailAddress = '#form.user_email#' ),'#form.gender#','#form.subs_value#')
</cfquery>

<cfquery datasource="Project_DataSource" result="rsUsersPhoneNo">
	<!---Insert Data into User_Phone_Number--->
	INSERT INTO dbo.Users_Phone_Number
		(uid,PhoneNumber)
		values
		((select uid from dbo.Users_Details where EmailAddress = '#form.user_email#' ),'#form.phoneno#')
	<cfif #form.phonenoalt# NEQ "">
		INSERT INTO dbo.Users_Phone_Number
			(uid,PhoneNumber)
		values
			((select uid from dbo.Users_Details where EmailAddress = '#form.user_email#' ),'#form.phonenoalt#')
		
	</cfif>
</cfquery>

	
<cfloop list="#form.user_interest#" index="interestValue" delimiters=",">
	<cfquery datasource="Project_DataSource" result="rsUserInterest">
		<!---Insert Data into User_Interest--->
		INSERT INTO dbo.Users_Interest
			(uid,InterestID)
			values
			((select uid from dbo.Users_Details where EmailAddress = '#form.user_email#' ),(select InterestID from dbo.Interest_Info where InterestName = '#trim('#interestValue#')#'))
	</cfquery>
</cfloop>>	

<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>Animated Check Mark</title>
  
  
  
      <link rel="stylesheet" href="stylesheet/checkmark.css">

  
</head>

<body>
  <div class="checkmark">
  <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
	 viewBox="0 0 161.2 161.2" enable-background="new 0 0 161.2 161.2" xml:space="preserve">
<path class="path" fill="none" stroke="#7DB0D5" stroke-miterlimit="10" d="M425.9,52.1L425.9,52.1c-2.2-2.6-6-2.6-8.3-0.1l-42.7,46.2l-14.3-16.4
	c-2.3-2.7-6.2-2.7-8.6-0.1c-1.9,2.1-2,5.6-0.1,7.7l17.6,20.3c0.2,0.3,0.4,0.6,0.6,0.9c1.8,2,4.4,2.5,6.6,1.4c0.7-0.3,1.4-0.8,2-1.5
	c0.3-0.3,0.5-0.6,0.7-0.9l46.3-50.1C427.7,57.5,427.7,54.2,425.9,52.1z"/>
<circle class="path" fill="none" stroke="#7DB0D5" stroke-width="4" stroke-miterlimit="10" cx="80.6" cy="80.6" r="62.1"/>
<polyline class="path" fill="none" stroke="#7DB0D5" stroke-width="6" stroke-linecap="round" stroke-miterlimit="10" points="113,52.8 
	74.1,108.4 48.2,86.4 "/>

<circle class="spin" fill="none" stroke="#7DB0D5" stroke-width="4" stroke-miterlimit="10" stroke-dasharray="12.2175,12.2175" cx="80.6" cy="80.6" r="73.9"/>

</svg>
  
<p>Great Job!<br>You can login in now</p>
<a alt="loginPageLink" href="login.cfm"><p>Click here to Login</p></a>
</div>
  
  
</body>
</html>

<cfelse>
	<cfoutput>
		<head>
			<link type="text/css" rel="stylesheet/main.css">	
		</head>
		<body>
			<h1 style="color:red"> User already exsists <a href="http://localhost/CF/CFSiteWithRegForm/index.cfm"> Click here to Register</a></h1>
		</body>
	</cfoutput>

</cfif>