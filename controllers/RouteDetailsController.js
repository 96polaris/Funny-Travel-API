const RouteDetailsDAO=require('../model/RouteDetailsDAO')
module.exports= {
    AddRouteDetails: async (ctx, next) => {
        let routedetail = {};

            routedetail.routeName=ctx.request.body.routeName;
            routedetail.Days=ctx.request.body.Days;
            routedetail.placeNumber=ctx.request.body.placeNumber;
            routedetail.rtIntr1=ctx.request.body.rtIntr1;
            routedetail.rtIntr2=ctx.request.body.rtIntr2;
            routedetail.rtIntr3=ctx.request.body.rtIntr3;
            routedetail.rtIntr4=ctx.request.body.rtIntr4;
            routedetail.rtTilte1=ctx.request.body.rtTilte1;
            routedetail.rtTilte2=ctx.request.body.rtTilte2;
            routedetail.rtTilte3=ctx.request.body.rtTilte3;
            routedetail.rtTilte4=ctx.request.body.rtTilte4;
            routedetail.parah=ctx.request.body.parah;
            routedetail.tripPlace =ctx.request.body.tripPlace;
            routedetail.playTime=ctx.request.body.playTime;
            routedetail.openTime =ctx.request.body.openTime;
            routedetail.route_routeId =ctx.request.body.route_routeId;

        try {
            await  RouteDetailsDAO.AddRouteDetails(routedetail);
            ctx.body = {"code": 200, "message": "OK", data: []}

        } catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },

    getoneRouteDetails: async (ctx, next) => {
        let query=ctx.request.query;
        let onertdetails = {};
        onertdetails.routeDetailsId = query.routeDetailsId;
        try{
            let jsondata = await  RouteDetailsDAO.getoneRouteDetails(onertdetails)
            ctx.body={"code":200,"message":"OK",data:jsondata}

        }catch(err){
            ctx.body={"code":500,"message":err.toString(),data:0}
        }

    }
}
