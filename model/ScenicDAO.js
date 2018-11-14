const DAO=require('../model/DAO')

class SC {


    //  //向景点表中添加景点信息
    AddScenic(scenic) {

        var sql = 'insert into scenic(scenicName,tese,scenicLevel,' +
            'scenicAddress,openHours,' +
            'scenicImage,scenicLocation_scenicLocationId) VALUES(?,?,?,?,?,?,?)';

        return DAO(sql,[scenic.scenicName,scenic.tese,
                     scenic.scenicLevel,scenic.scenicAddress,scenic.openHours,
                     scenic.scenicImage,scenic.scenicLocationId])
    }

    //获取全部景点数据
    getScenic() {
        var sql = 'select * from scenic';
        return DAO(sql, []);
    }
    //获取一个景点数据
    getoneScenic(sc) {
        var sql = 'select * from scenic where scenicName=?';
        return DAO(sql, [sc.scenicName]);
    }
}

module.exports=new SC();


