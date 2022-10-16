<?php
    if(!isset($_SESSION))
        session_start();
    
    include("../functions.php");

    $emailLogin = $_POST['emailLogin'];
    $senhalogin = $_POST['passLogin'];

    $bd = conect();
    sign($bd, $emailLogin, $senhalogin);

    mysqli_close($bd);
?>