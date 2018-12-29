<%--
  Created by IntelliJ IDEA.
  User: makeme
  Date: 12/27/18
  Time: 9:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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

            <!-- put new button: Add Customer -->

            <input type="button" value="Add Customer"
                   onclick="window.location.href='/customer/showFormForAdd'; return false;"
                   class="add-button"
            />

            <!--  add a search box -->
            <form:form action="/customer/search" method="POST">
                Search customer: <input type="text" name="theSearchName" />

                <input type="submit" value="Search" class="add-button" />
            </form:form>


            <!-- ADD OUR HTML TABLE HERE -->

            <TABLE>
                <TR>
                    <TH>First Name</TH>
                    <TH>Last Name</TH>
                    <TH>Email</TH>
                    <TH>Action</TH>
                </TR>

                <c:forEach var="tempCustomer" items="${customers}">

                    <!-- construct an update link with customer id -->
                    <c:url var ="updateLink" value="/customer/showFormForUpdate">
                        <c:param name="customerId" value="${tempCustomer.id}" />
                    </c:url>

                    <!-- construct an delete link with customer id -->
                    <c:url var ="deleteLink" value="/customer/delete">
                        <c:param name="customerId" value="${tempCustomer.id}" />
                    </c:url>

                    <tr>
                        <td>${tempCustomer.firstName}</td>
                        <td>${tempCustomer.lastName}</td>
                        <td>${tempCustomer.email}</td>
                        <td>
                            <!-- display the update link -->
                            <a href="${updateLink}">Update</a>
                            |
                            <a href="${deleteLink}" onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </TABLE>
        </div>
    </div>

</div>
</body>
</html>
