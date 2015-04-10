//包含指定user在一个项目中的状态
module.exports = function(id,name,category,creator,people,content,projectStatus){
    //private
    var projectUser =
    {
          id : 0,//项目的id
         name : "",//项目的名字
          category : "",//项目类别/或id
         creator : "",//创建者的名字/或id
         people : 0 ,//项目最多人数
         content : "",//项目描述
         projectStatus : 0 //项目的状态，0为进行中
    }
    //construct code
    projectUser.id = id;
    projectUser.name = name;
    projectUser.category = category;
    projectUser.content = content;
    projectUser.creator = creator;
    projectUser.people = people;
    projectUser.projectStatus = projectStatus;
    projectUser.getName = function getName(){
        return this.name;
    }
    projectUser.getCategory = function getCategory(){
        return this.category;
    }
    projectUser.getCreator = function getCreator(){
        return this.creator;
    }
    projectUser.setCreator = function setCreator(creator){
        return this.creator  = creator;
    }
    projectUser.getPeople = function getPeople(){
        return this.people;
    }
    projectUser.getContent = function getContent(){
        return this.content;
    }
    projectUser.getProjectStatus = function getProjectStatus(){
        return this.projectStatus;
    }
    return projectUser;
}
