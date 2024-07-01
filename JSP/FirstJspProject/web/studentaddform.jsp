

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Student Form</h1>
        <form action="saveStudent.jsp" method="post">
            Name: <input type="text" name="name">
            Email: <input type="email" name="email">
            Address: <input type="text" name="address">
            Cell No: <input type="text" name="cell">

            <input type="submit" value="Save">


        </form>

    </body>
</html>
