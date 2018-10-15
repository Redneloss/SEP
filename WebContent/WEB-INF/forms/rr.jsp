<%@ page language="java" import ="java.sql.*" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Recruitment Request</title>

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
            		case "hr":
            			out.print("/SEP/IndexHR");
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
	                        		case "hr":
	                        			out.print("/SEP/IndexHR");
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
            <h1>Recruitment Request</h1>
        </div>

        <form action="/SEP/CreateRR" method="POST">
            <fieldset id="recruitment-request" <% 
		     		switch (userRole){
		     		case "pm":
		     			out.print("enabled");
		     			break;
		     		case "sm":
		     			out.print("enabled");
		     			break;
		     		case "hr":
		     			out.print("disabled");
		     			break;	
		        } %>>
            	<% if (userRole.equals("hr")){ %>
                <div class="d-flex">
                    <div class="ml-auto">Status:
                        <span id="status" class="text-primary"><% out.print(rs.getString("status")); %></span>
                    </div>
                </div>
             	<% } %>

                <div class="form-group row">
                    <div class="form-group col-sm-6">
                        <label class="col-form-label">Requesting department:</label>
                        <div class="card p-4 mb-3">
                            <div class="card-block">
                                <div class="form-group row">
                                    <div class="col-md-6 col-sm-12">
                                        <div class="col-lg-3 col-md-6 col-sm-12">
                                            <div class="custom-control custom-radio">
                                                <input id="administration" name="department" type="radio" class="custom-control-input" 
                                                <% if (rs != null && rs.getString("department").equals("Administration")){ 
                                                	out.print("checked");
                                                } 
                                                if (rs == null){
                                                	out.print("checked");
                                                } %>
                                                value="Administration" checked>
                                                <label for="administration" class="custom-control-label">Administration</label>
                                            </div>
                                        </div>
                                
                                        <div class="col-lg-3 col-md-6 col-sm-12">
                                            <div class="custom-control custom-radio">
                                                <input id="production" name="department" type="radio" class="custom-control-input"
                                                <% if (rs != null && rs.getString("department").equals("Production")){ 
                                                	out.print("checked");
                                                } %>
                                                value="Production">
                                                <label for="production" class="custom-control-label">Production</label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6 col-sm-12">
                                        <div class="col-lg-3 col-md-6 col-sm-12">
                                            <div class="custom-control custom-radio">
                                                <input id="services" name="department" type="radio" class="custom-control-input" 
                                                <% if (rs != null && rs.getString("department").equals("Services")){ 
                                                	out.print("checked");
                                                } %>
                                                value="Services">
                                                <label for="services" class="custom-control-label">Services</label>
                                            </div>
                                        </div>
                                    
                                        <div class="col-lg-3 col-md-6 col-sm-12">
                                            <div class="custom-control custom-radio">
                                                <input id="financial" name="department" type="radio" class="custom-control-input" 
                                                <% if (rs != null && rs.getString("department").equals("Financial")){ 
                                                	out.print("checked");
                                                } %>
                                                value="Financial">
                                                <label for="financial" class="custom-control-label">Financial</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            
                    <div class="form-group col-sm-6">
                        <label class="col-form-label">Contract type:</label>
                        <div class="card p-4 mb-3">
                            <div class="card-block">
                                <div class="form-group">
                                    <div class="col-lg-3 col-md-6 col-sm-12">
                                        <div class="custom-control custom-radio">
                                            <input id="full-time" name="contract" type="radio" class="custom-control-input" 
                                            <% if (rs != null && rs.getString("contract_type").equals("full_time")){ 
                                            	out.print("checked");
                                            } 
                                            if (rs == null){
                                            	out.print("checked");
                                            } %>
                                            value="full_time" checked>
                                            <label for="full-time" class="custom-control-label">Full time</label>
                                        </div>
                                    </div>
                                
                                    <div class="col-lg-3 col-md-6 col-sm-12">
                                        <div class="custom-control custom-radio">
                                            <input id="part-time" name="contract" type="radio" class="custom-control-input" 
                                            <% if (rs != null && rs.getString("contract_type").equals("part_time")){ 
                                            	out.print("checked");
                                            } %>
                                            value="part_time">
                                            <label for="part-time" class="custom-control-label">Part time</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            
                <div class="form-group row">
                    <label for="experience" class="col-sm-2 col-form-label">Years of experience:</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="experience" name="years-of-experience" 
                        value="<% if (rs != null ) out.print(rs.getString("years_of_experience")); %>"
                        placeholder="Enter minimum number of years of experience" required>
                    </div>
                </div>
            
                <div class="form-group row">
                    <label for="title" class="col-sm-2 col-form-label">Job title:</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" id="title" name="job-title" 
                        value="<% if (rs != null ) out.print(rs.getString("job_title")); %>"
                        placeholder="Enter job title" required>
                    </div>
                </div>
            
                <div class="form-group row">
                    <label for="description" class="col-sm-2 col-form-label">Job description:</label>
                    <div class="col-sm-10">
                        <textarea class="form-control" rows="3" id="description" name="job-description"
                        <% if (rs != null ){ 
                        		out.print("placeholder=\"" + rs.getString("job_description") + "\"");
                        } 
                        if (rs == null){
                        	out.print("placeholder=\"Enter job description\"");
                        } %>
						required></textarea>
                    </div>
                </div>
            </fieldset>
            
            <% if (userRole.equals("hr")){ %>
            <fieldset id="request-status" enabled>
                <div class="form-group row mt-4">
                    <label for="rr-status" class="col-sm-2 col-form-label">Update status:</label>
                    <div class="col-sm-10">
                        <select class="custom-select" id="rr-status" name="status">
                            <option value="Select status" selected disabled>Select status</option>
                            <option value="hiring">In process for hiring</option>
                            <option value="outsourcing">In process for outsourcing</option>
                            <option value="complete">Complete</option>
                            <option value="canceled">Canceled</option>
                        </select>
                    </div>
                </div>
            </fieldset>
            
            <button type="submit" value="update-rr" class="btn btn-primary float-right mb-4">Update</button>
            <% } %>
	
            <% if (userRole.equals("pm") || userRole.equals("sm")){ %>
            <button type="submit" value="create-rr" class="btn btn-primary float-right mb-4">Create</button>
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
