<?php
class Conexion {
   public function con(){
    define("host","localhost");
    define("user","root");
    define("pass","");
    define("db","music");
    $con=mysqli_connect(host,user,pass,db)or die("error en la conexion");
    return $con;
}
}
?>