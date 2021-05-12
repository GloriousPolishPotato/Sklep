<%--
  Created by IntelliJ IDEA.
  User: Studia
  Date: 01.03.2021
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Finishing order</title>

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
        <div class="col-md-6 offset-md-3">
            <div class="card">
                <div class="card-header text-center custom-bg-grey text-white">
                    <i class="fa fa-shopping-cart fa-3x"></i>
                    <h5>Fill in the form</h5>
                </div>

                <div class="card-body" style="text-align: left">
                    <form action="Servlet" method="post">
                        <div class="form-group row" style="margin-bottom: 8px">
                            <label for="inputEmail" class="col-sm-3 col-form-label">Email</label>
                            <div class="col-sm-9">
                                <c:if test="${ not empty Servlet.getUser()}">
                                    <input type="email" class="form-control" id="inputEmail" placeholder="Email" name="email" value="<c:out value="${Servlet.getUser().getEmail()}"></c:out>" required>
                                </c:if>
                                <c:if test="${ empty Servlet.getUser()}">
                                    <input type="email" class="form-control" id="inputEmail" placeholder="Email" name="email" required>
                                </c:if>
                            </div>
                        </div>
                        <div class="form-group row" style="margin-bottom: 8px">
                            <label for="inputName" class="col-sm-3 col-form-label">Name</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="inputName" placeholder="Name" name="name" required>
                            </div>
                        </div>
                        <div class="form-group row" style="margin-bottom: 8px">
                            <label for="inputSurname" class="col-sm-3 col-form-label">Surname</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="inputSurname" placeholder="Surname" name="surname" required>
                            </div>
                        </div>
                        <div class="form-group row" style="margin-bottom: 8px">
                            <label for="inputEmail" class="col-sm-3 col-form-label">Phone No.</label>
                            <div class="col-sm-9">
                                <input type="tel" class="form-control" id="inputPhone" placeholder="Phone No." name="phoneNumber" required>
                            </div>
                        </div>

                        <br>

                        <div class="form-group row" style="margin-bottom: 8px">
                            <label class="col-sm-3 col-form-label">Address</label>
                        </div>

                        <div class="form-group row" style="margin-bottom: 8px">
                            <div class="col-sm-6">
                                <input type="text" class="form-control" id="inputStreet" placeholder="Street" name="street" required>
                            </div>
                            <div class="col-sm-3">
                                <input type="number" class="form-control" id="inputHouseNumber" placeholder="House No." name="houseNumber" required>
                            </div>
                            <div class="col-sm-3">
                                <input type="number" class="form-control" id="inputApartmentNumber" placeholder="Apartment No." name="apartmentNumber">
                            </div>
                        </div>

                        <div class="form-group row" style="margin-bottom: 8px">
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="inputCity" placeholder="City" name="city" required>
                            </div>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" id="inputZIP" placeholder="ZIP Code" name="ZIP" required>
                            </div>
                        </div>

                        <br>

                        <div class="signUp-group mt-3">
                            <button type="submit" name="page" value="completeTransaction"  class="btn btn-primary btn-block" >Submit</button>
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
