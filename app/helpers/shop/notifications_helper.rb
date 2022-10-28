module Shop::NotificationsHelper
  def unchecked_notifications
    @notifications = current_shop.passive_notifications.where(checked: false) if current_shop
  end
end
