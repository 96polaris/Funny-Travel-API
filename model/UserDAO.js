//用户数据访问对象
const DAO=require('../model/DAO');

class DB{
     //用户注册的方法，向数据库新增用户信息
    addUser(user){
        var sql='insert into user(userName,userPwd,userPhone) values(?,?,?)'
        return DAO(sql,[user.userName,user.userPwd,user.userPhone])

    }
    checkUser(phone){
        var sql='select userPhone from user where userPhone=?'
        return DAO(sql,[phone])
    }

    //用户登录
    login(user){
        var sql='select userImage,userId,userPwd,userPhone from `user` where userPhone=?'
        return DAO(sql,[user.phone])
    }

    //显示用户名77
    showuserName(phone){
        var sql='select userName from `user` where userPhone=?'
        return DAO(sql,[phone])
    }

    //在个人中心添加用户头像的方法
    addPic(userpic){
        var sql='update `user` set userImage=? where userId=?'
        return DAO(sql,[userpic.str,userpic.mydata])
    }

    showPic(userId){
        var sql='select  userImage from user where userId=?'
        return DAO(sql,[userId])
    }
    resetpwd(user){
        var sql='update  user set userPwd=?  where userPhone=?'
        return DAO(sql,[user.userPwd,user.userPhone])
    }


    //活动发布者审核参与活动的用户
    checkUserAgree(user){
        var sql='update joinactivity set userStatus=1 where user_userId=? and activity_activityId=?'
        return DAO(sql,[user.id,user.activityid])
    }

    checkUserRefuse(user){
        var sql='update joinactivity set userStatus=0 where user_userId=? and activity_activityId=?'
        return DAO(sql,[user.id,user.activityid])
    }
}


module.exports=new DB();//导出的是对象