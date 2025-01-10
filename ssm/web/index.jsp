<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>图书管理系统</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
        }
        .sidebar {
            width: 200px;
            background-color: #f4f4f4;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0,0,0,0.1);
        }
        .sidebar a {
            display: block;
            text-decoration: none;
            color: black;
            font-size: 18px;
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }
        .sidebar a:hover {
            background-color: #ddd;
        }
        .content {
            flex-grow: 1;
            padding: 20px;
        }
        h1 {
            text-align: center;
            margin-top: 50px;
        }
    </style>
</head>
<body>
<div class="sidebar">
    <h3>功能菜单</h3>
    <a href="book/borrow">借图书</a>
    <a href="book/return">还图书</a>
</div>
<div class="content">
    <h1>欢迎来到图书管理系统</h1>
    <p>请选择左侧菜单进行操作。</p>
</div>
</body>
</html>
