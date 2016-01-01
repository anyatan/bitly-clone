$(document).ready(function() {
	$("#box").focus(function () {
	    $(this).css('outline-color', '#FF0000');
	});

    	$('img').animate({ "top": "-=1100px"}, 3000);
        // $('img').animate({ "left": "+=200px"}, 1000);

	// $('img').click(function () {
 //    	$('img').effect( "bounce", {times:3}, 300 );
 //    });
    // $('img').click(function () {
    //     $(this).effect('explode');
    // });

    $('img').dblclick(function () {
        $(this).effect('explode');
    });

    $(".hovering").hover(
    function(){
    $(this).addClass('blue');
    },
    function(){
    $(this).removeClass('blue'); 
    }
  );

    $("#ajaxyo").submit(function(event){
// submit the form what we want to do 
       event.preventDefault()
// prevent Default is a JQuery function 
     $.ajax({
         method: "POST",
         url: "/urls",
         dataType: "JSON",
         data: {"long_url": $("#ajaxyo").val()}
       })
    // use just the ID and value for a specfic part, if there is something specific. Ie. data: {"#banana-yellow").val()}
    // another way is $("#ajaxyo").serialize 
       
     .done(function( msg ) {
    // receive whatever you send back, save it in a variable in done(result)function(){
    //     $("#magical result").html(result);
    // }
     // var toAdd = $('#msg').val(); 
     // $('.blue').append("<b>"+toAdd+"</b>");
     debugger
     $('.blue').append('<div class="item">'+ "Data Saved: " + msg.id +'</div>');
     $('.biggermargin').append('<div>' + '<a href=\"http://localhost:9393/\">' + 'http://localhost:9393/' + msg.short_url + '</a>' + '</div>'); 
     $('.biggermargin').append('<div>' + msg.click_count + '</div>');
     });
   });
});
// can use .html instead of append 
 //      '<p>' + 'http://localhost:9393/' + msg.short_url + '</p>');
 // <p><a href="<%= @urls.short_url %>">http://localhost:9393/<%= @urls.short_url %></a></p>
 // <p><%= @urls.click_count %></p> 



