class ItemsController < ApplicationController

  def index
    @items = Item.all #Itemテーブルのデータ全てを@itemsに代入
  end

  def new
    @item = Item.new
  end

end
