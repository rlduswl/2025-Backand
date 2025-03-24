<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>점수 입력</title>
</head>
<body>
    <h2>학생 점수 입력</h2>
    <form action="score_result.jsp" method="post">
        국어 점수: <input type="text" name="korean"><br>
        영어 점수: <input type="text" name="english"><br>
        수학 점수: <input type="text" name="math"><br>
        <input type="submit" value="제출">
    </form>
</body>
</html>
