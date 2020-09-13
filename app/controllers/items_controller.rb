class ItemsController < ApplicationController
  before_action :redirect_path, except: :index
  before_action :set_item , only: [:show,:edit]
  before_action :set_show , only: [:update,:destroy]
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
  end

  def edit
  end

  def update
    if item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if item.destroy
      redirect_to root_path
    else
      render :show
    end
  end


  private

  def redirect_path
    redirect_to new_user_session_path unless user_signed_in?
  end

  def item_params
   params.require(:item).permit(:image,:name,:memo,:category_id,:item_status_id,:ship_city_id,:ship_date_id,:ship_method_id,:price ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_show
    item = Item.find(params[:id])
  end

end
