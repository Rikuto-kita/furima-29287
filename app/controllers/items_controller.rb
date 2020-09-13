class ItemsController < ApplicationController
  before_action :redirect_path, except: :index
  skip_before_action :authenticate_user!


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

  def index
    @item = Item.all.order("created_at DESC")
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def redirect_path
    redirect_to new_user_session_path unless user_signed_in?
  end

  def item_params
   params.require(:item).permit(:image,:name,:memo,:category_id,:item_status_id,:ship_city_id,:ship_date_id,:ship_method_id,:price ).merge(user_id: current_user.id)
  end

end
