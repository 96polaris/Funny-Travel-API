//收藏记录数据访问对象
const DAO=require('../model/DAO');
class DB{
   //添加一个用户收藏线路，向收藏表中添加记录
    addRoute(collection){
        return DAO('insert into collection(route_routeId,user_userId) values(?,?)',
            [collection.route_routeId,collection.user_userId])
    }
    //添加一个用户收藏景点，向收藏表中添加记录/
    addScenic(collection){
        return DAO('insert into collection(scenic_scenicId,user_userId) values(?,?)',
            [collection.scenic_scenicId,collection.user_userId])
    }
    //显示收藏景点
    showCollScenic(user_userId){
        return DAO('call showCollScenic(?)',[user_userId])
        // return DAO('select scenicimage,scenicName,scenicintroduce from scenic where scenicId in (SELECT scenic_scenicId FROM collection where user_userId=?) ',
        //     [user_userId])
    }
//显示收藏线路
    showCollRoute(user_userId){
        return DAO('call showCollRoute(?)',[user_userId])
        // return DAO('select routeimage,routeName,routeIntroduction from route where routeId in (SELECT route_routeId FROM collection where user_userId=?)',
        //     [user_userId])
    }


   //删除用户的收藏表中的数据
    deleteScenic(user){
        console.log(123);
        return DAO('update collection set  scenic_scenicId=null where  scenic_scenicId=? and user_userId=?',[user.scenicid,user.userid])
    }
    deleteRoute(user){
        return DAO('update collection set  route_routeId=null where  route_routeId=? and user_userId=?',[user.routeid,user.userid])
    }

}
module.exports = new DB();