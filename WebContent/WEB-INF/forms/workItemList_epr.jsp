<%@ page language="java" import ="java.sql.*" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Work Items List</title>

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
            <a class="navbar-brand" href="<%
            	String userRole = (String) session.getAttribute("role");
            	switch (userRole){
            		case "scso":
            			out.print("/SEP/IndexSCSO");
            			break;
            		case "fm":
            			out.print("/SEP/IndexFM");
            			break;
            		case "am":
            			out.print("/SEP/IndexAM");
            			break;	
            	} %>">
                <img src="logo.png" alt="logo" style="width:40px;">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div id="navbarNavDropdown" class="navbar-collapse collapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="<%
			            	switch (userRole){
			            		case "scso":
			            			out.print("/SEP/IndexSCSO");
			            			break;
			            		case "fm":
			            			out.print("/SEP/IndexFM");
			            			break;
			            		case "am":
			            			out.print("/SEP/IndexAM");
			            			break;	
			            	} %>"><i class="fa fa-home"></i> Home</a>
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
            <h1>Work Items List</h1>
        </div>

        <table class="table table-striped table-hover">
            <thead class="thead-dark">
                <tr class="d-flex">
                    <th class="col-5">Subject</th>
                    <th class="col-2">Client</th>
                    <th class="col-3">Status</th>
                    <th class="col-2">Details</th>
                </tr>
            </thead>
            <tbody>
            <%
            	ResultSet rs = (ResultSet) request.getAttribute("resultSet");
            	while(rs.next()){
            		out.write("<tr class=\"d-flex\">"
                    + "<td class=\"col-5\">" + rs.getString("event_type") + "</td>"
                    + "<td class=\"col-2\">" + rs.getString("cl_record_name") + "</td>"
                    + "<td class=\"col-3\">" + rs.getString("status") + "</td>"
                    + "<td class=\"col-2\"><a href=\"GetEPR?id=" + rs.getString("id") + "\" class=\"btn btn-dark\">"
                    + "	<i class=\"fas fa-info-circle\"></i> Details</a>"
                    + "</td></tr>\n");
            	}
            %>
            <!--  
                <tr class="d-flex">
                    <td class="col-5">Event Planning Request 1</td>
                    <td class="col-2">Janet</td>
                    <td class="col-3">Approved by Senior CSO</td>
                    <td class="col-2"><a href="epr-form.html" class="btn btn-dark"><i class="fas fa-info-circle"></i> Details</a></td>
                </tr>
                <tr class="d-flex">
                    <td class="col-5">Event Planning Request 2</td>
                    <td class="col-2">Mike</td>
                    <td class="col-3">Approved by AM</td>
                    <td class="col-2"><a href="epr-form.html" class="btn btn-dark"><i class="fas fa-info-circle"></i> Details</a></td>
                </tr>
                <tr class="d-flex">
                    <td class="col-5">Event Planning Request 3</td>
                    <td class="col-2">Alice</td>
                    <td class="col-3">Feedback from FM</td>
                    <td class="col-2"><a href="epr-form.html" class="btn btn-dark"><i class="fas fa-info-circle"></i> Details</a></td>
                </tr>
                <tr class="d-flex">
                    <td class="col-5">Event Planning Request 4</td>
                    <td class="col-2">Janet</td>
                    <td class="col-3">Approved by Senior CSO</td>
                    <td class="col-2"><a href="epr-form.html" class="btn btn-dark"><i class="fas fa-info-circle"></i> Details</a></td>
                </tr>
                <tr class="d-flex">
                    <td class="col-5">Event Planning Request 5</td>
                    <td class="col-2">Mike</td>
                    <td class="col-3">Rejected by AM</td>
                    <td class="col-2"><a href="epr-form.html" class="btn btn-dark"><i class="fas fa-info-circle"></i> Details</a></td>
                </tr>
                -->
            </tbody>
        </table>
    </div>
</body>
