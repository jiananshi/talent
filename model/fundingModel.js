/**
 * Created by apple on 2015/4/20.
 */
//对应众筹的model
module.exports = function(userId,userName,content,money){
    var funding = {
        userId : 0,
        userName : "",
        content :"",
        money : 0
    }
    funding.userId = userId;
    funding.userName = userName;
    funding.content = content;
    funding.money = money;

    return funding;
}