<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String pwd = request.getParameter("pwd");

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		// 1. DB 연동 드라이버 로드
		Class.forName("org.mariadb.jdbc.Driver");

		// 2. 연결 객체 생성
		String url = "jdbc:mariadb://localhost:3306/backend";
		String user = "YeonJi";
		String passwd = "1111";
		con = DriverManager.getConnection(url, user, passwd);

		// 3. 생성된 연결을 통해 SQL문 실행 의뢰 준비
		String sql = "SELECT name, pwd FROM member WHERE id = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);

		// 4. SQL 실행
		rs = pstmt.executeQuery();

		// 5. 주어진 id에 해당되는 name과 pwd 추출
		if (rs.next()) {
			name = rs.getString("name");
			pwd = rs.getString("pwd");
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (rs != null) try { rs.close(); } catch(Exception e) {}
		if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
		if (con != null) try { con.close(); } catch(Exception e) {}
	}
%>	
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사용자 정보 변경</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container">
		<br>
		<h2 class="text-center font-weight-bold">사용자 정보 변경</h2>
		<hr/>
		<form action="updatePro.jsp" method="post">
		  <div class="form-group">
	      <label for="id">ID:</label>
	      <input type="text" class="form-control" id="id" name="id" value="<%=id%>" readonly>
	    </div>
	    <div class="form-group">
	      <label for="name">NAME:</label>
	      <input type="text" class="form-control" id="name" name="name" value="<%=name%>">
	    </div>
	    <div class="form-group">
	      <label for="pwd">PASSWORD:</label>
	      <input type="password" class="form-control" id="pwd" name="pwd" value="<%=pwd%>">
	    </div>
	    <br>
	    <div class="text-center">
	    	<input type="submit" value="변경" class="btn btn-secondary">  
			<input type="button" value="삭제" class="btn btn-secondary" onclick="location.href='delete.jsp?id=<%=id%>'">
			<input type="button" value="목록" class="btn btn-secondary" onclick="location.href='list.jsp'">
		</div>
		</form>
	</div>
</body>
</html>
