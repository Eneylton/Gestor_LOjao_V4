<?php

$listProdutos  = '';
$resultados    = '';
$result_cli    = '';
$result_mec    = '';
$result_serv   = '';

foreach ($servicos as $item) {
  
  $result_serv .= '
  <div class="custom-control custom-radio custom-control-inline">
  <input class="form-check-input" type="checkbox" value="'.$item->id.'" name="serv[]" id="[' . $item->id . ']">
  <label class="form-check-label">'.$item->nome.' - R$ '.number_format($item->valor,"2",",",".").'</label>
  </div>
   
  '; 
}

foreach ($clientes as $item) {
  
  $result_cli .= '

  <option value="'.$item->id.'">'.$item->nome.'</option>
   
  '; 
}

foreach ($mecanicos as $item) {
  
  $result_mec .= '

  <option value="'.$item->id.'">'.$item->nome.'</option>
   
  '; 
}

foreach ($produtos as $item) {

    if (empty($item->foto)) {

        $foto = 'imgs/sem.jpg';

    } else {

        $foto = $item->foto;

    }

    $listProdutos .= '

                <tr>
                  <td>

                        <div class="icheck-red ">
                        <input type="checkbox" value="' . $item->id . '" name="id[]" id="[' . $item->id . ']">
                        <label for="[' . $item->id . ']"></label>
                        </div>
                        </td>

                        <td>

                        <div class="product-img">
                        <img src="' . $foto . '" class="img-size-50" class="img-thumbnail">
                        </div>
                        </td>
                        <td>' . $item->codigo . '</td>
                        <td style="text-transform:uppercase">' . $item->nome . '</td>
                        <td style="text-align:center">

                        <span style="font-size:16px" class="' . ($item->estoque <= 3 ? 'badge badge-danger' : 'badge badge-success') . '">' . $item->estoque . '</span>

                        </td>
                        <td> R$ ' . number_format($item->valor_venda, "2", ",", ".") . '</td>
                        <td>

                        <a href="?acao=add&id=' . $item->id . '">
                         <i class="fas fa-plus-circle" style="font-size:28px;color:#30da04"></i>
                       </a>

                  </td>
                </tr>

';

}

$resultados = strlen($resultados) ? $resultados : '<tr>
                                                     <td colspan="6" class="text-center" > Nenhuma Vaga Encontrada !!!!! </td>
                                                     </tr>';

unset($_GET['pagina']);
$gets = http_build_query($_GET);

//PAGINAÇÂO

$paginacao = '';
$paginas = $pagination->getPages();

foreach ($paginas as $key => $pagina) {
    $class = $pagina['atual'] ? 'btn-primary' : 'btn-dark';
    $paginacao .= '<li class="page-item"><a href="?pagina=' . $pagina['pagina'] . '&' . $gets . '">

                  <button type="button" class=" btn ' . $class . '">' . $pagina['pagina'] . '</button>
                  &nbsp; </a></li>';
}

?>



<div class="content-wrapper" style="margin-top:60px !important;">

    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0"><?=TITLE?></h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active"><?=BRAND?></li>
            </ol>
          </div>
        </div>
      </div>
    </div>
    <section class="content">

<div class="container-fluid">

        <div class="row">

           <!-- LISTA DE PRODUTOS -->

          <div class="col-lg-8 col-6">
              <div class="card card-dark">
              <div class="card-header">
                <h3 class="card-title">Atendente: &nbsp; <span style="text-transform: uppercase; color:yellow"><?=$usuario?></span></h3>

                <div class="card-tools">
                  <ul class="pagination pagination-sm float-right">
                    <?=$paginacao?>
                  </ul>
                </div>
              </div>


              <div class="card-body">
              <form method="get">
                <h3 class="card-title">
                <div class="input-group input-group-sm" style="width: 350px;">
                <input type="text" name="buscar" class="form-control float-right" placeholder="Pesquisar...." autofocus>

                    <div class="input-group-append">
                      <button type="submit" class="btn btn-primary">
                        <i class="fas fa-search"></i>
                      </button>
                    </div>
                  </div>
                </h3>
               </form>
               <form id="form1" action="pdv.php" method="post">
               <div class="card-header">

                <div class="card-tools">
                <button type="submit" name="submit"  class="btn btn-flat btn-warning ">Adicionar todos &nbsp; <i class="fas fa-chevron-right"></i></button>
                </div>

              </div>

              <div class="table-responsive p-0" style="height: 460px;">
                <table class="table table-head-fixed text-nowrap">
                  <thead>
                  <th>
                    <div class="icheck-warning d-inline">
                    <input type="checkbox" id="select-all" >
                    <label for="select-all">
                    </label>
                    </div>

                    </th>
                    <th>IMAGEM</th>
                    <th>CÓDIGO</th>
                    <th>PRODUTO</th>
                    <th style="text-align:center">ESTOQUE</th>
                    <th>VALOR</th>
                    <th>AÇÃO</th>
                  </thead>
                  <tbody>
                     <?=$listProdutos?>
                  </tbody>
                </table>
              </div>


              </form>
            </div>


              </div>

          </div>

          <!-- CAIXA -->

          <div class="col-lg-4 col-6">
          <?php

use \App\Entidy\Produto;

$_SESSION['dados-venda'] = array();

$listItem = '';
$total = 0;

foreach ($_SESSION['carrinho'] as $id => $qtd) {

    $item = Produto::getID($id);

    $nome = $item->nome;

    $valor_venda = $item->valor_venda;

    $qtd;

    $sub = $qtd * $item->valor_venda;

    $total += $sub;

    $listItem .= '

            <tr>

            <td style="text-transform:uppercase; font-size:small">' . $nome . '</td>

            <td style="width:80px">

            <input type="text" size="1" name="prod[' . $id . ']" value="' . $qtd . '" style="width:50px" />



            </td>

            <td style="width:150px">R$

            <input type="text" size="2" name="val[' . $id . ']" value="' . $valor_venda . '" />

            <button type="submit"><i class="fas fa-pen"></i></button>

            &nbsp;&nbsp;

            <a href="?acao=del&id=' . $id . '"

            <i class="fas fa-times" style="color:#ff0000"></i>
            </a>

            </td>
            <td> R$ ' . number_format($sub, "2", ",", ".") . '</td>


            </tr>

            ';

            array_push(
              $_SESSION['dados-venda'],
  
              array(
                  'nome'         => $nome,
                  'codigo'       => $item->codigo,
                  'barra'        => $item->barra,
                  'qtd'          => $qtd,
                  'valor_venda'  => $valor_venda,
                  'subtotal'     => $sub,
                  'produtos_id'  => $id
              )
          );

}

?>


            <div class="card card-danger">
            <div class="card-header">
                <h1 class="card-title"><span style="font-size: xx-large; font-weight:600;">R$ &nbsp;

                 <?=number_format($total, "2", ",", ".")?>

                 </span></h1>

                <div class="card-tools">
                  <ul class="pagination pagination-sm float-right">
                    <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                  </ul>
                </div>
              </div>

                  <div class="card-body">

                  <div class="tab-content p-0 direct-chat-messages" style="height: 200px;">
                  <form action="?acao=up" method="post">
                  <table class="table table-hover table-dark table-striped table-sm" >
                  <thead>
                  <tr>
                    <th style="width:200px; text-align:LEFT"> PRODUTO </th>
                    <th> QTD </th>
                    <th style="width:200px; text-align:center"> VALOR </th>
                    <th style="width:100px"> SUBTOTAL </th>
                    </tr>
                  </thead>
                  <tbody>

                   <?=$listItem?>

                  </tbody>
                  </table>
                  </form>

                  </div>

                  <hr>
              <form action="ordem-servico.php" method="post">

                <div class="row">
                  <div class="col-6">
                  <select class="form-control select2" name="clientes_id" required>
                          <option value="">Selecione um cliente</option>
                          

                          <?= $result_cli; ?>

                        
                        </select>
                  </div>
                  <div class="col-2">
                  <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#modal-primary"><i class="fas fa-plus"></i></button>
                  </div>
                  <div class="col-4">
                  <select class="form-control select2" name="mecanicos_id" required>
                  <option value="">Selecione um Mecânico</option>
                          

                          <?= $result_mec; ?>

                        
                        </select>
                  </div>
                </div>
                <hr>

               <div class="row">

                  <div class="col-12">


                     
                        <?= $result_serv ?>
                    
                     
                    <hr>

                  </div>
                  <div class="col-6">
                    <textarea class="form-control" rows="3" placeholder="Observeções" name="obs" ></textarea>
                  </div>
                  
                  <div class="col-6">
                    <input type="text" maxlength="100000" class="form-control" id="dinheiro" placeholder="Mão de Obra" name="mao_obra" required>
                   </div>

                   <div class="col-12">
                   <button type="submit" class="btn btn-warning btn-lg btn-block" style="margin-top: 10px;">ENVIAR</button>

                   </div>

           
              </form>

            </div>


              </div>


          </div>
          <!-- FIM -->
        </div>
      </div>
      <form action="cliente-modal.php" method="post">
      <div class="modal fade" id="modal-primary">
        <div class="modal-dialog">
          <div class="modal-content bg-secondary">
            <div class="modal-header">
              <h4 class="modal-title">Adicionar Cliente</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body">

            <div class="col-12">
                <input type="text" name="nome" class="form-control" placeholder="Nome" required>
            </div>

            <div class="col-12">
                <input type="text" name="telefone" class="form-control" placeholder="Telefone" required>
            
            </div>

            <div class="col-12">
                <input type="text" name="email" class="form-control" placeholder="Email" required>
            </div>
            
            <div class="col-12">
                <input type="text" name="placa" class="form-control" placeholder="Placa" required>
            </div>

            <div class="col-12">
                <input type="text" name="veiculo" class="form-control" placeholder="Veiculo / Modelo / Ano" required>
            </div>

            <div class="col-12">
              <select class="form-control form-control-lg" name="marcas_id"  required>
                <option value="">Selecione um fabricante</option>
                <?php
                $option = '';
                foreach ($marcas as $item) {
                echo '<option value="' . $item->id . '">' . $item->nome . '</option>';
                }
              ?>
              </select>  
            </div>
            
            </div>
            <div class="modal-footer justify-content-between">
              <button type="button" class="btn btn-primary" data-dismiss="modal">Fechar</button>
              <button type="submit" class="btn btn-primary">Salvar</button>
            </div>
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>