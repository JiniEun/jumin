$(document).ready(function() {
	
	$("#button").click(function() {
		$("#divToggle").toggle();
	});
	$("button").click(function() {
		$("#divToggle2").toggle();
	});

  $(".choice1 .btn1").on("click", function(e){
            e.preventDefault();
            $(".list1").toggle();
        });
        $(".choice1 .btn2").on("click", function(e){
            e.preventDefault();
            $(".list1").toggle(2000);
        });
        $(".choice1 .btn3").on("click", function(e){
            e.preventDefault();
            $(".list1").toggle("fast");
        });

});