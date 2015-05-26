# talent
talent App
app
=======

引入了处理JS异步回调的插件co，所以需要做些额外的动作来支持它。

1.要求node.js 版本必须0.11以上，并且在运行是添加--harmony参数启用新的ES6特性，

    如：supervisor --harmony ./bin/www

2.webstorm 要求

进入配置项：Preferences -> Languages & Frameworks -> JavaScript, 选择 ECMAScript 6 作为 JavaScript version.

为了方便开发和发布，引入配置文件config.js

1.第一次运行程序需要在根目录创建一个 config.js

写入要连接数据库的信息内容如下：

    exports.sql = {
        host: 'localhost',
        user: 'root',
        password: '12345',
        database: 'talent',
        port: 3306
    };
    
注：config.js 已经加入gitignore 所以不会上传，每个人开发也不会相互影响。

enjoy!!!
