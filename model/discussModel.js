/**
 * Created by apple on 2015/4/20.
 */
//对应项目评论
module.exports = function(userId,userName,content,createTime){
    var discuss = {
        userId: 0,
        userName :"",
        content : "",
        createTime : ""
    }
    discuss.userId = userId;
    discuss.userName = userName;
    discuss.content = content;
    discuss.createTime = createTime;

    return discuss;
}