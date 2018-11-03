const scenicimageDAO=require('../model/scenicimageDAO')
module.exports= {
    AddScenicImage:async (ctx, next) => {
        let image={};
            image.image1= ctx.request.body.image1
            image.image2= ctx.request.body.image2
            image.image3= ctx.request.body.image3
            image.image4= ctx.request.body.image4
            image.image5= ctx.request.body.image5
            image.scenicIntroduceID= ctx.request.body.scenicIntroduceID

        try {
            await  scenicimageDAO.AddScenicImage(image)
            ctx.body = {"code": 200, "message": "OK", data:[]}

        } catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },
    getScenicImage:async (ctx, next) => {
        let simage={};
        simage.scenicImageId=ctx.request.body.scenicImageId;
        try {
            let jsondata = await  scenicimageDAO.getScenicImage(simage)
            ctx.body = {"code": 200, "message": "OK", data: jsondata}

        } catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    }
}
