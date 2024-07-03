<jsp:useBean class="model.Customer" id="c"/>
<%@page import="dao.CustomerDao"%>
<jsp:setProperty name="c" property="*"/>

<%
int i=CustomerDao.saveCustomer(c);
if(i>0){
    response.sendRedirect("success.jsp");
    }
    else{
        response.sendRedirect("erorr.jsp");
    }
%>
