<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
var clID = '${dto.clID}'; //게시글 번호
 
$('[name=rebtn]').click(function(){ //댓글 등록 버튼 클릭시 
	console.log("success");
    var insertData = $('[name=replyForm]').serialize(); //replyForm의 내용을 가져옴
    replyCreate(insertData); //Insert 함수호출(아래)
});
 
//댓글 목록 
function replyList(clID,page){
    $.ajax({
        url : '/club/reply/list',
        type : 'get',
        data : {'clID':clID, 'page' : page},
        success : function(data){
        	var page = data.page;
            var startpage = data.startpage;
            var endpage = data.endpage;
            var list=data.list;
            var limit = 3;            

            var a =''; 
            $.each(list, function(key, value){ 
            	console.log("hello");
            	console.log("data : " + list);
                console.log(list);
                console.log(page + "," + startpage + "," + endpage);
                console.log("start : " + startpage);
                console.log("end : " + endpage);

                a += 	'<div class="replyArea" style="border-bottom:1px solid darkgray; margin-bottom: 5px; padding : 0px;">';
                a += 	'<input type="hidden" class="id-control" name="id_'+value.clrID+'" value="'+value.ID+'"/>'
                a += 	'<div class="replyInfo'+value.clrID+'">'+'<i class="fas fa-comments"></i>'+' '+value.nickname+'<span><input type="text" readonly style="border:none; width : 200px;" class="id-control" name="rdate_'+value.clrID+'" value="'+' '+value.rdate+'"/></span>';
                a += 	'<button type="button" onclick="replyUpdate('+value.clrID+',\''+value.content+'\',\''+value.ID+'\');" style=" height : 30px; margin-left : 15px; margin-right : 7px; color:#5BA6A6; background-color : white; border: 2px solid #5BA6A6; border-radius:10%;"> 수정 </button>';
                a += 	'<button onclick="replyDelete('+value.clrID+');" style="color:#5BA6A6; background-color : white; border: 2px solid #5BA6A6; border-radius:10%;"> 삭제 </button> </div>';
                a += 	'<div class="replyContent'+value.clrID+'" > <p> 내용 : '+value.content +'</p>';
                a += '</div></div>';
            });
            
            for (var num=startpage; num<=endpage; num++) {
                if (num == page) {
                     a += '<a href="#" onclick="replyList(' + clID + ', ' + num + '); return false;" class="page-btn">' + num + '</a>';
                } else {
                     a += '<a href="#" onclick="replyList(' + clID + ', ' + num + '); return false;" class="page-btn">' + num + '</a>';
                }
             }            
            
            $(".replyList").html(a);
            
        }
    });
}
 
//댓글 등록
function replyCreate(insertData){
    $.ajax({
        url : '/club/reply/create',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
            	console.log("datasuccess")
            	replyList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }else{
            	alert("로그인을 해주세요");
            	console.log("failed")
            }
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function replyUpdate(clrID, content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="hidden" class="id-control" name="id_'+clrID+'" value="'+ID+'"/>';
    a += '<input type="text" style="width : 400px;" class="form-control" name="content_'+clrID+'" value="'+content+'"/>';
    a += '<div class="input-group-btn"><button class="btn" style="width : 60px; height : 38px; background-color : white; border: 2px solid #5BA6A6; color : #5BA6A6; textalign : center; margin-left : 10px; padding-right : 10px; padding-bottom : 5px;" type="button" onclick="replyUpdateProc('+clrID+');">수정</button> </div>';
    a += '</div>';
    
    $('.replyContent'+clrID).html(a);
    
}
 
//댓글 수정
function replyUpdateProc(clrID){
    var updateContent = $('[name=content_'+clrID+']').val();
    var replyid = $('[name=id_'+clrID+']').val();
    
    $.ajax({
        url : '/club/reply/update/'+clrID,
        type : 'post',
        data : {'content' : updateContent, 'clID' : clID, 'replyid': replyid},
        success : function(data){
        	console.log("업데이트성공");
        	if(data==1){
            replyList(clID); //댓글 수정후 목록 출력 
        	}else{
        		alert("작성자가 아닙니다.");
        	}
        }
    });
}
 
//댓글 삭제 
function replyDelete(clrID){
	var replyid = $('[name=id_'+clrID+']').val();
    $.ajax({
        url : '/club/reply/delete/'+clrID,
        type : 'post',
        data : {'replyid' : replyid },
        success : function(data){
        if(data == 1){
        	replyList(clID); //댓글 삭제후 목록 출력 
        }else{
    		alert("작성자가 아닙니다.");
    	}
        }}
    );}
 
 
 
 
$(document).ready(function(){
    replyList(clID,1); //페이지 로딩시 댓글 목록 출력 
});
 
 
 
</script>