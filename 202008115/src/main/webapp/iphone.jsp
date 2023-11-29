<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.*" %>

<html>
<head>
    <style>
        body {
            font-family: 'Helvetica Neue', Arial, sans-serif;
            background-color: #f8f9fa;
        }

        table {
            width: 80%;
            margin: auto;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {           
            border: 1px solid #343a40;          
            padding: 8px;
            text-align: center;
        }

        th {
            background-color: #343a40;
            color: white;
        }

        a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

        a:hover {
            color: #0056b3;
            text-decoration: underline;
        }

        .pagination {
            margin: 20px 0;
        }

        .pagination a {
            color: #007bff;
            float: left;
            padding: 8px 16px;
            text-decoration: none;
            transition: background-color .3s;
            border: 1px solid #dee2e6;
            margin: 0 4px;
        }

        .pagination a.active {
            background-color: #007bff;
            color: white;
            border: 1px solid #007bff;
        }

        .pagination a:hover:not(.active) {
            background-color: #ddd;
        }
    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="css/style.css">
    <title>Notebook</title>
</head>
    
<jsp:include page="menu.jsp" />

<body>
    <br>
    <h2 align="center" style="margin-top:10px;">
        Think different
    </h2>
   <table>
        <thead>
            <tr align=center  bgcolor=black style="color: white;">
                <th><a href="list.jsp?./list.jsp">Mac</a></th>
                <th><a href="./iphone.jsp">i-phone</a></th>
              	<th><a href="./airpods.jsp">Airpods</a></th>
            </tr>
        </thead>
        <tbody>
        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            int intPage = 0, totalPages =1;
            int TOTAL = 9;
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
                String dbUser = "root";
                String dbPwd = "inhatech";
                String requestSelect = "*, format(priceLow, 0) as price";//"num, cpuCore, Maker, Graphic, Ram, PriceLow";

                String dbOrder = ""; //" ORDER BY PriceLow";
                if(order != null) {
                    dbOrder = " ORDER BY " + order;    
                }
                
                /* MySQL Connection */
                conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPwd);
              
                String allRequest = "select count(num) as cnt from iphone"+dbWhere+dbOrder;
                pstmt = conn.prepareStatement(allRequest);
                rs = pstmt.executeQuery();
                rs.next();
                
                totalPages = rs.getInt("cnt");
               
                pstmt.close();
                rs.close();
                              
                //out.println(totalPages + ":" + intPage);
                allRequest = "select "+requestSelect+" from iphone"+dbWhere+dbOrder;
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
                    <%
int itemsPerPage = 9; // 한 페이지에 표시할 항목 수
int currentPage = intPage + 1; // 현재 페이지
int startIndex = currentPage * itemsPerPage - itemsPerPage; // 시작 인덱스


pstmt = conn.prepareStatement(allRequest);
rs = pstmt.executeQuery();

int count = 0; // 현재 페이지에서 표시한 항목 수를 계산하기 위한 변수

while (rs.next()) {
    // 리스트 아이템 내용을 표시
%>
<!-- 리스트 아이템 내용 -->
<td>
    <table>
         <tr>
            <td align="center"><%= rs.getString("num") %></td>
        </tr>
        <tr>
            <td align="center"><img src="image/iphone<%= rs.getString("num") %>.jpg" width="72" height="48"></td>
        </tr>
        <tr>
            <td><a href="iphonedetail.jsp?num=<%= rs.getString("num") %>&name=<%= rs.getString("name") %>&Maker=<%= rs.getString("Maker") %>&DisplayCm=<%= rs.getString("DisplayCm") %>&DisplayRes=<%= rs.getString("DisplayRes") %>&Price=<%= rs.getString("Price") %>&MaxUseTime=<%= rs.getString("MaxUseTime") %>&SSD=<%= rs.getString("SSD") %>&RAM=<%= rs.getString("RAM") %>"><%= rs.getString("name") %></a></td>
        </tr>
        <tr>
            <td align="center">CPU:<%= rs.getString("CPUName") %> </td>
        </tr>      
        <tr>
            <td align="center">코어:<%= rs.getInt("cpuCore") %></td>
        </tr>       
        <tr>
            <td align="center">램:<%= rs.getString("RAM") %> GB</td>
        </tr>
        <tr>
            <td align="center">최대사용시간:<%= rs.getString("MaxUseTime") %> 시간</td>
        </tr>
        <tr>
            <td align="right"><b>가격:<%= rs.getString("Price") %> 원</b></td>
        </tr>
    </table>
</td>
<%
    count++;

    if (count % 3 == 0) { // 한 행에 3개의 열을 표시하도록 수정
%>
</tr>
<tr>
<%
    }
}
%>

<%
if (count % 3 != 0) { // 마지막 행이 완전하지 않은 경우 닫아줍니다.
%>
</tr>
<%
}
%>
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
            
        %>

       </tbody>
    </table> 
    <jsp:include page="footer.jsp" />
</body>
