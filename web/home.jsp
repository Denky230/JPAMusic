<%-- 
    Document   : home
    Created on : 10-May-2019, 01:45:47
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
        
        <!-- If User is not logged in, send to index screen -->
        <% 
            if (request.getSession().getAttribute("user") == null) {
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        %>
        
        <!-- Main -->
        <div style="width:20%; padding-top: 20px; padding-left: 30px">

            <h1>Home</h1>
            
            <!-- New Sheet -->
            <form action="newSheet.jsp">
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">New Sheet</button>
                </div>
            </form>
            
            <!-- List All Sheets -->
            <form action="ListAllSheets">
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">List All Sheets</button>
                </div>
            </form>
            
            <!-- List Sheets By Favourite Instrument -->
            <form action="ListSheetsByFavouriteInstrument">
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">List Sheets By Favourite Instrument</button>
                </div>
            </form>            
            
            <!-- List Sheets By User -->
            <form action="ListSheetsByUser">
                <div class="form-group">
                    <input style="width:50%;" type="text" class="form-control" name="username" placeholder="Username" required>
                    <button type="submit" class="btn btn-primary">List Sheets By User</button>
                </div>
            </form>
            
            <!-- Logout -->
            <form action="Logout">
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Logout</button>
                </div>
            </form>
            
        </div>

        <!-- Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" crossorigin="anonymous"></script>
    </body>

</html>