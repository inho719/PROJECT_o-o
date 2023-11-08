<%@ page contentType="text/html; charset=utf-8" %>

<head>
	<link href="css/style.css" rel="stylesheet">
</head>
<div class="menu">
     <nav class="clearfix">
    
    <% 
    	Cookie[] cookies = request.getCookies();
    	
    %>
    
        <ul class="clearfix">
          <li style="float: left; margin-left: 10px;"> <a href="home.jsp"> <img style="width: 20px;" alt="" src="https://cdn.imweb.me/thumbnail/20220908/9ee8ddcfb5039.png"></a> </li>
          <li><a href="home.jsp">Home</a></li> <!--""<-여기 부분에 URL 작성하면 됨-->
          <li><a href="about.jsp">About</a></li>
          <li><a href="list.jsp">List</a></li>
          <li><a href="member.jsp">Members</a></li>
          <li><a href="contact.jsp">Contact</a></li>
          <% 
          
          boolean cookieOK = false;
          try{
        	  if(cookies.length > 1) cookieOK = true;
          }catch(Exception e){
      		e.printStackTrace();
      	  }
          
      	//out.println("["+cookies[0].getName()+"]");
          //out.println(cookies.length+"<BR>");
          	if(!cookieOK){
        	  	out.println("  <li><a href=login.jsp>Login</a></li>");
           	}
          	else{
          		out.println("<li><a href=logout.jsp>"+cookies[1].getValue()+"</a></li>");
          		cookies[1].setMaxAge(10*60);
          	}
	      %>
          
        </ul>
        <a id="pull" href="#"></a>
    </nav>
</div>