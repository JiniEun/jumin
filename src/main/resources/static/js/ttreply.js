console.log("*****Reply Module........");

var tid = '${dto.tid}'; //게시글 번호
 
 $('[name=rebtn]').click(function(){ //댓글 등록 버튼 클릭시 
	console.log("success");
    var insertData = $('[name=replyForm]').serialize(); //replyForm의 내용을 가져옴
    replyCreate(insertData); //Insert 함수호출(아래)
});
 
 
//댓글 목록 
function replyList(){
    $.ajax({
        url : '/reply/list',
        type : 'get',
        data : {'tid':tid},
        success : function(data){
            var a =''; 
            $.each(data, function(key, value){ 
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+value.trid+'">'+'댓글번호 : '+value.trid+' / 작성자 : '+value.writer;
                a += '<a onclick="commentUpdate('+value.trid+',\''+value.content+'\');"> 수정 </a>';
                a += '<a onclick="commentDelete('+value.trid+');"> 삭제 </a> </div>';
                a += '<div class="commentContent'+value.trid+'"> <p> 내용 : '+value.content +'</p>';
                a += '</div></div>';
            });
            
            $(".replyList").html(a);
        }
    });
}
 
//댓글 등록
function replyCreate(insertData){
    $.ajax({
        url : '/reply/create',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                replyList(); //댓글 작성 후 댓글 목록 reload
                $('[name=content]').val('');
            }
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function replyUpdate(trid, content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="content_'+trid+'" value="'+content+'"/>';
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+cno+');">수정</button> </span>';
    a += '</div>';
    
    $('.replyContent'+trid).html(a);
    
}
 
//댓글 수정
function replyUpdateProc(cno){
    var updateContent = $('[name=content_'+cno+']').val();
    
    $.ajax({
        url : '/comment/update',
        type : 'post',
        data : {'content' : updateContent, 'cno' : cno},
        success : function(data){
            if(data == 1) commentList(bno); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function replyDelete(trid){
    $.ajax({
        url : '/comment/delete/'+trid,
        type : 'post',
        success : function(data){
            if(data == 1) replyList(tid); //댓글 삭제후 목록 출력 
        }
    });
}
 
 
 
 
$(document).ready(function(){
    replyList(); //페이지 로딩시 댓글 목록 출력 
});
 



