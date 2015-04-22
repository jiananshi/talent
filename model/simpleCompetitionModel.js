//竞赛Model 用于存储简单竞赛信息
module.exports = function( id, name, creator, endTime){
    var competition = {
        id : 0, //竞赛的id
        name :"",//竞赛的名字
        creator : "",//竞赛的创建者
        endTime : ""//竞赛报名截止时间
    }
    competition.id = id;
    competition.name = name;
    competition.creator = creator;
    competition.endTime = endTime;

    return competition;
}
