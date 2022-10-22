class Shop::ChatsController < ApplicationController
  before_action :authenticate_shop!

  def show
    @shop = Shop.find(params[:id])
    rooms = current_shop.shop_rooms.pluck(:room_id)
    shop_rooms = ShopRoom.find_by(shop_id: @shop.id,room_id: rooms)

    unless shop_rooms.nil?
      @room = shop_rooms.room
    else
      @room = Room.new
      @room.save
      ShopRoom.create(shop_id: current_shop.id, room_id: @room.id)
      ShopRoom.create(shop_id: @shop.id, room_id: @room.id)
    end
    @chats = @room.chats
    @chat = Chat.new(room_id: @room.id)
  end

  def create
    @chat = current_shop.chats.new(chat_params)
    if @chat.save
      redirect_to request.referer
    else
      redirect_to request.referer,alert: "メッセージを入力してください"
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :room_id, )
  end

end
