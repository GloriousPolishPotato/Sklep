<%--
  Created by IntelliJ IDEA.
  User: Studia
  Date: 24.02.2021
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- START navigation bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="#">Fixeo</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="Servlet?page=index">Shop <span class="sr-only">(current)</span></a>
            </li>

            <c:if test="${ empty user || user.getStatus() == '' }">
                <li class="nav-item">
                    <a class="nav-link" href="logIn.jsp">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="signUp.jsp">Sign-up</a>
                </li>
            </c:if>
            <c:if test="${ user.getStatus() == 'user' }">
                <li class="nav-item">
                    <a class="nav-link" href="Servlet?page=logout">Logout</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Servlet?page=transactions">Transactions</a>
                </li>
            </c:if>
            <c:if test="${ user.getStatus() == 'admin' }">
                <li class="nav-item">
                    <a class="nav-link" href="Servlet?page=logout">Logout</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Servlet?page=allTransactions">Orders</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Servlet?page=productListAdmin">Products</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Servlet?page=addProductPage">Add product</a>
                </li>
            </c:if>
        </ul>

        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="shopCart.jsp" style="font-size: 28px; padding: 0 0 0 20px;" >
                    <i class="fa fa-shopping-cart fa-2x" style="font-size:28px; color: #aaaaaa"></i>
                    <c:if test="${empty shopCart}">
                        ( 0 )
                    </c:if>
                    <c:if test="${not empty shopCart}">
                        ( <c:out value="${shopCart.getTotalAmount()}"/> )
                    </c:if>
                </a>
            </li>
        </ul>
    </div>
</nav>
<!-- END navigation bar -->
