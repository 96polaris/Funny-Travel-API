const DAO=require('../model/DAO')

 class Rt{
     //向线路表中添加数据
     AddRoute(route){

         var sql = 'insert into route(routeId,routeName,routeIntroduction,Days,hotRoute,routeImage) VALUES(?,?,?,?,?,?) ';
         return DAO(sql,[route.routeId,route.routeName,route.routeIntroduction,route.Days,route.hotRoute,
            route.routeImage])
     }

     //获取线路表数据
     getRoute() {
         var sql = 'select * from route';
         return DAO(sql, []);
     }

     //获取一条线路数据
     getoneRoute(rline) {
         var sql = 'select * from route where Days=?';
         return DAO(sql, [rline.Days]);
     }
 }
module.exports=new Rt();