//对应新闻的model类
module.exports =  function(id, name){
    var category = {
        id : 0, //分类的id
        name : "" //分类的名字

    }
    category.id = id;
    category.name = name;


    return category;
}
