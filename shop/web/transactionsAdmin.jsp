<%--
  Created by IntelliJ IDEA.
  User: Studia
  Date: 03.03.2021
  Time: 20:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Transactions</title>

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
        <div class="col-6 offset-3" style="padding: 40px">

            <div class="row" style="background: #ffffff; padding: 20px; margin-top: 20px" align="center">

                <div class="center font-size-2">
                    <p><b>Transactions list</b></p>
                </div>

            </div>

            <c:forEach items="${orderList}" var="order">
                <div class="row" style="background: #ffffff; padding: 20px; margin-top: 20px">
                    <div class="column-transactions">
                        <h5 style="margin-bottom: 16px"> <b><c:out value="${ order.getTimestamp().toString() }"></c:out> </b></h5>
                        <div class="column-transactions" style="padding-left: 40px">

                            <p style="margin-bottom: 8px">Client name: <c:out value="${ order.getFullName() }"></c:out></p>
                            <p style="margin-bottom: 8px">Email: <c:out value="${ order.getEmail() }"></c:out></p>
                            <p style="margin-bottom: 16px">tel: <c:out value="${ order.getPhone() }"></c:out></p>

                            <p style="margin-bottom: 8px">Address: <c:out value="${ order.getAddress() }"></c:out></p>
                            <p style="margin-bottom: 8px">         <c:out value="${ order.getPostalAddress() }"></c:out></p>

                            <p style="margin-bottom: 8px">Product list:</p>

                            <div class="row">
                                <div class="column">
                                    <c:set var="i" value="0"></c:set>
                                    <c:forEach items="${order.getOrderedProducts().getProducts()}" var="product">
                                        <p style="margin-bottom: 8px; margin-left: 8px"> <c:out value="${order.getOrderedProducts().getAmount().get(i) }"></c:out> x </p>
                                        <c:set var="i" value="${i+1}"></c:set>
                                    </c:forEach>
                                </div>

                                <div class="column">
                                    <c:set var="i" value="0"></c:set>
                                    <c:forEach items="${order.getOrderedProducts().getProducts()}" var="product">
                                        <p style="margin-bottom: 8px; margin-left: 8px"><c:out value="${ product.getName() }"></c:out></p>
                                        <c:set var="i" value="${i+1}"></c:set>
                                    </c:forEach>
                                </div>

                                <div class="column">
                                    <c:set var="i" value="0"></c:set>
                                    <c:forEach items="${order.getOrderedProducts().getProducts()}" var="product">
                                        <p style="margin-bottom: 8px; margin-left: 8px">price: <c:out value="${ String.format( '%.2f',product.getPrice()) }"></c:out> zł </p>
                                        <c:set var="i" value="${i+1}"></c:set>
                                    </c:forEach>
                                </div>
                            </div>

                            <!--
                            <c:set var="i" value="0"></c:set>
                            <c:forEach items="${order.getOrderedProducts().getProducts()}" var="product">
                                <div class="row">
                                    <p style="margin-bottom: 8px; margin-left: 8px"> <c:out value="${order.getOrderedProducts().getAmount().get(i) }"></c:out> x </p>
                                    <p style="margin-bottom: 8px; margin-left: 8px"><c:out value="${ product.getName() }"></c:out></p>
                                    <p style="margin-bottom: 8px; margin-left: 8px">price: <c:out value="${ String.format( '%.2f',product.getPrice()) }"></c:out> zł </p>
                                </div>
                                <c:set var="i" value="${i+1}"></c:set>
                            </c:forEach>
                             -->
                        </div>

                        <p style="margin-bottom: 8px; margin-left: 8px">Total price: <c:out value="${ String.format( '%.2f',order.getOrderedProducts().getTotalPrice()) }"></c:out> zł </p>
                        <c:if test="${ empty order.getSent() || order.getSent() == false }">
                            <p style="margin-bottom: 8px; margin-left: 8px">Status: Waiting to be shipped</p>
                            <a class="btn btn-primary" href="Servlet?page=sentOrder&id=<c:out value="${order.getId()}"/>">Sent</a>
                        </c:if>
                        <c:if test="${ order.getSent() == true }">
                            <p style="margin-bottom: 8px; margin-left: 8px">Status: Sent</p>
                        </c:if>
                    </div>
                </div>
            </c:forEach>
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
