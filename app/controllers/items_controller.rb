class ItemsController < ApplicationController
before_action :move_to_index, except: [ :index, :show ]
before_action :show_item, only: [ :show, :edit]
  def index
    @items=  Item.all.order("created_at DESC")
    
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



  def show_item
    @item = Item.find(params[:id])
  end
  
  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  private

  def item_params
    params.require(:item).permit( :image, :name, :description, :price, :category_id, :status_id, :delivery_fee_id, :ship_from_id, :lead_time_id).merge(user_id: current_user.id)
  end

end