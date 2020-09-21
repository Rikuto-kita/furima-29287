class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item , only: [:index , :pay_item , :create , :sold]
  before_action :sold
  
  

  def index
    @order = OrderCustomer.new
  end

  def create

    @order = OrderCustomer.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end


  private

  def order_params
    params.require(:order_customer).permit(:post_code,:prefecture_id,:city,:address,:building_name,:phone_number).merge(user_id: current_user.id,token: params[:token],item_id:params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
    Payjp::Charge.create(
      amount: @item.price,  
      card: params[:token],   
      currency:'jpy'                 
    )
  end

  def sold
    if (current_user.id == @item.user_id) || (@item.customer!=nil)
       redirect_to root_path
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

 

end
