<?php 

require __DIR__.'/vendor/autoload.php';

define('TITLE','Nova Marca');
define('BRAND','Cadastrar Marca');

use App\Db\Pagination;
use App\Entidy\Produto;
use   \App\Session\Login;

$alertaLogin  = '';
$alertaCadastro = '';

$usuariologado = Login:: getUsuarioLogado();

$usuario = $usuariologado['id'];

Login::requireLogin();

$troco = 0;
if(isset($_POST['valor_receber'],$_POST['form_pagamento'])){
    $val_recebido   = $_POST['valor_receber'];
    $total_absoluto = $_POST['total_absoluto'];
    $troco =  ($val_recebido - $total_absoluto);

    if($troco < 0){


    }

    }

 // LISTAR PRODUTOS
$codigo = filter_input(INPUT_GET, 'buscar', FILTER_SANITIZE_STRING);
$buscar = filter_input(INPUT_GET, 'buscar', FILTER_SANITIZE_STRING);

$condicoes = [
  strlen($buscar) ? 'p.nome LIKE "%' . str_replace(' ', '%', $buscar) . '%" 
                       or 
                       p.codigo LIKE "%' . str_replace(' ', '%', $buscar) . '%"
                       or 
                       c.nome LIKE "%' . str_replace(' ', '%', $buscar) . '%"
                       or 
                       p.barra LIKE "%' . str_replace(' ', '%', $buscar) . '%"
                       or 
                       p.data LIKE "%' . str_replace(' ', '%', $buscar) . '%"' : null
];

$condicoes = array_filter($condicoes);

$where = implode(' AND ', $condicoes);

$qtd = Produto::qtdCount($where);

$pagination = new Pagination($qtd, $_GET['pagina'] ?? 1, 200);

$produtos = Produto::getRelacinadas($where, 'nome ASC', $pagination->getLimit());
   

include __DIR__.'/includes/layout/header.php';
include __DIR__.'/includes/layout/top.php';
include __DIR__.'/includes/layout/menu.php';
include __DIR__.'/includes/layout/content.php';
include __DIR__.'/includes/pagamento/pagamento-form.php';
include __DIR__.'/includes/layout/footer.php';