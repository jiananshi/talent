//包含指定user在一个项目中的状态
module.exports = function(id,name,category,creator,people,content,projectStatus){
    //private
    var projectUser =
    {
          id : 0,//项目的id
         name : "",//项目的名字
          category : "",//项目类别
         creator : "",//创建者的名字
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
    return projectUser;
}
