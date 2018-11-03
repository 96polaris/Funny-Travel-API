const Koa = require('koa')
const app = new Koa()
const router = require('koa-router')()
const ManageDAO=require('../model/ManageDAO')
const manageController=require('../controllers/ManageController')
var bodyparser = require('koa-bodyparser')
const crypto=require('crypto')
router.prefix('/manage')
app.use(bodyparser())


//管理员登录
router.post('/managelogin',async(ctx,next)=>{
    await manageController.login(ctx,next)
})


//管理员页面显示待审核活动
router.get('/manageShowAct',async(ctx,next)=>{
    await manageController.manageShowAct(ctx,next)
})

//管理员审核活动-通过
router.get('/manageCheckActAgree',async(ctx,next)=> {
    await manageController.manageCheckActAgree(ctx,next)
})

    //管理员审核活动-不同意
    router.post('/manageCheckActRefuse',async(ctx,next)=>{
        await manageController.manageCheckActRefuse(ctx,next)

    })

   //管理员设置热门景点，线路，游记等
    router.get('/setScenic',async(ctx,next)=>{
        await manageController.setScenic(ctx,next)

    }
)


router.get('/setRoute',async(ctx,next)=>{
        await manageController.setRoute(ctx,next)

    }
)

router.get('/setNote',async(ctx,next)=>{
        await manageController.setNote(ctx,next)

    }
)

//在管理员界面上显示景点，线路，游记等

router.get('/manageShowScenic',async (ctx,next)=>{
    await manageController.manageShowScenic(ctx,next)
})

router.get('/manageShowRoute',async (ctx,next)=>{
    await manageController.manageShowRoute(ctx,next)

})


router.get('/manageShowNote',async (ctx,next)=>{
    await manageController.manageShowNote(ctx,next)

})


// 2.显示游记，景点，线路
// router.get('/manageShowAll',async (ctx,next)=>{
//     await manageController.manageShowAll(ctx,next)
//
// })



//显示所有热门景点，游记，线路
// router.get('/manageShowHotAll',async (ctx,next)=>{
//     await manageController.manageShowHotAll(ctx,next)
//
// })

//显示热门景点，线路游记等

router.get('/showHotScenic',async(ctx,next)=>{
    await manageController.showHotScenic(ctx,next)

})

router.get('/showHotRoute',async(ctx,next)=>{
    await manageController.showHotRoute(ctx,next)

})

router.get('/showHotNote',async(ctx,next)=>{
    await manageController.showHotNote(ctx,next)

})

module.exports = router
