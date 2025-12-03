<?php
require_once 'conexao.php';

class publico extends Conexao {
    private $idpublico;
    private $nomepublico;
    private $tabela = 'publico';

    // construtor
    public function __construct() {
        parent::__construct();
    }

    // getter e setter
    public function getidpublico() {
        return $this->idpublico;
    }

    public function setidpublico($idpublico) {
        $this->idpublico = $idpublico;
    }

    public function getnomepublico() {
        return $this->nomepublico;
    }

    public function setnomepublico($nomepublico) {
        $this->nomepublico = $nomepublico;
    }

    // consulta no banco
    public function consulta() {
        $sql = "SELECT idpublico, nomepublico FROM $this->tabela";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }
}
?>