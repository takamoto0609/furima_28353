class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :new, :create, :show, :destroy]

  def index
    @items = Item.all.order(id: "DESC")
    @purchases = Purchase.pluck(:item_id)
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
    @purchases = Purchase.pluck(:item_id)
    # if @purchases.include?(@item.id)
    #   redirect_to root_path
    # end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.new(item_params)
    if @item.valid?
      Item.find(params[:id]).update(item_params)
      redirect_to root_path
    else
      render :edit
    end
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

  def move_to_index
    item = Item.find(params[:id])
    if current_user.id != item.user_id
      redirect_to root_path
    end
  end

end