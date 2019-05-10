<%-- 
    Document   : newUser
    Created on : 07-may-2019, 16:55:28
    Author     : alu2017310
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="constants.Instrument" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous">
        <title>New User</title>
    </head>

    <body>
        <!-- Main -->
        <div style="width:20%; padding-top: 20px; padding-left: 30px">

            <h1>Register User</h1>

            <!-- User register form -->
            <form action="NewUser" method="POST">

                <div class="form-group">
                    <input type="text" class="form-control" name="username" placeholder="Username">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="password" placeholder="Password">
                </div>
                <div class="form-group">
                    <select name="instrument">
                        <%
                            for (Instrument i : Instrument.values()) {
                                %><option value="<%= i.name() %>"><%= i.name() %></option><%
                            }
                        %>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Register</button>

            </form>

        </div>

        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" crossorigin="anonymous"></script>
    </body>

</html>