
const router=require('koa-router')()
const ScenicDAO=require('../model/ScenicDAO')
const ScenicController=require('../controllers/ScenicController')
router.prefix('/scenic')

router.get('/getScenic',async (ctx,next)=> {

    try {
        let jsondata = await ScenicDAO.getScenic();
        ctx.body = {"code": 200, "message": "OK", data:jsondata}

    } catch (err) {
        ctx.body = {"code": 500, "message": err.toString(), data: []}
    }
})

router.get('/getoneScenic',async (ctx,next)=> {
    await ScenicController.getoneScenic(ctx,next)
})

router.post('/AddScenic',async (ctx,next)=>{

    await ScenicController.AddScenic(ctx,next)
})

module.exports = router