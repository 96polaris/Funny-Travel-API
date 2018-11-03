const DAO=require('../model/DAO')
class RtDetails{

    //向线路详情表中添加数据
    AddRouteDetails(routedetail){
        var sql = 'insert into routedetails(routeName,Days,placeNumber,parah,rtTitle1,rtTitle2,rtTitle3,rtTitle4,rtIntr1,rtIntr2,rtIntr3,rtIntr4,tripPlace,playTime,openTime,route_routeId) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)';
       return DAO(sql,[routedetail.routeName,routedetail.Days,routedetail.parah,routedetail.placeNumber,routedetail.rtTitle1,routedetail.rtTitle2,routedetail.rtTitle3,routedetail.rtTitle4,routedetail.rtIntr1,routedetail.rtIntr2,routedetail.rtIntr3,routedetail.rtIntr4,
            routedetail.tripPlace,routedetail.playTime,routedetail.openTime,routedetail.route_routeId])
    }

    //获取线路详情表数据
    getRouteDetails() {
        var sql = 'select * from routedetails';
        return DAO(sql, [])
    }

    getoneRouteDetails(onertdetails) {
        var sql = 'select * from routedetails where routeDetailsId=?';
        return DAO(sql, [onertdetails.routeDetailsId])
    }
}

module.exports=new RtDetails();
