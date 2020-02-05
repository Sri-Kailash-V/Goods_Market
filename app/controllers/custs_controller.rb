class CustsController < ApplicationController
  skip_before_filter :verify_login ,only: [:new,:create]
    def index
      @cust = Cust.find(@cid)
      if session[:group].nil?||session[:group]==""
        @search=Mproduct.all 
      else
        @search= Mproduct.where(group: session[:group])
      end
    end
    def search 
      session[:group] = params[:mproducts][:group]
      redirect_to custs_path
    end
    def  new
        @cust = Cust.new
    end
    def create
        @cust = Cust.new(credentials)
        if @cust.save
          session[:cid]=Cust.find_by(email: @cust.email).id
          redirect_to custs_path,notice: "Customer Registered"
        else
          render 'new'
        end
    end
    def profile
      @cust=Cust.find(@cid)
    end
    def edit
      @cust=Cust.find(@cid)
    end
    def update 
      @cust=Cust.find(@cid)
      if @cust.update(credentials)
        redirect_to cprofile_path,notice: "Updated Sucessfully"
      else
        render 'edit'
      end
    end
    def logout
      session.delete(:cid)
      redirect_to root_path,notice: "loggedout #{@e} successfully "
    end
    def destroy
      @cust=Cust.find(@cid)
      @e="and Removed"
      @cust.destroy
      logout
    end
    private
    def credentials
      params.require(:cust).permit(:username,:email,:password,:mobile_no,:address)
    end
end
