class GoodsmarketsController < ApplicationController
  skip_before_action :verify_login

  def index
  end

  def customer
    if session[:cid]
      redirect_to custs_path
    else
      @cust=Cust.new
    end
  end

  def csignin
   @cust=Cust.new(cust_credentials)  
    cust=Cust.find_by(email: @cust.email,password: @cust.password)
    unless cust.nil?
      session[:cid]=cust.id
      redirect_to custs_path
    else
      redirect_to :back,alert: "Invalid Username or Password"
    end
  end

  def manufacturer
    # session[:mid]=1
    if session[:mid]
      redirect_to mfrs_path
    else
      @mfr=Mfr.new
    end
  end

  def msignin
    @mfr=Mfr.new(mfr_credentials)
    mfr=Mfr.find_by(email: @mfr.email,password: @mfr.password)
    unless mfr.nil?
      session[:mid] = mfr.id
     	redirect_to mfrs_path
    else 
      # render 'manufacturer'
      redirect_to :back,alert: "Invalid Username or Password"
    end
  end
  private
  def cust_credentials
    params.require(:cust).permit(:email,:password)
  end
  def mfr_credentials
    params.require(:mfr).permit(:email,:password)
  end
end



=begin
  p "================================="
 p "*****************************"
      #@msign=Goodsmarket.new(msign_params)
      #mfr=Mfr.find_by(email: params[:Goodsmarket][:email])
      p mfr
      puts"========================================================================#{session[:email]}"
    # if mfr#.authenticate(password: @mfr.password)
  	#if mfr#.password==(params [:goodsmarket][:password])
  	 # manufacturer
      #  render 'manufacturer'
      # render 'goodsmarkets_manufacturer_path'
   #if session[:cemail]
    #  redirect_to new_chome_path
    #else
    ##  @cst=Mfr.new
    #end#redirect_to chomes
=end