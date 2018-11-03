const ScenicLocationDAO=require('../model/scenicLocationDAO')
module.exports={
    AddScenicLocation:async(ctx,next)=>{
        var location = {}
            location.locationName=ctx.request.body.locationName

        try{
            await  ScenicLocationDAO.AddScenicLocation(location)
            ctx.body={"code":200,"message":"OK",data:1}

        }catch(err){
            ctx.body={"code":500,"message":err.toString(),data:0}
        }
    },
    getScenicLocation:async(ctx,next)=>{
        let query=ctx.request.query;
        var scenicL={};
        scenicL.scenicLocation_scenicLocationId=query.scenicLocation_scenicLocationId;
        try{

            let jsondata = await  ScenicLocationDAO.getScenicLocation(scenicL)
            ctx.body={"code":200,"message":"OK",data:jsondata}

        }catch(err){
            ctx.body={"code":500,"message":err.toString(),data:[]}
        }
    }
}
