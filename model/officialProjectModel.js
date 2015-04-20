/**
 * Created by apple on 2015/4/20.
 */
module.exports = function(id,name,category,type,creator,describe,people,startTime,endTime,discuss,source,aid,background,innovation,plan,prospect,budget,resourcerequired, member,teacher,mainMember,status){
    var officialProject = {
        id: 0,
        name: "",
        category: "",
        type: 2,
        creator: "",
        describe: "",
        people: 0,
        startTime: "",
        endTime: "",
        discuss: [],
        source: "",
        aid: "",
        backgroud: "",
        innovation: "",
        plan: "",
        prospect: "",
        budget: 0,
        resourcerequired: "",
        member: [],
        teacher: "",
        mainMember: {},
        status: 3
    }
    officialProject.id = id;
    officialProject.name = name;
    officialProject.category = category;
    officialProject.type = type;
    officialProject.creator = creator;
    officialProject.describe = describe;
    officialProject.people = people;
    officialProject.startTime = startTime;
    officialProject.endTime = endTime;
    officialProject.discuss = discuss;
    officialProject.source = source;
    officialProject.aid = aid;
    officialProject.backgroud = background;
    officialProject.innovation = innovation;
    officialProject.plan = plan;
    officialProject.prospect = prospect;
    officialProject.budget = budget;
    officialProject.resourcerequired = resourcerequired;
    officialProject.member = member;
    officialProject.teacher = teacher;
    officialProject.mainMember = mainMember;
    officialProject.status = status;

    officialProject.setDiscuss = function setDiscuss(discuss){
        this.discuss = discuss;
    }
    officialProject.setMainMember = function setMainMember(mainMember){
        this.mainMember = mainMember;
    }
    officialProject.setTeacher = function setTeacher(teacher){
        this.teacher = teacher;
    }
    officialProject.setMember = function setMember(member){
        this.member = member;
    }
    return officialProject;

}