class PurchaseHistoriesController < ApplicationController
  def index
    @purchase_destination  = PurchaseDestination.new
    @item = Item.find(params[:item_id])

  end

  def create
    @purchase_destination = PurchaseDestination.new(purchase_params)

    if @purchase_destination.valid?
       @purchase_destination.save
       redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private
    
  def purchase_params
   params.require(:purchase_destination).permit(:postal_code,:shipping_area_id,:city,:address,:building_name,:phone_number).merge(user_id: current_user.id,item_id: params[:item_id])
  end


end
