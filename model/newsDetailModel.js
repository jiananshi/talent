/**
 * Created by apple on 2015/4/21.
 */
//对应新闻详情的model类
module.exports =  function(id, name ,category,imgUrl, content, time, readTimes){
    var news = {
        id : 0, //新闻的id
        name : "", //新闻的标题
        category : 1 ,//1.新闻 2.通知
        imgUrl : "", //图片路径
        content : "", //新闻内容
        time : "", //创建时间
        readTimes : 0 //阅读次数
    }
    news.id = id;
    news.name = name;
    news.category = category;
    news.imgUrl = imgUrl;
    news.content = content;
    news.time = time;
    news.readTimes = readTimes;

    return news;
}