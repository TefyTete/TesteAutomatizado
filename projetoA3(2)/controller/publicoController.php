<?php
require_once('../model/publicoModel.php');

class publicoController {
    public function consulta() {
        $publicoModel = new publico();
        $result = $publicoModel->consulta();
        return $result;
    }

    public function handleRequest() {
        if (isset($_GET['action']) && $_GET['action'] == 'consultarpublico') {
            $this->consulta();
        }
    }
}

$publicoController = new publicoController();
$publicoController->handleRequest();
?>