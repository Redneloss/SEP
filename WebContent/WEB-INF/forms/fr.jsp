<%@ page language="java" import ="java.sql.*" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Financial Request</title>

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
            		case "pm":
            			out.print("/SEP/IndexPM");
            			break;
            		case "sm":
            			out.print("/SEP/IndexSM");
            			break;
            		case "fm":
            			out.print("/SEP/IndexFM");
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
	                        		case "pm":
	                        			out.print("/SEP/IndexPM");
	                        			break;
	                        		case "sm":
	                        			out.print("/SEP/IndexSM");
	                        			break;
	                        		case "fm":
	                        			out.print("/SEP/IndexFM");
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
            <h1>Financial Request</h1>
        </div>

        <form action="/SEP/CreateFR" method="POST">
            <fieldset id="financial-request" <% 
		     		switch (userRole){
		     		case "pm":
		     			out.print("enabled");
		     			break;
		     		case "sm":
		     			out.print("enabled");
		     			break;
		     		case "fm":
		     			out.print("disabled");
		     			break;	
		        } %>>
		        <% if (userRole.equals("fm")){ %>
                <div class="d-flex">
                    <div class="ml-auto">Status:
                        <span id="status" class="text-primary"><% out.print(rs.getString("status")); %></span>
                    </div>
                </div>
                <% } %>
            
                <div class="form-group row">
                    <div class="form-group col-sm-12">
                        <label class="col-form-label">Requesting department:</label>
                        <div class="card p-4 mb-3">
                            <div class="card-block">
                                <div class="form-group row">
                                    <div class="col-lg-3 col-md-6 col-sm-12">
                                        <div class="custom-control custom-radio">
                                            <input id="administration" name="department" type="radio" class="custom-control-input" 
                                            <% if (rs != null && rs.getString("department").equals("administration")){ 
                                            	out.print("checked");
                                            } 
                                            if (rs == null){
                                            	out.print("checked");
                                            } %>
                                            value="administration" checked>
                                            <label for="administration" class="custom-control-label">Administration</label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-6 col-sm-12">
                                        <div class="custom-control custom-radio">
                                            <input id="production" name="department" type="radio" class="custom-control-input" 
                                            <% if (rs != null && rs.getString("department").equals("production")){ 
                                            	out.print("checked");
                                            } %>
                                            value="Production">
                                            <label for="production" class="custom-control-label">Production</label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-6 col-sm-12">
                                        <div class="custom-control custom-radio">
                                            <input id="services" name="department" type="radio" class="custom-control-input" 
                                            <% if (rs != null && rs.getString("department").equals("services")){ 
                                            	out.print("checked");
                                            } %>
                                            value="services">
                                            <label for="services" class="custom-control-label">Services</label>
                                        </div>
                                    </div>

                                    <div class="col-lg-3 col-md-6 col-sm-12">
                                        <div class="custom-control custom-radio">
                                            <input id="financial" name="department" type="radio" class="custom-control-input" 
                                            <% if (rs != null && rs.getString("department").equals("financial")){ 
                                            	out.print("checked");
                                            } %>
                                            value="financial">
                                            <label for="financial" class="custom-control-label">Financial</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            
                <div class="form-group row">
                    <label for="reference" class="col-sm-2 col-form-label">Project reference:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="reference" name="project-reference" placeholder="Enter project reference" 
                        value="<% if (rs != null ) out.print(rs.getString("project")); %>"
                        required>
                    </div>
                </div>
            
                <div class="form-group row">
                    <label for="amount" class="col-sm-2 col-form-label">Requested amount:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="amount" name="requested-amount" placeholder="Enter requested amount" 
                        value="<% if (rs != null ) out.print(rs.getString("requested_amount")); %>"
                        required>
                    </div>
                </div>
            
                <div class="form-group row">
                    <label for="reason" class="col-sm-2 col-form-label">Reason for the request:</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" rows="3" id="reason" name="reason" 
                        <% if (rs != null ){ 
                        		out.print("placeholder=\"" + rs.getString("reason") + "\"");
                        } 
                        if (rs == null){
                        	out.print("placeholder=\"Enter reason for the request\"");
                        } %>
                        required></textarea>
                    </div>
                </div>
            </fieldset>

            <% if (userRole.equals("fm")){ %>
            <fieldset id="request-status" enabled>
                <div class="form-group row mt-4">
                    <label for="fr-status" class="col-sm-2 col-form-label">Status:</label>
                    <div class="col-sm-10">
                        <select class="custom-select" id="fr-status" name="status">
                            <option value="Select status" selected disabled>Select status</option>
                            <option value="waiting">Waiting for decision</option>
                            <option value="complete">Complete</option>
                            <option value="canceled">Canceled</option>
                        </select>
                    </div>
                </div>
            </fieldset>
            
            <button type="submit" value="update-fr" class="btn btn-primary float-right mb-4">Update</button>
            <% } %>
            
            <% if (userRole.equals("pm") || userRole.equals("sm")){ %>
            <button type="submit" value="create-fr" class="btn btn-primary float-right mb-4">Create</button>
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
