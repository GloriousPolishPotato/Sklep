<%--
  Created by IntelliJ IDEA.
  User: Studia
  Date: 04.03.2021
  Time: 02:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Products list</title>

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

<div class="container-fluid" style="background-color:#eeeeee; min-height: 100vh;">
    <div class="row">
        <div class="col-8 offset-2" style="padding: 40px; background: #ffffff;">

            <div class="row" style=" padding: 20px; margin-top: 20px" align="center">

                <div class="center font-size-2">
                    <p><b>Product list</b></p>
                </div>

            </div>

            <table class="table table-striped">
                <thead>
                <tr>
                    <th scope="col">#id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Price</th>
                    <th scope="col">Category</th>
                    <th scope="col">Availability</th>
                    <th scope="col">Edit</th>
                </tr>
                </thead>
                <tbody>
                    <c:forEach items="${productList }" var="product">
                        <tr>
                            <th scope="row"><c:out value="${product.getId()}"></c:out></th>
                            <td><c:out value="${product.getName()}"></c:out></td>
                            <td><c:out value="${ String.format( '%.2f', product.getPrice()) }"></c:out> zł </td>
                            <c:forEach items="${categoryList}" var="category">
                                <c:if test="${product.getId_category() == category.getId()}">
                                    <td><c:out value="${category.getName()}"></c:out></td>
                                </c:if>
                            </c:forEach>
                            <c:if test="${product.getAvailable() == true}">
                                <td>available</td>
                            </c:if>
                            <c:if test="${product.getAvailable() == false}">
                                <td>unavailable</td>
                            </c:if>
                            <td><a href="Servlet?page=editProduct&id=<c:out value="${product.getId()}"/>"> Edit </a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
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
