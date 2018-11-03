const Koa = require('koa')
const app = new Koa()
const router = require('koa-router')()
const userDAO=require('../model/UserDAO')
const moment=require('moment')
const bodyparser = require('koa-bodyparser')
const formidable =require('formidable')
const static=require('koa-static')
var qs=require('querystring')
const crypto=require('crypto')
// const bodyparser=require('koa-bodyparser')
const fs=require('fs')
const path=require('path')
const userController=require('../controllers/UserController')

router.prefix('/users')
app.use(bodyparser())
app.use(static('public'))

//用户注册
router.post('/addUser',async(ctx,next)=>{
    await userController.addUser(ctx,next)

})

//用户登录
router.post('/login',async(ctx,next)=>{
    await userController.login(ctx,next)

})
router.post('/resetpwd',async(ctx,next)=>{
    await userController.resetpwd(ctx,next)

})

//用户手机号验证，用户不能重复
router.post('/checkuser',async(ctx,next)=>{
    await userController.checkuser(ctx,next)

})

router.post('/upload',async(ctx,next)=>{
    await userController.addPic(ctx,next)

})


router.post('/showPic',async(ctx,next)=>{
    await userController.showPic(ctx,next)

})

router.post('/showuserName',async(ctx,next)=>{
    await userController.showuserName(ctx,next)

})



//用户添加头像
// router.post('/addPic',async(ctx,next)=>{
//     await userController.addPic(ctx,next)
//
// })

//用户上传头像
// router.post('/uploadfile', async (ctx, next) =>{
//     await userController.addPic(ctx,next)
// })


//     var form = new formidable.IncomingForm();
//     form.uploadDir = '../public/userpic';   //设置文件存放路径
//     form.multiples = true;  //设置上传多文件
//     var filename = "";
//     var src = "";
//     var fileDes = "";//文件目的地
//     form.parse(ctx.req, async function (err, fields, files) {
//         // console.log(files)
//         //根据files.filename.name获取上传文件名，执行后续写入数据库的操作
//         filename = files.filename.name;
//         src = path.join(__dirname, files.filename.path);
//         fileDes = path.basename(filename, path.extname(filename)) + moment(new Date()).format("YYYYMMDDHHMMSS") + path.extname(filename);
//         fs.rename(src, path.join(path.parse(src).dir, fileDes));
//         let str = `http://localhost:3000/userpic/${fileDes}`;
//         console.log(str);
//         console.log(fields);
//         console.log("mydata: " + fields.mydata);
//         let myfile=fields.mydata
//         console.log(myfile);
//         try {
//             await userDAO.addPic(str, myfile);
//             console.log(myfile);
//             ctx.body = {"code": 200, "message": "ok", data: 1};
//         } catch (e) {
//             ctx.body = {"code": 500, "message": "err" + e.message, data: 0};
//         }
//         //
//         // //根据fileds.mydata获取上传表单元素的数据，执行写入数据库的操作
//     })
// // if(err){
// //     ctx.body={'code':500,"message":"err"+err.message,data:[]};
// // }
// })
//

module.exports = router
