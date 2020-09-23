class ItemsController < ApplicationController
  before_action :set_item , only: [:show,:edit]
  before_action :authenticate_user! , except: [:index,:show,:search]



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

  def search
    @item = Item.search(params[:keyword])
  end

  def show 
    @comment = Comment.all
    @comments = @item.comments.includes(:user)
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit 
    end
  end

  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    else
      render :show
    end
  end


  private

  def item_params
   params.require(:item).permit(:image,:name,:memo,:category_id,:item_status_id,:ship_city_id,:ship_date_id,:ship_method_id,:price ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
