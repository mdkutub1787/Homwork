<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Student" %>
<%@page import="dao.StudentDao" %>
<%@page import="java.util.List" %>

<%
List<Student> list = StudentDao.viewAllStudent();
request.setAttribute("list", list);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student List</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f2f2f2;
                margin: 0;
                padding: 20px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }
            table, th, td {
                border: 1px solid black;
            }
            th, td {
                padding: 10px;
                text-align: center;
            }
            th {
                background-color: #4CAF50;
                color: white;
            }
            tr:nth-child(even) {
                background-color: #f2f2f2;
            }
            tr:hover {
                background-color: #ddd;
            }
            a {
                color: red;
                text-decoration: none;
                margin-right: 10px;
            }
            a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>

        <table>

            <thead>
                <tr>
                    <th colspan="6"><h2>Student List</h2></th>
                </tr>
                <tr>                 
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Cell</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="s" items="${list}">
                    <tr>
                        <td>${s.getId()}</td>
                        <td>${s.getName()}</td>
                        <td>${s.getEmail()}</td>
                        <td>${s.getAddress()}</td>
                        <td>${s.getCell()}</td>
                        <td>
                            <a href="updatestudentform.jsp?id=${s.getId()}" style="color:blueviolet">Edit</a>
                            <a href="deletestudent.jsp?id=${s.getId()}">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>
