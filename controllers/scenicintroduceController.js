const scenicintroduceDAO=require('../model/scenicintroduceDAO')
module.exports= {

    AddScenicintroduce: async (ctx, next) => {

        var introduce = {}

            introduce.scenicTitle=ctx.request.body.scenicTitle
            introduce.scenicImages=ctx.request.body.scenicImages
            introduce.scenicParagraph=ctx.request.body.scenicParagraph
            introduce.scenicName=ctx.request.body.scenicName
            introduce.scenicLevel=ctx.request.body.scenicLevel
            introduce.scenicAddress=ctx.request.body.scenicAddress
            introduce.openHours=ctx.request.body.openHours
            introduce.scenic_scenicId=ctx.request.body.scenic_scenicId
            introduce.image1=ctx.request.body.image1
        introduce.image2=ctx.request.body.image2
        introduce.image3=ctx.request.body.image3
        introduce.p1=ctx.request.body.p1
        introduce.p2=ctx.request.body.p2
        introduce.p3=ctx.request.body.p3

        try {
            await  scenicintroduceDAO. AddScenicintroduce(introduce)
            ctx.body = {"code": 200, "message": "OK", data: []}

        } catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },

    getoneScenicintroduce: async (ctx, next) => {
        let query=ctx.request.query;
        let sintroduce = {};
        sintroduce.scenicIntroduceID = query.scenicIntroduceID;
        try{
            let jsondata = await  scenicintroduceDAO.getoneScenicintroduce(sintroduce)
            ctx.body={"code":200,"message":"OK",data:jsondata}

        }catch(err){
            ctx.body={"code":500,"message":err.toString(),data:0}
        }

    }
}
