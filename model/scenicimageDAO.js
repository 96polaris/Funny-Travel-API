const DAO=require('../model/DAO')

class Image{

    //  //向景点图片表中添加图片信息
    AddScenicImage(image) {
        var sql = 'insert into scenicimage(image1,image2,image3,image4,image5,scenicIntroduceID) VALUES(?,?,?,?,?,?)';
        return DAO(sql,[image.image1,image.image2,image.image3,image.image4,image.image5,image.scenicIntroduceID])
    }

    //获取全部图片信息
    getScenicImage(simage) {
        var sql = 'select * from scenicimage where scenicImageId=?';
        return DAO(sql, [simage.scenicImageId]);
    }
}

module.exports=new Image();


