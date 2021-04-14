<?php

$listProdutos  = '';

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

                        <a href="#">
                         <i class="fas fa-plus-circle" style="font-size:28px;color:#eeeeee"></i>
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



<div class="content-wrapper" style="margin-top:10px !important;">

  <div class="content-header">
    <div class="container-fluid">
      <div class="row mb-2">
        <div class="col-sm-6">
          <h1 class="m-0"><?= TITLE ?></h1>
        </div>
        <div class="col-sm-6">
          <ol class="breadcrumb float-sm-right">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item active"><?= BRAND ?></li>
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
              <h3 class="card-title">Atendente: &nbsp; <span style="text-transform: uppercase; color:yellow"><?= $usuario ?></span></h3>

              <div class="card-tools">
                <ul class="pagination pagination-sm float-right">
                  <?= $paginacao ?>
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
                    <button disabled type="submit" name="submit" class="btn btn-flat btn-warning ">Adicionar todos &nbsp; <i class="fas fa-chevron-right"></i></button>
                  </div>

                </div>

                <div class="card-body table-responsive p-0" style="height: 380px;">
                  <table class="table table-head-fixed text-nowrap">
                    <thead>
                      <th>
                        <div class="icheck-warning d-inline">
                          <input type="checkbox" id="select-all">
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
                      <?= $listProdutos ?>
                    </tbody>
                  </table>
                </div>


              </form>
            </div>


          </div>

        </div>

        <!-- CAIXA -->

        <div class="col-lg-4 col-6">

        <form action="forma_pagamento_insert.php" method="post">
          <input type="hidden" name="total_absoluto" value="<?= $total_absoluto ?>">
          <div class="card card-success">
            <div class="card-header">
              <h1 class="card-title"><span style="font-size: xx-large; font-weight:600;">R$&nbsp;<?= number_format($total_absoluto,"2",",",".") ?>

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

                <div class="row">
                  <div class="col-6">
                    <span style="font-weight: 600;">CLIENTE: </span>&nbsp; <?= $cliente; ?>
                  </div>
                  <div class="col-6">
                    <span style="font-weight: 600;">MECÂNICO: </span>&nbsp; <?= $mecanico; ?>
                    <hr>
                  </div>

                  <div class="col-12">
                    <span style="font-weight: 600;">Total do(s) serviços(s):......................................................... </span>&nbsp;R$ <?= number_format($servicos, "2", ",", ".") ?>
                    <br>
                    <span style="font-weight: 600;">Mão de obra: ...................................................................... </span>&nbsp;R$ <?= number_format($obra, "2", ",", ".") ?>
                    <br>
                    <span style="font-weight: 600;">Total:................................................................................. </span>&nbsp;<span style="font-weight: 600; color:#ff0000"> R$ <?= number_format($total, "2", ",", ".")  ?></span>
                 <hr>
                  </div>

                  <hr>
                  <table class="table  table-dark table-sm">
                    <thead>
                      <tr>
                        <th>PRODUTO(S)</th>
                        <th>UNI</th>
                        <th>SUBTOTAL</th>
                      </tr>
                      
                    </thead>
                    <tbody>
                      
                       <?= $result ; ?>
                      
                       <tr>
                      <td colspan="2">TOTAL</td>
                      <td style="font-weight: 600; color:#ff0000">R$ <?= number_format($total_produtos,"2",",",".")  ?></td>
                      
                      </tr>
                     
                    </tbody>
                  </table>
                  
                  <div class="col-6">
                   <input type="text" name="valor_receber" class="form-control" placeholder="R$ valor a receber " required>
                  </div>
                  <div class="col-6">
                    <select name="form_pagamento" id="" class="form-control" required>
                     <option value="">Forma de Pagamento</option>
                     <option value="Dinheiro">Dinheiro</option>
                     <option value="Cartão de Débito">Cartão de Débito</option>
                     <option value="Cartão de Crédito">Cartão de Crédito</option>

                    </select>
                  </div>
                  
                  <div class="col-12">

                    <button type="submit" class="btn btn-warning btn-lg btn-block swalDefaultError" style="margin-top: 10px;">ENVIAR</button>

                  </div>

                  
                </div>
                
                
              </div>
              
              
            </div>
          </form>
        <!-- FIM -->
      </div>
    </div>