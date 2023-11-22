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
<title>Notebook</title>
</head>
    
<jsp:include page="menu.jsp" />

<body>
    <BR><BR>
   <table width="80%" align="center">
        <thead>
            <tr align=center  bgcolor=#AAAAAA>
                <th><a href="?order=num">#</a></th>
                <th><a href="?order=name">이름</a></th>
                <th><A href="?order=DisplayInch">Display Inch</A></th>
                <th><A href="?order=Maker">Maker</A></th>
                <th><A href="?order=cpuCore">CPU Core</A></th>
                <th><A href="?order=Graphic">Graphic Card</A></th>
                <th><A href="?order=RAM">RAM</A></th>
                <th><A href="?order=PriceLow">가격</A></th>
            </tr>
        </thead>
        <tbody>
        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try{
                String jdbcDriver = "jdbc:mysql://localhost:3306/products?useUnicode=true&characterEncoding=utf8";
                String dbWhere = ""; //" where PriceLow > 1000000";
                String dbUser = "inhatc";
                String dbPwd = "inhatech";
                String requestSelect = "*";//"num, cpuCore, Maker, Graphic, Ram, PriceLow";
                
                /* parameter get */
                request.setCharacterEncoding("utf-8");
		        String order = request.getParameter("order");
                String dbOrder = ""; //" ORDER BY PriceLow";
                if(order != null) {
                    dbOrder = " ORDER BY " + order;    
                }
                conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPwd);
                String allRequest = "select "+requestSelect+" from notebook"+dbWhere+dbOrder;
                pstmt = conn.prepareStatement(allRequest);
                //out.print(allRequest);
                rs = pstmt.executeQuery();

                int number=1;
                while(rs.next()){
        %>
                <tr>
                    <td><%=number%></td>
                    <td><A href=mysql_part.jsp?num=<%=rs.getString("num") %>><%= rs.getString("name") %></A></td>
                    <td align="center"><%= rs.getString("DisplayInch") %></td>
                    <td align="center"><%= rs.getString("Maker") %></td>
                    <td align="center"><%= rs.getString("cpuCore") %></td>
                    <td align="center"><%= rs.getString("Graphic") %></td>
                    <td align="center"><%= rs.getString("RAM") %> GB</td>
                    <td align="center"><%= rs.getString("MaxUseTime") %> 시간</td>
                    <td align="center"><%= rs.getString("CPUName") %> </td>
                    <td align="center"><%= rs.getString("Weight") %> </td>
                    <td align="center"><%= rs.getString("Chip") %> </td>
                    <td align="center"><%= rs.getString("Bluetooth") %> </td>                    
                    <td align="right"><%= rs.getString("PriceLow") %></td>
                </tr>
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
        </tbody>
    </table> 
</body>
<jsp:include page="footer.jsp" />
