var Notice = require('../model/NoticeDAO')

module.exports = {
    //显示全部公告
    getNotice: async (ctx, next) => {
        try {
            console.log('ok');
            let jsondata = await Notice.getNotice()
            console.log(jsondata)
            ctx.set('content-type', 'application/json')
            // ctx.body = {data:jsondata};
            ctx.body = {"code": 200, "message": "ok", data: jsondata}
        }
        catch (e) {
            console.log('error' + e.message)
        }
    },


    //添加公告
    addNotice: async (ctx, next) => {
        //实现跨域允许
        //ctx.set("Access-Control-Allow-Origin", "*")
        let query = ctx.request.body
        let notice = {};
        notice.publicTitle = query.publicTitle
        notice.publicContent = query.publicContent

        try {
            await Notice.addNotice(notice)
            ctx.body = {"code": 200, "message": "添加公告成功", data: []}
        } catch (err) {
            ctx.body = {"code": 500, "message": "服务器错误" + err.message, data: []}
        }
    },
    //删除公告
    deleteNotice: async (ctx) => {
        ctx.set('Access-Control-Allow-Origin', '*');
        let jsondata = await Notice.deleteNotice(ctx.query.publicId);
        ctx.set('content-type', 'application/json');
        ctx.body = {code: 200, message: '公告删除成功', data: jsondata}

    }
}




