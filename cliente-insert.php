<?php 

require __DIR__.'/vendor/autoload.php';

$alertaCadastro = '';

define('TITLE','Cadastro Cliente');
define('BRAND','Cliente');

use \App\Entidy\Cliente;
use \App\Entidy\Marca;
use   \App\Session\Login;

Login::requireLogin();

$usuariologado = Login:: getUsuarioLogado();

$usuario = $usuariologado['id'];

$marcas = Marca::getList();

if(isset($_POST['nome'])){

    $item = new Cliente;
    $item->nome         = $_POST['nome'];
    $item->telefone     = $_POST['telefone'];
    $item->email        = $_POST['email'];
    $item->placa        = $_POST['placa'];
    $item->veiculo      = $_POST['veiculo'];
    $item->marcas_id    = $_POST['marcas_id'];
    $item->usuarios_id  = $usuario;
    $item-> cadastar();

    header('location: cliente-list.php?status=success');

    exit;
}

include __DIR__.'/includes/layout/header.php';
include __DIR__.'/includes/layout/top.php';
include __DIR__.'/includes/layout/menu.php';
include __DIR__.'/includes/layout/content.php';
include __DIR__.'/includes/cliente/cliente-form-insert.php';
include __DIR__.'/includes/layout/footer.php';