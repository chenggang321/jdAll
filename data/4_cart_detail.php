<?php
//数据格式
//{"pic":"images/phone/phone_01.jpg","pname":"小米 Note","price":"1199.00","count":"1"}
header("Countent-Type:application/json;charset=utf-8");

$uname=$_REQUEST["uname"];


#链接数据库
include('0_config.php');
$conn=mysqli_connect($db_url,$db_user,$db_pwd,$db_name,$db_port);

//语句1
$sql="set names utf8";
mysqli_query($conn,$sql);
//语句2
$sql="select uid from jd_user where uname='$uname'";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_assoc($result);
$uid=intval($row['uid']);//用户id

//语句3
$sql="select cid from jd_cart where userID='$uid'";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_assoc($result);
$cid=intval($row['cid']);

//语句4
$sql="select pic,pname,price,did,count from jd_product,jd_detail where pid=productID and cartID='$cid'";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_all($result,MYSQLI_ASSOC);

echo json_encode($row);
