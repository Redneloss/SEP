<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Event Planning Request</title>

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
            		case "cso":
            			out.print("/SEP/IndexCSO");
            			break;
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
			            		case "cso":
			            			out.print("/SEP/IndexCSO");
			            			break;
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
            <h1>Event Planning Request</h1>
        </div>
        
        <form action="<% 
     		switch (userRole){
     		case "cso":
     			out.print("/SEP/CreateEPR");
     			break;
     		case "scso":
     			out.print("/SEP/UpdateEPRstatus");
     			break;
     		case "fm":
     			out.print("/SEP/UpdateEPRfeedback");
     			break;
     		case "am":
     			out.print("/SEP/UpdateEPRstatus");
     			break;	
        } %>" method="POST">
            <fieldset id="epr-details" enabled>
                <div class="d-flex">
                	<% if (userRole.equals("cso")){ %>
                    <div class="mb-4 text-danger">(For registered clients)</div>
                    <% } %>
                    <% if (!userRole.equals("cso")){ %>
                    <div class="ml-auto">Status:
                        <span id="status" class="text-primary"></span>
                    </div>
                    <% } %>
                </div>

                <div class="form-group row">
                    <label for="record-number" class="col-sm-2 col-form-label">Client record number:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="record-number" name="record-number" placeholder="Enter client record number">
                    </div>
                </div>
        
                <div class="form-group row">
                    <label for="client-name" class="col-sm-2 col-form-label">Client name:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="client-name" name="client-name" placeholder="Enter client name">
                    </div>
                </div>
        
                <div class="form-group row">
                    <label for="event-type" class="col-sm-2 col-form-label">Event type:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="event-type" name="event-type" placeholder="Enter event type">
                    </div>
                </div>
        
                <div class="form-row">
                    <div class="form-group col-sm-7">
                        <div class="form-row">
                            <label for="from" class="col-sm-2 col-form-label">From:</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" id="from" name="start-date" placeholder="__/__/____">
                            </div>
                        </div>
                    </div>

                    <div class="form-group col-sm-5">
                        <div class="form-row">
                            <label for="to" class="col-sm-2 col-form-label">To:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="to" name="end-date" placeholder="__/__/____">
                            </div>
                        </div>
                    </div>
                </div>
        
                <div class="form-group row">
                    <label for="number-of-attendees" class="col-sm-3 col-form-label">Expected number of attendees:</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control" id="number-of-attendees" name="number-of-attendees" placeholder="Enter number of attendees">
                    </div>
                </div>
        
                <label>Preferences:</label>
                <div class="card p-4 mb-3">
                    <div class="card-block">
                        <div class="form-group row">
                            <div class="col-sm-6">
                                <div class="custom-control custom-checkbox">
                                    <input id="decorations" name="decorations" type="checkbox" class="custom-control-input">
                                    <label for="decorations" class="custom-control-label">Decorations</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input id="food-and-drinks" name="food-and-drinks" type="checkbox" class="custom-control-input">
                                    <label for="food-and-drinks" class="custom-control-label">Food/Drinks</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input id="photos" name="photos" type="checkbox" class="custom-control-input">
                                    <label for="photos" class="custom-control-label">Photos/Filming</label>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="custom-control custom-checkbox">
                                    <input id="music" name="music" type="checkbox" class="custom-control-input">
                                    <label for="music" class="custom-control-label">Music</label>
                                </div>
                                <div class="custom-control custom-checkbox">
                                    <input id="posters" name="posters" type="checkbox" class="custom-control-input">
                                    <label for="posters" class="custom-control-label">Posters/Art work</label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        
                <div class="form-group row">
                    <label for="expected-budget" class="col-sm-2 col-form-label">Expected budget:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="expected-budget" name="expected-budget" placeholder="Enter expected budget">
                    </div>
                </div>
            </fieldset>
			
			<% if (userRole.equals("cso")){ %>
            <fieldset id="create" enabled>
                <div class="btn-group float-right" role="group">
                    <button type="submit" value="create-epr" class="btn btn-primary mt-3 mb-4">Create</button>
                </div>
            </fieldset>
            <% } %>
            
			<% if (userRole.equals("scso")){ %>
            <fieldset id="approve-reject">
                <div class="btn-group" role="group">
                    <button type="submit" value="approve-epr" class="btn btn-primary mt-3 mb-4">Approve</button>
                    <button type="submit" value="reject-epr" class="btn btn-danger mt-3 mb-4">Reject</button>
                </div>
            </fieldset>
            <% } %>            
            
			<% if (userRole.equals("fm")){ %>
            <fieldset id="feedback">
                <div class="form-group">
                    <label for="feedback" class="col-form-label">Feedback from the Financial Manager:</label>
                    <textarea class="form-control" rows="3" id="feedback" name="feedback" placeholder="Enter feedback about the expected budget"></textarea>
                </div>
                <div class="btn-group float-right" role="group">
                    <button type="submit" value="send-feedback" class="btn btn-primary mt-3 mb-4">Send Feedback</button>
                </div>
            </fieldset>
            <% } %>
            
            <% if (userRole.equals("am")){ %>
            <fieldset id="feedback disabled">
                <div class="form-group">
                    <label for="feedback" class="col-form-label">Feedback from the Financial Manager:</label>
                    <textarea class="form-control" rows="3" id="feedback" name="feedback" placeholder="Enter feedback about the expected budget"></textarea>
                </div>
            </fieldset>
            
            <fieldset id="approve-reject">
                <div class="btn-group" role="group">
                    <button type="submit" value="approve-epr" class="btn btn-primary mt-3 mb-4">Approve</button>
                    <button type="submit" value="reject-epr" class="btn btn-danger mt-3 mb-4">Reject</button>
                </div>
            </fieldset>
            <% } %>          
            
        </form>
    </div>
</body>
