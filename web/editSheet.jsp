<%-- 
    Document   : editSheet
    Created on : 11-May-2019, 02:02:24
    Author     : User
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="constants.*" %>
<%@ page import="entities.Sheetmusic" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" crossorigin="anonymous">
        <title>Edit Sheet</title>
    </head>

    <body>
        
        <!-- If User is not logged in, send to index screen -->
        <% 
            if (request.getSession().getAttribute("user") == null) {
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        %>
        
        <!-- Get Sheet to edit -->
        <% Sheetmusic sheet = (Sheetmusic) request.getAttribute("sheet"); %>
        
        <!-- Main -->
        <div style="width:20%; padding-top: 20px; padding-left: 30px">

            <h1>Edit Sheet</h1>

            <!-- Sheet edit form -->
            <form action="UpdateSheet" method="POST">

                <!-- Title -->    
                <div class="form-group">
                    <input type="text" class="form-control" name="title" placeholder="Title" value="<%= sheet.getTitle() %>">
                </div>
                <!-- Artist -->
                <div class="form-group">
                    <input type="text" class="form-control" name="artist" placeholder="Artist" value="<%= sheet.getArtist() %>">
                </div>
                <!-- Printed -->
                <div class="form-group">
                    <div class="form-check">
                        <%
                            if (sheet.getPrinted()) {
                                %><input type="checkbox" id="printedCheck" class="form-check-cinput" name="printed" checked><%
                            } else {
                                %><input type="checkbox" id="printedCheck" class="form-check-cinput" name="printed"><%
                            }
                        %>
                        <label class="form-check-label" for="printedCheck">Printed</label>
                    </div>
                </div>
                <!-- Instrument -->
                <div class="form-group">
                    <select name="instrument">
                        <%
                            for (Instrument i : Instrument.values()) {
                                if (i.name().equals(sheet.getInstrument())) {
                                    %><option value="<%= i.name() %>" selected><%= i.name() %></option><%
                                } else {
                                    %><option value="<%= i.name() %>"><%= i.name() %></option><%
                                }
                            }
                        %>
                    </select>
                </div>
                <!-- Genre -->
                <div class="form-group">
                    <select name="genre">
                        <%
                            for (Genres i : Genres.values()) {
                                if (i.name().equals(sheet.getGenre())) {
                                    %><option value="<%= i.name() %>" selected><%= i.name() %></option><%
                                } else {
                                    %><option value="<%= i.name() %>"><%= i.name() %></option><%
                                }
                            }
                        %>
                    </select>
                </div>
                <!-- Difficulty -->
                <div class="form-group">
                    <select name="difficulty">
                        <%
                            for (Difficulty i : Difficulty.values()) {
                                if (i.name().equals(sheet.getDifficulty())) {
                                    %><option value="<%= i.name() %>" selected><%= i.name() %></option><%
                                } else {
                                    %><option value="<%= i.name() %>"><%= i.name() %></option><%
                                }
                            }
                        %>
                    </select>
                </div>
                <input type="hidden" name="id" value="<%= sheet.getIdsheetmusic() %>">
                <button type="submit" class="btn btn-primary" name="save">Save</button>

            </form>

        </div>

        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" crossorigin="anonymous"></script>
    </body>

</html>