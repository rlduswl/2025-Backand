<%@ page contentType="text/html; charset=UTF-8" %>
<%
    String xStr = request.getParameter("x");
    String yStr = request.getParameter("y");
    String op = request.getParameter("op");

    String result = "";
    boolean isCalculated = false;

    if (xStr != null && yStr != null && op != null) {
        try {
            int x = Integer.parseInt(xStr);
            int y = Integer.parseInt(yStr);
            isCalculated = true;

            switch(op) {
                case "+":
                    result = "덧셈 결과는 : " + (x + y);
                    break;
                case "-":
                    result = "뺄셈 결과는 : " + (x - y);
                    break;
                case "*":
                    result = "곱셈 결과는 : " + (x * y);
                    break;
                case "/":
                    if (y == 0) {
                        result = "0으로 나눌 수 없습니다.";
                    } else {
                        double div = (double)x / y;
                        result = "나눗셈 결과는 : " + div;
                    }
                    break;
                default:
                    result = "올바른 연산자가 아닙니다.";
            }
        } catch (NumberFormatException e) {
            result = "숫자를 정확히 입력해주세요.";
        }
    }
%>
<html>
<head><meta charset="UTF-8"><title>계산기</title></head>
<body>
    <form method="get" action="calculate_1.jsp">
        x: <input type="text" name="x" value="<%= xStr != null ? xStr : "" %>"><br>
        y: <input type="text" name="y" value="<%= yStr != null ? yStr : "" %>"><br>
        <input type="submit" name="op" value="+">
        <input type="submit" name="op" value="-">
        <input type="submit" name="op" value="*">
        <input type="submit" name="op" value="/">
    </form>
    <br>
    <% if (isCalculated) { %>
        <div><strong><%= result %></strong></div>
    <% } %>
</body>
</html>
