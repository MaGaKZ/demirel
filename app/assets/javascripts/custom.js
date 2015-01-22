$( document ).ready(function() {
	$(".list-group-item").first().addClass("active");
$( ".list-group-item" ).click(function() {
  $(".list-group-item").removeClass( "list-group-item active" ).addClass( "list-group-item" );
  $( this ).addClass( "list-group-item active" );
});
});