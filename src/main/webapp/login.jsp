<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Login</title>

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
	width: 450px;
	max-width: 95%;
	background: rgba(255, 255, 255, 0.96);
	backdrop-filter: blur(12px);
	border-radius: 20px;
	padding: 30px;
	box-shadow: 0 20px 40px rgba(0, 0, 0, 0.25);
}

.header {
	text-align: center;
	margin-bottom: 20px;
}

.header h2 {
	color: #0f172a;
	font-size: 30px;
	font-weight: 700;
}

.form-group {
	margin-bottom: 16px;
}

label {
	display: block;
	margin-bottom: 8px;
	color: #314d7d;
	font-size: 15px;
	font-weight: 600;
}

input[type=text], input[type=password] {
	width: 100%;
	height: 48px;
	padding: 0 16px;
	border: 1.5px solid #cbdcf6;
	border-radius: 12px;
	background: #ffffff;
	color: #1f2937;
	font-size: 16px;
	font-weight: 500;
	transition: all .25s ease;
}

input:focus {
	outline: none;
	border-color: #2563eb;
	background: white;
	box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.12);
}

.btn {
	width: 100%;
	border: none;
	background: linear-gradient(135deg, #0f172a, #1e3a8a);
	color: white;
	padding: 13px;
	border-radius: 12px;
	font-size: 15px;
	font-weight: 600;
	cursor: pointer;
	transition: all .3s ease;
	margin-top: 5px;
}

.btn:hover {
	background: linear-gradient(135deg, #1e3a8a, #38bdf8);
	transform: translateY(-3px);
	box-shadow: 0 10px 25px rgba(30, 58, 138, 0.35);
}

.register-link {
	display: block;
	text-align: center;
	margin-top: 15px;
	padding: 12px;
	border-radius: 12px;
	background: #eff6ff;
	color: #1e3a8a;
	text-decoration: none;
	font-weight: 600;
	transition: all .3s ease;
}

.register-link:hover {
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

.success-box {
	background: #dcfce7;
	color: #15803d;
	padding: 10px 12px;
	border-radius: 10px;
	margin-bottom: 15px;
	border-left: 5px solid #15803d;
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

@media ( max-width :700px) {
	.container {
		padding: 22px;
	}
	.header h2 {
		font-size: 26px;
	}
}
</style>

</head>

<body>

	<div class="container">

		<div class="header">
			<h2>Employee Login</h2>
		</div>

		<c:if test="${not empty error}">
			<div class="error-box">${error}</div>
		</c:if>

		<c:if test="${not empty message}">
			<div class="success-box">${message}</div>
		</c:if>

		<form action="login" method="post">

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

			<input type="submit" value="Login" class="btn">

		</form>

		<a href="${pageContext.request.contextPath}/" class="register-link">
			Not Registered? Register </a>

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