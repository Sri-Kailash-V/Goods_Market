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
  def packed
    @products=Cproduct.find(params[:id])
    @products.status="Packed"
    @products.save
    redirect_to :back,notice: "status updated"
  end
  def shipped
    @products=Cproduct.find(params[:id])
    @products.status="Shipped"
    @products.save
    redirect_to :back,notice: "status updated"
  end
  def delivered
    @products=Cproduct.find(params[:id])
    @products.status="Delivered"
    @products.save
    redirect_to :back,notice: "Order Forcefully cancelled"
  end
  def forcecancel
    @products=Cproduct.find(params[:id])
    @products.status="Force Cancelled"
    @products.save
    redirect_to :back,notice: "Order Forcefully cancelled"
  end
end
