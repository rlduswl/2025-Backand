<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
</head>
<body>
    <h2>회원가입 양식</h2>
    <form action="join_result.jsp" method="post">
        이름: <input type="text" name="name"><br><br>
        아이디: <input type="text" name="userid"><br><br>
        비밀번호: <input type="password" name="password"><br><br>
        성별:
        <input type="radio" name="gender" value="남자">남자
        <input type="radio" name="gender" value="여자">여자<br><br>
        관심 분야 (복수 선택):
        <input type="checkbox" name="interest" value="음악">음악
        <input type="checkbox" name="interest" value="독서">독서
        <input type="checkbox" name="interest" value="여행">여행<br><br>
        지역:
        <select name="region">
            <option value="서울">서울</option>
            <option value="부산">부산</option>
            <option value="대구">대구</option>
            <option value="광주">광주</option>
        </select><br><br>
        <input type="submit" value="회원가입">
    </form>
</body>
</html>
