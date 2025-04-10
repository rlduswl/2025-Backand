<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*" %>
<%
    request.setCharacterEncoding("utf-8");

    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String pwd = request.getParameter("pwd");

    Connection con = null;
    PreparedStatement pstmt = null;

    try {
        // 1. DB 연동 드라이버 로드
        Class.forName("org.mariadb.jdbc.Driver");

        // 2. 연결 객체 생성
        String url = "jdbc:mariadb://localhost:3306/backend";
        String user = "YeonJi";
        String passwd = "1111";
        con = DriverManager.getConnection(url, user, passwd);

        // 3. SQL 준비
        String sql = "UPDATE MEMBER SET NAME=?, PWD=? WHERE ID=?";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, name);
        pstmt.setString(2, pwd);
        pstmt.setString(3, id);

        // 4. SQL 실행
        pstmt.executeUpdate();

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 5. 객체 해제
        if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
        if (con != null) try { con.close(); } catch (Exception e) {}
    }
%>

<script>
    alert("변경되었습니다!");
    location.href = 'list.jsp';
</script>
