<?php
require_once 'conexao.php';

class Atendimento extends Conexao {
    private $idAtendimento;
    private $idFormaAtendimento;
    private $idUsuario;
    private $idpublico;
    private $ativo;
    private $respostaAtendimento;
    private $tabela = 'atendimento';

    // construtor
    public function __construct() {
        parent::__construct();
    }

    // getter e setter
    public function getIdAtendimento() {
        return $this->idAtendimento;
    }

    public function setIdAtendimento($idAtendimento) {
        $this->idAtendimento = $idAtendimento;
    }

    public function getIdFormaAtendimento() {
        return $this->idFormaAtendimento;
    }

    public function setIdFormaAtendimento($idFormaAtendimento) {
        $this->idFormaAtendimento = $idFormaAtendimento;
    }

    public function getIdUsuario() {
        return $this->idUsuario;
    }

    public function setIdUsuario($idUsuario) {
        $this->idUsuario = $idUsuario;
    }

    public function getIdpublico() {
        return $this->idpublico;
    }

    public function setIdpublico($idpublico) {
        $this->idpublico = $idpublico;
    }

    public function getAtivo() {
        return $this->ativo;
    }

    public function setAtivo($ativo) {
        $this->ativo = $ativo;
    }

    public function getRespostaAtendimento() {
        return $this->respostaAtendimento;
    }

    public function setRespostaAtendimento($respostaAtendimento) {
        $this->respostaAtendimento = $respostaAtendimento;
    }

    // consulta no banco
    public function consulta() {
        $sql = "SELECT idAtendimento, idFormaAtendimento, idUsuario, idpublico, ativo, respostaAtendimento FROM $this->tabela";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetchAll(PDO::FETCH_ASSOC);
        return $result;
    }

    public function consultaAtendimentos(){
        $sql = "SELECT 
        a.idAtendimento, 
        u.NomeUsuario, 
        f.nomeAtendimento AS formaAtendimento,
        f.idFormaAtendimento,
        p.nomepublico AS publico,
        p.idpublico,
        a.ativo, 
        a.respostaAtendimento
        FROM atendimento a
        JOIN usuario u ON a.idUsuario = u.idUsuario
        JOIN formaatendimento f ON a.idFormaAtendimento = f.idFormaAtendimento
        JOIN publico p ON a.idpublico = p.idpublico";

        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }


    public function consultaID($id) {
        $sql = "SELECT idAtendimento, idFormaAtendimento, idUsuario, idpublico, ativo, respostaAtendimento FROM $this->tabela WHERE idAtendimento = :id";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
        $result = $stmt->fetch(PDO::FETCH_ASSOC);
        if ($result) {
            $this->setIdFormaAtendimento($result['idFormaAtendimento']);
            $this->setIdUsuario($result['idUsuario']);
            $this->setIdpublico($result['idpublico']);
            $this->setAtivo($result['ativo']);
            $this->setRespostaAtendimento($result['respostaAtendimento']);
        }
    }

    public function cadastrar($atendimento) {
        $idFormaAtendimento = $atendimento->getIdFormaAtendimento();
        $idUsuario = $atendimento->getIdUsuario();
        $idpublico = $atendimento->getIdpublico();
        $ativo = $atendimento->getAtivo();
        $respostaAtendimento = $atendimento->getRespostaAtendimento();

        // Verificar se o idpublico é um valor válido
        $sql = "SELECT COUNT(*) FROM publico WHERE idpublico = :idpublico";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':idpublico', $idpublico, PDO::PARAM_INT);
        $stmt->execute();
        $count = $stmt->fetchColumn();

        if ($count > 0) {
            $sql = "INSERT INTO $this->tabela (idFormaAtendimento, idUsuario, idpublico, ativo, respostaAtendimento) 
                    VALUES (:idFormaAtendimento, :idUsuario, :idpublico, :ativo, :respostaAtendimento)";
            $stmt = $this->conn->prepare($sql);
            $stmt->bindParam(':idFormaAtendimento', $idFormaAtendimento, PDO::PARAM_INT);
            $stmt->bindParam(':idUsuario', $idUsuario, PDO::PARAM_INT);
            $stmt->bindParam(':idpublico', $idpublico, PDO::PARAM_INT);
            $stmt->bindParam(':ativo', $ativo, PDO::PARAM_STR);
            $stmt->bindParam(':respostaAtendimento', $respostaAtendimento, PDO::PARAM_STR);
            $stmt->execute();
        } else {
            throw new Exception("O valor de idpublico informado é inválido.");
        }
    }

    public function editar($idFormaAtendimento, $idUsuario, $idpublico, $ativo, $respostaAtendimento, $id) {
        $sql = "UPDATE $this->tabela SET 
                idFormaAtendimento = :idFormaAtendimento,
                idUsuario = :idUsuario,
                idpublico = :idpublico,
                ativo = :ativo,
                respostaAtendimento = :respostaAtendimento
                WHERE idAtendimento = :id";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':idFormaAtendimento', $idFormaAtendimento, PDO::PARAM_INT);
        $stmt->bindParam(':idUsuario', $idUsuario, PDO::PARAM_INT);
        $stmt->bindParam(':idpublico', $idpublico, PDO::PARAM_INT);
        $stmt->bindParam(':ativo', $ativo, PDO::PARAM_STR);
        $stmt->bindParam(':respostaAtendimento', $respostaAtendimento, PDO::PARAM_STR);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        return $stmt->execute();
    }
    

    public function excluir($id) {
        $sql = "DELETE FROM $this->tabela WHERE idAtendimento = :id";
        $stmt = $this->conn->prepare($sql);
        $stmt->bindParam(':id', $id, PDO::PARAM_INT);
        $stmt->execute();
    }
}
?>