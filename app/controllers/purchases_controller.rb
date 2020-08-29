class PurchasesController < ApplicationController
  before_action :move_to_index
  before_action :move_to_sign_in

  def new
    @item = Item.find(params[:item_id])
    @purchase = AddressPurchase.new
  end
  
  def create
    @purchase = AddressPurchase.new(purchase_params)
    if @purchase.valid?
      pay_item
      @purchase.save
      return redirect_to root_path
    else
      return render "new"
    end
  end

  private

  def purchase_params
    params.require(:address_purchase).permit(
      :postal_code, :municipalities, :address, :building_name, :phone_number, :shipping_area_id, :purchase_id
    ).merge(user_id: current_user.id,).merge(item_id: params[:item_id])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
  
  def move_to_index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def move_to_sign_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end
  
end
