<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=utf-8" %>
<html>
<head>
    <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
     <link rel="stylesheet" href="css/style.css">
<title>Notebook</title>
</head>

    <body topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0">

    
	<jsp:include page="menu.jsp" />
        
        <BR><BR>
        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            request.setCharacterEncoding("utf-8");
		    String inputNum = request.getParameter("num");
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try{
                String jdbcDriver = "jdbc:mysql://localhost:3306/products?useUnicode=true&characterEncoding=utf8";
                String dbOrder = " ORDER BY PriceLow";
                String dbWhere = " where num="+inputNum;
                String dbUser = "inhatc";
                String dbPwd = "inhatech";

                conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPwd);

                pstmt = conn.prepareStatement("select *, format(priceLow, 0) as price from tv"+dbWhere+dbOrder);

                rs = pstmt.executeQuery();

                int number=1;
                while(rs.next()){
        %>
        
        <table width=80% align="center">
            <tr>
                <td rowspan=12 width=300>
                    <img src=image/Image<%=rs.getString("num") %>.png width=300 height=200>
                </td> 
            <tr>
                <td> 제품명 </td><td align="center"><%= rs.getString("name") %> </td> 
            <tr>    
                <td> 크기 </td>
            	<td align="center"><%= rs.getInt("SizeCm") %>-<%= rs.getInt("SizeIn") %></td>
            <tr>    
                <td> 제조사 </td>
            	<td align="center"><%= rs.getString("Maker") %></td>
            <tr>    
                <td> HDMI </td>
            	<td align="center"><%= rs.getInt("HDMI") %></td>
            <tr>    
                <td> USB </td>
            	<td align="center"><%= rs.getInt("USB") %></td>
            <tr>    
                <td> 무게 </td>
            	<td align="center"><%= rs.getFloat("Weight") %> Kg</td>            
            <tr>
                <td> 최저가 </td><td align="right"><%= rs.getString("Price") %> 원</td> 
            
        </table>
        <%
                number++;
                }
            }catch(SQLException se){
                se.printStackTrace();
            }finally{
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            }
        %>
    
	<jsp:include page="footer.jsp" />
</body>