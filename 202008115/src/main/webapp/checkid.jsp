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
		
	// 1.변수선언
    String jdbcDriver = "jdbc:mysql://localhost:3306/products?useUnicode=true&characterEncoding=utf8";
    String dbUser = "inhatc";
    String dbPwd = "inhatech";
	String putData = null;

	Connection conn = null;
	PreparedStatement pstmt = null;
    ResultSet rs = null;
    
	//String sql = "insert into users values(?, ?, ?, ?, ?, ?, ?) ";
	String shaPW = "passwd";
	String getSHA = "select SHA(";
	String password = null;
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
		
		if(rs.getInt("cnt")== 1)already =true;
		
		pstmt.close();
		
		//out.println(already);
		
		if(already){
			putData = "select passwd from users where userid=\'"+id+"\'";
			pstmt = conn.prepareStatement(putData);
			
			rs = pstmt.executeQuery();
			rs.next();
			
			password = rs.getString("passwd");
			pstmt.close();
			
			if(password.equals(shaPW)){
				Cookie cookie_id=new Cookie("userID", id);
				//Cookie cookie_pw=new Cookie("userPW", shaPW);
				cookie_id.setMaxAge(10*60);
				//cookie_pw.setMaxAge(10*60);
				
				response.addCookie(cookie_id);
				//response.addCookie(cookie_pw);
				response.sendRedirect("index.jsp");
			}
			else {
				%>
				<H3>사용자 암호가 틀립니다.</H3>
				<a href="SignUp.jsp">가입하기</a>
				<%
				//response.sendRedirect("join_fail.jsp");
			}			
		}
		else{
			%>
			<H3>ID를 찾을 수 없습니다.</H3>
			<a href="SignUp.jsp">가입하기</a>
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
