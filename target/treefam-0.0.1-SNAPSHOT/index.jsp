<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored ="false" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=BenchNine|Satisfy|Shadows+Into+Light" rel="stylesheet">
<link rel="stylesheet" href="resources/libs/bootstrap-3.3.7/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="resources/libs/jquery-ui-1.11.1/jquery-ui.css">
<link rel="stylesheet" href="resources/css/card.css" />
<link rel="stylesheet" href="resources/css/normalize.css" />
<link rel="stylesheet" href="resources/css/demo.css" />
<link rel="stylesheet" href="resources/css/component.css" />
<link rel="stylesheet" href="resources/css/index.css">
<link rel="stylesheet" href="resources/css/modal.css">
<!-- JAVASCRIPT AND JQUERY -->
<script src="resources/js/jquery-1.11.1.min.js"></script>
<script src="resources/libs/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
<script src="resources/libs/jquery-ui-1.11.1/jquery-ui.js"></script>

<title>FAMILY TREE</title>
<body>
	<div class="container">
	    <div class="row">
	       <!-- FORM TO UPLOAD EXCEL FILE -->
			<div class="col-sm-4 col-xs-12 nav-header">
			</div>
			<!-- col-sm-4 col-xs-12 -->
			<!-- ALL MEMBER OF FAMILY -->
	       <div class="col-sm-8 col-xs-12 nav-header">
	           
	       </div><!-- col-sm-8 col-xs-12 -->
	    </div><!-- row -->
	    <div class="row">
	      
	       <div class="col-sm-4 col-xs-12 nav-body">
	          <!-- SELECT OPTION -->
	          <div class="inline">
	                  <div class="text-center option-square" data="1">Add an alive</div>
	                  <div class="text-center option-square" data="2">Add a died</div>
	          </div>
	          <!-- INSERT ALIVE PEOPLE -->
	          <fieldset id="aliveFieldset">
	             <legend>Insert new member</legend>
                 <div class="form-group">
                      <label for="fullNameInput">Fullname</label>
                      <input type="text" name="fullNameInput" class="form-control">
                 </div>
                 <div class="form-group">
                      <label for="addressInput">Address</label>
                      <input type="text" name="addressInput" class="form-control">
                 </div>
                   <div class="form-group">
                      <label for="emailInput">Email</label>
                      <input type="text"  name="emailInput" class="form-control">
                 </div>
                 <div class="form-group">
                      <label for="phoneInput">Phone</label>
                      <input type="text" name="phoneInput" class="form-control">
                 </div>
                 <div class="form-group">
                      <label for="bornDateInput">Borndate</label>
                      <input type="text" name="bornDateInput" id="bornDateInput" class="form-control">
                 </div>
                 <div class="form-group">
                      <label for="detailTextarea">More information:</label>
                      <textarea name="detailTextarea" class="form-control" rows="5" cols="10"></textarea>
                 </div>
                 <div class="form-group">
						 <input type="file" name="file-1[]" id="imageFile" class="inputfile inputfile-1" data-multiple-caption="{count} files selected" multiple />
						 <label for="file-1"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> <span>Choose a file&hellip;</span></label>
	            </div>
	            <div class="form-group">
                      <input type="button" class="btn-submit" name="aliveSubmit" value="Submit">
                      <input type="button" class="btn-submit" name="aliveCancel" value="Cancel">
                 </div>
               </fieldset>
               <!-- INSERT DIED PEOPLE -->
               <fieldset id="diedFieldset">
	             <legend>Insert died member</legend>
                 <div class="form-group">
                      <label for="fullName">Fullname</label>
                      <input type="text" name="fullName" class="form-control">
                 </div>
                 <div class="form-group">
                      <label for="bornDate">Borndate</label>
                      <input type="text" name="bornDate" id="bornDate" class="form-control">
                 </div>
                 <div class="form-group">
                      <label for="diedDate">Dieddate</label>
                      <input type="text" name="diedDate" id="diedDate" class="form-control">
                 </div>
                 <div class="form-group">
						 <input type="file" name="file-1[]" id="imageFile" class="inputfile inputfile-1" data-multiple-caption="{count} files selected" multiple />
						 <label for="file-1"><svg xmlns="http://www.w3.org/2000/svg" width="20" height="17" viewBox="0 0 20 17"><path d="M10 0l-5.2 4.9h3.3v5.1h3.8v-5.1h3.3l-5.2-4.9zm9.3 11.5l-3.2-2.1h-2l3.4 2.6h-3.5c-.1 0-.2.1-.2.1l-.8 2.3h-6l-.8-2.2c-.1-.1-.1-.2-.2-.2h-3.6l3.4-2.6h-2l-3.2 2.1c-.4.3-.7 1-.6 1.5l.6 3.1c.1.5.7.9 1.2.9h16.3c.6 0 1.1-.4 1.3-.9l.6-3.1c.1-.5-.2-1.2-.7-1.5z"/></svg> <span>Choose a file&hellip;</span></label>
	            </div>
	            <div class="form-group">
                      <input type="button" class="btn-submit" name="diedSubmit" value="Submit">
                      <input type="button" class="btn-submit" name="diedCancel" value="Cancel">
                 </div>
               </fieldset>    
			</div><!-- col-sm-4 col-xs-12 -->
	       <!-- ALL MEMBER OF FAMILY -->
	       <div class="col-sm-8 col-xs-12 nav-body">
	                     <div class="col-sm-12 col-xs-12" id="searchDiv">
	                       <div class="input-group">
						    <span class="input-group-addon">Search member</span>
						    <input id="memberInput" type="text" class="form-control" name="memberInput" placeholder="Enter a name">
						  </div>
	                     </div>
	                    <div id="result"></div>
	                    <div class="col-sm-12 col-xs-12 text-center" id="paginationDiv">
	                        <ul id="paginationUl" class="pagination pagination-lg">
	                        </ul>
	                    </div>
	       </div><!-- col-sm-8 col-xs-12 -->
	    </div><!-- row -->
	</div><!-- container -->
	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4>Update information</h4>
	      </div>
	      <div class="modal-body">
	          <table class="table text-center borderless">
	               <!-- FULLNAME -->
	               <tr>
		               <th>
		                   <label for="fullnameModal">Fullname</label>
		               </th>
		               <td>
		                   <input type="hidden" name="idModal">
		                   <input type="text" name="fullnameModal" id="fullnameModal">
		               </td>
	               </tr>
	               <!-- EMAIL -->
	               <tr>
		               <th>
		                   <label for="emailModal">Email</label>
		               </th>
		               <td>
		                   <input type="text" name="emailModal" id="emailModal">
		               </td>
	               </tr>
	               <!-- ADDRESS -->
	               <tr>
		               <th>
		                   <label for="addressModal">Address</label>
		               </th>
		               <td>
		                   <input type="text" name="addressModal" id="addressModal">
		               </td>
	               </tr>
	               <!-- PHONE -->
	               <tr>
		               <th>
		                   <label for="phoneModal">Phone</label>
		               </th>
		               <td>
		                   <input type="text" name="phoneModal" id="phoneModal">
		               </td>
	               </tr>
	                <!-- BORNDATE -->
	               <tr>
		               <th>
		                   <label for="bornModal">Borndate</label>
		               </th>
		               <td>
		                   <input type="text" name="bornModal" id="bornModal">
		               </td>
	               </tr>
	               <!-- BUTTON -->
	               <tr>
		               <th>
		                   <label></label>
		               </th>
		               <td>
		                   <input type="button" class="btn btn-primary" value="Update" name="updateModal">
		               </td>
	               </tr>
	          </table>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	
	  </div>
	</div>	
<script type="text/javascript" src="resources/js/index.js"></script>	
<script src="resources/js/custom-file-input.js"></script>
</body>
</html>
