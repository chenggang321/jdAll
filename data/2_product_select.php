<?php
header('Content-Type:application/json;charset:utf-8');

$pageNum=$_REQUEST['pageNum'];

/*链接服务器*/
include('0_config.php');
$conn=mysqli_connect($db_url,$db_user,$db_pwd,$db_name,$db_port);

/*分页数据对象*/
$pageDate=[
  'recordCount'=>0,//总记录数
  'pageSize'=>8,//页面大小
  'pageCount'=>0,//总页数
  'pageNum'=>$pageNum,//当前页数
  'data'=>null
];

/*执行语句*/
$sql="set names utf8";
mysqli_query($conn,$sql);

$sql="select count(*) from jd_product";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_assoc($result);
$pageDate['recordCount']=intval($row['count(*)']);
$pageDate['pageCount']=ceil($pageDate['recordCount']/$pageDate['pageSize']);

/*读取指定页面数据*/
$start=($pageDate['pageNum']-1)*$pageDate['pageSize'];
$count=$pageDate['pageSize'];
$sql="select * from jd_product limit $start,$count";
$result=mysqli_query($conn,$sql);

$pageDate['data']=mysqli_fetch_all($result,MYSQLI_ASSOC);

echo json_encode($pageDate);