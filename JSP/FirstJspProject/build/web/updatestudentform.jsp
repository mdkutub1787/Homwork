<%@page import="model.Student" %>
<%@page import="dao.StudentDao" %>

<%
String id=request.getParameter("id");
Student s=StudentDao.getById(Integer.parseInt(id));
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Update Form</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .form-container {
                background-color: #fff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                width: 300px;
            }
            h1 {
                text-align: center;
                margin-bottom: 20px;
                font-size: 24px;
                color: #333;
            }
            form {
                display: flex;
                flex-direction: column;
            }
            label {
                margin-bottom: 5px;
                font-weight: bold;
                color: #333;
            }
            input[type="text"],
            input[type="email"],
            input[type="submit"] {
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 5px;
                font-size: 14px;
            }
            input[type="submit"] {
                background-color: #4CAF50;
                color: white;
                border: none;
                cursor: pointer;
                transition: background-color 0.3s;
            }
            input[type="submit"]:hover {
                background-color: #45a049;
            }
        </style>
    </head>
    <body>
        <div class="form-container">
            <h1>Student Update Form</h1>
            <form action="updatestudent.jsp" method="post">
                <input type="hidden" name="id" value="<%=s.getId()%>">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="<%=s.getName()%>">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<%=s.getEmail()%>">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" value="<%=s.getAddress()%>">
                <label for="cell">Cell No:</label>
                <input type="text" id="cell" name="cell" value="<%=s.getCell()%>">
                <input type="submit" value="Save">
            </form>
        </div>
    </body>
</html>
