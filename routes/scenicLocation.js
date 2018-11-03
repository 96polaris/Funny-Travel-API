
const router=require('koa-router')()
const ScenicLocationDAO=require('../model/scenicLocationDAO')
const ScenicLocationController=require('../controllers/ScenicLocationContreller')
router.prefix('/scenicLocation')

router.get('/getScenicLocation',async (ctx,next)=> {
    await ScenicLocationController.getScenicLocation(ctx,next)
})
router.post('/AddScenicLocation',async (ctx,next)=>{
    await ScenicLocationController.AddScenicLocation(ctx,next)
})


module.exports = router