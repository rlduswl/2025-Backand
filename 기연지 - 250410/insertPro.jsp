<%@ page import="java.sql.*" %>
<%
    request.setCharacterEncoding("UTF-8");

    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String pwd = request.getParameter("pwd");

    Connection con = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("org.mariadb.jdbc.Driver");
        String url = "jdbc:mariadb://localhost:3306/backend";
        String user = "YeonJi";
        String passwd = "1111";
        con = DriverManager.getConnection(url, user, passwd);

        String sql = "INSERT INTO member (id, name, pwd) VALUES (?, ?, ?)";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.setString(2, name);
        pstmt.setString(3, pwd);

        pstmt.executeUpdate();

    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        if(pstmt != null) try { pstmt.close(); } catch(Exception e) {}
        if(con != null) try { con.close(); } catch(Exception e) {}
    }

    response.sendRedirect("list.jsp");
%>
