<%-- 
    Document   : feedback
    Created on : 08-may-2019, 19:34:09
    Author     : alu2017310
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous">
        <title>Feedback pa'l señor user</title>
    </head>

    <body>
        <!-- Main -->
        <div style="width:20%; padding-top: 20px; padding-left: 30px">
            
            <div class="form-group">
                <p><%= (String) request.getAttribute("status") %></p>
                <form action="home.jsp"><button type="submit" class="btn btn-primary">Home</button></form>
            </div>
            
        </div>
                
        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" crossorigin="anonymous"></script>
    </body>

</html>
