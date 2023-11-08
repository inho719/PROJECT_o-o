<%@ page contentType = "text/html;charset=utf-8" %>
<%
%>

<%
    int multi=Integer.parseInt(request.getParameter("multi"));
%>

    <hr> <%=multi%> 단 <br>

    <%
        for(int i=0; i<9;i++){ 
    %>
                <%=multi%> * <%=i+1 %> = <%=(i+1)*multi %>  <br>           
    <%    
        }
    %>
