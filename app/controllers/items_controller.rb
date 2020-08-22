class ItemsController < ApplicationController

  def index
    @items = Item.all #Itemテーブルのデータ全てを@itemsに代入
  end

  def new #トップページの「出品」ボタンに対応するアクション
    @item = Item.new
  end

  def create # new.html.erbの出品確定ボタンに対応するアクション
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :explanation, :user_id, :category_id, :status_id, :shipping_fee_burden_id, :shipping_area_id, :estimated_delivery_date_id)
  end

end