<%--
  Created by IntelliJ IDEA.
  User: Studia
  Date: 04.03.2021
  Time: 06:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Edit product</title>

    <!-- bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
          crossorigin="anonymous">
    <!-- icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- custom css -->
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>

<!-- navigation bar -->
<jsp:include page="navigationBar.jsp" />


<div class="container">
    <div class="row mt-5">
        <div class="col-md-5 offset-md-4">
            <div class="card" style="margin-bottom: 40px">
                <div class="card-header text-center custom-bg-grey text-white">
                    <i class="fa fa-gear fa-3x"></i>
                    <h5>Edit Page</h5>
                </div>
                <div class="card-body">
                    <form action="Servlet" method="post" value="updateProduct">

                        <div class="edit-group">
                            <label>Name</label>
                            <input type="text" class="form-control" name="name" value="<c:out value="${product.getName() }"></c:out>" required>
                        </div>
                        <div class="edit-group">
                            <label>Price</label>
                            <input type="number" step="0.01" class="form-control" name="price" value="<c:out value="${product.getPrice() }"></c:out>" required>
                        </div>

                        <div class="edit-group">
                            <label for="description">Description</label>
                            <textarea class="form-control" id="description" rows="3" name="description" value="<c:out value="${product.getDescription() }"></c:out>" required></textarea>
                        </div>

                        <div class="edit-group">
                            <label for="category">Category</label>
                            <select class="form-control" id="category" required>
                                <c:forEach items="${categoryList}" var="category">
                                    <option><c:out value="${category.getName()}"></c:out></option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="edit-group">
                            <label for="available">Available</label>
                            <select class="form-control" id="available" required>
                                <option><c:out value="${true}"></c:out></option>
                                <option><c:out value="${false}"></c:out></option>
                            </select>
                        </div>

                        <div class="center">
                            <img src="data:image/jpg;base64,${product.getBase64Image()}" class="img-responsive" width="200" height="200" style="margin-left: auto; margin-right: auto"/>
                            <input type="file" name="image">
                        </div>

                        <input type="hidden" name="page" value="updateProduct">
                        <input type="hidden" name="id" value="<c:out value="${product.getId() }"/>">

                        <div class="edit-group mt-3">
                            <button type="submit" class="btn btn-primary btn-block">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>


<footer>
    <div class="text-center p-3" style="background-color: #212121">
        © 2020 Copyright:
        <a class="text-white" style="color:white" href="Controller?page=index">Fixeo.pl</a>
    </div>
</footer>

<!-- bootstrap: jQuery, Popper.js -->
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>


</body>
</html>
