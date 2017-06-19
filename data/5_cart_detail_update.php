<?php
header('Content-Type:text/plain;charset=utf-8');

$did=$_REQUEST['did'];
$count=$_REQUEST['count'];

//Á´½ÓÊý¾Ý¿â
include('0_config.php');
$conn=mysqli_connect($db_url,$db_user,$db_pwd,$db_name,$db_port);

//sqlÓï¾ä1
$sql="set names utf8";
mysqli_query($conn,$sql);

//sqlÓï¾ä2

$sql="update jd_detail set count='$count' where did='$did'";
$result=mysqli_query($conn,$sql);
if($result){
  echo 'ok';
}else{
  echo 'err';
}