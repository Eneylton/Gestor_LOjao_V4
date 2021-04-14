<?php

require __DIR__.'/vendor/autoload.php';

use   \App\Entidy\Produto;
use   \App\Entidy\Cliente;
use   \App\Entidy\Servico;
use   \App\Entidy\Mecanico;
use   \App\Entidy\Marca;
use   \App\Db\Pagination;
use   \App\Session\Login;


define('TITLE', 'Caixa');
define('BRAND', 'Movimentação Finaceira ');

Login::requireLogin();

// USUARIO LOGADO
$usuariologado = Login::getUsuarioLogado();

$usuario = $usuariologado['nome'];

// CLIENTE // SERVIÇOS

$total_absoluto = 0;

if(isset($_SESSION['dados-serv'])){
  foreach ($_SESSION['dados-serv'] as $item) {
           
           $cliente_id = $item['cliente'];

           $buscar_cliente = Cliente:: getID($cliente_id);
           
           $cliente = $buscar_cliente->nome;


           $mec_id = $item['mecanico'];

           $buscar_mec = Mecanico:: getID($mec_id);
           
           $mecanico = $buscar_mec->nome;

           $obra     = $item['obra'];
           $servicos = $item['servico'];
           $total    = $item['total'];
  }

}

//CARRINHO

$result = '';
$total_produtos = '0';

if(isset($_SESSION['dados-venda'])){
  foreach ($_SESSION['dados-venda'] as $item) {

    $produto = $item['nome'];
    $qtd     = $item['qtd'];
    $uni     = $item['valor_venda'];
    $sub     = $item['subtotal'];
    $total_produtos += $sub; 

    $result .= '
    <tr>
    <td>'.$produto.' - Qtd: ('.$qtd.') </td>
    <td> R$ '.number_format($uni,"2",",",".").' </td>
    <td> R$ '.number_format($sub,"2",",",".").' </td>
    </tr>
    ';

  }

}

$total_absoluto = $total + $total_produtos;

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
include __DIR__.'/includes/venda/venda-form.php';
include __DIR__.'/includes/layout/footer.php';


?>