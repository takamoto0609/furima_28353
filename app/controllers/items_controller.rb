class ItemsController < ApplicationController

  def index
    @items = Item.all.order(id: "DESC")
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item                    = Item.find(params[:id])
    @category                = Category.find(@item.category_id)
    @status                  = Status.find(@item.status_id)
    @shipping_fee_burden     = ShippingFeeBurden.find(@item.shipping_fee_burden_id)
    @shipping_area           = ShippingArea.find(@item.shipping_area_id)
    @estimated_delivery_date = EstimatedDeliveryDate.find(@item.estimated_delivery_date_id)
    @user                    = User.find(@item.user_id)
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to item_path
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :explanation, :user_id, :category_id, :status_id, :shipping_fee_burden_id, :shipping_area_id, :estimated_delivery_date_id, :image).merge(user_id: current_user.id)
  end

end