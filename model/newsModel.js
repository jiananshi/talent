//对应新闻的model类
module.exports =  function(id, name ,imgUrl, content, time, readTimes){
    var news = {
        id : 0, //新闻的id
        name : "", //新闻的标题
        imgUrl : "", //图片路径
        content : "", //新闻内容
        time : "", //创建时间
        readTimes : 0 //阅读次数
    }
    news.id = id;
    news.name = name;
    news.imgUrl = imgUrl;
    news.content = content;
    news.time = time;
    news.readTimes = readTimes;

    return news;
}