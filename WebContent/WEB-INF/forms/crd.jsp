<%@ page language="java" import ="java.sql.*" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Client Request Details</title>

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
            	Object res = request.getAttribute("result");
            	ResultSet rs = null;
            	if (res != null){
            		rs = (ResultSet) res;
            	}
            	String userRole = (String) session.getAttribute("role");
            	switch (userRole){
            		case "scso":
            			out.print("/SEP/IndexSCSO");
            			break;
            		case "fm":
            			out.print("/SEP/IndexFM");
            			break;
            		case "pm":
            			out.print("/SEP/IndexPM");
            			break;
            		case "sm":
            			out.print("/SEP/IndexSM");
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
	                        		case "pm":
	                        			out.print("/SEP/IndexPM");
	                        			break;
	                        		case "sm":
	                        			out.print("/SEP/IndexSM");
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
            <h1>Client Request Details</h1>
        </div>

        <form action="/SEP/CreateCRD" method="POST">
            <fieldset id="crd" <% 
            		if (userRole.equals("scso") && rs == null){
            			out.print("enabled");
            		}
            		else {
            			out.print("disabled");
            		}%>>
		        <% if (! (userRole.equals("scso") && rs == null)){ %>
                <div class="d-flex">
                    <div class="mb-4 ml-auto">Project Ref. Number:
                        <span id="status" class="text-primary"><% out.print(rs.getString("project")); %></span>
                    </div>
                </div>
                <% } %>

                <div class="form-group row">
                    <div class="form-group col-md-7">
                        <div class="form-group row">
                            <label for="record-number" class="col-md-3 col-form-label">Client record number:</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" id="record-number" name="record-number" 
                                value="<% if (rs != null ) out.print(rs.getString("cl_record_id")); %>"
                                placeholder="Enter client record number" required>
                            </div>
                        </div>
        
                        <div class="form-group row">
                            <label for="client-name" class="col-md-3 col-form-label">Client name:</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" id="client-name" name="client-name"
                                value="<% if (rs != null ) out.print(rs.getString("cl_record_name")); %>"
                                placeholder="Enter client name" required>
                            </div>
                        </div>
        
                        <div class="form-group row">
                            <label for="event-type" class="col-md-3 col-form-label">Event type:</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control" id="event-type" name="event-type" 
                                value="<% if (rs != null ) out.print(rs.getString("event_type")); %>"
                                placeholder="Enter event type" required>
                            </div>
                        </div>
                    </div>
        
                    <div class="form-group col-md-5">
                        <div class="form-group row">
                            <label for="number-of-attendees" class="col-md-3 col-form-label">Number of attendees:</label>
                            <div class="col-md-9">
                                <input type="number" class="form-control" id="number-of-attendees" name="number-of-attendees" 
                                value="<% if (rs != null ) out.print(rs.getString("exp_attendees_num")); %>"
                                placeholder="Enter number of attendees" required>
                            </div>
                        </div>
        
                        <div class="form-group row">
                            <label for="expected-budget" class="col-md-3 col-form-label">Expected budget:</label>
                            <div class="col-md-9">
                                <input type="number" class="form-control" id="expected-budget" name="expected-budget" 
                                value="<% if (rs != null ) out.print(rs.getString("exp_budget")); %>"
                                placeholder="Enter expected budget">
                            </div>
                        </div>
                    </div>
                </div>
        
                <div class="form-group row">
                    <div class="form-group col-sm-7">
                        <div class="form-row">
                            <label for="from" class="col-sm-3 col-form-label">From:</label>
                            <div class="col-sm-8">
                                <input type="date" class="form-control" id="from" name="start-date" 
                                value="<% if (rs != null ) out.print(rs.getString("time_from")); %>"
                                required>
                            </div>
                        </div>
                    </div>
                    <div class="form-group col-sm-5">
                        <div class="form-row">
                            <label for="to" class="col-sm-3 col-form-label">To:</label>
                            <div class="col-sm-9">
                                <input type="date" class="form-control" id="to" name="end-date"
                                value="<% if (rs != null ) out.print(rs.getString("time_to")); %>"
                                required>
                            </div>
                        </div>
                    </div>
                </div>
            </fieldset>

            <fieldset id="crd-details" <% 
            		if (userRole.equals("scso") && rs == null){
            			out.print("enabled");
            		}
            		else {
            			out.print("disabled");
            		}%>>
                <div class="form-group">
                    <label for="description" class="col-form-label">Description:</label>
                    <textarea class="form-control" rows="3" id="description" name="description"
                    <% if (rs != null ){ 
                     		out.print("placeholder=\"" + rs.getString("description") + "\"");
                     } 
                     if (rs == null){
                     	out.print("placeholder=\"Enter event description\"");
                     } %> required></textarea>
                </div>
        
                <div class="form-group row">
                    <div class="form-group col-sm-6">
                        <div class="form-group">
                            <label for="decorations" class="col-form-label">Decorations:</label>
                            <textarea class="form-control" rows="3" id="decorations" name="decorations"
                            <% if (rs != null ){ 
                     		     out.print("placeholder=\"" + rs.getString("decorations") + "\"");
		                     } 
		                     if (rs == null){
		                     	 out.print("placeholder=\"Enter requested details\"");
		                     } %> required></textarea>
                        </div>
        
                        <div class="form-group">
                            <label for="photos" class="col-form-label">Photos/Filming:</label>
                            <textarea class="form-control" rows="3" id="photos" name="photos" 
                            <% if (rs != null ){ 
                     		     out.print("placeholder=\"" + rs.getString("photos_filming") + "\"");
		                     } 
		                     if (rs == null){
		                     	 out.print("placeholder=\"Enter requested details\"");
		                     } %>
                             required></textarea>
                        </div>
        
                        <div class="form-group">
                            <label for="posters" class="col-form-label">Posters/Art work:</label>
                            <textarea class="form-control" rows="3" id="posters" name="posters" 
                            <% if (rs != null ){ 
                     		     out.print("placeholder=\"" + rs.getString("posters_artwork") + "\"");
		                     } 
		                     if (rs == null){
		                     	 out.print("placeholder=\"Enter requested details\"");
		                     } %>
                            required></textarea>
                        </div>
                    </div>
        
                    <div class="form-group col-sm-6">
                        <div class="form-group">
                            <label for="food-and-drinks" class="col-form-label">Food/Drinks:</label>
                            <textarea class="form-control" rows="3" id="food-and-drinks" name="food-and-drinks" 
                            <% if (rs != null ){ 
                     		     out.print("placeholder=\"" + rs.getString("food_drinks") + "\"");
		                     } 
		                     if (rs == null){
		                     	 out.print("placeholder=\"Enter requested details\"");
		                     } %> required></textarea>
                        </div>
        
                        <div class="form-group">
                            <label for="music" class="col-form-label">Music:</label>
                            <textarea class="form-control" rows="3" id="music" name="music" 
                            <% if (rs != null ){ 
                     		     out.print("placeholder=\"" + rs.getString("music") + "\"");
		                     } 
		                     if (rs == null){
		                     	 out.print("placeholder=\"Enter requested details\"");
		                     } %>
                            required></textarea>
                        </div>
        
                        <div class="form-group">
                            <label for="computer-issues" class="col-form-label">Computer-Related Issues:</label>
                            <textarea class="form-control" rows="3" id="computer-issues" name="computer-issues"
                            <% if (rs != null ){ 
                     		     out.print("placeholder=\"" + rs.getString("computer_issues") + "\"");
		                     } 
		                     if (rs == null){
		                     	 out.print("placeholder=\"Enter requested details\"");
		                     } %>
                             required></textarea>
                        </div>
                    </div>
                </div>
        
                <div class="form-group row">
                    <label for="other" class="col-sm-2 col-form-label">Other needs:</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" rows="3" id="other" name="other" 
                      	<% if (rs != null ){ 
                    		     out.print("placeholder=\"" + rs.getString("other_needs") + "\"");
	                     } 
	                     if (rs == null){
	                     	 out.print("placeholder=\"Enter event description\"");
	                     } %>
                        required></textarea>
                    </div>
                </div>
            </fieldset>
        	
        	<% if (userRole.equals("scso") && rs == null){ %>
            <fieldset id="create" enabled>
                <button type="submit" value="create-crd" class="btn btn-primary float-right mt-3 mb-4">Create</button>
            </fieldset>
            <% } %>
            
        </form>
        
        <%	Object actionState = request.getAttribute("actionState");
       		if (actionState != null){
       			String actionStateStr = (String) actionState;
       			if( actionStateStr.equals("fail") ){   %>
       				<div class="text-danger">The action has failed.</div>
       	<%		} else if( actionStateStr.equals("success")){  %>
       				<div class="text-success">The action has been completed successfully.</div>
       	<%		}
       		}		      %>
    </div>
</body>
