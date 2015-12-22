var star_number=0;

function starOnMouse(pNum,stars){
	var root=$("input[name='root']").val();
	var ul=document.getElementById("myr_score"+pNum);
	
	for(var i=1; i<stars+1; i++){
		ul.children[i].children[0].src=root+"/css/images/yellowStar.png";
	}
	for(var i=stars+1; i<=5; i++){
		ul.children[i].children[0].src=root+"/css/images/emptyStar.png";
	}
	document.getElementById("star_number"+pNum).value=stars;
}