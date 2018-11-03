const router = require('koa-router')()
const ActivityDAO=require('../model/ActivityDAO')
const ActivityController = require('../controllers/ActivityController')

router.prefix('/activity')
//获取全部活动
router.get('/', async (ctx, next) => {
    await ActivityController.getAllActivity(ctx,next)
})
//获取某个活动详情
router.get('/details/:activityId', async (ctx, next) => {
    await ActivityController.getOneActivity(ctx,next)
})
//发布活动
router.post('/addActivity', async (ctx, next) => {
    console.log('123456789')
    await ActivityController.addActivity(ctx,next)
})

//修改活动信息
router.post('/updateAct', async (ctx, next) => {
    console.log('---123');
    await ActivityController.updateActivity(ctx,next)
})
//加入活动
router.post('/joinActivity', async (ctx, next) => {
    await ActivityController.userJoinAct(ctx,next)
})
// 用户退出活动
router.get('/exit/:userId/:activityId', async (ctx, next) => {
    console.log('123456789')
    await ActivityController.userExit(ctx)
})
//活动结束 用户评价
router.post('/end', async (ctx, next) => {
    await ActivityController.end(ctx,next)
})
// 评论点赞
router.get('/end/click/:id', async (ctx, next) => {
    await ActivityController.clickZan(ctx,next)
})

// 取消点赞

router.post('/end/cancel/:id', async (ctx, next) => {
    await ActivityController.cancelZan(ctx,next)
})

//回复评论
router.post('/end/reply', async (ctx, next) => {
    await ActivityController.reply(ctx,next)
})


//获取某个活动的全部评论
router.get('/comment/:activity_activityId', async (ctx, next) => {
    ctx.set('content-type', 'application/json');
    await ActivityController.getAllComment(ctx,next)
})
//获取某一个评价详情
router.get('/end/details/:activityCommentId', async (ctx, next) => {
    await ActivityController.getOneComment(ctx,next)
})
//删除某一个评价
router.get('/end/:activityCommentId', async (ctx, next) => {
    await ActivityController.delOneComment(ctx,next)
})

//显示用户参加的活动
router.post('/showUserJohnAct', async (ctx, next) => {
    await ActivityController.showUserJohnAct(ctx,next)
})

//显示用户发布的活动
router.post('/showUserProvideAct', async (ctx, next) => {
    await ActivityController.showUserProvideAct(ctx,next)
})
//获取某一个用户详情
router.get('/oneUser/:userId', async (ctx, next) => {
    await ActivityController.getOneUser(ctx,next)
})

// 搜索查询
router.get('/actData/:keyword', async (ctx, next) => {
    await ActivityController.getData(ctx,next)
})
//查看用户加入活动的情况
router.get('/joinDetails/:id', async (ctx, next) => {
    await ActivityController.getJoinDetails(ctx,next)
})


//显示回复评论
router.post('/replyDetails/:id', async (ctx, next) => {
    console.log(123);
    await ActivityController.showReply(ctx,next)
})



module.exports = router


