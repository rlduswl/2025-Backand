<%@ page contentType="text/html; charset=UTF-8" %>
<%
		request.setCharacterEncoding("UTF-8");
    String writer = request.getParameter("writer");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시글 확인</title>
</head>
<body>
    <h2>게시글 확인</h2>
    <p><strong>작성자:</strong> <%= writer %></p>
    <p><strong>제목:</strong> <%= title %></p>
    <p><strong>내용:</strong><br> <pre><%= content %></pre></p>
</body>
</html>
