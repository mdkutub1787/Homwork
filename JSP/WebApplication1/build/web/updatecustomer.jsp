<jsp:useBean class="model.Customer" id="c"/>
<%@page import="dao.CustomerDao"%>
<jsp:setProperty name="c" property="*"/>

<%
CustomerDao.updateCustomer(c);

    response.sendRedirect("success.jsp");
    
%>