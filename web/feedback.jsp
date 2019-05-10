<%-- 
    Document   : feedback
    Created on : 08-may-2019, 19:34:09
    Author     : alu2017310
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback pa'l señor user</title>
    </head>

    <body>
        <!-- Main -->
        <div style="width:20%; padding-top: 20px; padding-left: 30px">
            
            <p><%= (String) request.getAttribute("status") %></p>
            <form action="home.jsp"><button type="submit" class="btn btn-primary">Home</button></form>
            
        </div>
    </body>

</html>
