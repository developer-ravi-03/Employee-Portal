
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Dashboard</title>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	background: linear-gradient(135deg, #e0f2fe, #bae6fd);
	min-height: 100vh;
	padding: 30px;
}

/* Dashboard Container */
.dashboard {
	max-width: 1300px;
	margin: auto;
}

/* Header */
.header {
	background: linear-gradient(135deg, #0f172a, #1e3a8a);
	color: white;
	padding: 25px 35px;
	border-radius: 16px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	box-shadow: 0 12px 30px rgba(15, 23, 42, 0.25);
	margin-bottom: 30px;
}

.welcome h2 {
	font-size: 28px;
	font-weight: 600;
}

.welcome p {
	margin-top: 6px;
	font-size: 14px;
	opacity: 0.9;
}

/* Logout Button */
.logout-btn {
	text-decoration: none;
	background: white;
	color: #1e3a8a;
	padding: 12px 24px;
	border-radius: 8px;
	font-weight: 600;
	transition: all 0.3s ease;
}

.logout-btn:hover {
	background: #2563eb;
	color: white;
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(30, 58, 138, 0.3);
}

/* Employee Section */
.employee-card {
	background: white;
	border-radius: 16px;
	padding: 25px;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.08);
}

.section-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.section-header h3 {
	color: #0f172a;
	font-size: 24px;
	font-weight: 600;
}

.badge {
	background: #dbeafe;
	color: #1e3a8a;
	padding: 8px 16px;
	border-radius: 50px;
	font-size: 14px;
	font-weight: 600;
	border: 1px solid #93c5fd;
}

/* Table */
.table-container {
	overflow-x: auto;
}

table {
	width: 100%;
	border-collapse: collapse;
	border: 2px solid #1e3a8a;
	border-radius: 10px;
	overflow: hidden;
}

thead {
	background: #1e3a8a;
	color: white;
}

th {
	padding: 16px;
	text-align: center;
	font-weight: 600;
	border: 2px solid #1e3a8a;
}

td {
	padding: 14px;
	text-align: center;
	color: #334155;
	border: 1.5px solid #64748b;
	font-weight: 500;
}

tbody tr {
	transition: all 0.3s ease;
}

tbody tr:nth-child(even) {
	background: #f8fafc;
}

tbody tr:hover {
	background: #dbeafe;
	transform: scale(1.002);
}

/* Responsive */
@media ( max-width : 768px) {
	.header {
		flex-direction: column;
		gap: 15px;
		text-align: center;
	}
	.section-header {
		flex-direction: column;
		gap: 10px;
	}
}
</style>
</head>

<body>

	<div class="dashboard">

		<!-- Header -->
		<div class="header">

			<div class="welcome">
				<h2>Welcome, ${employee.name}</h2>
				<p>Employee Management Dashboard</p>
			</div>

			<a href="${pageContext.request.contextPath}/logout"
				class="logout-btn">
				Logout
			</a>

		</div>

		<!-- Employee List -->
		<div class="employee-card">

			<div class="section-header">
				<h3>Registered Employees</h3>

				<span class="badge">
					${employees.size()} Employees
				</span>
			</div>

			<div class="table-container">

				<table>

					<thead>
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>City</th>
							<th>State</th>
							<th>Login ID</th>
						</tr>
					</thead>

					<tbody>

						<c:forEach items="${employees}" var="emp">
							<tr>
								<td>${emp.id}</td>
								<td>${emp.name}</td>
								<td>${emp.city}</td>
								<td>${emp.state}</td>
								<td>${emp.loginId}</td>
							</tr>
						</c:forEach>

					</tbody>

				</table>

			</div>

		</div>

	</div>

</body>
</html>