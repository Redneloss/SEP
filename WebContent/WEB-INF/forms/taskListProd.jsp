<%@ page language="java" import ="java.sql.*" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Tasks List</title>

    <meta charset="utf-8">
    <link rel="icon" type="image/x-icon" href="favicon.ico">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <a class="navbar-brand" href="/SEP/IndexProdSubteam">
                <img src="logo.png" alt="logo" style="width:40px;">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div id="navbarNavDropdown" class="navbar-collapse collapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="/SEP/IndexProdSubteam"><i class="fa fa-home"></i> Home</a>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <div class="navbar-text mr-4">Logged in:
                        <span class="text-primary"><% out.print(session.getAttribute("name"));%></span>
                    </div>
                    <li class="nav-item">
                        <a class="nav-link" href="/SEP/Logout"><i class="fas fa-sign-out-alt"></i> Log out</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4 mb-4">
        <div class="pb-2 mt-4 mb-4 border-bottom">
            <h1>Tasks List</h1>
        </div>

        <table class="table table-striped table-hover">
            <thead class="thead-dark">
            <!-- <thead class="bg-primary text-white"> -->
                <tr class="d-flex">
                    <th class="col-3">Description</th>
                    <th class="col-3">Status</th>
                    <th class="col-2">Priority</th>
                    <th class="col-2">Sender</th>
                    <th class="col-2">Details</th>
                </tr>
            </thead>
            <tbody>
            	<%
            	ResultSet rs = (ResultSet) request.getAttribute("resultSet");
            	while(rs.next()){
            		out.write("<tr class=\"d-flex\">"
                    + "<td class=\"col-3\">" + rs.getString("description") + "</td>"
                    + "<td class=\"col-3\">" + rs.getString("status") + "</td>"
                    + "<td class=\"col-2\">" + rs.getString("priority") + "</td>"
                    + "<td class=\"col-2\">" + rs.getString("sender") + "</td>"
                    + "<td class=\"col-2\"><a href=\"GetTaskProd?id=" + rs.getString("id") + "\" class=\"btn btn-dark\">"
                    + "	<i class=\"fas fa-info-circle\"></i> Details</a>"
                    + "</td></tr>\n");
            	}
          		%>
            </tbody>
        </table>
    </div>
</body>
