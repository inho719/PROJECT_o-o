<%@ page contentType="text/html;charset=utf-8" %>

<head>
    <link rel="stylesheet"
        href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        /* Add your custom styles here */
        table {
            width: 50%;
            margin: 0 auto;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
        	 color: white;
   			 background-color: #343a40;
        }
    </style>
    <title>Notebook</title>
</head>

<jsp:include page="menu.jsp" />

<H3 class="m-4" align="center">
    정보통신공학과<br> Project: Apple
</H3>
<div>
    <H1 align=center>
        <img style="width: 35%; height: 40%;" src="https://kr.seaicons.com/wp-content/uploads/2023/08/users-1-icon.png">
    </H1>
</div>

<div align="center">
    <table>
        <thead>
            <tr>
                <th>이름</th>
                <th>학번</th>
                <th>역할</th>                
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>김기준</td>
                <td>202008096</td>
                <td>기능, CSS, DB</td>                                       
            </tr>
            <tr>
                <td>황인호</td>
                <td>202008115</td>
                <td>기능, CSS, DB</td>                                       
            </tr>
            <tr>
                <td>전준모</td>
                <td>202008108</td>
                <td>기능, CSS, DB</td>                                       
            </tr>
        </tbody>
    </table>
</div>

<jsp:include page="footer.jsp" />
