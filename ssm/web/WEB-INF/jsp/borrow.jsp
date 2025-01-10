<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>借书页面</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f4f4f4;
        }
        .book-container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .book-image {
            max-width: 200px;
            height: auto;
            margin-bottom: 20px;
        }
        .book-info {
            margin-bottom: 20px;
        }
        .book-info h2 {
            margin: 0;
            font-size: 24px;
        }
        .book-info p {
            margin: 5px 0;
            font-size: 18px;
        }
        .borrow-button {
            padding: 10px 20px;
            font-size: 18px;
            color: white;
            background-color: #28a745;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .borrow-button:hover {
            background-color: #218838;
        }
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.4);
        }
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 300px;
            border-radius: 8px;
        }
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        .modal-content input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .modal-content input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .modal-content input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
${msg}
<!-- The Modal -->
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2>借书信息</h2>
        <form action="borrowBook" method="post">
            <input id="bookId" type="hidden" name="bookId" value="">
            <input type="text" name="borrowerName" placeholder="姓名" required>
            <input type="text" name="borrowerPhone" placeholder="电话" required>
            <input type="submit" value="提交">
        </form>
    </div>
</div>

<script>
    function openModal(bookId) {
        document.getElementById("bookId").value = bookId;
        document.getElementById("myModal").style.display = "block";
    }

    function closeModal() {
        document.getElementById("bookId").value = "";
        document.getElementById("myModal").style.display = "none";
    }
</script>
</body>
</html>
