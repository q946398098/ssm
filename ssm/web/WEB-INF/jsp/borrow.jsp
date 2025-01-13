<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style type="text/css">
    .book-container{
        height: 300px;
    }
    .book-container img{
        width: 200px !important;
        height: 160px !important;
    }
    .caption > h3{
        text-align:center;
    }
    #myModal{
        position: absolute;
        left: 30%;
        top:10%;
        width: 30%;
    }
    #myModal h2{
        text-align: center;
    }
</style>


<jsp:include page="/WEB-INF/jsp/common/header.jsp" />


<div class="page-header">
    <h1><small>Borrow</small></h1>
</div>

<div class="row">
    <c:forEach var="book" items="${books}">
        <div class="col-xs-6 col-md-3 book-container">
            <div class="thumbnail">
                <img src="<%=request.getContextPath()%>${book.pictureUrl}" alt="${book.bookName}">
                <div class="caption">
                    <h3>${book.bookName}</h3>
                    <p>余量：${book.bookCounts}</p>
                    <p>
                        <button onclick="openModal(${book.bookId})" class="btn btn-default" role="button">借书</button>
                    </p>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<!-- The Modal -->
<div id="myModal" class="modal">
    <div class="modal-content">
        <span class="close" onclick="closeModal()">&times;</span>
        <h2>借书信息</h2>
        <form action="borrowBook" method="post">
            <div>
                <input id="bookId" type="hidden" name="bookId" value="">
            </div>
            <div class="input-group">
                <span class="input-group-addon" id="sizing-addon2">姓名</span>
                <input type="text" class="form-control" name="borrowerName" aria-describedby="sizing-addon2">
            </div>
            <div class="input-group">
                <span class="input-group-addon" id="sizing-addon3">电话</span>
                <input type="text" class="form-control" name="borrowerPhone" aria-describedby="sizing-addon3">
            </div>
            <div class="" style="display: flex">
                <button type="submit" class="btn btn-default">Submit</button>
            </div>
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
