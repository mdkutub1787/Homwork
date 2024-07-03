<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="k" %>
<%@page import="model.Employee" %>
<%@page import="dao.EmployeeDao" %>
<%@page import="java.util.*" %>

<%
List <Employee> list=EmployeeDao.viewAllEmployee();
request.setAttribute("List",list);

%>
<table border="1">
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Address</th>
            <th>Cell</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>

        <k:forEach var="e" items="${List}">
            <tr>
                <td>${e.getId()}</td>
                <td>${e.getName()}</td>
                <td>${e.getEmail()}</td>
                <td>${e.getAddress()}</td>
                <td>${e.getCell()}</td>
                <td>
                    <a href="updateemployeeaddform.jsp?id=${e.getId()}">Edit</a>
                    <a href="deleteemployee.jsp?id=${e.getId()}">Delete</a>
                </td>
            </tr>
        </k:forEach> 

    </tbody>


</table>