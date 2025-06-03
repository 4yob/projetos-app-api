const notificationModel = require("../models/notificationModel");

// Controller para listar todas as notificações
const getNotifications = async (req, res) => {
  try {
    const notifications = await notificationModel.getNotifications();
    res.status(200).json(notifications);
  } catch (error) {
    console.error(error);
    res.status(400).json({ message: "Erro ao buscar notificações." });
  }
};

// Controller para buscar uma notificação por ID
const getNotificationById = async (req, res) => {
  try {
    const notification = await notificationModel.getNotificationById(req.params.id);
    if (!notification) {
      return res.status(404).json({ message: "Notificação não encontrada." });
    }
    res.status(200).json({ message: "Notificação encontrada.", notification });
  } catch (error) {
    console.error(error);
    res.status(404).json({ message: "Erro ao buscar notificação." });
  }
};

// Controller para criar uma nova notificação
const createNotification = async (req, res) => {
  try {
    const { user_id, mensagem, message, post_id, chat_id } = req.body;
    
    const msg = message || mensagem;
    if (!user_id || !msg || !chat_id) {
      return res.status(400).json({ error: "user_id, mensagem/message e chat_id são obrigatórios." });
    }
    const notification = await notificationModel.createNotification(
      user_id,
      msg, 
      post_id,
      chat_id
    );
    res.status(201).json(notification);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
};

// Controller para atualizar uma notificação existente
const updateNotification = async (req, res) => {
  try {
    const { message, post_id } = req.body;
    const updatedNotification = await notificationModel.updateNotification(req.params.id, message, post_id);
    if (!updatedNotification) {
      return res.status(404).json({ message: "Notificação não encontrada." });
    }
    res.json({ message: "Notificação atualizada com sucesso.", updatedNotification });
  } catch (error) {
    res.status(500).json({ message: "Erro ao atualizar notificação." });
  }
};

// Controller para deletar uma notificação
const deleteNotification = async (req, res) => {
  try {
    const { id } = req.params;
    const deletedNotification = await notificationModel.deleteNotification(id);
    if (!deletedNotification) {
      return res.status(404).json({ message: "Notificação não encontrada." });
    }
    res.json({ message: "Notificação deletada com sucesso.", deletedNotification });
  } catch (error) {
    res.status(500).json({ message: "Erro ao deletar notificação." });
  }
};

const ganharNotificacao = async (req, res) => {
  try {
    const { user_id, message, post_id, chat_id } = req.body;
    if (!user_id || !message || !post_id || !chat_id) {
      return res.status(400).json({ message: "Campos obrigatórios não informados." });
    }
    const newNotification = await notificationModel.ganharNotificacao(user_id, message, post_id, chat_id);
    res.status(201).json(newNotification);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Erro ao ganhar notificação." });
  }
}

module.exports = {
  getNotifications,
  getNotificationById,
  createNotification,
  updateNotification,
  deleteNotification,
  ganharNotificacao
};
