$(function () {//페이지가 로딩될때
   showList();
    showPage();
});//page loading function end  
 
let replyUL = $(".chat");
let replyPageFooter = $(".panel-footer");
 
let param = "nPage=" + nPage;
    param += "&nowPage=" + nowPage;
    param += "&bbsno=" + tid;
    param += "&col=" + colx;
    param += "&word=" + wordx;
 
const replyService = new ReplyService();
 
function showList() {
  replyService
    .getList({ tid: tid, sno: sno, eno: eno })
    .then(list => {
      let str = ""
 
      for (var i = 0; i < list.length ; i++) {
        str += "<li class='list-group-item' data-rnum='" + list[i].trid + "'>";
        str += "<div><div class='header'><strong class='primary-font'>" + list[i].id + "</strong>";
        str += "<small class='pull-right text-muted'>" + list[i].rdate + "</small></div>";
        str += replaceAll(list[i].content, '\n', '<br>') + "</div></li>";
      }
 
      replyUL.html(str);
    })
 
}//showList() end
 
function replaceAll(str, searchStr, replaceStr) {
  return str.split(searchStr).join(replaceStr);
}
 
function showPage(){
    replyService
   .getPage(param)
   .then(paging => {
      console.log(paging);
      let str = "<div><small class='text-muted'>" + paging + "</small></div>";
 
      replyPageFooter.html(str);
});
}