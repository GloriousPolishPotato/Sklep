<%--
  Created by IntelliJ IDEA.
  User: Studia
  Date: 28.02.2021
  Time: 23:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Shop Cart</title>

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
            <div class="col-10" style="padding: 40px">
                <c:if test="${shopCart.getTotalAmount()==0 || empty shopCart }">
                    <div class="row" style="background: #ffffff; padding: 20px; margin-top: 20px">
                        <div class="column-empty-cart">
                            <div class="center">
                                <h8 style="margin-bottom: 12px"> <b>Your Cart is empty, visit store to browse products</b></h8>
                                <br>
                                <a class="btn btn-warning" href="Servlet?page=index" role="button" style="width: 50%; margin-left: auto; margin-right: auto">Go to store</a>
                            </div>
                        </div>
                    </div>
                </c:if>
                <c:set var="i" value="0"></c:set>
                <c:forEach items="${shopCart.getProducts() }" var="product">
                    <div class="row" style="background: #ffffff; padding: 20px; margin-top: 20px">
                        <img src="data:image/jpg;base64,${product.getBase64Image()}" class="img-responsive" width="160" height="160" style="float: left"/>
                        <div class="column">
                            <h5 style="margin-bottom: 12px"> <b> <c:out value="${product.getName() }"></c:out> </b></h5>
                            <p style="margin-bottom: 8px"><c:out value="${product.getDescription() }"></c:out></p>
                            <p style="margin-bottom: 8px"><c:out value="${ String.format( '%.2f',product.getPrice()) }"></c:out> zł </p>
                            <p style="margin-bottom: 8px"> quantity: <c:out value="${ shopCart.getAmount().get(i) }"></c:out></p>
                        </div>
                    </div>
                    <c:set var="i" value="${i+1}"></c:set>
                </c:forEach>
            </div>

            <div class="col-2" style="background-color:#aaa; min-height: 100vh; padding: 20px">
                <div class="row" style="background: #ffffff; padding: 20px">
                    <c:if test="${shopCart.getTotalAmount()==0 || empty shopCart }">
                        <p style="font-size:20px; margin-bottom: 12px; display:inline">Subtotal (no items): </p>
                        <a class="btn btn-warning disabled" href="order.jsp" role="button" style="width: 100%">Proceed to checkout</a>
                    </c:if>
                    <c:if test="${shopCart.getTotalAmount() == 1}">
                        <p-inline style="font-size:20px; margin-bottom:0px">Subtotal (<c:out value="${ shopCart.getTotalAmount() }"></c:out> items): </p-inline>
                        <p-inline style="font-size:20px; margin-bottom: 12px; display:inline"><b><c:out value="${ String.format( '%.2f',shopCart.getTotalPrice())}"></c:out>zł</b></p-inline>
                        <a class="btn btn-warning" href="order.jsp" role="button" style="width: 100%">Proceed to checkout</a>
                    </c:if>
                    <c:if test="${shopCart.getTotalAmount() > 1}">
                        <p-inline style="font-size:20px; margin-bottom:0px">Subtotal (<c:out value="${ shopCart.getTotalAmount() }"></c:out> items): </p-inline>
                        <p-inline style="font-size:20px; margin-bottom: 12px; display:inline"><b><c:out value="${ String.format( '%.2f',shopCart.getTotalPrice())}"></c:out>zł</b></p-inline>
                        <a class="btn btn-warning" href="order.jsp" role="button" style="width: 100%">Proceed to checkout</a>
                    </c:if>
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
    </div>
</body>
</html>
