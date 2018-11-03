const RouteDAO=require('../model/RouteDAO')
module.exports= {
    AddRoute: async (ctx, next) => {
        var route = {};
            route.routeId= ctx.request.body.routeId
            route.routeName= ctx.request.body.routeName
            route.routeIntroduction= ctx.request.body.routeIntroduction
            route.Days= ctx.request.body.Days
            route.hotRoute=ctx.request.body.hotRoute
            route.routeImage=ctx.request.body.routeImage

        try {
            await RouteDAO.AddRoute(route)
            ctx.body = {"code": 200, "message": "OK", data: []}

        } catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    },

    getoneRoute: async (ctx, next) => {
        let query=ctx.request.query;
        let rline= {};
        rline.Days = query.Days;
        try {
            let jsondata = await RouteDAO.getoneRoute(rline)
            ctx.body = {"code": 200, "message": "OK", data: jsondata}

        } catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data: []}
        }
    }
}



