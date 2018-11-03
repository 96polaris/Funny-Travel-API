const ManageDAO=require('../model/ManageDAO')
const crypto=require('crypto')

module.exports={
    login:async(ctx,next)=>{
        let query=ctx.request.body;
        let manage={};
        manage.name=query.name;
        //密码加密
        var pwdd=query.pwd;
        const hash=crypto.createHash('md5');
        hash.update(pwdd);
        var pwd=hash.digest('hex')
        manage.pwd=pwdd
        try{
            //获取传回的管理员密码
            let jsondata=await ManageDAO.checkManage(manage);
            if(jsondata[0].managePwd==pwd){
                ctx.body={"code":200,"message":"OK",data:jsondata[0]}
                //管理员登录成功
            }else{
                ctx.body={"code":403,"message":'密码错误',data:0}
            }
        }catch(err){
            ctx.body={"code":500,"message":err.toString(),data:0}
        }

    },
    manageShowAct:async(ctx,next)=>{
        let query = ctx.request.query
        let act={};
        try {
            let jsondata=await ManageDAO.manageShowAct(act)
            ctx.body = {"code": 200, "message": "OK", data: jsondata}

        } catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data:0}
        }
    },
    manageCheckActAgree:async(ctx,next)=>{
        let query = ctx.request.query
        let act = {};
        act.activityId = query.activityId;
        try {
            await ManageDAO.manageCheckActAgree(act)
            ctx.body = {"code": 200, "message": "OK", data:1}

        } catch (err) {
            ctx.body = {"code": 500, "message": err.toString(), data:0}
        }
    },
    manageCheckActRefuse:async(ctx,next)=>{
        let query=ctx.request.query
        let act={};
        act.activityId=query.activityId;
        try{
            await ManageDAO.manageCheckActRefuse(act)

            ctx.body={"code":200,"message":"OK",data:1}

        }catch(err){
            ctx.body={"code":500,"message":err.toString(),data:0}
        }
    },
    //管理员设置热门景点线路游记等
    setScenic:async(ctx,next)=>{
        let query=ctx.request.query;
        let scenic={}
        scenic.scenicid=query.scenicId
        try{
            await ManageDAO.manageSetScenic(scenic)
            ctx.body={"code":200,"message":"OK",data:1}

        }catch(err){
            ctx.body={"code":500,"message":err.toString(),data:0}
        }
    },
    setRoute:async(ctx,next)=>{
        let query=ctx.request.query;
        let route={}
        route.routeid=query.routeid;
        try{
            await ManageDAO.manageSetRoute(route)
            ctx.body={"code":200,"message":"OK",data:1}

        }catch(err){
            ctx.body={"code":500,"message":err.toString(),data:0}
        }
    },
    setNote:async(ctx,next)=>{
        let query=ctx.request.query;
        let note={}
        note.noteid=query.noteid;
        try{
            await ManageDAO.manageSetNote(note)
            ctx.body={"code":200,"message":"OK",data:1}

        }catch(err){
            ctx.body={"code":500,"message":err.toString(),data:0}
        }
    },

    //管理员界面显示游记，线路景点等
    manageShowScenic:async(ctx,next)=>{
        try{
            let jsondata=await ManageDAO.manageShowScenic();
            ctx.body={"code":200,"message":"OK",data:jsondata}

        }catch(err){
            ctx.body={"code":500,"message":err.toString(),data:0}
        }
    },
    manageShowRoute:async(ctx,next)=>{
        try{
            let jsondata=await ManageDAO.manageShowRoute();
            ctx.body={"code":200,"message":"OK",data:jsondata}

        }catch(err){
            ctx.body={"code":500,"message":err.toString(),data:0}
        }
    },
    manageShowNote:async(ctx,next)=>{
        try{
            let jsondata=await ManageDAO.manageShowNote();
            ctx.body={"code":200,"message":"OK",data:jsondata}

        }catch(err){
            ctx.body={"code":500,"message":err.toString(),data:0}
        }
    },
    //管理员界面，显示所有游记景点线路
    // manageShowAll:async(ctx,next)=>{
    //     try{
    //         let jsondata=await ManageDAO.manageShowAll();
    //         ctx.body={"code":200,"message":"OK",data:jsondata}
    //
    //     }catch(err){
    //         ctx.body={"code":500,"message":err.toString(),data:[]}
    //     }
    // },
    // manageShowHotAll:async(ctx,next)=>{
    //     try{
    //         let jsondata=await ManageDAO.manageShowHotAll();
    //         ctx.body={"code":200,"message":"OK",data:jsondata}
    //
    //     }catch(err){
    //         ctx.body={"code":500,"message":err.toString(),data:[]}
    //     }
    // }


    //显示热门景点，线路，游记等
    showHotScenic:async(ctx,next)=>{
        try{
            let jsondata=await ManageDAO.showHotScenic();
            ctx.body={"code":200,"message":"OK",data:jsondata}

        }catch(err){
            ctx.body={"code":500,"message":err.toString(),data:0}
        }
    },
    showHotRoute:async(ctx,next)=>{
        try{
            let jsondata=await ManageDAO.showHotRoute();
            ctx.body={"code":200,"message":"OK",data:jsondata}

        }catch(err){
            ctx.body={"code":500,"message":err.toString(),data:0}
        }
    },
    showHotNote:async(ctx,next)=>{
        try{
            let jsondata=await ManageDAO.showHotNote();
            ctx.body={"code":200,"message":"OK",data:jsondata}

        }catch(err){
            ctx.body={"code":500,"message":err.toString(),data:0}
        }
    }


}