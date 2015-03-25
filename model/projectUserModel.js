//包含指定user在一个项目中的状态
module.exports= function(name,category,creator,people,content,status,projectStatus){
    //private
    var projectUser =
    {
         name : "",//项目的名字
          category : "",//项目类别
         creator : "",//创建者的名字
         people : 0 ,//项目最多人数
         content : "",//项目描述
         status : 0 ,//用户在这个项目中的状态，0为未报名，1为审核中，2为审核通过，3为审核未通过
         projectStatus : 0 //项目的状态，0为进行中
    }
    //construct code
    projectUser.name = name;
    projectUser.category = category;
    projectUser.content = content;
    projectUser.creator = creator;
    projectUser.people = people;
    projectUser.projectStatus = projectStatus;
    projectUser.status = status;
    return projectUser;
}
