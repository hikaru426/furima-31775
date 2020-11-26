class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, except: [:index, :new, :create]
  def index
    @items = Item.includes(:user).order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    redirect_to root_path if current_user.id != @item.user_id
  end

  def show
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy if current_user.id == @item.user.id
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:category_id, :condition_id, :delivery_id, :shipping_id, :prefecture_id, :image, :name, :info, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
