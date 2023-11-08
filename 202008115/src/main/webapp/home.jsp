<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/style.css">
<style type="text/css">
tr{
border-bottom: 2px solid lightgray;


}


</style>


<title>Notebook</title>
</head>

<jsp:include page="menu.jsp" />

<body>
	<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	int intPage = 0, totalPages = 1;
	int TOTAL = 6;
	/* parameter get */
	request.setCharacterEncoding("utf-8");
	String order = request.getParameter("order");
	String pages = request.getParameter("page");
	if (pages == null) {
		intPage = 0;
	} else {
		intPage = Integer.valueOf(pages);
	}

	try {
		String jdbcDriver = "jdbc:mysql://localhost:3306/products?useUnicode=true&characterEncoding=utf8";
		String dbWhere = ""; //" where PriceLow > 1000000";
		String dbUser = "inhatc";
		String dbPwd = "inhatech";
		String requestSelect = "*, format(priceLow, 0) as price";//"num, cpuCore, Maker, Graphic, Ram, PriceLow";

		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPwd);
		requestSelect = "select " + requestSelect + " from tv" + dbWhere;
		pstmt = conn.prepareStatement(requestSelect);

		rs = pstmt.executeQuery();
		rs.next();
	%>
	<BR>
	<BR>

	<div class="row" style="margin-left: 12%;">

		<div class="col-md-6">
			<table>
				<tr>
					<td colspan="2" align=center><img
						src="image/Image<%=rs.getString("num")%>.png"
						style="width: 100%; height: 200px;"></td>
				</tr>
				<tr></tr>

				<tr>
					<td><a href=mysql_part.jsp?num= <%=rs.getInt("num")%>><%=rs.getString("name")%></a></td>
				</tr>
				<tr>
					<td>Display Size</td>
					<td><%=rs.getInt("SizeCm")%>-<%=rs.getInt("SizeIn")%></td>
				</tr>
				<tr>
					<td>Technology</td>
					<td><%=rs.getString("Tech")%></td>
				</tr>
				<tr>
					<td>Maker</td>
					<td><%=rs.getString("Maker")%></td>
				</tr>
				<tr>
					<td>Resolution</td>
					<td><%=rs.getString("REsolution")%></td>
				</tr>
				<tr>
					<td>Speaker</td>
					<td><%=rs.getInt("SpeakerPower")%></td>
				</tr>
				<tr>
					<td>Connection</td>
					<td>HDIM:<%=rs.getInt("HDMI")%>/USB:<%=rs.getInt("USB")%></td>
				</tr>
				<tr>
					<td>Power Consumption</td>
					<td><%=rs.getInt("Power")%> W</td>
				</tr>
				<tr>
					<td>가격</td>
					<td align="right"><B><%=rs.getString("Price")%> 원</B></td>
				</tr>
				<%
				rs.next();
				%>
			</table>

		</div>

		<div class="col-md-6">
			<div>

				<table>


					<tr>
						<td colspan="2" align=center><img
							src="image/Image<%=rs.getString("num")%>.png"
							style="width: 100%; height: 150px;"></td>
					</tr>
					<tr>
						<td>Display Size</td>
						<td><%=rs.getInt("SizeCm")%>-<%=rs.getInt("SizeIn")%></td>
					</tr>
					<tr>
						<td>가격</td>
						<td align="right"><B><%=rs.getString("Price")%> 원</B></td>
					</tr>

				<%
				rs.next();
				%>
				</table>
			</div>
			<table>


				<tr>
					<td colspan="2" align=center><img
						src="image/Image<%=rs.getString("num")%>.png"
						style="width: 100%; height: 150px;"></td>
				</tr>
				<tr>
					<td>Display Size</td>
					<td><%=rs.getInt("SizeCm")%>-<%=rs.getInt("SizeIn")%></td>
				</tr>
				<tr>
					<td>가격</td>
					<td align="right"><B><%=rs.getString("Price")%> 원</B></td>
				</tr>

				<%
				rs.next();
				%>
			</table>
		</div>



	</div>
	<br>

	<div class="row" style="margin-left: 12%;">

		<div class="col-md-6">
			<table>
				<tr>
					<td colspan="2" align=center><img
						src="image/Image<%=rs.getString("num")%>.png"
						style="width: 100%; height: 200px;"></td>
				</tr>
				<tr></tr>

				<tr>
					<td><a href=mysql_part.jsp?num= <%=rs.getInt("num")%>><%=rs.getString("name")%></a></td>
				</tr>
				<tr>
					<td>Display Size</td>
					<td><%=rs.getInt("SizeCm")%>-<%=rs.getInt("SizeIn")%></td>
				</tr>
				<tr>
					<td>Technology</td>
					<td><%=rs.getString("Tech")%></td>
				</tr>
				<tr>
					<td>Maker</td>
					<td><%=rs.getString("Maker")%></td>
				</tr>
				<tr>
					<td>Resolution</td>
					<td><%=rs.getString("REsolution")%></td>
				</tr>
				<tr>
					<td>Speaker</td>
					<td><%=rs.getInt("SpeakerPower")%></td>
				</tr>
				<tr>
					<td>Connection</td>
					<td>HDIM:<%=rs.getInt("HDMI")%>/USB:<%=rs.getInt("USB")%></td>
				</tr>
				<tr>
					<td>Power Consumption</td>
					<td><%=rs.getInt("Power")%> W</td>
				</tr>
				<tr>
					<td>가격</td>
					<td align="right"><B><%=rs.getString("Price")%> 원</B></td>
				</tr>
				<%
				rs.next();
				%>
			</table>

		</div>

		<div class="col-md-6">
			<div>

				<table>


					<tr>
						<td colspan="2" align=center><img
							src="image/Image<%=rs.getString("num")%>.png"
							style="width: 100%; height: 150px;"></td>
					</tr>
					<tr>
						<td>Display Size</td>
						<td><%=rs.getInt("SizeCm")%>-<%=rs.getInt("SizeIn")%></td>
					</tr>
					<tr>
						<td>가격</td>
						<td align="right"><B><%=rs.getString("Price")%> 원</B></td>
					</tr>
					<%
					rs.next();
					%>

				</table>
			</div>
			<table>


				<tr>
					<td colspan="2" align=center><img
						src="image/Image<%=rs.getString("num")%>.png"
						style="width: 100%; height: 150px;"></td>
				</tr>
				<tr>
					<td>Display Size</td>
					<td><%=rs.getInt("SizeCm")%>-<%=rs.getInt("SizeIn")%></td>
				</tr>
				<tr>
					<td>가격</td>
					<td align="right"><B><%=rs.getString("Price")%> 원</B></td>
				</tr>

				<%
				rs.next();
				%>
				<%
				} catch (SQLException se) {
				se.printStackTrace();
				} finally {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
				}
				%>
			</table>
		</div>



	</div>


	<jsp:include page="footer.jsp" />
</body>
</html>