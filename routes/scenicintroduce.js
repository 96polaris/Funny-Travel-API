
const router=require('koa-router')()
const scenicintroduceDAO=require('../model/scenicintroduceDAO')
const scenicintroduceController=require('../controllers/scenicintroduceController')
router.prefix('/scenicintroduce')

router.get('/getScenicintroduce',async (ctx,next)=> {

    try {
        let jsondata = await scenicintroduceDAO.getScenicintroduce();
        ctx.body = {"code": 200, "message": "OK", data:jsondata}

    } catch (err) {
        ctx.body = {"code": 500, "message": err.toString(), data: []}
    }
})

router.get('/getoneScenicintroduce',async (ctx,next)=>{

    await scenicintroduceController.getoneScenicintroduce(ctx,next)
})
router.post('/AddScenicintroduce',async (ctx,next)=>{

    await scenicintroduceController.AddScenicintroduce(ctx,next)
})

module.exports = router