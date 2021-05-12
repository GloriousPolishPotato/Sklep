<%--
  Created by IntelliJ IDEA.
  User: Studia
  Date: 12.11.2020
  Time: 09:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Shop</title>

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

        <div class="container-fluid" style="padding: 0px; min-height: 100vh;">
            <div class="row">
                <!-- left side -->
                <div class="col-2" style="background-color:#aaa; min-height: 100vh;">
                    <br>
                    <br>
                    <h5> Filter product </h5>
                    <hr>
                    <h6 class="text-info" style="color: #424242"> Select category </h6>
                    <ul class="list-group" style="list-style-type:none;">
                        <li class="a-space-category">
                                <span>
                                    <a style=" color: black;" href="Servlet?page=selectCategory&id=0">
                                        ALL
                                    </a>
                                </span>
                        </li>
                        <c:forEach items="${categoryList}" var="category">
                            <li class="a-space-category">
                                <span>
                                    <a style=" color: black;" href="Servlet?page=selectCategory&id=<c:out value="${category.getId()}"/>" >
                                        <c:out value="${category.getName()}"></c:out>
                                    </a>
                                </span>
                            </li>
                        </c:forEach>
                    </ul>
                    <br>
                    <br>
                </div>
                <!-- left side end-->

                <!-- right side -->
                <div class="col-10" style="background-color:#bbb; min-height: 100vh;
                 padding-top: 20px">

                        <c:forEach items="${productList }" var="product">
                            <div class="column" style="min-width: 292px">
                                <div class="card" style="margin-bottom: 40px">
                                    <img src="data:image/jpg;base64,${product.getBase64Image()}" class="img-responsive" width="240" height="240" style="margin-left: auto; margin-right: auto"/>
                                    <div class="card-body">
                                        <h5 class="card-title" style="margin-bottom: 12px"> <b> <c:out value="${product.getName() }"></c:out> </b></h5>
                                        <p class="card-text" style="margin-bottom: 8px"><c:out value="${product.getDescription() }"></c:out></p>
                                        <p style="text-align: center; margin-bottom: 8px"><c:out value="${ String.format( '%.2f', product.getPrice()) }"></c:out> zł </p>

                                        <c:if test="${!product.getAvailable()}">
                                            <div class="text-center">
                                                <a class="btn btn-primary disabled">Add to Cart</a>
                                            </div><br>
                                            <a>product temporarily unavailable</a>
                                        </c:if>
                                        <c:if test="${product.getAvailable()}">
                                            <div class="text-center">
                                                <a class="btn btn-primary" href="Servlet?page=addToCart&id=<c:out value="${product.getId()}"/>">Add to Cart</a>
                                            </div><br>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
        <!-- right side end -->

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

        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.bundle.min.js"></script>

    </body>
</html>
