

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <h1>Student Form</h1>
        <form action="savestudent.jsp"method="post">
            
            Name:<input type="text" name="name"><br><br>
            Email:<input type="email" name="email"><br><br>
            Address:<input type="text" name="address"><br><br>
            Cell No:<input type="text" name="cell"><br><br>

            <input type="submit" value="Data Save">
        </form>

    </body>
</html>
