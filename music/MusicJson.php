<?php
include("conexion.php");
class Listar {
    public function listarSongs(){
        try{
            $con=new Conexion();
            $c= $con::con();
            $query="SELECT * FROM tbl_img";
            $result=mysqli_query($c,$query);
            $json=array();
            while($row=mysqli_fetch_assoc($result)){
                $json[]=$row;
            }
            return json_encode($json);
        }catch(Exception $e){
            echo "error ".e;
        }
    }
}
?>