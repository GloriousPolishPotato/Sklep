<%--
  Created by IntelliJ IDEA.
  User: Studia
  Date: 24.02.2021
  Time: 22:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Register</title>

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
                        <h5>Registration Page</h5>
                    </div>
                    <div class="card-body">
                        <form action="SingUpServlet" method="post">

                            <c:if test="${errorMsg == 1}">
                                <div class="alert alert-danger" role="alert">
                                    Password do not match
                                </div>
                            </c:if>
                            <c:if test="${errorMsg == 2}">
                                <div class="alert alert-danger" role="alert">
                                    Password must be at least 6 characters long
                                </div>
                            </c:if>

                            <div class="signUp-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" name="email" value="<c:out value="${email}"></c:out>" required>
                            </div>
                            <div class="signUp-group">
                                <label for="InputPassword">Password</label>
                                <input type="password" class="form-control" id="InputPassword" placeholder="Password" name="password" value="<c:out value="${password}"></c:out>" required>
                            </div>
                            <div class="signUp-group">
                                <label for="confirmPassword">Re-enter password</label>
                                <input type="password" class="form-control" id="confirmPassword" placeholder="Password" name="confirmPassword" value="<c:out value="${confirmPassword}"></c:out>" required>
                            </div>

                            <div class="signUp-group mt-3">
                                <button type="submit" class="btn btn-primary btn-block" >Submit</button>
                            </div>

                            <p>
                                Already have an account? <a href="logIn.jsp" style="color:#F24638;">Login!</a>
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

</body>
</html>
