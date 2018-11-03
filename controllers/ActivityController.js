const ActivityDAO = require('../model/ActivityDAO')
const formidable =require ('formidable')
const path =require('path')
const fs=require('fs')
module.exports = {
    //获取全部活动
    getAllActivity: async (ctx, next) => {
        try {
            let data=await ActivityDAO.getAllActivity();
            console.log(data);
            ctx.body = {"code": 200, "message": "OK", data: data}
        } catch (err) {
            console.log('get失败'+err.message)
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },
    //获取某一个活动详情
    getOneActivity:async (ctx,next)=>{
            try{
                let jsondata = await ActivityDAO.getOneActivity(ctx.params.activityId);
                console.log(jsondata);
                ctx.body = {"code": 200, "message": "OK", data: jsondata}
            }
            catch (err) {
                console.log('获取详情失败'+err.message)
            }
    },

    // //发布活动
    addActivity: async (ctx, next) => {

        var form = new formidable.IncomingForm();
        form.uploadDir = '../public/Actuploadfile'    //设置文件存放路径  //
        form.multiples = true;  //设置上传多文件
        form.parse(ctx.req, function (err, fields, files) {
            console.log(files)
            //根据files.filename.name获取上传文件名，执行后续写入数据库的操作
            console.log(fields)

            if (files.actImg) {
                // 获取传入的路径与名字
                let src = files.actImg.path;
                let fileName = files.actImg.name;
                // 获取源文件全路径
                let srcNew = path.join(__dirname, files.actImg.path);
                // 改成你想要的名字
                let destName = `${path.basename(fileName, path.extname(fileName))}${path.extname(fileName)}`;
                let stt = `http://localhost:3000/Actuploadfile/${destName}`;
                let name = path.join(path.parse(srcNew).dir, destName);
                fs.renameSync(srcNew, path.join(path.parse(srcNew).dir, destName));
                let act = {};
                    act.activityTitle=fields.activityTitle,
                    act.activityDays=fields.activityDays,
                    act.beginTime=fields.beginTime,
                    act.endTime=fields.endTime,
                    act.personNum=fields.personNum,
                    act.money=fields.money,
                    act.telNum=fields.telNum,
                    act.activityIntroduce=fields.activityIntroduce,
                    act.user_userId=fields.user_userId
                    act.actImg=stt
                ActivityDAO.addActivity(act)
            }
            //根据fileds.mydata获取上传表单元素的数据，执行写入数据库的操作
            if (err) {
                ctx.body = '上传失败'
            }
        })
    },

    //修改活动信息(修改图片)
    updateActivity: async (ctx, next) => {
        console.log(456);
        var form = new formidable.IncomingForm();
        form.uploadDir = '../public/Actuploadfile'    //设置文件存放路径  //
        form.multiples = true;  //设置上传多文件
        form.keepExtensions=true;//保留文件扩展名
        form.parse(ctx.req,async function (err, fields, files) {
            console.log(fields);
            console.log('333');
            console.log(typeof fields.actImg)
            // 1，只修改了文字
            if (fields.actImg == 'undefined' ) {
                console.log(fields);
                console.log(files);
                console.log(222);

                let act = {};
                act.activiyId=fields.activityId,
                    act.activityTitle=fields.activityTitle,
                    act.activityDays=fields.activityDays,
                    act.beginTime=fields.beginTime,
                    act.endTime=fields.endTime,
                    act.personNum=fields.personNum,
                    act.money=fields.money,
                    act.telNum=fields.telNum,
                    act.activityIntroduce=fields.activityIntroduce
                try {
                    console.log(222);
                    let str=await ActivityDAO.updateActivity(act);
                    // console.log(str)
                    ctx.body = {"code": 200, "message": "ok", data: str};
                } catch (e) {
                    ctx.body = {"code": 500, "message": "err" + e.message, data: []};
                }
            }
            //2 ,图片文字都被修改
            if (fields.actImg != 'undefined ' ) {
                // 获取传入的路径与名字
                console.log('111');
                let src = files.actImg.path;
                let fileName = files.actImg.name;
                console.log("fileName"+fileName)
                // 获取源文件全路径
                let srcNew = path.join(__dirname, files.actImg.path);
                // 改成你想要的名字
                let destName = `${path.basename(fileName, path.extname(fileName))}${path.extname(fileName)}`;
                let stt = `http://localhost:3000/Actuploadfile/${destName}`;
                let name = path.join(path.parse(srcNew).dir, destName);
                fs.renameSync(srcNew, path.join(path.parse(srcNew).dir, destName));
                let act = {};
                act.activiyId=fields.activityId,
                    act.activityTitle=fields.activityTitle,
                    act.activityDays=fields.activityDays,
                    act.beginTime=fields.beginTime,
                    act.endTime=fields.endTime,
                    act.personNum=fields.personNum,
                    act.money=fields.money,
                    act.telNum=fields.telNum,
                    act.activityIntroduce=fields.activityIntroduce,
                    act.actImg=stt
                console.log(stt);
                console.log("全部数据："+ act.endTime)
                console.log(act);
                try {
                    console.log(111);
                   let str=await ActivityDAO.updateActivity1(act);
                    // console.log(str)
                    ctx.body = {"code": 200, "message": "ok", data: str};

                    console.log('data:' + data);
                } catch (e) {
                    ctx.body = {"code": 500, "message": "err" + e.message, data: []};
                }
            }


        })
    },

    //用户发布的活动信息showUserProvideAct
    showUserProvideAct:async(ctx,next)=>{
        let query=ctx.request.body;
        try {
            let jsondata = await ActivityDAO.showUserProvideAct(query.userId)
            ctx.body = {"code": 200, "message": "OK", data: jsondata}
            console.log(jsondata);

        }
        catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: 0}
        }
    },


    //用户参加活动
    userJoinAct: async (ctx, next) => {
        let query = ctx.request.body
        let user={}
        // user.joinActivityId=query.joinActivityId
        user.provideId=query.provideId
        user.user_userId=query.user_userId
        user.activity_activityId=query.activity_activityId
        console.log(typeof user.provideId);
        try {
            let data=await ActivityDAO.userJoinAct(user);
            console.log(data)
            ctx.body = {"code": 200, "message": "OK", data: []}
        } catch (err) {
            console.log('join失败')
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },
    //用户退出
    userExit: async (ctx, next) => {
        try{
            let userId=ctx.params.userId;
            let activityId=ctx.params.activityId;
            let act={
                userId:userId,
                activityId:activityId
            }
            let jsondata= await ActivityDAO.userExit(act)
            console.log('退出信息'+jsondata)
            // console.log(Json)
            ctx.body ={"code": 200, "message": "OK", data:jsondata}
        }
        catch (err) {
            ctx.body ={"code": 500, "message": err.message, data:[]}
        }
    },
    //活动结束，评论
    end: async (ctx, next) => {
        let query = ctx.request.body
        let comment={}
        comment.activityTime=query.activityTime
        comment.activityCommentContent=query.activityCommentContent
        comment.userid=query.userId
        comment.activity_activityId=query.activity_activityId
        comment.userName=query.userName
        try {
            let data=await ActivityDAO.end(comment);
            console.log(data)
            ctx.body = {"code": 200, "message": "OK", data: data}
        } catch (err) {
            console.log('发表失败'+err.message)
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },
    //获取某个活动的全部评论
    getAllComment: async (ctx, next) => {
        try {
            let data=await ActivityDAO.getAllComment(ctx.params.activity_activityId);
            console.log('--------------------------');
            console.log(data)
            ctx.body = {"code": 200, "message": "OK", data: data}
        } catch (err) {
            console.log('get失败'+err.message)
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },
    //获取某一个评论详情
    getOneComment: async (ctx, next) => {
        try{
            let jsondata = await ActivityDAO.getOneComment(ctx.params.activityCommentId);
            // console.log(jsondata)
            console.log('评论ID'+ctx.params.activityCommentId);
            ctx.body = {"code": 200, "message": "OK", data: jsondata}
        }
        catch (err) {
            console.log('获取详情失败'+err.message)
        }
    },

    //删除某一个评论
    delOneComment: async (ctx, next) => {
        try{
            let commentJson= await ActivityDAO.delOneComment(ctx.params.activityCommentId)
            console.log('删除信息 '+commentJson)
            ctx.body = {"code": 200, "message": "OK", data: commentJson}
        }
        catch (err) {
            console.log('获取详情失败'+err.message)
        }
    },

    //显示用户参加的活动
    showUserJohnAct:async(ctx,next)=>{
        let query=ctx.request.body;
        try {
            let jsondata = await ActivityDAO.showUserJohnAct(query.userId)
            ctx.body = {"code": 200, "message": "OK", data: jsondata}
            console.log(jsondata);

        }
        catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: 0}
        }
    },

    //获取某一个用户详情
    getOneUser: async (ctx, next) => {
        try{
            let jsondata = await ActivityDAO.getOneUser(ctx.params.userId);
            // console.log(jsondata)
            console.log('用户ID'+ctx.params.userId);
            ctx.body = {"code": 200, "message": "OK", data: jsondata}
        }
        catch (err) {
            console.log('获取详情失败'+err.message)
        }
    },

    //搜索查询功能
    getData: async (ctx, next) => {
        try{
            let keyword=ctx.params.keyword;
            let jsondata = await ActivityDAO.getData(keyword);
            console.log(jsondata)
            console.log('输入的内容：'+ctx.params.keyword);
            ctx.body = {"code": 200, "message": "OK", data: jsondata}
        }
        catch (err) {
            console.log('获取详情失败'+err.message)
        }
    },

    // 查看用户加入活动的情况
    getJoinDetails:async (ctx,next)=>{
    try {
        let data = await ActivityDAO.getJoinDetails(ctx.params.id);
               console.log(data)
        console.log('用户ID' + ctx.params.id);
        ctx.body = {"code": 200, "message": "OK", data: data}

    }
    catch (err) {
        console.log('获取详情失败' + err.message)
      }
    },

        //评论点赞
    clickZan: async (ctx, next) => {
        try{
            let id=ctx.params.id;
            let jsondata = await ActivityDAO.clickZan(id);
            console.log(jsondata)
            console.log('输入的内容：'+ctx.params.id);
            ctx.body = {"code": 200, "message": "OK", data: jsondata}
        }
        catch (err) {
            console.log('获取详情失败'+err.message)
        }
    },

    // 取消点赞
    cancelZan: async (ctx, next) => {
        try{
            let id=ctx.params.id;
            let jsondata = await ActivityDAO.cancelZan(id);
            console.log(jsondata)
            console.log('输入的内容：'+ctx.params.id);
            ctx.body = {"code": 200, "message": "OK", data: jsondata}
        }
        catch (err) {
            console.log('获取详情失败'+err.message)
        }
    },




    //回复评论
    reply:async (ctx, next) => {
        let query = ctx.request.body
        let rep={}
        rep.replyTime=query.replyTime
        rep.replyContent=query.replyContent
        rep.userId=query.userId
        rep.actCommentId=query.actCommentId
        try {
            let data=await ActivityDAO.reply(rep);
            console.log(data)
            ctx.body = {"code": 200, "message": "OK", data: []}
        } catch (err) {
            console.log('发表失败'+err.message)
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },
    // 显示回复评论
    showReply: async (ctx, next) => {
        try {
            let data=await ActivityDAO.showReply(ctx.params.id);
            console.log('--------------------------');
            console.log(data)
            ctx.body = {"code": 200, "message": "OK", data: data}
        } catch (err) {
            console.log('get失败'+err.message)
            ctx.body = {"code": 500, "message": err.toString(), data: data}
        }
    },
}