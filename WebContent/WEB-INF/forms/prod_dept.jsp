<%@ page language="java" import ="java.sql.*" import ="java.util.*" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII" %>
<!DOCTYPE html>
<html lang="en">

<%
	ArrayList<String> rsProjects = (ArrayList<String>) request.getAttribute("rsProjects");
	ArrayList<ArrayList<String>> rsDecArchitects = (ArrayList<ArrayList<String>>) request.getAttribute("rsDecArchitects");
%>

<head>
    <title>Production Department</title>

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
            <a class="navbar-brand" href="/SEP/IndexPM">
                <img src="logo.png" alt="logo" style="width:40px;">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
                aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div id="navbarNavDropdown" class="navbar-collapse collapse">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="/SEP/IndexPM"><i class="fa fa-home"></i> Home</a>
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
            <h1>Create Tasks</h1>
        </div>

        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#decorations">Decorations</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#photography">Photography</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#music">Music</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#graphic-design">Graphic Design</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#computer-related">Computer Related</a>
            </li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">
            <div id="decorations" class="container tab-pane active">
                <div class="mt-4 mb-4">
                    <h3>Decorations</h3>
                </div>
                <form id="send-decoration-tasks" action="/SEP/CreateTaskPM" method="POST">
                    <fieldset id="decoration-tasks" enabled>
                        <div class="form-group row">
                            <label for="decoration-reference" class="col-sm-2 col-form-label">Project reference:</label>
                            <div class="col-sm-10">
                            	<select class="custom-select" id="decoration-reference" name="project-reference" required>
                                    <% for(String id: rsProjects){
                                    	out.println("<option value=\"" + id + "\">" + id + "</option>\"");
                                    } 
                                    %>
                                </select>
                            </div>
                        </div>
                    
                        <div class="form-group row">
                            <label for="decoration-description" class="col-sm-2 col-form-label">Description:</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="3" id="decoration-description" name="task-description" placeholder="Enter task description" required></textarea>
                            </div>
                        </div>
                    
                    
                        <div class="form-group row">
                            <label for="decoration-assign-to" class="col-sm-2 col-form-label">Assign to:</label>
                            <div class="col-sm-10">
                                <select class="custom-select" id="decoration-assign-to" name="assign-to" required>
                                    <% for(ArrayList<String> decArchitect: rsDecArchitects){
                                    	out.println("<option value=\"" + decArchitect.get(0) 
                                    			  + "\">" + decArchitect.get(1)  + "</option>\"");
                                    } 	
                                    %>
                                </select>
                            </div>
                        </div>
                    
                        <div class="form-group row">
                            <label for="decoration-priority" class="col-sm-2 col-form-label">Priority:</label>
                            <div class="col-sm-10">
                                <select class="custom-select" id="decoration-priority" name="priority" required>
                                    <option value="Select priority" selected disabled>Select priority</option>
                                    <option value="High">High</option>
                                    <option value="Medium">Medium</option>
                                    <option value="Low">Low</option>
                                </select>
                            </div>
                        </div>
                        
                    </fieldset>

                    <fieldset id="decoration-submit" enabled>
                        <button type="submit" value="send-decoration-task" class="btn btn-primary float-right mb-4">Send Task</button>
                    </fieldset>
                    
               <%	Object actionState = request.getAttribute("actionState");
		       		if (actionState != null){
		       			String actionStateStr = (String) actionState;
		       			if( actionStateStr.equals("fail") ){   %>
		       				<div class="text-danger">The action has failed.</div>
		       	<%		} else if( actionStateStr.equals("success")){  %>
		       				<div class="text-success">The action has been completed successfully.</div>
		       	<%		}
		       		}		      %>
                </form>
            </div>

            <div id="photography" class="container tab-pane">
                <div class="mt-4 mb-4">
                    <h3>Photography</h3>
                </div>
                <form id="send-photography-tasks" action="" method="GET">
                    <fieldset id="photography-tasks" enabled>
                        <div class="form-group row">
                            <label for="photography-reference" class="col-sm-2 col-form-label">Project reference:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="photography-reference" name="project-reference" placeholder="Enter project reference">
                            </div>
                        </div>
                    
                        <div class="form-group row">
                            <label for="photography-description" class="col-sm-2 col-form-label">Description:</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="3" id="photography-description" name="task-description" placeholder="Enter task description"></textarea>
                            </div>
                        </div>
                    
                        <div class="form-group row">
                            <label for="photography-assign-to" class="col-sm-2 col-form-label">Assign to:</label>
                            <div class="col-sm-10">
                                <select class="custom-select" id="photography-assign-to" name="assign-to">
                                    <option value="Select an employee" selected disabled>Select an employee</option>
                                    <option value="Tobias">Tobias</option>
                                    <option value="Magdalena">Magdalena</option>
                                </select>
                            </div>
                        </div>
                    
                        <div class="form-group row">
                            <label for="photography-priority" class="col-sm-2 col-form-label">Priority:</label>
                            <div class="col-sm-10">
                                <select class="custom-select" id="photography-priority" name="priority">
                                    <option value="Select priority" selected disabled>Select priority</option>
                                    <option value="high">High</option>
                                    <option value="medium">Medium</option>
                                </select>
                            </div>
                        </div>
                    
                        <p class="mb-4 text-danger text-right">(High or Medium priority according to the project deadline)</p>
                    
                    </fieldset>

                    <fieldset id="photography-submit" enabled>
                        <button type="submit" value="send-photography-task" class="btn btn-primary float-right mb-4">Send Task</button>
                    </fieldset>
                </form>
            </div>

            <div id="music" class="container tab-pane">
                <div class="mt-4 mb-4">
                    <h3>Music</h3>
                </div>
                <form id="send-music-tasks" action="" method="GET">
                    <fieldset id="music-tasks" enabled>
                        <div class="form-group row">
                            <label for="music-reference" class="col-sm-2 col-form-label">Project reference:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="music-reference" name="project-reference" placeholder="Enter project reference">
                            </div>
                        </div>
                    
                        <div class="form-group row">
                            <label for="music-description" class="col-sm-2 col-form-label">Description:</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="3" id="music-description" name="task-description" placeholder="Enter task description"></textarea>
                            </div>
                        </div>
                    
                        <div class="form-group row">
                            <label for="music-assign-to" class="col-sm-2 col-form-label">Assign to:</label>
                            <div class="col-sm-10">
                                <select class="custom-select" id="music-assign-to" name="assign-to">
                                    <option value="Select an employee" selected disabled>Select an employee</option>
                                    <option value="Antony">Antony</option>
                                    <option value="Adam">Adam</option>
                                </select>
                            </div>
                        </div>
                    
                        <div class="form-group row">
                            <label for="music-priority" class="col-sm-2 col-form-label">Priority:</label>
                            <div class="col-sm-10">
                                <select class="custom-select" id="music-priority" name="priority">
                                    <option value="Select priority" selected disabled>Select priority</option>
                                    <option value="high">High</option>
                                    <option value="medium">Medium</option>
                                </select>
                            </div>
                        </div>
                    
                        <p class="mb-4 text-danger text-right">(High or Medium priority according to the project deadline)</p>
                    
                    </fieldset>
            
                    <fieldset id="music-submit" enabled>
                        <button type="submit" value="send-music-task" class="btn btn-primary float-right mb-4">Send Task</button>
                    </fieldset>
                </form>
            </div>

            <div id="graphic-design" class="container tab-pane">
                <div class="mt-4 mb-4">
                    <h3>Graphic Design</h3>
                </div>
                <form id="send-graphic-design-tasks" action="" method="GET">
                    <fieldset id="graphic-design-tasks" enabled>
                        <div class="form-group row">
                            <label for="graphic-design-reference" class="col-sm-2 col-form-label">Project reference:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="graphic-design-reference" name="project-reference" placeholder="Enter project reference">
                            </div>
                        </div>
                    
                        <div class="form-group row">
                            <label for="graphic-design-description" class="col-sm-2 col-form-label">Description:</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="3" id="graphic-design-description" name="task-description" placeholder="Enter task description"></textarea>
                            </div>
                        </div>
                    
                        <div class="form-group row">
                            <label for="graphic-design-assign-to" class="col-sm-2 col-form-label">Assign to:</label>
                            <div class="col-sm-10">
                                <select class="custom-select" id="graphic-design-assign-to" name="assign-to">
                                    <option value="Select an employee" selected disabled>Select an employee</option>
                                    <option value="Julia">Julia</option>
                                    <option value="Raymond">Raymond</option>
                                </select>
                            </div>
                        </div>
                    
                        <div class="form-group row">
                            <label for="graphic-design-priority" class="col-sm-2 col-form-label">Priority:</label>
                            <div class="col-sm-10">
                                <select class="custom-select" id="graphic-design-priority" name="priority">
                                    <option value="Select priority" selected disabled>Select priority</option>
                                    <option value="high">High</option>
                                    <option value="medium">Medium</option>
                                </select>
                            </div>
                        </div>
                    
                        <p class="mb-4 text-danger text-right">(High or Medium priority according to the project deadline)</p>
                    
                    </fieldset>
            
                    <fieldset id="graphic-design-submit" enabled>
                        <button type="submit" value="send-graphic-design-task" class="btn btn-primary float-right mb-4">Send Task</button>
                    </fieldset>
                </form>
            </div>

            <div id="computer-related" class="container tab-pane">
                <div class="mt-4 mb-4">
                    <h3>Computer Related</h3>
                </div>
                <form id="send-computer-related-tasks" action="" method="GET">
                    <fieldset id="computer-related-tasks" enabled>
                        <div class="form-group row">
                            <label for="computer-related-reference" class="col-sm-2 col-form-label">Project reference:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="computer-related-reference" name="project-reference" placeholder="Enter project reference">
                            </div>
                        </div>
                    
                        <div class="form-group row">
                            <label for="computer-related-description" class="col-sm-2 col-form-label">Description:</label>
                            <div class="col-sm-10">
                                <textarea class="form-control" rows="3" id="computer-related-description" name="task-description" placeholder="Enter task description"></textarea>
                            </div>
                        </div>
                    
                        <div class="form-group row">
                            <label for="computer-related-assign-to" class="col-sm-2 col-form-label">Assign to:</label>
                            <div class="col-sm-10">
                                <select class="custom-select" id="computer-related-assign-to" name="assign-to">
                                    <option value="Select an employee" selected disabled>Select an employee</option>
                                    <option value="Christian">Christian</option>
                                    <option value="Nicolas">Nicolas</option>
                                    <option value="Michael">Michael</option>
                                    <option value="Robert">Robert</option>
                                </select>
                            </div>
                        </div>
                    
                        <div class="form-group row">
                            <label for="computer-related-priority" class="col-sm-2 col-form-label">Priority:</label>
                            <div class="col-sm-10">
                                <select class="custom-select" id="computer-related-priority" name="priority">
                                    <option value="Select priority" selected disabled>Select priority</option>
                                    <option value="high">High</option>
                                    <option value="medium">Medium</option>
                                </select>
                            </div>
                        </div>
                    
                        <p class="mb-4 text-danger text-right">(High or Medium priority according to the project deadline)</p>
                    
                    </fieldset>
            
                    <fieldset id="computer-related-submit" enabled>
                        <button type="submit" value="send-computer-related-task" class="btn btn-primary float-right mb-4">Send Task</button>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
</body>
