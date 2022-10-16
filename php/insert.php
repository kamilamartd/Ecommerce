<?php
    if(!isset($_SESSION))
        session_start();
    
    include("../functions.php");
    
    $nome = $_POST['name'];
    $cpf = $_POST['cpf'];
    $email = $_POST['email'];
    $senha = $_POST['pass'];
    $confirm = $_POST['passConfirm'];

    $bd = conect();
    $verify = verify($bd, $email);

    if($senha == $confirm){
        if($verify == 0)
            insert($bd, $nome, $cpf, $email, $senha);
        else
            echo("Você já está cadastrado.");
    }else
        echo("As senhas não correspondem.");
        
    mysqli_close($bd);
?>
