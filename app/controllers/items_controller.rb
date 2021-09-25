class ItemsController < ApplicationController

  before_action :authenticate_user!, only: [:new]

  # トップページの表示
  def index
  end

  # 商品出品ページの表示
  def new
    @item = Item.new
  end

  #商品情報の保存
  def create
    @item = Item.new(item_params)
    binding.pry

    # 保存判定
    if @item.save
      redirect_to root_path      
    else
      render :new      
    end
    
  end

  
  private

  def item_params
    params.require(:item).permit(:image,:name,:description,:category_id,:item_status_id,:shipping_charges_id,:shipping_area_id,:days_to_ship_id,:price).merge(user_id: current_user.id)
  end



end
