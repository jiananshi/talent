/**
 * Created by apple on 2015/4/3.
 */
//竞赛Model 用于存储竞赛信息
module.exports = function( id, name, creator, content, createTime ,endTime, people){
    var competition = {
        id : 0, //竞赛的id
        name :"",//竞赛的名字
        creator : "",//竞赛的创建者
        content : "",//竞赛的介绍
        createTime :"",//竞赛的创建时间
        endTime : "",//竞赛报名截止时间
        people : 0 //报名时，每组最多人数
    }
    competition.id = id;
    competition.name = name;
    competition.creator = creator;
    competition.content = content;
    competition.createTime = createTime;
    competition.endTime = endTime;
    competition.people = people;
    return competition;
}
