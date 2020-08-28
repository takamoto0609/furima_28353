class PurchasesController < ApplicationController

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
      return redirect_to root_path
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
  
end
