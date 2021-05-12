<%--
  Created by IntelliJ IDEA.
  User: Studia
  Date: 24.02.2021
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Log In</title>

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

    <div class="container" style="min-height: 100vh;">
        <div class="row mt-5">
            <div class="col-md-5 offset-md-4">
                <div class="card">
                    <div class="card-header text-center custom-bg-grey text-white">
                        <i class="fa fa-user-circle-o fa-3x"></i>
                        <h5>Login Page</h5>
                    </div>
                    <div class="card-body">
                        <form action="LogInServlet" method="post">

                            <c:if test="${errorMsg == 1}">
                                <div class="alert alert-danger" role="alert">
                                    incorrect login or password
                                </div>
                            </c:if>
                            <c:if test="${errorMsg == 2}">
                                <div class="alert alert-success" role="alert">
                                    Your account was created. Use email and password to log in
                                </div>
                            </c:if>

                            <div class="signUp-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="email" value="<c:out value="${email}"></c:out>" required>
                                <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
                            </div>
                            <div class="signUp-group">
                                <label for="InputPassword">Password</label>
                                <input type="password" class="form-control" id="InputPassword" placeholder="Password" name="password" value="<c:out value="${password}"></c:out>" required>
                            </div>

                            <div class="signUp-group mt-3">
                                <button type="submit" class="btn btn-primary btn-block" >Log in</button>
                            </div>
                            <p>
                                You do not have an account? <a href="signUp.jsp" style="color:#F24638;">Create it!</a>
                            </p>
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
