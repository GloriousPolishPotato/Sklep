<%--
  Created by IntelliJ IDEA.
  User: Studia
  Date: 12.11.2020
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p> Login: <%=session.getAttribute("daneZSerwletu")%> </p>
<p> Wyporzyczone książki: </p>


<jsp:include page="stopka.jsp" />
</body>
</html>
