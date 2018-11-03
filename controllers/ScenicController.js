const ScenicDAO=require('../model/ScenicDAO')
module.exports= {

    AddScenic: async (ctx, next) => {

        let scenic = {}
        scenic.scenicName = ctx.request.body.scenicName;
        scenic.fromArea = ctx.request.body.fromArea;
        scenic.timeArrange = ctx.request.body.timeArrange;
        scenic.scenicLevel = ctx.request.body.scenicLevel;
        scenic.hotScenic = ctx.request.body.hotScenic
        scenic.scenicAddress = ctx.request.body.scenicAddress;
        scenic.openHours = ctx.request.body.openHours
        scenic.scenicImage = ctx.request.body.scenicImage
        scenic.scenicIntroduce = ctx.request.body.scenicIntroduce
        scenic.scenicLocationId = ctx.request.body.scenicLocationId

        try {
            await  ScenicDAO.AddScenic(scenic)
            ctx.body = {"code": 200, "message": "OK", data: []}

        } catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },
    getoneScenic: async (ctx, next) => {
        let query=ctx.request.query;
        let sc = {};
        sc.scenicName = query.scenicName;
        try{
            let jsondata = await  ScenicDAO.getoneScenic(sc)
            ctx.body={"code":200,"message":"OK",data:jsondata}

        }catch(err){
            ctx.body={"code":500,"message":err.toString(),data:0}
        }

    }
}
