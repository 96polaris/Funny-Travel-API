const DAO=require('../model/DAO')

class Introduces {


    //  //向景点介绍表中添加景点信息
    AddScenicintroduce(introduce) {

        var sql = 'insert into scenicintroduce(scenicTitle,scenicImages,scenicParagraph,scenicName,scenicLevel,scenicAddress,openHours,scenic_scenicId,image1,image2,image3,p1,p2,p3) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)';

        return DAO(sql, [introduce.scenicTitle, introduce.scenicImages, introduce.scenicParagraph, introduce.scenicName, introduce.scenicLevel, introduce.scenicAddress, introduce.openHours,
            introduce.scenic_scenicId,introduce.image1,introduce.image2,introduce.image3,introduce.p1,introduce.p2,introduce.p3])
    }

    //获取全部景点介绍的数据
    getScenicintroduce() {
        var sql = 'select * from scenicintroduce ';
        return DAO(sql, []);
    }

    getoneScenicintroduce(sintroduce) {
        var sql = 'select * from scenicintroduce where scenicIntroduceID=? ';
        return DAO(sql, [sintroduce.scenicIntroduceID]);
    }
}
module.exports=new Introduces();


