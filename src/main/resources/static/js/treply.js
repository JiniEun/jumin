console.log("*****Reply Module........");
class ReplyService {
    getList(param) {
        return new Promise((resolve, reject) => {
            var tid = param.tid;
            var sno = param.sno;
            var eno = param.eno;
            //alert(param.tid);
            $.getJSON("./treply/list/" + tid + "/" + sno + "/" + eno ,
                function (data) {
                    //alert(data);
                    resolve(data); // 댓글 목록만 가져오는 경우 
                    //callback(data.replyCnt, data.list); //댓글 숫자와 목록을 가져오는 경우 
                }
            );
        });
    }
 
    getPage(param) {
        return new Promise((resolve, reject) => {
            $.ajax({
                type: 'get',
                url: "./treply/page",
                data: param,
                contentType: "application/text; charset=utf-8",
                success: function (result, status, xhr) {
                    resolve(result);
 
                },
                error: function (xhr, status, er) {
                    reject(er);
                }
            });
        });
    }
 
} //class end