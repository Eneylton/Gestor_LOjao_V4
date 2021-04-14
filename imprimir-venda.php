<?php

require __DIR__ . '/vendor/autoload.php';

use App\Entidy\Cliente;
use App\Entidy\Mecanico;
use App\Entidy\Ordem;
use \App\Session\Login;

Login::requireLogin();

$usuariologado = Login::getUsuarioLogado();

$usuario = $usuariologado['nome'];

if (isset($_SESSION['dados-serv'])) {

    foreach ($_SESSION['dados-serv'] as $item) {

        $cliente_id      = $item['cliente'];
        $mecanico_id     = $item['mecanico'];
        $mao_obra        = $item['obra'];
        $servicos        = $item['servico'];
        $sub             = $item['total'];
    }

    $cliente = Cliente::getID($cliente_id);
    $nome_cliente       = $cliente->nome;
    $email_cliente      = $cliente->email;
    $telefone_cliente   = $cliente->telefone;
    $veiculo_cliente    = $cliente->veiculo;
    $placa_cliente      = $cliente->placa;

    $mecanico = Mecanico::getID($mecanico_id);
    $nome_mecanico = $mecanico->nome;
}

$ordem_servicos = Ordem::getClientID($cliente_id);

$result = '';
$total_serv = 0;
foreach ($ordem_servicos as $value) {
    
    $result .= '
        <tr>
        <td style="text-align: left;">' . $value->nome . '</td>
        <td style="text-align: left;"> R$ ' . number_format($value->valor, "2", ",", ".") . '</td>
        </tr>

        ';

        $total_serv += $value->valor;
}

$result_prod = '';
$total_prod = 0;
foreach ($_SESSION['dados-venda'] as $item) {

    $nome            = $item['nome'];
    $qtd             = $item['qtd'];
    $valor_venda     = $item['valor_venda'];
    $subtotal        = $item['subtotal'];

    $result_prod .= '
        <tr>
        <td>' . $nome . '</td>
        <td>' . $qtd . '</td>
        <td> R$ ' . number_format($valor_venda, "2", ",", ".") . '</td>
        <td style="text-align: left;"> R$ ' . number_format($subtotal, "2", ",", ".") . '</td>
        </tr>

        ';

        $total_prod += $subtotal;
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <style>
        @page {
            margin: 70px 0;
        }

        body {
            margin: 0;
            padding: 0;
            font-family: "Open Sans", sans-serif;
        }

        .header {
            position: fixed;
            top: -70px;
            left: 0;
            right: 0;
            width: 100%;
            text-align: center;
            background-color: #555555;
            padding: 10px;
        }

        .header img {
            width: 160px;
        }

        .footer {
            bottom: -27px;
            left: 0;
            width: 100%;
            padding: 5px 10px 10px 10px;
            text-align: center;
            background: #555555;
            color: #fff;
        }

        .footer .page:after {
            content: counter(page);

        }

        table {
            width: 100%;
            border: 1px solid #555555;
            margin: 0;
            padding: 0;
        }

        th {
            text-transform: uppercase;
        }

        table,
        th,
        td {
            font-size: xx-small;
            border: 1px solid #555555;
            border-collapse: collapse;
            text-align: center;
            padding: 5px;

        }

        tr:nth-child(2n+0) {
            background: #eeeeee;
        }

        p {
            color: #888888;
            margin: 0;
            text-align: center;
        }

        h2 {
            text-align: center;

        }
    </style>

    <title>Lista de Pedidos</title>
</head>

<body>

    <table style="margin-top: -30px;">
        <tbody>
            <tr style="background-color: #fff; color:#000">
                <td style="border:1px solid #fff; text-align:left">
                    <span style="margin-left:126px; margin-top: -30px; font-size:large">LOJÃO DO CARRO </span><br>
                    <span>LISTA DE PEDIDOS</span>
                    <img style="width:120px; height:50px; float:left;margin-top:-40px; padding:10px; margin-left:-12px;" src="01.png">

                <td style="border:1px solid #fff; text-align:right; font-size:12px">
                    Data: de Emissão: <?php echo date("d/m/Y") ?>
                </td>
            </tr>
        </tbody>
    </table>

    <table style="margin-top: 0px;">
        <tbody>
            <tr style="background-color: #fff; color:#000">
                <td style="border:1px solid #fff; text-align:center;font-size:20px">
                    ORDEM DE SERVIÇOS
                </td>
            </tr>
        </tbody>
    </table>

    <table style="margin-top: 0px;">
        <tbody>
            <tr style="background-color: #fff; color:#000">
                <td style="border:1px solid #fff; text-align:left;font-size:15px">
                Atendente: <?= $usuario  ?>
                </td>
            </tr>
        </tbody>
    </table>

    <table style="margin-top: 0px;">
        <tbody>
            <tr style="background-color: #dddddd; color:#000">
                <td style="border:1px solid #eeeeee; text-align:left;font-size:15px">
                    DADOS DO CLIENTE
                </td>
            </tr>
        </tbody>
    </table>
   
    <table style="margin-top: 0px;">
        <tbody>
            <tr style="background-color: #fff; color:#000">
                <td style="width:25px; border:1px solid #fff; text-align:left;font-size:14px">
                    Cliente:
                </td>
                <td style="border:1px solid #fff; text-align:left;font-size:14px" >
                    <?= $nome_cliente ?>
                </td>
            </tr>
            <tr>
                <td style="width:25px; border:1px solid #fff; text-align:left;font-size:14px; background-color:#fff">
                    Email:
                </td>
                <td style="border:1px solid #fff; text-align:left;font-size:14px; background-color:#fff">
                <?= $email_cliente ?>
                </td>
                <td style="width:25px; border:1px solid #fff; text-align:left;font-size:14px; background-color:#fff">
                    Telefone:
                </td>
                <td style="border:1px solid #fff; text-align:left;font-size:14px; background-color:#fff">
                <?= $telefone_cliente ?>
                </td>

            </tr>
        </tbody>
    </table>

    <table style="margin-top: 0px;">
        <tbody>
            <tr style="background-color: #dddddd; color:#000">
                <td style="border:1px solid #eeeeee; text-align:left;font-size:15px">
                   DADOS DO VEÍCULO
                </td>
            </tr>
        </tbody>
    </table>

    <table style="margin-top: 0px;">
        <tbody>
       
            <tr>
                <td style="width:25px; border:1px solid #fff; text-align:left;font-size:14px">
                    Marca:
                </td>
                <td style="border:1px solid #fff; text-align:left;font-size:14px">
                   <?= $veiculo_cliente ?>
                </td>
                <td style="width:25px; border:1px solid #fff; text-align:left;font-size:14px">
                    Placa:
                </td>
                <td style="border:1px solid #fff; text-align:left;font-size:14px">
                   <?= $placa_cliente ?>
                </td>

            </tr>
        </tbody>
    </table>

    <table style="margin-top: 0px;">
        <tbody>
            <tr style="background-color: #dddddd; color:#000">
                <td style="border:1px solid #eeeeee; text-align:left;font-size:15px">
                   SERVIÇOS
                </td>
            </tr>
        </tbody>
    </table>


    <table style="margin-top: 0px;">
        <tbody>
       
            <tr>
                <td style="width:180px; border:1px solid #fff; text-align:left;font-size:14px">
                    Mecânico Responsavél:
                </td>
                <td style="border:1px solid #fff; text-align:left;font-size:14px">
                     <?= $nome_mecanico ?>
                </td>
                

            </tr>
        </tbody>
    </table>

    <table>
        <tbody>
            <tr style="background-color: #000; color:#fff">
                
                <td style="text-align: left; width:620px">SERVIÇOS</td>
                <td style="text-align: left; width:620px">VALOR</td>
               
            </tr>     
             <?= $result; ?> 

             <tr style="background-color: #444546; color:#fff">
             <td style="text-align: left;">
               TOTAL
             </td>
             <td style="text-align: left;">
              <span>R$ <?= number_format( $total_serv,"2",",",".") ?></span>
             </td>
             </tr>
        </tbody>
    </table>

    <table style="margin-top: 20px;">
        <tbody>
            <tr style="background-color: #dddddd; color:#000">
                <td style="border:1px solid #eeeeee; text-align:left;font-size:15px">
                   PRODUTOS
                </td>
            </tr>
        </tbody>
    </table>
    <table>
        <tbody>
            <tr style="background-color: #ff0000; color:#fff">
                
                <td>NOME</td>
                <td>QTD</td>
                <td>UNI</td>
                <td style="text-align: left;">SUBTOTAL</td>
               
            </tr>     
             <?= $result_prod; ?>  

             <tr style="background-color: #444546; color:#fff">
             <td style="text-align: left;" colspan="3">
               TOTAL
             </td>
             <td style="text-align: left;" >
             <span>R$ <?= number_format( $total_prod,"2",",",".") ?></span>
             </td>
             </tr>
        </tbody>
    </table>

    <table style="margin-top: 10px;">
        <tbody>
            <tr style="background-color: #fff; color:#000; font-size:x-small">
                <td style="border:1px solid #eeeeee; text-align:left;font-size:15px">
                Total do(s) Serviço(s)  [+].................................
                <br>
                Total do(s) Produto(s)  [+].................................
                <br>
                Total da Mão de Obra    [+]...................................
                <br>
                ___________________________________________________________
                <br>
                Total [+]
                <br>
                Troco [-]

                </td>
            </tr>

        </tbody>
    </table>

</body>

</html>