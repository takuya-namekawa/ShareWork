class Chat < ApplicationRecord
  belongs_to :shop
  belongs_to :room
  has_many :notifications, dependent: :destroy
  with_options presence: true do
    validates :message
  end
  
  def create_notification_chat!(current_shop, chat_id, room_id, visited_id)
    # チャットしている相手を取得し、通知を送る
    temp_ids = Chat.select(:shop_id).where(room_id: room_id).where.not(shop_id: current_shop.id).distinct
    temp_ids.each do |temp_id|
      save_notification_chat!(current_shop, chat_id, temp_id['shop_id'])
    end
     # もしチャットが空だったら、投稿者に通知を送る
    save_notification_chat!(current_shop, chat_id, visited_id) if temp_ids.blank?
  end

  def save_notification_chat!(current_shop, chat_id, visited_id)
    # チャットは複数回することが考えられるため、複数回通知する
    notification = current_shop.active_notifications.new(
      chat_id: chat_id,
      visited_id: visited_id,
      action: 'chat'
    )
    # 自分のチャットの場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end
end
