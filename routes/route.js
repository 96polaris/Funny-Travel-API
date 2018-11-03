
const router=require('koa-router')()
const RouteDAO=require('../model/RouteDAO')
const RouteController=require('../controllers/RouteConrtroller')
router.prefix('/route')

router.get('/getRoute',async (ctx,next)=> {
    try {
        let jsondata = await RouteDAO.getRoute();
        ctx.body = {"code": 200, "message": "OK", data:jsondata}

    } catch (err) {
        ctx.body = {"code": 500, "message": err.toString(), data: []}
    }
})
router.get('/getoneRoute',async (ctx,next)=>{
    await RouteController.getoneRoute(ctx,next)
})
router.post('/AddRoute',async (ctx,next)=>{
    await RouteController.AddRoute(ctx,next)
})


module.exports = router