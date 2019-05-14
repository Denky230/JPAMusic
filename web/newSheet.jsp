<%-- 
    Document   : newSheet
    Created on : 10-May-2019, 02:01:56
    Author     : User
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="constants.*" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous">
        <title>New Sheet</title>
    </head>

    <body>
        
        <!-- If User is not logged in, send to index screen -->
        <% 
            if (request.getSession().getAttribute("user") == null) {
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        %>
        
        <!-- Main -->
        <div style="width:20%; padding-top: 20px; padding-left: 30px">

            <h1>Register Sheet</h1>

            <!-- Sheet register form -->
            <form action="NewSheet" method="POST">

                <!-- Title -->
                <div class="form-group">
                    <input type="text" class="form-control" name="title" placeholder="Title">
                </div>
                <!-- Artist -->
                <div class="form-group">
                    <input type="text" class="form-control" name="artist" placeholder="Artist">
                </div>
                <!-- Instrument -->
                <div class="form-group">
                    <select name="instrument">
                        <%
                            for (Instrument i : Instrument.values()) {
                                %><option value="<%= i.name() %>"><%= i.name() %></option><%
                            }
                        %>
                    </select>
                </div>
                <!-- Genre -->
                <div class="form-group">
                    <select name="genre">
                        <%
                            for (Genres i : Genres.values()) {
                                %><option value="<%= i.name() %>"><%= i.name() %></option><%
                            }
                        %>
                    </select>
                </div>
                <!-- Difficulty -->
                <div class="form-group">
                    <select name="difficulty">
                        <%
                            for (Difficulty i : Difficulty.values()) {
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