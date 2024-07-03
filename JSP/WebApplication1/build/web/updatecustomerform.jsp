<%@page import="model.Customer"%>
<%@page import="dao.CustomerDao" %>

<%
String id=request.getParameter("id"); 
 Customer c=CustomerDao.getById(Integer.parseInt(id));
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Customer Update Form</h1>

        <form action="updatecustomer.jsp" method="post">

            <input type="hidden" name="id" value="<%=c.getId()%>" >

            Name:<input type="text" name="name" value="<%=c.getName()%>"> <br>
            Address:<input type="text" name="address" value="<%=c.getAddress()%>"> <br>
            Phone:<input type="text" name="phone" value="<%=c.getPhone()%>"> <br>

            <input type="submit" value="Save">
        </form>
            
    </body>
</html>
