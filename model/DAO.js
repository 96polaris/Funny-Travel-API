//通用数据操作对象
const mysql=require('mysql')//装mysql
const  config=require('../model/dbconfig')

//创建数据库连接池
const pool=mysql.createPool(config)

function query(sql,values) {
   return new Promise((resolve,reject)=>{
       pool.getConnection(function (err,connection) {
           if(err){
               reject(err)
           }else{
               connection.query(sql,values,(err,rows)=>{
                   if(err){
                       reject(err)
                   }else{
                       resolve(rows) ;
                   }
                   connection.release();
               })
           }
       })
   })
}

module.exports=query;