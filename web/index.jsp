<%-- 
    Document   : index
    Created on : 10-May-2019, 02:19:07
    Author     : User
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous">
        <title>Home</title>
    </head>
    
    <body>
        
        <!-- If User is logged in, send to User Home screen -->
        <% 
            if (request.getSession().getAttribute("user") != null) {
                request.getRequestDispatcher("/home.jsp").forward(request, response);
            }
        %>
        
        <!-- Main -->
        <div style="width:30%; padding-top: 20px; padding-left: 30px">

            <h1>Hello Mr. Forastero</h1>
            
            <!-- Login -->
            <form action="login.jsp">
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Login</button>
                </div>
            </form>
            
            <!-- Register -->
            <form action="newUser.jsp">
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Register</button>
                </div>
            </form>

        </div>
        
        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" crossorigin="anonymous"></script>
    </body>
    
</html>
