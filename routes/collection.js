const router = require('koa-router')()
// const collectionDAO= require('../model/CollectionDAO')
const CollectionController = require('../controllers/CollectionController')
router.prefix('/collection')
//添加景点收藏
router.post('/addScenic',async (ctx,next)=>{
    await CollectionController. addScenic(ctx,next)
})
//添加景点收藏
router.post('/addRoute',async (ctx,next)=>{
    await CollectionController.addRoute(ctx,next)
})


//显示收藏景点
router.post('/ShowScenicColl',async (ctx,next)=>{
    await CollectionController.showCollScenic(ctx,next)
})


//显示收藏线路
router.post('/ShowRouteColl',async (ctx,next)=>{
    await CollectionController.showCollRoute(ctx,next)
})

//删除收藏
router.get('/delscenic/:scenicId/:userId',async (ctx,next)=>{
    await CollectionController.deleteScenic(ctx,next)
})
router.get('/delroute/:routeId/:userId',async (ctx,next)=>{
    await CollectionController.deleteRoute(ctx,next)
})
router.post('/showCollect',async(ctx,next)=>{
    await userCtroller.showScenic(ctx,next)
})

module.exports = router