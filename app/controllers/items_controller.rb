class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :move_to_index, only: [:edit]
  
  def index
    @items = Item.order("created_at DESC ")
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

  def show
  end

  def edit
  end

  def update

    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:name,:description,:category_id,:item_status_id,:shipping_charges_id,:shipping_area_id,:days_to_ship_id,:price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])    
  end

  def move_to_index

    if !(user_signed_in? && current_user.id == @item.user.id) 
      redirect_to action: :index
    end

  end
end
