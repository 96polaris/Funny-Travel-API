//管理员数据访问对象
const DAO=require('../model/DAO');

class DB{
    //管理员登录，身份验证
    checkManage(manage){
        var sql='select managePwd from manage where manageName=?'
        return DAO(sql,[manage.name])
    }
//状态为0表示未通过，1表示通过
    //管理员审核活动
        manageCheckActAgree(act){
        var sql='update activity set manageCheck=1 where activityId=?'
            return DAO(sql,[act.activityId])
    }
    manageCheckActRefuse(act){
        var sql='update activity set manageCheck=0 where activityId=?'
        return DAO(sql,[act.activityId])
    }

    //管理员设置热门景点，线路,游记等，1为热门
    manageSetScenic(scenic){
        var sql='update scenic set hotScenic=1 where scenicId=?'
        return DAO(sql,[scenic.scenicid])
    }

    manageSetRoute(route){
        var sql='update route set hotRoute=1 where routeId=?'
        return DAO(sql,[route.routeid])
    }

    manageSetNote(note){
        var sql='update travelnote set hotNote=1 where travelNoteId=?'
        return DAO(sql,[note.noteid])
    }


    //管理员页面显示景点，游记，线路
    manageShowScenic(){
        var sql='select scenicId,scenicName from scenic where hotScenic=0'
        return DAO(sql,[])
    }

    manageShowRoute(){
        var sql='select routeId,routeName from route where  route.hotRoute=0'
        return DAO(sql,[])
    }

    manageShowNote(){
        var sql='select travelNoteId,travelTitle,travelNoteContent from travelNote where hotNote=0'
        return DAO(sql,[])
    }

    //2.管理员页面显示所有景点，游记，线路
    // manageShowAll(){
    //     var sql='select scenicId,scenicName,' +
    //         'RouteId,RouteName,travelNoteId,' +
    //         'travelTitle,travelNoteContent ' +
    //         'from scenic,route,routedetails,travelNote ' +
    //         'where route_routeId=routeId'
    //     return DAO(sql,[])
    // }


// 显示热门景点，线路，游记等

    showHotScenic(){
        var sql='select scenicLevel,scenicId,scenicName,scenicImage,scenicIntroduce from scenic where hotScenic=1'
        return DAO(sql,[])
    }

    showHotRoute(){
        var sql='select routeId,route.routeName,routeImage,route.routeIntroduction from route,routedetails where route_routeId=routeId and hotRoute=1'
        return DAO(sql,[])
    }

    showHotNote(){
        var sql='select fbtime,travelNoteId,travelTitle,travelNoteImage,travelNoteContent from travelnote where hotNote=1'
        return DAO(sql,[])
    }


    //显示所有待审核活动（2），管理员进行审核
    manageShowAct(){
        var sql='select * from activity where manageCheck=2'
        return DAO(sql,[])
}
    // 2.显示所有热门-可以在首页使用数据
//     manageShowHotAll(){
//         var sql='select scenicName,scenicImage,scenicIntroduce,routeName,routeImage,routeIntroduction,travelTitle,travelNoteImage,travelNoteContent from scenic,route,routedetails,travelnote where hotScenic=1 or route_routeId=routeId and hotRoute=1 or hotNote=1'
//         return DAO(sql,[])
// }




}

module.exports =new DB();