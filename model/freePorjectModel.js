/**
 * Created by apple on 2015/4/20.
 */
//对应自创项目
module.exports = function(id,name,category,type,startTime,endTime,crowdfunding,creator,people,describe,discuss,allCrowdfunding,status){
    var freeProject = {
        id: 0,
        name :"",
        category : "",
        type : 0,
        startTime : "",
        endTime : "",
        crowdfunding : 1,
        creator: "",
        people :0,
        describe : "",
        discuss : [],
        allCrowdfunding : [],
        status :  7
    }
    freeProject.id = id;
    freeProject.name = name;
    freeProject.category = category;
    freeProject.type = type;
    freeProject.startTime = startTime;
    freeProject.endTime = endTime;
    freeProject.crowdfunding = crowdfunding;
    freeProject.creator = creator;
    freeProject.people = people;
    freeProject.describe = describe;
    freeProject.allCrowdfunding = allCrowdfunding;
    freeProject.status = status;

    return freeProject;
}