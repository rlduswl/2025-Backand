<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.text.DecimalFormat" %>
<%
    // 입력받은 점수 가져오기
    int korean = Integer.parseInt(request.getParameter("korean"));
    int english = Integer.parseInt(request.getParameter("english"));
    int math = Integer.parseInt(request.getParameter("math"));

    // 총점과 평균 계산
    int sum = korean + english + math;
    double average = sum / 3.0;

    // 평균 소수점 둘째자리까지 출력
    String formattedAverage = String.format("%.2f", average);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>점수 결과</title>
</head>
<body>
    <h2>점수 결과</h2>
    <p>국어 점수: <%= korean %></p>
    <p>영어 점수: <%= english %></p>
    <p>수학 점수: <%= math %></p>
    <p>총점: <%= sum %></p>
    <p>평균: <%= formattedAverage %></p>
</body>
</html>
