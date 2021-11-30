<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
var cid = '${dto.cid}'; //게시글 번호
 
$('[name=rebtn]').click(function(){ //댓글 등록 버튼 클릭시 
	console.log("success");
    var insertData = $('[name=replyForm]').serialize(); //replyForm의 내용을 가져옴
    replyCreate(insertData); //Insert 함수호출(아래)
});
 
 
 
//댓글 목록 
function replyList(cid,page){
    $.ajax({
        url : '/community/reply/list',
        type : 'get',
        data : {'cid':cid, 'page' : page},
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

                a += '<div class="replyArea" style="border-bottom:1px solid darkgray; margin-bottom: 5px;">';
                a += '<input type="hidden" class="id-control" name="id_'+value.crid+'" value="'+value.id+'"/>'
                a += '<div class="replyInfo'+value.crid+'" style="color:#808088">'+'<i class="fas fa-comments"></i>'+''+value.nickname+' '+value.rdate;
                a += '<button type="button" onclick="replyUpdate('+value.crid +',\''+value.content+'\');" style=" height : 30px; margin-left : 15px; margin-right : 7px; color:#5BA6A6; background-color : white; border: 2px solid #5BA6A6; border-radius:10%;"> 수정 </button>';
                a += '<button onclick="replyDelete('+value.crid+');" style="color:#5BA6A6; background-color : white; border: 2px solid #5BA6A6; border-radius:10%;"> 삭제 </button> </div>';
                a += '<div class="replyContent'+value.crid+'"> <p>'+value.content +'</p>';
                a += '</div></div>';
            });
            
            for (var num=startpage; num<=endpage; num++) {
                if (num == page) {
                     a += '<a href="#" onclick="replyList(' + cid + ', ' + num + '); return false;" class="page-btn">' + num + '</a>';
                } else {
                     a += '<a href="#" onclick="replyList(' + cid + ', ' + num + '); return false;" class="page-btn">' + num + '</a>';
                }
             }            
            
            $(".replyList").html(a);
            
        }
    });
}
 
//댓글 등록
function replyCreate(insertData){
    $.ajax({
        url : '/community/reply/create',
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
function replyUpdate(crid, content, id){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="hidden" class="id-control" name="id_'+crid+'" value="'+id+'"/>';
    a += '<input type="text" class="form-control" name="content_'+crid+'" value="'+content+'"/>';
    a += '<div class="input-group-btn"><button class="btn" style="width : 60px; height : 38px; background-color : white; border: 2px solid #5BA6A6; color : #5BA6A6; textalign : center; margin-left : 10px; padding-right : 10px; padding-bottom : 5px;" type="button" onclick="replyUpdateProc('+crid+');">수정</button> </div>';
    a += '</div>';
    
    $('.replyContent'+crid).html(a);
    
}
 
//댓글 수정
function replyUpdateProc(crid){
    var updateContent = $('[name=content_'+crid+']').val();
    var replyid = $('[name=id_'+crid+']').val();
	console.log(replyid);
    
    $.ajax({
        url : '/community/reply/update/'+crid,
        type : 'post',
        data : {'content' : updateContent, 'cid' : cid, 'replyid': replyid},
        success : function(data){
            if(data == 1) {
            	replyList(cid); //댓글 수정후 목록 출력
            }else{
        		alert("작성자가 아닙니다.");
        	}
            
        }
    });
}
 
//댓글 삭제 
function replyDelete(crid){
	var replyid = $('[name=id_'+crid+']').val();
    $.ajax({
        url : '/community/reply/delete/'+crid,
        type : 'post',
        data : {'replyid' : replyid },
        success : function(data){
            if(data == 1){ 
            	replyList(cid); //댓글 삭제후 목록 출력 
            }else{
    		alert("작성자가 아닙니다.");
    	}    
  	  }}
   );}

 
 
 
 
$(document).ready(function(){
    replyList(cid,1); //페이지 로딩시 댓글 목록 출력 
});
 
 
 
</script>

