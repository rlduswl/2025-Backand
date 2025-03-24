<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시판 글쓰기</title>
</head>
<body>
    <h2>게시판 글쓰기</h2>
    <form action="board_result.jsp" method="post">
        작성자: <input type="text" name="writer"><br><br>
        제목: <input type="text" name="title"><br><br>
        내용:<br>
        <textarea name="content" rows="6" cols="50"></textarea><br><br>
        <input type="submit" value="등록">
    </form>
</body>
</html>
