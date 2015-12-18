var star_number=0;

$(function(){
	var root=$("input[name='root']").val();
	var emptyStar="<input type='image' id='empty_star' class='score_button' src='"+root+"/css/images/emptyStar.png' alt='button'/>";
	var yellowStar="<input type='image' id='yellow_star' class='score_button' src='"+root+"/css/images/yellowStar.png' alt='button'/>";
	
	$(".score_button_li_1").mouseenter(function(){
		$("input.score_button",$(".score_button_li")).remove();
		$(".score_button_li_2").append(emptyStar);
		$(".score_button_li_3").append(emptyStar);
		$(".score_button_li_4").append(emptyStar);
		$(".score_button_li_5").append(emptyStar);
		$(this).append(yellowStar);
		var star_number=1;
		$("#star_number").val(star_number);
	});
	$(".score_button_li_2").mouseenter(function(){
		$("input.score_button",$(".score_button_li")).remove();
		$(".score_button_li_1").append(yellowStar);
		$(".score_button_li_3").append(emptyStar);
		$(".score_button_li_4").append(emptyStar);
		$(".score_button_li_5").append(emptyStar);
		$(this).append(yellowStar);
		var star_number=2;
		$("#star_number").val(star_number);
	});
	$(".score_button_li_3").mouseenter(function(){
		$("input.score_button",$(".score_button_li")).remove();
		$(".score_button_li_1").append(yellowStar);
		$(".score_button_li_2").append(yellowStar);
		$(".score_button_li_4").append(emptyStar);
		$(".score_button_li_5").append(emptyStar);
		$(this).append(yellowStar);
		var star_number=3;
		$("#star_number").val(star_number);
	});
	$(".score_button_li_4").mouseenter(function(){
		$("input.score_button",$(".score_button_li")).remove();
		$(".score_button_li_1").append(yellowStar);
		$(".score_button_li_2").append(yellowStar);
		$(".score_button_li_3").append(yellowStar);
		$(".score_button_li_5").append(emptyStar);
		$(this).append(yellowStar);
		var star_number=4;
		$("#star_number").val(star_number);
	});
	$(".score_button_li_5").mouseenter(function(){
		$("input.score_button",$(".score_button_li")).remove();
		$(".score_button_li_1").append(yellowStar);
		$(".score_button_li_2").append(yellowStar);
		$(".score_button_li_3").append(yellowStar);
		$(".score_button_li_4").append(yellowStar);
		$(this).append(yellowStar);
		var star_number=5;
		$("#star_number").val(star_number);
	});
});

