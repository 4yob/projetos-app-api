const notificacaoModel = require("../models/notificacaoModel");

// Controller para listar todas as notificações
const getNotificacoes = async (req, res) => {
  try {
    const notificacoes = await notificacaoModel.getNotificacoes();
    res.status(200).json(notificacoes);
  } catch (error) {
    console.error(error);
    res.status(400).json({ message: "Erro ao buscar notificações." });
  }
};

// Controller para buscar uma notificação por ID
const getNotificacaoById = async (req, res) => {
  try {
    const notificacao = await notificacaoModel.getNotificacaoById(req.params.id);
    if (!notificacao) {
      return res.status(404).json({ message: "Notificação não encontrada." });
    }
    res.status(200).json({ message: "Notificação encontrada.", notificacao });
  } catch (error) {
    console.error(error);
    res.status(404).json({ message: "Erro ao buscar notificação." });
  }
};

// Controller para criar uma nova notificação
const createNotificacao = async (req, res) => {
  try {
    const { user_id, mensagem } = req.body;
    if (!user_id || !mensagem) {
      return res.status(400).json({ message: "Campos obrigatórios não informados." });
    }
    const novaNotificacao = await notificacaoModel.createNotificacao(user_id, mensagem);
    res.status(201).json(novaNotificacao);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Erro ao criar notificação." });
  }
};

// Controller para atualizar uma notificação existente
const updateNotificacao = async (req, res) => {
  try {
    const { mensagem } = req.body;
    const notificacaoAtualizada = await notificacaoModel.updateNotificacao(req.params.id, mensagem);
    if (!notificacaoAtualizada) {
      return res.status(404).json({ message: "Notificação não encontrada." });
    }
    res.json({ message: "Notificação atualizada com sucesso.", notificacaoAtualizada });
  } catch (error) {
    res.status(500).json({ message: "Erro ao atualizar notificação." });
  }
};

// Controller para deletar uma notificação
const deleteNotificacao = async (req, res) => {
  try {
    const { id } = req.params;
    const notificacaoDeletada = await notificacaoModel.deleteNotificacao(id);
    if (!notificacaoDeletada) {
      return res.status(404).json({ message: "Notificação não encontrada." });
    }
    res.json({ message: "Notificação deletada com sucesso.", notificacaoDeletada });
  } catch (error) {
    res.status(500).json({ message: "Erro ao deletar notificação." });
  }
};

module.exports = {
  getNotificacoes,
  getNotificacaoById,
  createNotificacao,
  updateNotificacao,
  deleteNotificacao
};
