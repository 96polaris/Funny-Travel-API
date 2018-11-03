var Travel = require('../model/TravelNoteDAO')
//加载bodyparser模块，用于转换post传参的格式
const bodyparser = require('koa-bodyparser')
var mysql = require('mysql')
const path = require('path');
const fs = require('fs');
const formidable = require("formidable");
var mysql = require('mysql')



module.exports = {

    gettuijian: async (ctx, next) => {
        try {
            let jsondata = await Travel.gettuijian(ctx.params.hotNote)
            ctx.set('content-type', 'application/json')
            ctx.body = {"code": 200, "message": "0", data: jsondata}
        }
        catch (err) {
            ctx.body = {"code": 500, "message": "服务器错误" + err.message, data: []}
        }
    },

    //热门
    getremen: async (ctx, next) => {
        try {
            let jsondata = await Travel.getrenmen(ctx.params.hotNote)
            ctx.set('content-type', 'application/json')
            ctx.body = {"code": 200, "message": "0", data: jsondata}
        }
        catch (err) {
            ctx.body = {"code": 500, "message": "服务器错误" + err.message, data: []}
        }
    },
    //最新
    getzuixin: async (ctx, next) => {
        try {
            let jsondata = await Travel.getzuixin(ctx.params.hotNote)
            ctx.set('content-type', 'application/json')
            ctx.body = {"code": 200, "message": "0", data: jsondata}
        }
        catch (err) {
            ctx.body = {"code": 500, "message": "服务器错误" + err.message, data: []}
        }
    },
    //个人
    getzjyouji: async (ctx, next) => {
        try {
            let jsondata = await Travel.getzjyouji(ctx.params.userId)
            ctx.set('content-type', 'application/json')
            ctx.body = {"code": 200, "message": "0", data: jsondata}
        }
        catch (err) {
            ctx.body = {"code": 500, "message": "服务器错误" + err.message, data: []}
        }
    },
    //删除游记
    deletetravelnote: async (ctx) => {
        try {
            // let jsondata1 = await Travel.deletetravelnoteid(ctx.params.sc);
            let jsondata2 = await Travel.deletetravelnote(ctx.params.sc);
            ctx.set('content-type', 'application/json');
            ctx.body = {code: 200, message: '删除游记成功', data: jsondata2}
        } catch (err) {
            ctx.body = {"code": 500, "message": "服务器错误" + err.message, data: []}
        }
    },
//显示单个游记详情
    getonetravelnote: async (ctx, next) => {
        try {
            let jsondata = await Travel.getonetravelnote(ctx.params.travelNoteId)
            ctx.set('content-type', 'application/json')
            ctx.body = {"code": 200, "message": "已显示单个游记的具体内容", data: [jsondata]}
        }
        catch (err) {
            ctx.body = {"code": 500, "message": "服务器错误" + err.message, data: []}
        }
    },
    //显示单个游记评论
    getonetravelnotepl: async (ctx, next) => {
        try {
            let jsondata = await Travel.getonetravelnotepl(ctx.params.travelNoteId)
            ctx.set('content-type', 'application/json')
            ctx.body = {"code": 200, "message": "已显示单个游记的具体内容", data: [jsondata]}
        }
        catch (err) {
            ctx.body = {"code": 500, "message": "服务器错误" + err.message, data: []}
        }
    },



//添加游记的评论
    addtravelnotecomment: async (ctx, next) => {
        let query = ctx.request.body
        let travelnotecomment = {};
        travelnotecomment.comment = query.comment
        travelnotecomment.user_userId = query.user_userId
        travelnotecomment.travelNote_travelNoteId = query.travelNote_travelNoteId
        try {
            await Travel.addtravelnotecomment(travelnotecomment)
            ctx.body = {"code": 200, "message": "评论成功", data: []}
        } catch (err) {
            ctx.body = {"code": 500, "message": "服务器错误" + err.message, data: []}
        }
    },

//点赞
    dz: async (ctx) => {
        try {
            let jsondata = await Travel.dz(ctx.params.dj);
            ctx.set('content-type', 'application/json');
            ctx.body = {code: 200, message: '点赞成功', data: jsondata}
        } catch (err) {
            ctx.body = {"code": 500, "message": "服务器错误" + err.message, data: []}
        }
    },

//取消点赞
    qxdianzan: async (ctx) => {
        try {
            let jsondata = await Travel.qxdianzan(ctx.params.qx);
            ctx.set('content-type', 'application/json');
            ctx.body = {code: 200, message: '取消成功', data: jsondata}
        } catch (err) {
            ctx.body = {"code": 500, "message": "服务器错误" + err.message, data: []}
        }
    },
    //添加游记
    addtravelnote: async (ctx, next) => {
        var form = new formidable.IncomingForm();
        form.uploadDir = '../public/uploadfile'    //设置文件存放路径  //
        form.multiples = true;  //设置上传多文件
        form.parse(ctx.req, function (err, fields, files) {
            console.log(files)
            //根据files.filename.name获取上传文件名，执行后续写入数据库的操作
            console.log(fields)

            if (files.travelNoteImage) {
                // 获取传入的路径与名字
                let src = files.travelNoteImage.path;
              let fileName = files.travelNoteImage.name;
                // 获取源文件全路径
                let srcNew = path.join(__dirname, files.travelNoteImage.path);
                // 改成你想要的名字
                let destName = `${path.basename(fileName, path.extname(fileName))}${path.extname(fileName)}`;
                let name = path.join(path.parse(srcNew).dir, destName);
                fs.renameSync(srcNew, path.join(path.parse(srcNew).dir, destName));
                let stt = `http://localhost:3000/uploadfile/${destName}`;
//chen
                let travelnote = {};
                travelnote.travelTitle = fields.travelTitle
                travelnote.travelNoteContent = fields.travelNoteContent
                travelnote.userId = fields.userId
                travelnote.fbtime = fields.fbtime.replace('-','');
                travelnote.travelNoteImage=stt;
                Travel.addtravelnote(travelnote)
            }
            //根据fileds.mydata获取上传表单元素的数据，执行写入数据库的操作
            if (err) {
                ctx.body = '上传失败'
            }
        })
    },




}