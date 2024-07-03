<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                margin: 0;
                padding: 20px;
            }
            h1 {
                font-size: 24px;
                color: #333;
                text-align: center;
                margin-top: 20px;
            }
            h2 {
                font-size: 24px;
                color: #333;
                text-align: center;
                margin-top: 20px;
            }
            a {
                color: #4CAF50;
                text-decoration: none;
                font-size: 18px;
                display: inline-block;
                margin-top: 10px;
                transition: color 0.3s;
            }
            a:hover {
                color: #45a049;
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        
        <h1> <%= new java.util.Date() %> <br></h1>
        <h2>       
            <a href="studentaddform.jsp">Add Student</a><br>
            <a href="viewallstudent.jsp">View All Student</a>
        </h2>
    </body>
</html>
