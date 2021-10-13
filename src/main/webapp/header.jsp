<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>Header</title>
    <style>
        .header{
           display: flex;
           flex-direction: column;
           align-items: center;
           margin: 20px 0;
        }
        h1{
            font-size: 40px;
        }
        .move-page{
            min-width: 300px;
            display: flex;
            justify-content: space-between;
        }
        .page-path{
            font-size: 24px;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>User Management</h1>

        <div class="move-page">
            <a href="addEmployee.jsp" class="page-path">Add New User</a>
            <a href="index.jsp" class="page-path">List All User</a>
        </div>
    </div>
</body>
</html>