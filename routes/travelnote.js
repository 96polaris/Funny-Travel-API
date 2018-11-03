const router = require('koa-router')()
var mysql = require('mysql')
var path = require('path')
var mysql = require('mysql')
const formidable = require("formidable");
const TravelDAO = require('../model/TravelNoteDAO')
const NoticeDAO=require('../model/NoticeDAO')
const TraveleCtroller=require('../controllers/TravelnoteController')
const Notice=require('../controllers/NoticeController')
router.prefix('/travelnote')


//显示全部游记的标题，图片,基础内容
// router.get('/travelNote', async (ctx, next) => {
//     await TraveleCtroller.gettravelnote(ctx,next)
// })
//推荐
router.get('/tuijianNote', async (ctx, next) => {
    await TraveleCtroller.gettuijian(ctx,next)
})

//热门
router.get('/hotNote', async (ctx, next) => {
    await TraveleCtroller.getremen(ctx,next)
})
//最新
router.get('/zuixinNote', async (ctx, next) => {
    await TraveleCtroller.getzuixin(ctx,next)
})
//显示个人游记
router.get('/gerenNote/:userId', async (ctx, next) => {
    await TraveleCtroller.getzjyouji(ctx,next)
})

//显示单个游记详情
router.get('/travelNoteId/:travelNoteId', async (ctx, next) => {
    await TraveleCtroller.getonetravelnote(ctx,next)
})
//显示单个游记评论
router.get('/travelNoteIdpl/:travelNoteId', async (ctx, next) => {
    await TraveleCtroller.getonetravelnotepl(ctx,next)
})


//删除游记
router.get('/delyj/:sc', async (ctx, next) => {
    await TraveleCtroller.deletetravelnote(ctx,next)
})

//添加游记平论
router.post('/addpl', async (ctx, next) => {
    await TraveleCtroller.addtravelnotecomment(ctx,next)
})
//点赞
router.get('/dz/:dj', async (ctx, next) => {
    await TraveleCtroller.dz(ctx,next)
})
//取消点赞
router.get('/qxdianzan/:qx', async (ctx, next) => {
    await TraveleCtroller.qxdianzan(ctx,next)
})

//添加游记
router.post('/add', async (ctx, next) => {
    await TraveleCtroller.addtravelnote(ctx,next)
})













//
// //删除游记平论
// router.get('/addsc', async (ctx, next) => {
//     await TraveleCtroller.deletecomment(ctx,next)
// })
//
// //显示公告内容
// router.get('/addpb', async (ctx, next) => {
// await Notice.getNotice(ctx,next)
// })
//
// //添加公告
// router.post('/addgg', async (ctx, next) => {
//     await Notice.addNotice(ctx,next)
// })
// //删除公告
// router.get('/addsg', async (ctx, next) => {
//     await Notice.deleteNotice(ctx,next)
// })



module.exports = router
