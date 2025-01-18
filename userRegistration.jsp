<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <link rel="stylesheet"  href="NewFile.css">
</head>
<body>
    <div class="container">
        <h1>User Registration</h1>
        <form action="UserServlet" method="post">
            <input type="hidden" name="action" value="register">
            
            <div class="form-row">
                <label for="firstName">First Name:</label>
                <input type="text" id="firstName" name="firstName" required placeholder="Enter your first name" maxlength="20">
                <label for="lastName">Last Name:</label>
                <input type="text" id="lastName" name="lastName" required placeholder="Enter your last name" maxlength="20">
            
            </div>
            
           
                
            
            <div class="form-row">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required placeholder="@gmail.com" maxlength="50">
                <label for="phone">Phone:</label>
                <input type="tel" id="phone" name="phone" pattern="\d{10}" required placeholder="Enter your phone number" 
                title="Phone number should be 10 digits, 0-9 numbers">
            </div>
            
            <div class="form-row">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required placeholder="Create a password" 
                pattern="^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@#$!%*?&])[A-Za-z\d@$#!%*?&]{8,}$" 
                title="Password should be at least 8 characters, include letters, numbers, and special characters">
                
          	    <label for="confirmPassword">Confirm Password:</label>
        		<input type="password" id="confirmPassword" name="confirmPassword" required><br><br>
            </div>
            
            <div class="form-row">
                <label for="pincode">Pincode:</label>
                <input type="text" id="pincode" name="pincode" required placeholder="Enter your pincode">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" required placeholder="Enter your address">
            </div>
				 
		    <div class="form-row">
			<label for="dob">Date of Birth:</label>
                <input type="date" id="dob" name="dob" required>
              </div>  
              
            <div class="form-row">
                <button type="submit">Register</button>
                <button type="reset">Reset</button>
                
            </div>
            <div class="form-forget">
             <a href="userLogin.jsp">Login</a>
             </div>
        </form>
        
       
    </div>
</body>

</html>
