/**
 * Created by apple on 2015/4/24.
 */

module.exports = function(id,role,name,photo,number,message,guideProject,joinProject,createProject,competition){
    var user = {
        id : 0,//用户的id
        role : 0,//用户的权限 1.学生3.指导老师7.管理员
        name : "",//用户的名字
        photo : "",//头像
        number : 0,//学号
        message : [],//消息
        guideProject : [],//指导的项目，非老师则传空
        joinProject : [],//我加入的项目
        createProject : [],//我创建的项目,
        competition : [] //我参加的竞赛
    }

    user.id = id;
    user.role = role;
    user.name = name;
    user.photo = photo;
    user.number = number;
    user.message = message;
    user.guideProject = guideProject;
    user.joinProject = joinProject;
    user.createProject = createProject;
    user.competition = competition;

    user.setMessage = function setMessage(message){
        this.message = message;
    }

    user.setGuideProject = function setGuideProject(guideProject){
        this.guideProject = guideProject;
    }

    user.setJoinProject = function setJoinProject(joinProject){
        this.joinProject = joinProject;
    }

    user.setCreateProject = function setCreateProject(createProject){
        this.createProject = createProject;
    }

    user.setCompetition = function setCompetition(competition){
        this.competition = competition;
    }

    return user;
}

