<?php
header('Content-Type:application/json;charset=utf-8');

$uname=$_REQUEST['uname'];
$pid=$_REQUEST['pid'];

#未提交数据
if(!$uname||!$pid){
  echo '{}';
  return;
}

#客户端对象
$output=[
  'msg'=>null,
  'uid'=>0,
  'cid'=>0,
  'pid'=>intval($pid),
  'count'=>0
];

#连接服务器
include('0_config.php');
$conn=mysqli_connect($db_url,$db_user,$db_pwd,$db_name,$db_port);

#sql语句1设置编码格式
$sql="set names utf8";
mysqli_query($conn,$sql);

#sql语句2根据uname查询uid
$sql="select uid from jd_user where uname='$uname'";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_assoc($result);
$uid=intval($row['uid']);
$output['uid']=$uid;

#sql语句3根据uid查询购物车编号没有则添加
$sql="select cid from jd_cart where userID='$uid'";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_assoc($result);
if($row){
 $cid=intval($row['cid']);
}else{
  $sql="insert into jd_cart values(null,'$uid')";
  $result=mysqli_query($conn,$sql);
  $cid=mysqli_insert_id($conn);
}
 $output['cid']=$cid;

 #sql语句cid和pid查询是否购买过商品没则添加有则加一
 $sql="select * from jd_detail where cartID='$cid'and productID='$pid'";
 $result=mysqli_query($conn,$sql);
 $row=mysqli_fetch_assoc($result);
 if($row){//有加一
    $count=intval($row['count']);
    $count++;
    $sql="update jd_detail set count='$count' where cartID='$cid'and productID='$pid'";
    $result=mysqli_query($conn,$sql);
 }else{//没有添加
    $sql="insert into jd_detail values(null,$cid,$pid,1)";
    mysqli_query($conn,$sql);
    $count=1;
 }
 $output['count']=$count;


echo json_encode($output);