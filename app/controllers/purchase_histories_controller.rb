class PurchaseHistoriesController < ApplicationController

  before_action :set_item, only: [:index, :create]
  before_action :move_to_index, only: [:index]
  before_action :authenticate_user!, only: [:index]


  def index
    @purchase_destination  = PurchaseDestination.new
  end

  def create
    @purchase_destination = PurchaseDestination.new(purchase_params)

    if @purchase_destination.valid?

      pay_item

       @purchase_destination.save
       redirect_to root_path
    else
      render :index
    end
  end

  private
    
  def purchase_params
   params.require(:purchase_destination).permit(:postal_code,:shipping_area_id,:city,:address,:building_name,:phone_number).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if user_signed_in?
      if current_user.id == @item.user.id
        redirect_to controller: :items, action: :index
      elsif  current_user.id != @item.user.id && PurchaseHistory.exists?(item_id: @item.id)
        redirect_to controller: :items, action: :index
      end      
    end  
  end 
  
  def set_item
    @item = Item.find(params[:item_id])
  end
end
