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
        allCrowdfunding : {},
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
    freeProject.discuss = discuss;
    freeProject.allCrowdfunding = allCrowdfunding;
    freeProject.status = status;

    freeProject.setName = function setName(name){
        this.name = name;
    }
    freeProject.setType = function setType(type){
         this.type = type;
    }
    freeProject.setCategory = function setCategory(category){
        this.category = category;
    }
    freeProject.setDiscuss = function setDiscuss(discuss){
        this.discuss = discuss;
    }
    freeProject.setAllCrowdfunding = function setAllCrowdfunding(allCrowdfunding){
        this.allCrowdfunding = allCrowdfunding;
    }


    return freeProject;
}