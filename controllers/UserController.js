const Koa = require('koa')
const app = new Koa()
const userDAO=require('../model/UserDAO')
const crypto=require('crypto')
const formidable =require('formidable')
const moment=require('moment')
const bodyparser = require('koa-bodyparser')
const static=require('koa-static')
const fs=require('fs')
const path=require('path')
var qs=require('querystring')
app.use(bodyparser())
app.use(static('public'))
module.exports={

//手机号查重
    checkuser:async(ctx,next)=>{
        let query=ctx.request.body
        console.log(query);
        var jsondata= await userDAO.checkUser(query.userPhone)
            console.log(jsondata);
            if(jsondata.length!=0){
                ctx.body={"code":500,"message":"用户已存在，请重新输入",data:-1}
            }else{
                ctx.body={"code":200,"message":"ok",data:1}
            }

    },


//data中0表示失败，1表示成功
    addUser:async(ctx,next)=>{
        let query=ctx.request.body
        let user={};
        user.userName=query.userName;
        user.userPhone=query.userPhone;
// //密码加密
        var pwdd=query.userPwd;
        const hash=crypto.createHash('md5');
        hash.update(pwdd);
        var pwd=hash.digest('hex')
        user.userPwd=pwd;
        console.log("注册加密密码："+pwd);
            try{
            await  userDAO.addUser(user)
            ctx.body={"code":200,"message":"OK",data:1}
        }catch(err){
            ctx.body={"code":500,"message":err.toString(),data:0}
        }

},
login:async(ctx,next)=>{
    let query=ctx.request.body;
    let user={}
    user.phone=query.userPhone;

    //密码加密
    var pwd=query.userPwd;
    const hash=crypto.createHash('md5');
    hash.update(pwd);
     pwd=hash.digest('hex')
    console.log("用户登录加密密码："+pwd);


    try{
        //获取传回，用户名和密码
        let jsondata=await userDAO.login(user)
        if(jsondata[0].userPwd==pwd){
            console.log("数据库传回的密码："+jsondata[0].userPwd);
            ctx.body={"code":200,"message":"OK",data:jsondata[0]}
            var userinfo=JSON.stringify(jsondata[0]);
            //用户登录成功，将信息保存在cookie中
            ctx.cookies.set('userInfo',userinfo)
            // ctx.cookies.get

        }else{
            ctx.body={"code":403,"message":'密码错误或用户不存在',data:0}
        }
    }catch(err){
        ctx.body={"code":500,"message":err.toString(),data:0}
    }
},

    resetpwd:async(ctx,next)=>{
        let query=ctx.request.body;
        let user={}
        user.userPhone=query.userPhone
        var pwd=query.userPwd;
        const hash=crypto.createHash('md5');
        hash.update(pwd);
        pwd=hash.digest('hex')
        user.userPwd=pwd
        console.log("密码重置：用户加密密码："+pwd);
        try{
            //获取传回，用户名和密码
            let jsondata=await userDAO.resetpwd(user)
            console.log(user);
            ctx.body={"code":200,"message":"OK",data:1}

        }catch(err){
            ctx.body={"code":500,"message":err.toString(),data:0}
        }
    },


    showuserName:async(ctx,next)=>{
        let query = ctx.request.body
        try {
            let jsondata=await userDAO.showuserName(query.userPhone)
            console.log(jsondata);
            ctx.body = {"code": 200, "message": "OK", data: jsondata[0]}

        } catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data:0}
        }
    },


    showPic:async(ctx,next)=>{
        let query = ctx.request.body
        try {
            let jsondata=await userDAO.showPic(query.userId)
            ctx.body = {"code": 200, "message": "OK", data: jsondata[0]}

        } catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data:0}
        }
    },

addPic:async(ctx,next)=>{
    let userpic={}
    var form = new formidable.IncomingForm();
    form.uploadDir = '../public/userpic';   //设置文件存放路径
    form.multiples = true;  //设置上传多文件
    var filename = "";
    var src = "";
    var fileDes = "";
    form.parse(ctx.req, async function (err, fields, files) {
        console.log(files.filename)
        console.log(fields)

        //根据files.filename.name获取上传文件名，行后续写入数据库的操作
        filename = files.filename.name;
        console.log(filename);
        src = path.join(__dirname, files.filename.path);
        console.log("src:"+src);
        fileDes = path.basename(filename, path.extname(filename)) + moment(new Date()).format("YYYYMMDDHHMMSS") + path.extname(filename);
        fs.renameSync(src, path.join(path.parse(src).dir, fileDes));
        let str = `http://localhost:3000/userpic/${fileDes}`;
        console.log("str: "+str);
        console.log(fields);
        console.log("mydata: " + fields.mydata);
         userpic.str=str
         userpic.mydata=fields.mydata
        console.log(userpic);

        try {
            let newstr =  await  userDAO.addPic(userpic);
            ctx.body={"code":200, "message":"ok", data:newstr};
            console.log("data:"+data);
        } catch (e) {
            ctx.body={"code":500, "message":"err"+e.message, data:0};
        }
        //
        // //根据fileds.mydata获取上传表单元素的数据，执行写入数据库的操作
    })
// if(err){
//     ctx.body={'code':500,"message":"err"+err.message,data:[]};
// }
}



// addPic:async(ctx,next)=>{
//         const form=new formidable.IncomingForm();
//             form.parse(ctx.req,function (err,fields,files) {
//             //获取上传文件的原路径
//             var src=files.userPic.path;
//             // console.log(fields);
//             //设置文件保存路径为public中
//             var des=path.join(__dirname,'../','public/userpic',path.basename(src))
//             //复制文件
//             fs.copyFile(src,des,  function(){
//                 //复制文件成功，pic路径放数据库
//                 //1.从cookies中获取当前用户的id
//                 var userInfo=ctx.cookies.get('userInfo')
//                 var info=JSON.parse(userInfo)
//                 console.log(info.userId);
//                 var userId=info.userId;
//                 let user={}
//                 user.id=userId;
//                 user.pic=des;
//                 console.log(user.pic);
//                 try{
//                      userDAO.addPic(user);
//                     ctx.body={"code":200,"message":"OK",data:1}
//                 }catch(err){
//                     ctx.body={"code":500,"message":err.toString(),data:0}
//                 }
//             })
//         })
//
//     }

}