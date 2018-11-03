
const router=require('koa-router')()
const RouteDetailsDAO=require('../model/RouteDetailsDAO')
const RouteDetailsController=require('../controllers/RouteDetailsController')
router.prefix('/routedetails')
router.get('/getRouteDetails',async (ctx,next)=> {

    try {
        let jsondata = await RouteDetailsDAO.getRouteDetails();
        ctx.body = {"code": 200, "message": "OK", data:jsondata}

    } catch (err) {
        ctx.body = {"code": 500, "message": err.toString(), data: []}
    }
})

router.get('/getoneRouteDetails',async (ctx,next)=>{
    await RouteDetailsController. getoneRouteDetails(ctx,next)
})
router.post('/AddRouteDetails',async (ctx,next)=>{
    await RouteDetailsController. AddRouteDetails(ctx,next)
})


module.exports = router