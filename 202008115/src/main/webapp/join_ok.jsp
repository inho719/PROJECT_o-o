<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=utf-8" %>

<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String phone1 = request.getParameter("phone1");
	String phone2 = request.getParameter("phone2");
	String phone3 = request.getParameter("phone3");
	String gender = request.getParameter("gender");
	
	// 1.변수선언
    String jdbcDriver = "jdbc:mysql://localhost:3306/products?useUnicode=true&characterEncoding=utf8";
    String dbUser = "inhatc";
    String dbPwd = "inhatech";
	String putData = null;

	Connection conn = null;
	PreparedStatement pstmt = null;
    ResultSet rs = null;
    
	String sql = "insert into users values(?, ?, ?, ?, ?, ?, ?) ";
	String shaPW = "passwd";
	String getSHA = "select SHA(";
	int count = 0;
	boolean already=false;
	//out.println("test");
	try{
		// 1. 드라이버 로드
		Class.forName("com.mysql.cj.jdbc.Driver");
        request.setCharacterEncoding("utf-8");
        
		// 2. conn 생성
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPwd);
		
		// getSHA
		putData = "select SHA(\'" + pw +"\') as shaPW";
		
		//out.println(putData);
		
		pstmt = conn.prepareStatement(putData);
		
		rs = pstmt.executeQuery();
		rs.next();
		
		shaPW = rs.getString("shaPW");
		pstmt.close();
		
		// id가 기존에 있었는지 확인
		putData = "select count(num) as cnt from users where userid=\'"+id+"\'";
		//out.println(putData);
		
		pstmt = conn.prepareStatement(putData);
		
		rs = pstmt.executeQuery();
		rs.next();
		
		if(rs.getInt("cnt")== 0)already =true;
		
		pstmt.close();
		
		//out.println(already);
		
		if(already){
		
			pstmt = conn.prepareStatement("SELECT COUNT(*) AS CNT FROM USERS");
			rs = pstmt.executeQuery();
			
			rs.next();
			count = rs.getInt("CNT");
			pstmt.close();
			
			out.println(shaPW + "nothing");
			// 3. pstmt 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, count+1);
			pstmt.setString(2, name);
			pstmt.setString(3, id);
			pstmt.setString(4, shaPW);
			pstmt.setString(5, phone1);
			pstmt.setString(6, phone2);
			pstmt.setString(7, phone3);
			// 4. sql문 실행
			int result = pstmt.executeUpdate();

			if(result == 1){ // 성공
				response.sendRedirect("join_success.jsp");
			} else{ // 실패
				
				%>
				<H3>사용자 등록이 안 됩니다. 관리자에게 연락해주세요.</H3>
				<a href="addUser.jsp">다시 가입하기</a>
				<%
				//response.sendRedirect("join_fail.jsp");
			}
			
		}
		else{
			%>
			<H3>ID가 이미 존재합니다.</H3>
			<a href="addUser.jsp">다시 가입하기</a>
			<%
			//response.sendRedirect("join_fail.jsp");
		}
		
	} catch(Exception e){
		e.printStackTrace();
	} finally{
		try{
			if(conn != null) conn.close();
			if(pstmt != null) pstmt.close();
		} catch(Exception e){
			e.printStackTrace();
		}
	}
	
%>