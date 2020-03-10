class MproductsController < ApplicationController
    def index
       @mproduct = Mproduct.where(mfr_id: @mid )
    end
    def new
        @mproduct = Mproduct.new
    end
    def create
        @mproduct = Mproduct.new(product_params)
        @mproduct.mfr_id=@mid
        if @mproduct.save
           redirect_to new_mfr_mproduct_path(@mid),notice: "Successfully Added"
        else
            render 'new'
        end
    end
    def edit
        current_user = Mfr.find(@mid)
        @mproduct = current_user.mproducts.find(params[:id])
    end
    def update
        current_user = Mfr.find(@mid)
        @mproduct = current_user.mproducts.find(params[:id])
        if @mproduct.update(product_params)
          redirect_to mfr_mproducts_path(@mid),notice: "Successfully Updated"
        else
          flash[:notice] = "Update failed"
          render 'edit'
        end
    end
    def destroy
        current_user = Mfr.find(@mid)
        @mproduct = current_user.mproducts.find(params[:id])
        @mproduct.destroy
        redirect_to mfr_mproducts_path(@mid),notice: "Successfully Removed"
    end
    private
    def product_params
        params.require(:mproduct).permit(:product_name,:quantity,:price,:group)
    end 
end

# @mproduct=Mproduct.find(params[:id])