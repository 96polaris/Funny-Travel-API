const ScenicDAO=require('../model/ScenicDAO')
const formidable =require ('formidable')
const path =require('path')
const fs=require('fs')
module.exports= {

    //添加景点信息
    AddScenic: async (ctx, next) => {

        var form = new formidable.IncomingForm();
        form.uploadDir = '../public/Scenicuploadfile'    //设置文件存放路径  //
        form.multiples = true;  //设置上传多文件
        form.parse(ctx.req, function (err, fields, files) {
            console.log(files)
            //根据files.filename.name获取上传文件名，执行后续写入数据库的操作
            console.log(fields)

            if (files.scenicImage) {
                // 获取传入的路径与名字
                let src = files.scenicImage.path;
                let fileName = files.scenicImage.name;
                // 获取源文件全路径
                let srcNew = path.join(__dirname, files.scenicImage.path);
                // 改成你想要的名字
                let destName = `${path.basename(fileName, path.extname(fileName))}${path.extname(fileName)}`;
                let stt = `http://localhost:3000/Actuploadfile/${destName}`;
                console.log(123);
                console.log(stt);
                console.log(fields.scenicName);
                let name = path.join(path.parse(srcNew).dir, destName);
                fs.renameSync(srcNew, path.join(path.parse(srcNew).dir, destName));
                let scenic = {}
                scenic.scenicName = fields.scenicName;
                scenic.tese = fields.tese;
                // scenic.timeArrange = ctx.request.body.timeArrange;
                scenic.scenicLevel = fields.scenicLevel;
                // scenic.hotScenic = ctx.request.body.hotScenic
                scenic.scenicAddress = fields.scenicAddress;
                scenic.openHours = fields.openHours
                // scenic.scenicImage = ctx.request.body.scenicImage
                scenic.scenicLocationId = fields.scenicLocation_scenicLocationId
                scenic.scenicImage=stt
                console.log(scenic);

                try {
                    ScenicDAO.AddScenic(scenic);
                    ctx.body={"code":200, "message":"ok", data:1};
                    console.log("data:"+data);
                } catch (e) {
                    ctx.body={"code":500, "message":"err"+e.message, data:0};
                }

                // ScenicDAO.AddScenic(scenic)
            }
            //根据fileds.mydata获取上传表单元素的数据，执行写入数据库的操作
            if (err) {
                ctx.body = '上传失败'
            }
        })
    },


    // AddScenic: async (ctx, next) => {
    //
    //     let scenic = {}
    //     scenic.scenicName = ctx.request.body.scenicName;
    //     scenic.fromArea = ctx.request.body.fromArea;
    //     scenic.timeArrange = ctx.request.body.timeArrange;
    //     scenic.scenicLevel = ctx.request.body.scenicLevel;
    //     // scenic.hotScenic = ctx.request.body.hotScenic
    //     scenic.scenicAddress = ctx.request.body.scenicAddress;
    //     scenic.openHours = ctx.request.body.openHours
    //     scenic.scenicImage = ctx.request.body.scenicImage
    //     scenic.scenicIntroduce = ctx.request.body.scenicIntroduce
    //     scenic.scenicLocationId = ctx.request.body.scenicLocationId
    //
    //     try {
    //         await  ScenicDAO.AddScenic(scenic)
    //         ctx.body = {"code": 200, "message": "OK", data: []}
    //
    //     } catch (err) {
    //         ctx.body = {"code": 500, "message": err.toString(), data: []}
    //     }
    // },
    getoneScenic: async (ctx, next) => {
        let query=ctx.request.query;
        let sc = {};
        sc.scenicName = query.scenicName;
        try{
            let jsondata = await  ScenicDAO.getoneScenic(sc)
            ctx.body={"code":200,"message":"OK",data:jsondata}

        }catch(err){
            ctx.body={"code":500,"message":err.toString(),data:0}
        }

    }
}
