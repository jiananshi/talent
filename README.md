# talent
talent App

整体架构和[node-serve](https://github.com/ggice/node-server)相同，不同的是将数据库由mongodb更换成了mysql。

1.踢出了mongodb相关的依赖

2.引入mysql依赖 [node-mysql](https://www.npmjs.com/package/mysql)
有关node.js 使用mysql的一篇技术[文章](http://blog.fens.me/nodejs-mysql-intro/)

3.具体实现产考test.js中的示例代码，示例代码的sql文件在data目录中。