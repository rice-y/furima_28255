class PurchasesController < ApplicationController
  before_action :move_to_index, only: [:index, :create]
  before_action :show_item, only:[:index, :create]
  def index
    @purchase = PurchaseAddress.new
  end

  def create
    @purchase = PurchaseAddress.new(purchase_params)

    if @purchase.valid?
      pay_item
      @purchase.save
        return redirect_to root_path
    else
      render 'index'
    end
  end

  def move_to_index
    redirect_to user_session_path unless user_signed_in?
  end

  def show_item
    @item = Item.find(params[:item_id])
  end

  private

  def purchase_params
    params.permit(:token, :authenticity_token, :price, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id)
  end

  

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: purchase_params[:price], # 商品の値段
      card: purchase_params[:token], # カードトークン
      currency: 'jpy' # 通貨の種類(日本円)
    )
  end
end
