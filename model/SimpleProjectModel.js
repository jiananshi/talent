/**
 * Created by apple on 2015/4/20.
 */
//对应项目的简短详情（id,name,category,creator,status）
module.exports = function(id,name,category,creator,status){
    //private
    var simpleProject =
    {
        id : 0,//项目的id
        name : "",//项目的名字
        category : "",//项目类别/或id
        creator : "",//创建者的名字/或id
        status : 0 //项目的状态
    }
    //construct code
    simpleProject.id = id;
    simpleProject.name = name;
    simpleProject.category = category;
    simpleProject.creator = creator;
    simpleProject.status = status;

    return simpleProject;
}
