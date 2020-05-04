<%--
  Created by IntelliJ IDEA.
  User: BADRobin
  Date: 28.04.2020
  Time: 16:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <title>List Customers</title>

    <link type="text/css"
          rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/style.css" />
</head>
<body>
<div id="wrapper">
    <div id="header">
        <h2>CRM - Customer Relationship Manager</h2>
    </div>
</div>

<div id="container">

    <div id="content">

        <p>
            User: <security:authentication property="principal.username" />, Role(s): <security:authentication property="principal.authorities" />
        </p>


        <security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">

            <input type="button" value="Add Customer"
                   onclick="window.location.href='showFormForAdd'; return false;"
                   class="add-button"
            />

        </security:authorize>



        <table>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>

                <security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">

                    <th>Action</th>

                </security:authorize>

            </tr>

            <c:forEach var="tempCustomer" items="${customers}">

                <c:url var="updateLink" value="/customer/showFormForUpdate">
                    <c:param name="customerId" value="${tempCustomer.id}" />
                </c:url>

                <c:url var="deleteLink" value="/customer/delete">
                    <c:param name="customerId" value="${tempCustomer.id}" />
                </c:url>

                <tr>
                    <td> ${tempCustomer.firstName} </td>
                    <td> ${tempCustomer.lastName} </td>
                    <td> ${tempCustomer.email} </td>

                    <security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">

                        <td>
                            <security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
                                <a href="${updateLink}">Update</a>
                            </security:authorize>

                            <security:authorize access="hasAnyRole('ADMIN')">
                                <a href="${deleteLink}"
                                   onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">Delete</a>
                            </security:authorize>
                        </td>

                    </security:authorize>

                </tr>

            </c:forEach>

        </table>

    </div>

</div>

<p></p>

<form:form action="${pageContext.request.contextPath}/logout"
           method="POST">

    <input type="submit" value="Logout" class="add-button" />

</form:form>
</body>
</html>
