<%@ page language="java" import ="java.sql.*" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII" %>
<!DOCTYPE html>
<html lang="en">

<%
    Object res = request.getAttribute("result");
	ResultSet rs = null;
	if (res != null){
		rs = (ResultSet) res;
	}
%>

<head>
    <title>Task Comments</title>

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
            <h1>Task</h1>
        </div>

        <form id="view-task" action="" method="GET">
            <fieldset id="view-task">
                <div class="form-group row">
                    <label for="task-reference" class="col-sm-2 col-form-label">Project reference:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="task-reference" placeholder="Enter project reference"
                        value="<% if (rs != null ) out.print(rs.getString("project")); %>"
                        readonly>
                    </div>
                </div>
            
                <div class="form-group row">
                    <label for="task-description" class="col-sm-2 col-form-label">Description:</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" rows="3" id="task-description" placeholder="Enter task description" 
                        value="<% if (rs != null ) out.print(rs.getString("description")); %>"
                        readonly></textarea>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="task-assigned-to" class="col-sm-2 col-form-label">Assigned to:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="task-assigned-to" placeholder="Enter an employee" 
                        value="<% if (rs != null ) out.print(rs.getString("assigned_to")); %>"
                        readonly>
                    </div>
                </div>

                <div class="form-group row">
                    <label for="task-priority" class="col-sm-2 col-form-label">Priority:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="task-priority" placeholder="Enter priority" 
                        value="<% if (rs != null ) out.print(rs.getString("priority")); %>"
                        readonly>
                    </div>
                </div>
            </fieldset>

            <div class="mt-4 mb-4">
                <h3>Task Plan</h3>
            </div>

            <!-- Add expected Task Plan for employees -->
            <fieldset id="task-comments" enabled>
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Employee name:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" name="employee-name" placeholder="Enter employee name">
                    </div>
                </div>
                
                <div class="form-group row">
                    <label class="col-sm-2 col-form-label">Task description:</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" rows="3" name="employee-task-description" placeholder="Enter task description"></textarea>
                    </div>
                </div>

                <div class="form-group row">
                    <div class="form-group col-sm-6">
                        <div class="form-row">
                            <label class="col-sm-3 col-form-label">Start date:</label>
                            <div class="col-sm-9">
                                <input type="date" class="form-control" name="start-date">
                            </div>
                        </div>
                    </div>
                
                    <div class="form-group col-sm-6">
                        <div class="form-row">
                            <label class="col-sm-3 col-form-label">End date:</label>
                            <div class="col-sm-9">
                                <input type="date" class="form-control" name="end-date">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="mt-4 mb-4">
                    <h3>Extra Budget</h3>
                </div>

                <!-- Add Extra Budget -->
                <div class="form-group row">
                    <label for="task-amount" class="col-sm-2 col-form-label">Requested amount:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="task-amount" name="requested-amount" placeholder="Enter requested amount">
                    </div>
                </div>
            
                <div class="form-group row">
                    <label for="reason" class="col-sm-2 col-form-label">Reason for the request:</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" rows="3" id="reason" name="reason" placeholder="Enter reason for the request"></textarea>
                    </div>
                </div>
            </fieldset>

            <fieldset id="task-submit" enabled>
                <button type="submit" value="send-top-chef-task" class="btn btn-primary float-right mb-4">Send Comment</button>
            </fieldset>
        </form>
    </div>


</body>
