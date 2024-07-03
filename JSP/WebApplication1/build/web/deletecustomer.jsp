<jsp:useBean class="model.Customer" id="c"/>
<%@page import="dao.CustomerDao"%>
<jsp:setProperty name="c" property="*"/>

<%
CustomerDao.deleteCustomer(c);

    response.sendRedirect("showcustomer.jsp");
    
%>