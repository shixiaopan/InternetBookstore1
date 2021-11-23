<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<body>
<%
  Class.forName("com.mysql.cj.jdbc.Driver");
  String url = "jdbc:mysql://localhost:3306/bookstore?user=root&password=797926&useUnicode=true&characterEncoding=utf-8&autoReconnect=true&failOverReadOnly=false";
  String sql = "select id,name,author,price,image,description,category_id from book" +
          " where category_id = ?";
  String categoryID = request.getParameter("id");
  Connection conn = DriverManager.getConnection(url);
  PreparedStatement stat = conn.prepareStatement(sql);
  stat.setString(1,categoryID);
  ResultSet rs = stat.executeQuery();
  while (rs.next()) {
%>
<div class="col-sm-9 col-md-3">
  <div class="thumbnail" >
      <img src=<%=rs.getString("image")%>>
    <div class="caption">
      <h4><%=rs.getString("name")%></h4>
      <p><%=rs.getString("description")%>
</p>
      <p>
      <a href="#" class="btn btn-primary" role="button">加入购物车</a>
      <a href="#" class="btn btn-default" role="button">查看详情</a>
    </p>
    </div>
  </div>
</div>
<%
  }
  stat.close();
  conn.close();
%>
</body>