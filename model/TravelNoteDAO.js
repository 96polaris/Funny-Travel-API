//游记数据访问
const DAO = require('../model/DAO');

class DB {
    //推荐游记
    gettuijian(cv) {
        return DAO('select travelTitle,travelNoteId,travelNoteImage,travelNoteContent,travelNotePriseNum,fbtime,user.userName,user.userImage from travelnote right join user on  travelnote.userId=user.userId WHERE hotNote=?', [cv = 2]
        );
    }

    //获取热门游记
    getrenmen() {
        return DAO('select travelTitle,travelNoteId,travelNoteImage,travelNoteContent,travelNotePriseNum,fbtime,user.userName,user.userImage from travelnote right join user on  travelnote.userId=user.userId order by travelNotePriseNum desc ',
        );
    }

    //获取最新游记
    getzuixin() {
        return DAO('SELECT travelTitle,travelNoteId,travelNoteImage,travelNoteContent,travelNotePriseNum,fbtime ,user.userName,user.userImage from travelnote right join user on  travelnote.userId=user.userId  order by fbtime desc ',
        );
    }

//获取个人邮寄
    getzjyouji(userId) {
        return DAO('select fbtime,travelTitle,travelNoteImage,travelNoteContent,travelNoteId from travelnote WHERE userId=?', [userId]);
    }

    //获取指定编号的游记详细内容内容方法及评论
    getonetravelnote(travelNoteId) {
        //10.18晚上新的查询语句
        //return DAO('select travelnote.travelTitle,travelnote.travelNoteId,travelnote.travelNoteContent,travelnote.userId,travelnote.travelNotePriseNum,travelnote.travelNoteImage, travelnotecomment.comment,travelnotecomment.user_userId,user.userImage,user.userName FROM travelnote INNER JOIN travelnotecomment on travelnote.travelNoteId=travelnotecomment.travelNote_travelNoteId INNER JOIN `user` on travelnotecomment.user_userId=user.userId where travelNoteId=?', [travelNoteId])

        return DAO('select travelnote.travelTitle,travelnote.travelNoteContent, travelnote.travelNoteId,travelnote.userId,travelnote.travelNotePriseNum, travelnote.travelNoteImage FROM  travelnote right join user on  travelnote.userId=user.userId where travelNoteId=?', [travelNoteId])
    }

//获取指定编号的游记详细内容内容方法及评论
    getonetravelnotepl(travelNoteId) {
        return DAO('select travelnotecomment.comment,travelnotecomment.user_userId,user.userName,user.userImage from  travelnotecomment right join user on  travelnotecomment.user_userId=user.userId WHERE travelNote_travelNoteId=?', [travelNoteId])
    }


    //删除游记
    deletetravelnote(sc) {
        return DAO('delete from travelnote where travelNoteId=?', [sc])
    }

    //添加游记评论
    addtravelnotecomment(travelnotecomment) {
        return DAO('insert into travelnotecomment(comment,user_userId,travelNote_travelNoteId) values(?,?,?)',
            [travelnotecomment.comment, travelnotecomment.user_userId, travelnotecomment.travelNote_travelNoteId]
        )
    }

//点赞
    dz(dj) {
        return DAO('update travelnote set travelNotePriseNum=travelNotePriseNum+1 where travelNoteId=?', [dj])
    }

    //取消点赞
    qxdianzan(qx) {
        return DAO('update travelnote set travelNotePriseNum=travelNotePriseNum-1 where travelNoteId=?', [qx])
    }

    //添加游记
    addtravelnote(travelnote) {
        return DAO('insert into travelnote(travelTitle,travelNoteContent,travelNoteImage,userId,fbtime) values(?,?,?,?,?)',
            [travelnote.travelTitle, travelnote.travelNoteContent, travelnote.travelNoteImage, travelnote.userId, travelnote.fbtime]
        )
    }





}

module.exports = new DB();