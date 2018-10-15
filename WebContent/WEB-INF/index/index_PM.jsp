<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Don't forget to change the department name depending on the user role -->
    <title>Home page</title>

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
            <a class="navbar-brand" href="">
                <img src="logo.png" alt="logo" style="width:40px;">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div id="navbarNavDropdown" class="navbar-collapse collapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href=""><i class="fa fa-home"></i> Home</a>
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
            <h1>Home Page - Production Manager</h1>
        </div>
        
        <div class="row">
	        <div class="card-deck col-md-4 col-sm-6">
	            <a class="card border-primary bg-light text-primary p-4 mt-3 mb-3" style="text-decoration: none;" href="work-item-list.html">
	                <div class="card-link text-center">
	                    <i class="far fa-clipboard"></i> View Client Request Details</div>
	            </a>
	        </div>
	        <div class="card-deck col-md-4 col-sm-6">
	            <a class="card border-primary bg-light text-primary p-4 mt-3 mb-3" style="text-decoration: none;" href="/SEP/CreateRR">
	                <div class="card-link text-center">
	                    <i class="fas fa-hands-helping"></i> Create Recruitment Request</div>
	            </a>
	        </div>
	        <div class="card-deck col-md-4 col-sm-6">
	            <a class="card border-primary bg-light text-primary p-4 mt-3 mb-3" style="text-decoration: none;" href="/SEP/CreateFR">
	                <div class="card-link text-center">
	                    <i class="fas fa-hand-holding-usd"></i> Create Financial Request</div>
	            </a>
	        </div>
	        <div class="card-deck col-md-4 col-sm-6">
	            <a class="card border-primary bg-light text-primary p-4 mt-3 mb-3" style="text-decoration: none;" href="prod-dept.html">
	                <div class="card-link text-center">
	                    <i class="fas fa-thumbtack"></i> Create Tasks</div>
	            </a>
	        </div>
	        <div class="card-deck col-md-4 col-sm-6">
	            <a class="card border-primary bg-light text-primary p-4 mt-3 mb-3" style="text-decoration: none;" href="task-list.html">
	                <div class="card-link text-center">
	                    <i class="fas fa-tasks"></i> View Commented Task</div>
	            </a>
	        </div>     
        </div>
    </div>
</body>
