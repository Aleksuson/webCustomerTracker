<%--
  Created by IntelliJ IDEA.
  User: makeme
  Date: 12/27/18
  Time: 9:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <title>List Customers</title>

    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>

    <div id="wrapper">
        <div id="header">
            <h2>CRM - Customer Relationship Manager</h2>
        </div>

        <div id="container">

            <div id="content">
                <!-- ADD OUR HTML TABLE HERE -->

                <TABLE>
                    <TR>
                        <TH>First Name</TH>
                        <TH>Last Name</TH>
                        <TH>Email</TH>
                    </TR>

                    <c:forEach var="tempCustomer" items="${customers}">
                        <tr>
                            <td>${tempCustomer.firstName}</td>
                            <td>${tempCustomer.lastName}</td>
                            <td>${tempCustomer.email}</td>
                        </tr>
                    </c:forEach>
                </TABLE>
            </div>
        </div>

    </div>
</body>
</html>
