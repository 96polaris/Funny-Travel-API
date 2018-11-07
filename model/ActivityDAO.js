//活动数据
const DAO=require('../model/DAO');
class DB{
    //获取全部活动信息
    getAllActivity(){
        return DAO('select * from activity where manageCheck=1 order by endTime desc', []);
    }
    //查询某一个活动详情
    getOneActivity(id){
        return DAO('select * from activity where activityId=?', [id]);
    }
    //用户发布活动，管理员审核通过后向活动表中添加数据
    addActivity(act){
        return DAO('insert into activity(activityTitle,activityDays,beginTime,endTime,personNum,money,telNum,activityIntroduce,user_userId,actImg) values(?,?,?,?,?,?,?,?,?,?)',
            [act.activityTitle,act.activityDays,act.beginTime,act.endTime,act.personNum,act.money,act.telNum,act.activityIntroduce,act.user_userId,act.actImg])
    }

    //修改活动数据（不修改图片的情况）
    updateActivity(act){
        return DAO('update activity set activityTitle=?,activityDays=?,beginTime=?,endTime=?,personNum=?,money=?,telNum=?,activityIntroduce=? where activityId=?',
            [act.activityTitle,act.activityDays,act.beginTime,act.endTime,act.personNum,act.money,act.telNum,act.activityIntroduce,act.activityId])
    }
    //修改活动数据（修改图片的情况）
    updateActivity1(act){
        console.log(1223)
        return DAO('update activity set actImg=?,activityTitle=?,activityDays=?,beginTime=?,endTime=?,personNum=?,money=?,telNum=?,activityIntroduce=? where activityId=?',
            [act.actImg,act.activityTitle,act.activityDays,act.beginTime,act.endTime,act.personNum,act.money,act.telNum,act.activityIntroduce,act.activityId])
    }

    //用户参与活动，发布者审核通过后向用户-活动表中添加数据
    userJoinAct(user){
            return DAO('insert into joinActivity(provideId,user_userId,activity_activityId) values(?,?,?)',
                [user.provideId,user.user_userId,user.activity_activityId])
    }
    //用户退出活动，从用户-活动表中删除数据
    userExit(act){
        return DAO('Delete from joinActivity where user_userId=? and activity_activityId=?', [act.userId,act.activityId])
    }
    //活动结束，用户向活动评价表添加活动评价

    end(comment){
        // return DAO('select userId from joinActivity where userStatus =1',[])
        return DAO('insert into activityComment (activityTime,activityCommentContent,activity_activityId,userid)values (?,?,?,?)',
            [comment.activityTime,comment.activityCommentContent,comment.activity_activityId,comment.userid,])
    }
    //获取某个活动的全部评论
    getAllComment(id){
        // return DAO('select * from activityComment where activity_activityId=? order by activityTime desc', [id]);
        return DAO('SELECT user.userName,user.userImage,activitycomment.zan,activitycomment.activityCommentId,activitycomment.activityCommentContent,activitycomment.activityTime FROM `activitycomment` RIGHT JOIN `user` on activitycomment.userid=user.userId where activitycomment.activity_activityId=? order by activityTime desc',[id])
    }
    //获取某一个评论详情
    getOneComment(id){
        return DAO('select * from activityComment where activityCommentId=?',[id])
    }
    //删除某一评论
    delOneComment(id){
        return DAO('Delete from activityComment where activityCommentId=? ', [id])
    }

    //显示用户参加活动
    showUserJohnAct(userId){
        return DAO('select activity.actImg,activityTitle,activityIntroduce,activityId from joinactivity, activity where joinactivity.activity_activityId=activity.activityId and joinactivity.user_userId=?',[userId])

    }

    showUserProvideAct(userId){
        return DAO('SELECT * FROM `activity` where user_userId=?',[userId])
    }
    //获取某一个评论详情
    getOneUser(id){
        return DAO('select * from user where userId=?',[id])
    }

    //搜索查询功能
    getData(keyword){
        return DAO('select * from activity where activityTitle like "%'+keyword+'%" ',[])
    }

    //查看用户加入活动的情况
    getJoinDetails(id){
        return DAO('select user.userName,user.userImage,user.userPhone from joinactivity join user on joinactivity.user_userid=user.userId where joinactivity.activity_activityId=?',[id])
    }

    //评论点赞
    clickZan(id){
        return DAO( 'update activityComment set zan=zan+1 where activityCommentId=?', [id])
    }

    // 取消点赞
    cancelZan(id){
        return DAO( 'update activityComment set zan=zan-1 where activityCommentId=?', [id])
    }

    // 评论回复
    reply(rep){
        return DAO('insert into replyactcomment (actCommentId,replyTime,replyContent,userId)values ( ?,?,?,?)',
            [rep.actCommentId,rep.replyTime,rep.replyContent,rep.userId,])
    }
    // 显示回复评论
    showReply(id){
        return DAO('select user.userName,user.userImage,"replyactcomment.replyContent","replyactcomment.replyTime" from activitycomment join user on "replyactcomment.userId"=user.userId where "replyactcomment.actCommentId"=?',[id])
    }
}

module.exports=new DB();