<%@ page contentType="text/html; charset=UTF-8" %>
<%
    request.setCharacterEncoding("UTF-8");

    String name = request.getParameter("name");
    String userid = request.getParameter("userid");
    String password = request.getParameter("password");
    String gender = request.getParameter("gender");
    String region = request.getParameter("region");
    String[] interests = request.getParameterValues("interest");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 결과</title>
</head>
<body>
    <h2>회원가입 정보</h2>
    <p><strong>이름:</strong> <%= name %></p>
    <p><strong>아이디:</strong> <%= userid %></p>
    <p><strong>비밀번호:</strong> <%= password %></p>
    <p><strong>성별:</strong> <%= gender %></p>
    <p><strong>관심 분야:</strong>
        <%
            if (interests != null) {
                for (String interest : interests) {
                    out.print(interest + " ");
                }
            } else {
                out.print("선택 없음");
            }
        %>
    </p>
    <p><strong>지역:</strong> <%= region %></p>
</body>
</html>
