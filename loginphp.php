<?php
$conn= mysqli_connect('localhost','root', '', 'jackie');
if(!$conn){
    die ("paldo");
}
$MobileNumber=$POST("Mobile NUmber");
$Password=$POST9("Password");
$sql = "SELECT * From Customers WHERE MobileNumber = '$MobileNumber' AND Password = '$Password'";
$result =mysqli_query($coon,$sql);
if(mysqli_num_rows($result)>0){
    echo "Success"
    exit();
}else{
    echo "log in Failed"
}
mysqli_close($conn);
?>