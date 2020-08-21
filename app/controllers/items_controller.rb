class ItemsController < ApplicationController

  def index
    @items = Item.all #Itemテーブルのデータ全てを@itemsに代入
  end

  def new #トップページの「出品」ボタンに対応するアクション
    @item = Item.new
  end

  def create # new.html.erbの「出品する」ボタンに対応するアクション
  end

end