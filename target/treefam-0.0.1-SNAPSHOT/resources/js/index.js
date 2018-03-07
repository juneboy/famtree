/*GET CURRENT URL*/
function getURL(){
	var url = window.location.href;
	return url.split("/")[0]+"//"+url.split("/")[2]+"/"+url.split("/")[3];
}
$("#bornDateInput").datepicker();
$("#bornDateInput").datepicker('option', 'dateFormat', 'yy-mm-dd');
$("#uploadLab").click(function(){
	$(":input[type='file']").click();
});
var START = 0;
/*LOAD DATA FROM PAGE LOADING*/
var loadData = function(){
	$.ajax({
		url: getURL()+"/alive",
	    method: "GET",
	    dataType: "JSON",
	    success: function(data){
	    	 //alert(getURL());
	    	       $("#result").html("");
	    	       if(data.length > 6){
		    	   for(var i = data.length -6 - START; i < data.length - START; i++){
		    		   nameArray.push(data[i].fullname);
		    		   $("#result").append(
		    				   '<div class="'+'column-famtree">'+
		    				    '<div class="'+'card-famtree">'+
		    				    '<span class="'+'glyphicon glyphicon-remove glyphicon-famtree"'+'id="'+data[i].id+'"></span>'+
		    				      '<img src="'+data[i].imageLink+'" alt="'+data[i].fullname+'">'+
		    				      '<div class="'+'container-famtree">'+
		    				        '<h2>'+data[i].fullName+'</h2>'+
		    				        '<p class="'+'title">'+data[i].bornDate+'</p>'+
		    				        '<p>'+data[i].address+'</p>'+
		    				        '<p>'+data[i].email+'</p>'+
		    				        '<p><button class="'+'button-famtree">'+data[i].phone+'</button></p>'+
		    				      '</div>'+
		    				    '</div>'+
		    				  '</div>'
		    		   );
		    	     }
		    		   var pages = Math.round(data.length/6);
		    		   for(var i=1; i < pages+1; i++){
		    			   if(i < pages) {
		    			   $("#paginationUl").html(
		    					   "<li id='"+i+"'><a>"+i+"</a></li>"
		    					   );} else {
		    						   $("#paginationUl").append(
		    		    					   "<li class='"+"active' id='"+i+"'><a>"+i+"</a></li>"
		    		    					   ); 
		    					   }
		    		   }
		    	   } else {
		    		   for(var i=0; i < data.length; i++){
			    		   nameArray.push(data[i].fullname);
			    		   $("#result").append(
			    				   '<div class="'+'column-famtree">'+
			    				    '<div class="'+'card-famtree">'+
			    				    '<span class="'+'glyphicon glyphicon-remove glyphicon-famtree"'+'id="'+data[i].id+'"></span>'+
			    				      '<img src="'+data[i].imageLink+'" alt="'+data[i].fullname+'">'+
			    				      '<div class="'+'container-famtree">'+
			    				        '<h2>'+data[i].fullName+'</h2>'+
			    				        '<p class="'+'title">'+data[i].bornDate+'</p>'+
			    				        '<p>'+data[i].address+'</p>'+
			    				        '<p>'+data[i].email+'</p>'+
			    				        '<p><button class="'+'button-famtree">'+data[i].phone+'</button></p>'+
			    				      '</div>'+
			    				    '</div>'+
			    				  '</div>'
			    		   );
			    	     }
		    	   }
	    },
	    error: function(){
	    	   alert("Error to load data!");
	    }
	});
}
var nameArray = new Array();
/*AUTOCOMPLETE*/
$("#searchDiv").autocomplete({
	   source: nameArray
});

/*DISPLAY ALIVE PEOPLE TO RESULT DIV*/
$( document ).ready(function(){
	loadData();
	/*DELETE MEMBER*/
	$("span").on('click',function(){
		alert("span click");
		var id = $(this).attr('id');
		$.ajax({
			beforeSend : function() {
				alert(id);
			},
			url : getURL()+"/delete",
			method : "POST",
			crossDomain: true,
			dataType : "html",
			data : JSON.stringify(id),
			success : function(xhr,response) {
				if(response === 1){
					alert('Successfully deleted member!');
					loadData();
				}
			},
			error: function(){
				alert("error!");
			}
		});
	});
	
	/*HANDLE PAGE SELECTION*/
	$("#paginationDiv #paginationUl li a").on("click", function(){
		$("#paginationUl li").removeClass();
		alert("li click");
		var page = parseInt($(this).attr("id"));
		$(this).addClass("active");
		START = START + page*6;
		loadData();
	});
	/*HANDLE INSERT NEW MEMBER*/
	$(":input[name='btnSubmit']").click(function(){
		var alive = new Object();
		/*GET ALL INPUT*/
		var fullName = $(":input[name='fullNameInput']").val();
		var address = $(":input[name='addressInput']").val();
		var email = $(":input[name='emailInput']").val();
		var phone = $(":input[name='phoneInput']").val();
		var bornDate = $(":input[name='bornDateInput']").val();
		var detail = $(":input[name='detailTextare']").val();
		var imageLink = 'https://pbs.twimg.com/profile_images/874276197357596672/kUuht00m_400x400.jpg';
		alive = {
				fullName: fullName,
				address: address,
				email: email,
				phone: phone,
				bornDate: bornDate,
				detail: detail,
				imageLink: imageLink
		}
		if(fullName.trim().length != 0 && email.trim().length != 0 && bornDate.trim().length != 0 ){
			/*AJAX CALL HERE*/
			$.ajax({
				beforeSend : function() {
					
				},
				url : getURL()+"/alive",
				method : "POST",
				crossDomain: true,
				dataType : "html",
				data : JSON.stringify(alive),
				success : function() {
					alert("Successfully insert new member!");
					loadData();
				},
				error: function(){
					alert("error!");
				}
			});
		}
	}
	);
});