class OrdersController < ApplicationController
  def confirm
      @cart=Cproduct.where(cust_id: session[:cid],status: "Cart")
      @cart.each do |item|
        item.status="Placed"
        item.save 
      end
      # redirect_to custs_path,notice: "Order placed Successfully"
  end

  def cancel
    @products=Cproduct.find(params[:id])
    @products.status="Cancelled"
    @products.save
    redirect_to :back,notice: "Order cancelled"
  end

  def show
    unless params[:status].nil?
      @products=Cproduct.where(cust_id: session[:cid],status: params[:status])
    else
      @products=Cproduct.where(cust_id: session[:cid])
    end
  end
end
