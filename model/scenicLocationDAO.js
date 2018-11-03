const DAO=require('../model/DAO')
class Area {


//向地区表中添加地区信息
    AddScenicLocation(location) {

        var sql = 'insert into sceniclocation(locationName) VALUES(?)';
        return DAO(sql, [ location.locationName])
    }

    //获取景点地区数据
    getScenicLocation(scenicL) {
        var sql = 'select * from scenic right join scenicLocation on  scenic.scenicLocation_scenicLocationId=scenicLocation.scenicLocationId WHERE scenicLocation_scenicLocationId=?';
        return DAO(sql, [scenicL.scenicLocation_scenicLocationId])
    }

}

module.exports=new Area();

