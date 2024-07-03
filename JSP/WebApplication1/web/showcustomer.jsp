<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="model.Customer"%>
<%@page import="dao.CustomerDao" %>
<%@page import="java.util.*" %>

<%
List <Customer> list=CustomerDao.showCustomer();
request.setAttribute("List",list);
%>

<table border="1">
    
    <thead>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Address</th>
            <th>Phone</th>
            <th>Action</th>
        </tr>
    </thead>
    
    <tbody>
        <c:forEach var="e" items="${List}">
            <tr>
                <td>${e.getId()}</td>
                <td>${e.getName()}</td>
                <td>${e.getAddress()}</td>
                <td>${e.getPhone()}</td>
                <td>
                    <a href="updatecustomerform.jsp?id=${e.getId()}">Edit</a>
                    <a href="deletecustomer.jsp?id=${e.getId()}">Delete</a>
                </td>
            </tr> 
            
        </c:forEach>
    </tbody>
    
</table>