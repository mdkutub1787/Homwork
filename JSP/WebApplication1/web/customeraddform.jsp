
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Customer Form</h1>

        <form action="savecustomer.jsp"method="post">
            Name:<input type="text" name="name"> <br><br>
            Address:<input type="text" name="address"> <br><br>
            Phone:<input type="text" name="phone"> <br><br>

            <input type="submit" value="Save Data">
        </form>
    </body>
</html>
