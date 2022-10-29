class Shop::NotificationsController < ApplicationController
  def index
    @notifications = current_shop.passive_notifications.all
    @notifications.where(checked: false).each do |notification|
      notification.update_attribute(:checked, true)
    end
  end

  def all_destroy
    @notifications = current_shop.passive_notifications.all
    @notifications.destroy_all
    redirect_to notifications_path, notice: "通知を全て削除しました"
  end


end
