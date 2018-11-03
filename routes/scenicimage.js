
const router=require('koa-router')()
const scenicimageDAO=require('../model/scenicimageDAO');
const scenicimageController=require('../controllers/scenicimageController');
router.prefix('/api/scenicimage')

router.get('/getScenicImage',async (ctx,next)=> {
    await scenicimageController.getScenicImage(ctx,next)

})

router.post('/AddScenicImage',async (ctx,next)=>{

    await scenicimageController.AddScenicImage(ctx,next)
})

module.exports = router