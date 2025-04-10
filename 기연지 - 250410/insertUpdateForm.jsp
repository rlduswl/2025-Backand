<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<%
	String id = request.getParameter("id");
	String name = "YeonJi";
	String pwd = "1111";
	String action = "insertPro.jsp";

	if (id != null && !id.trim().equals("")) {
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			String url = "jdbc:mariadb://localhost:3306/backend";
			String user = "YeonJi";
			String passwd = "1111";
			Connection con = DriverManager.getConnection(url, user, passwd);

			String sql = "SELECT * FROM member WHERE id = ?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				name = rs.getString("name");
				pwd = rs.getString("pwd");
				action = "updatePro.jsp";
			}

			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace(); // 개발 시 콘솔 확인용
		}
	} else {
		id = "";
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사용자 입력</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<br>
		<h2 class="text-center font-weight-bold">사용자 입력</h2>
		<hr/>

		<form action="<%= action %>" method="post">
			<div class="form-group">
				<label for="id">ID:</label>
				<input type="text" class="form-control" id="id" name="id" value="<%= id %>" <%= action.equals("updatePro.jsp") ? "readonly" : "" %>>
			</div>
			<div class="form-group">
				<label for="name">NAME:</label>
				<input type="text" class="form-control" id="name" name="name" value="<%= name %>">
			</div>
			<div class="form-group">
				<label for="pwd">PASSWORD:</label>
				<input type="password" class="form-control" id="pwd" name="pwd" value="">
			</div>
			<br>
			<div class="text-center">
				<input type="submit" value="변경" class="btn btn-secondary">  
				<input type="button" value="삭제" class="btn btn-secondary" onclick="location.href='delete.jsp?id=<%= id %>'">
				<input type="button" value="목록" class="btn btn-secondary" onclick="location.href='list.jsp'">
			</div>
		</form>
	</div>
</body>
</html>
