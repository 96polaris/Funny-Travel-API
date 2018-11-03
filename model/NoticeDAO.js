//公告发布
const DAO = require('../model/DAO');

class DB {
    //获取全部公告数据
    getNotice() {
        return DAO('select * from public',[]);
    }

//向公告表中添加数据
    addNotice(notice) {
        return DAO('insert into public(publicTitle,publicContent) values(?,?)',
            [notice.publicTitle, notice.publicContent])
    }
    //删除公告数据
    deleteNotice(aId){
        return DAO('delete from public where publicId=?',[aId])
    }
}

module.exports = new DB();