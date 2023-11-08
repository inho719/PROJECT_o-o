<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.*" %>

<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<title>Notebook</title>
</head>
    
<jsp:include page="menu.jsp" />

<body>
    <BR>
    <H2 align=center>
        Product List
    </H2>
   <table width="80%" align="center">
        <thead>
            <tr align=center  bgcolor=#AAAAAA>
            	<th><a href="?order=num"> Num</a> </th>
                <th></th>
                <th><a href="?order=name">이름</a></th>
                <th><A href="?order=SizeCm">Display</A></th>
                <th><A href="?order=Maker">Maker</A></th>
                <th><A href="?order=HDMI">HDMI</A></th>
                <th><A href="?order=USB">USB</A></th>
                <th><A href="?order=Weight">Weight</A></th>
                <th><A href="?order=PriceLow">가격</A></th>
            </tr>
        </thead>
        <tbody>
        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            int intPage = 0, totalPages =1;
            int TOTAL = 10;
            /* parameter get */
            request.setCharacterEncoding("utf-8");
	        String order = request.getParameter("order");
	        String pages = request.getParameter("page");
	        if(pages == null){
                intPage = 0;
            } else {
            	intPage = Integer.valueOf(pages);
            }
	        
            try{
                String jdbcDriver = "jdbc:mysql://localhost:3306/products?useUnicode=true&characterEncoding=utf8";
                String dbWhere = ""; //" where PriceLow > 1000000";
                String dbUser = "inhatc";
                String dbPwd = "inhatech";
                String requestSelect = "*, format(priceLow, 0) as price";//"num, cpuCore, Maker, Graphic, Ram, PriceLow";

                String dbOrder = ""; //" ORDER BY PriceLow";
                if(order != null) {
                    dbOrder = " ORDER BY " + order;    
                }
                
                /* MySQL Connection */
                conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPwd);
              
                String allRequest = "select count(num) as cnt from tv"+dbWhere+dbOrder;
                pstmt = conn.prepareStatement(allRequest);
                rs = pstmt.executeQuery();
                rs.next();
                
                totalPages = rs.getInt("cnt");
               
                pstmt.close();
                rs.close();
                              
                //out.println(totalPages + ":" + intPage);
                allRequest = "select "+requestSelect+" from tv"+dbWhere+dbOrder;
                pstmt = conn.prepareStatement(allRequest);
                //out.print(allRequest);
                rs = pstmt.executeQuery();

                int number=1;
                int p = 0;
               
                
                //out.println(${fn:length(rs)});
                while(rs.next()){
                	//out.println((number-1)/TOTAL - intPage);
        			
                	if( (number-1)/TOTAL - intPage < 0){
                	}
                	else{
        %>
                    <tr>
                        <td align=center> <%=rs.getString("num")%></td>
                        <td align=center><img src=image/Image<%=rs.getString("num") %>.png width=72 height=48></td>
                        <td><A href=mysql_part.jsp?num=<%=rs.getString("num") %>><%= rs.getString("name") %></A></td>
                        <td align="center"><%= rs.getInt("SizeCm") %>-<%= rs.getInt("SizeIn") %></td>
                        <td align="center"><%= rs.getString("Maker") %></td>
                        <td align="center"><%= rs.getInt("HDMI") %></td>
                        <td align="center"><%= rs.getInt("USB") %></td>
                        <td align="center"><%= rs.getFloat("Weight") %> Kg</td>
                                          
                        <td align="right"><B><%= rs.getString("Price") %> 원</B></td>
                    </tr>
        <%
                	}
                	number++;
        			//out.print(number+":");
        			//out.println((number-1)/TOTAL - intPage);
        			if((number-1)/TOTAL - intPage >= 1) break;
                }
            }catch(SQLException se){
                se.printStackTrace();
            }finally{
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            }
            if(totalPages > 1){
            	%>
            	<tr>
            		<td colspan=9 align=center> Pages : 
            			<%
            				String linkPoint = "<A href=?";
            				if(order != null) linkPoint=linkPoint+"order="+order+"&";
            				int i;
            				for(i=0; i< totalPages/TOTAL; i++){
            					if(i==intPage) out.print(" "+i+" ");
            					else {
            					    out.println(linkPoint+"page="+i+">"+i+"</A>");
            					}
            				}
            				if(totalPages%TOTAL != 0){
            					if(i==intPage) out.print(" "+i+" ");
            					else {
            						out.println(linkPoint+"page="+ i+">"+i+"</A>");
            					}
            					
            				}
            			%>
            			
            		</td>
            	<%
            	
            	
            }
        %>

       </tbody>
    </table> 
    <jsp:include page="footer.jsp" />
</body>
