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
        <%= (String) request.getAttribute("status") %>

        <form action="index.html"><input type="submit" value="Home"></form>
    </body>
</html>
