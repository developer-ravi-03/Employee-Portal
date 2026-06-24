<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Registration</title>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap"
	rel="stylesheet">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	background: linear-gradient(135deg, #dbeafe, #bfdbfe);
	padding: 20px;
}

.container {
	width: 620px;
	max-width: 95%;
	background: rgba(255, 255, 255, 0.96);
	border-radius: 20px;
	padding: 28px;
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.25);
	transition: all 0.3s ease;
}

.header {
	text-align: center;
	margin-bottom: 18px;
}

.header h2 {
	color: #0f172a;
	font-size: 30px;
	font-weight: 700;
}

.header p {
	color: #475569;
	font-size: 14px;
	margin-top: 6px;
}

.form-group {
	margin-bottom: 14px;
}

label {
	display: block;
	margin-bottom: 8px;
	color: #314d7d;
	font-size: 15px;
	font-weight: 600;
}

input[type=text], input[type=password], input[type=date], textarea {
	width: 100%;
	height: 48px;
	padding: 0 16px;
	border: 1.5px solid #cbdcf6;
	border-radius: 12px;
	transition: all .25s ease;
	font-size: 16px;
	font-weight: 500;
}

input:hover, textarea:hover {
	border-color: #38bdf8;
	background: #f8fdff;
}

input:focus, textarea:focus {
	outline: none;
	border-color: #2563eb;
	background: white;
	box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.12);
}

textarea {
	resize: none;
	height: 70px;
}

.gender-box {
	display: flex;
	gap: 18px;
	margin-top: 2px;
}

.gender-box label {
	display: flex;
	align-items: center;
	gap: 6px;
	font-weight: 500;
	margin-bottom: 0;
	cursor: pointer;
}

.password-wrapper {
	position: relative;
}

.toggle-password {
	position: absolute;
	right: 12px;
	top: 50%;
	transform: translateY(-50%);
	border: none;
	background: none;
	cursor: pointer;
	color: #1e3a8a;
	font-size: 13px;
	font-weight: 600;
	transition: all .3s ease;
}

.btn {
	width: 100%;
	border: none;
	background: linear-gradient(135deg, #0f172a, #1e3a8a);
	color: white;
	padding: 14px;
	border-radius: 12px;
	font-size: 15px;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.3s ease;
}

.btn:hover {
	background: linear-gradient(135deg, #1e3a8a, #38bdf8);
	transform: translateY(-3px);
	box-shadow: 0 10px 25px rgba(30, 58, 138, 0.35);
}

.login-link {
	display: block;
	text-align: center;
	margin-top: 16px;
	padding: 12px;
	text-decoration: none;
	color: #1e3a8a;
	font-weight: 600;
	border-radius: 12px;
	background: #eff6ff;
	transition: all 0.3s ease;
}

.login-link:hover {
	background: #dbeafe;
	color: #0f172a;
	transform: translateY(-2px);
}

.error-box {
	background: #fee2e2;
	color: #dc2626;
	padding: 10px 12px;
	border-radius: 10px;
	margin-bottom: 15px;
	border-left: 5px solid #dc2626;
}

@media ( max-width :700px) {
	.container {
		padding: 22px;
	}
	.header h2 {
		font-size: 26px;
	}
}

@media ( max-width :700px) {
	.form-row {
		flex-direction: column;
		gap: 0;
	}
	.container {
		padding: 25px;
	}
}
</style>

</head>

<body>

	<div class="container">

		<div class="header">
			<h2>Employee Registration</h2>

		</div>

		<c:if test="${not empty error}">
			<div class="error-box">${error}</div>
		</c:if>

		<form action="register" method="post">
			<div class="form-group">
				<label>Full Name</label> <input type="text" name="name" required>
			</div>
			<div class="form-group">
				<label>Date of Birth</label> <input type="date" name="dob" required>
			</div>
			<div class="form-group">
				<label>Gender</label>
				<div class="gender-box">
					<label> <input type="radio" name="gender" value="Male"
						required> Male
					</label> <label> <input type="radio" name="gender" value="Female">
						Female
					</label>
				</div>
			</div>
			<div class="form-group">
				<label>Address</label> <input type="text" name="address" required>
			</div>
			<div class="form-group">
				<label>City</label> <input type="text" name="city" required>
			</div>
			<div class="form-group">
				<label>State</label> <input type="text" name="state">
			</div>
			<div class="form-group">
				<label>Login ID</label> <input type="text" name="loginId" required>
			</div>
			<div class="form-group">
				<label>Password</label>
				<div class="password-wrapper">
					<input type="password" id="password" name="password" required>
					<button type="button" class="toggle-password"
						onclick="togglePassword()">Show</button>
				</div>
			</div>
			<button type="submit" class="btn">Register Account</button>
		</form>

		<a href="login" class="login-link"> Already have an account? Sign
			In </a>

	</div>

	<script>
		function togglePassword() {

			const password = document.getElementById("password");

			const btn = document.querySelector(".toggle-password");

			if (password.type === "password") {
				password.type = "text";
				btn.innerText = "Hide";
			} else {
				password.type = "password";
				btn.innerText = "Show";
			}
		}
	</script>

</body>
</html>