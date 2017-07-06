﻿<!----
	Filename 		: 	formValidationService.cfc
 	Functionality	:	Server side validation of form data
 						Creation of a validationToken per specific form submit
	Creation Date	:	July ‎2 ,  ‎2017 ,  ‏‎11:52:25 AM

--->

<cfcomponent extends = "fieldValidationService" hint = "validates form data recived via AJAX">
	
	<cffunction name = "validateAllFields" access = "remote" returntype = "struct" returnformat = "JSON" hint = "function validates form fields">
		<cfset LOCAL.strModAndError = {}>	
		
		<cfset StructAppend(LOCAL.strModAndError , validateName(URL.firstname , "firstname"))>
		<cfset StructAppend(LOCAL.strModAndError , validateName(URL.lastname , "lastname"))>
		
		<cfset StructAppend(LOCAL.strModAndError , validateMail(URL.user_email , "user_email"))>
		<cfset StructAppend(LOCAL.strModAndError , validatePass(URL.user_confirm_password , URL.user_password , "user_confirm_password"))>
		<cfset StructAppend(LOCAL.strModAndError , validateNumber(URL.phoneno , "phoneno"))>
		<cfset StructAppend(LOCAL.strModAndError , validateName(URL.city , "city"))>
		<cfset generateValidationToken()>
		
	<cfreturn strModAndError>		
	</cffunction>
	<cffunction name = "generateValidationToken" access = "private" returntype = "String" hint = "generates validation token">
		<cfset LOCAL.formDataToHash = "">
		<cfset LOCAL.arrayFieldValues = StructKeyArray(url)>
		<cfset #ArraySort(LOCAL.arrayFieldValues , "text")#>
		<cfloop array = "#LOCAL.arrayFieldValues#" index = "fieldValue">
		<cfif fieldValue NEQ "method" AND fieldValue NEQ "capval">
				<cfset LOCAL.formDataToHash = LOCAL.formDataToHash & url[fieldValue]>
		</cfif>
		</cfloop>
		<cfset SESSION.validationToken = Hash(LOCAL.formDataToHash , "SHA-512" )>
		
	</cffunction>
	
</cfcomponent>