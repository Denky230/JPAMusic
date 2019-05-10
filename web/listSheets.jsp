<%-- 
    Document   : listSheets
    Created on : 10-May-2019, 02:32:56
    Author     : User
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="entities.Sheetmusic" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous">
        <title>List Sheets</title>
    </head>

    <body>
        
        <!-- If User is not logged in, send to index screen -->
        <% 
            if (request.getSession().getAttribute("user") == null) {
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        %>
        
        <!-- Main -->
        <div style="width:50%; padding-top: 20px; padding-left: 30px">

            <!-- Get Sheets data -->
            <% List<Sheetmusic> sheets = (List<Sheetmusic>) request.getAttribute("sheets"); %>
            
            <!-- Sheets table -->
            <table class="table">
                <thead>
                    <tr>
                        <th scope="col">Title</th>
                        <th scope="col">Artist</th>
                        <th scope="col">Instrument</th>
                        <th scope="col">Genre</th>
                        <th scope="col">Difficulty</th>
                        <th scope="col">Printed</th>
                        <th scope="col">Owner</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for (Sheetmusic s : sheets) {
                            %><tr>
                                <td><%= s.getTitle() %></td>
                                <td><%= s.getArtist() %></td>
                                <td><%= s.getInstrument() %></td>
                                <td><%= s.getGenre() %></td>
                                <td><%= s.getDifficulty() %></td>
                                <td><%= s.getPrinted() ? "Y" : "N" %></td>
                                <td><%= s.getOwner().getUsername() %></td>
                            </tr><% 
                        }
                    %>
                </tbody>
            </table>

        </div>

        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" crossorigin="anonymous"></script>
    </body>

</html>
