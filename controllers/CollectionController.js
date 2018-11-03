var CollectionDAO = require('../model/CollectionDAO')

module.exports = {
    // 增加景点收藏   收集数据
    addScenic: async (ctx, next) => {
        let query = ctx.request.body
        let collection = {};
        collection.scenic_scenicId = query.scenic_scenicId  //景点
        collection.user_userId = query.user_userId
        try {
            await CollectionDAO.addScenic(collection)
            ctx.body = {"code": 200, "message": "收藏添加成功", data:1}

        } catch (err) {
            ctx.body = {"code": 500, "message": "服务器错误" + err.message, data:0}
        }
    },

    //添加线路收藏
    addRoute: async (ctx, next) => {
        let query = ctx.request.body
        let collection = {};

        collection.route_routeId = query.route_routeId     //路线
        collection.user_userId = query.user_userId
        try {
            await CollectionDAO.addRoute(collection)
            ctx.body = {"code": 200, "message": "收藏添加成功", data:1}

        } catch (err) {
            ctx.body = {"code": 500, "message": "服务器错误" + err.message, data:0}
        }
    },




    //显示收藏景点
    showCollScenic:async(ctx)=>{
        let query=ctx.request.body;
        try{
            let jsondata=await CollectionDAO.showCollScenic(query.userId);
            ctx.body={"code":200,"message":"OK",data:jsondata[0]}

        }catch(err){
            ctx.body={"code":500,"message":err.toString(),data:0}
        }
    },


    //显示收藏线路
    showCollRoute:async(ctx)=>{
        let query=ctx.request.body;

        try{
            let jsondata=await CollectionDAO.showCollRoute(query.userId);
            ctx.body={"code":200,"message":"OK",data:jsondata[0]}

        }catch(err){
            ctx.body={"code":500,"message":err.toString(),data:0}
        }
    },

    //删除收藏的景点路线
    deleteScenic: async (ctx) => {
        let query=ctx.params;
        console.log(query);
        let user={}
        user.scenicid=query.scenicId
        user.userid=query.userId
        console.log(user);
        let jsondata = await CollectionDAO.deleteScenic(user);
        console.log(jsondata);
        ctx.set('content-type', 'application/json');
        try {
            ctx.body = {code: 200, message: '收藏成功删除', data: jsondata}
        }
        catch (err) {
            ctx.body = {"code": 500, "message": "服务器错误" + err.message, data: []}
        }
    },

    deleteRoute: async (ctx) => {
        let query=ctx.params;
        console.log(query);
        let user={}
        user.routeid=query.routeId
        user.userid=query.userId
        console.log(user);
        let jsondata = await CollectionDAO.deleteRoute(user);
        ctx.set('content-type', 'application/json');
        try {
            ctx.body = {code: 200, message: '收藏成功删除', data: jsondata}
        }
        catch (err) {
            ctx.body = {"code": 500, "message": "服务器错误" + err.message, data: []}
        }
    }
}
