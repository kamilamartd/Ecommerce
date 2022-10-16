<?php

    if(!isset($_SESSION))
        session_start();
    
    function conect(){
        @ $bd = mysqli_connect('localhost', 'root', '', 'lojaVirtual');
        
        if(!$bd)
            die ("Não foi possível se concetar ao banco de dados");

        return $bd;
    }
  
    function verify($bd, $email){
        $sql = mysqli_query($bd, "SELECT * FROM cliente WHERE email = '{$email}'");
        $verify = mysqli_num_rows($sql);

        return $verify;
    }

    function sign($bd, $emailLogin, $senhaLogin){
        $sql = "SELECT * FROM cliente WHERE email = '$emailLogin' AND senha = md5('$senhaLogin')";
        $resul = mysqli_query($bd, $sql) or die("Erro no banco de dados!");

        if(mysqli_num_rows($resul)>0){
            //atualiza session
            echo("Bem vindo de volta!");
        }else
            echo("Você ainda não está cadastrado.");    
    }

    function insert($bd, $nome, $cpf, $email, $senha){
        $query = "INSERT INTO cliente VALUES ('$nome', '$cpf', '$email', md5('$senha'))";
        if(mysqli_query($bd, $query)){
            //atualiza session
            echo("Bem vindo!");
        }else
            echo("Não foi possível realizar o cadastro.");
    }


?>
