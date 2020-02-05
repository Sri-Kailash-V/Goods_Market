class CproductsController < ApplicationController
    def index
        @product=Mproduct.find_by(mfr_id:params[:mid],pid:params[:pid])
        @samemfr=Mproduct.where(mfr_id:params[:mid])
    end

    def ratings
        @product=Mproduct.find_by(mfr_id:params[:mid],pid:params[:pid])
        @product.ratings+=params[:number].to_i
        @product.rcount+=1
        if @product.save
            redirect_to cproducts_path(mid:params[:mid],pid:params[:pid]) 
        end
    end

    def new
        session[:pname]=params[:pname]
        session[:pid]=params[:pid]
        unless Cproduct.find_by(pid:session[:pid])
                @cart=Cproduct.new
        else
             redirect_to edit_cproduct_path(session[:pid])
        end
    end
    def create 

         unless Cproduct.find_by(pid:session[:pid])
            @cart=Cproduct.new(product_creds)
            if @cart.save
                redirect_to custs_path,notice: "Added to cart"
            else 
                render 'new'
            end
         else
             redirect_to edit_cproduct_path(session[:pid])
          end
     end
     def cart 
        @cproduct=Cproduct.all
     end
     def destroy
         @cproduct = Cproduct.find(params[:id])
         @cproduct.destroy
            redirect_to cart_url,notice: "Successfully Removed"
     end
     
     private
     def product_creds
        params.require(:cproduct).permit(:pid,:pname,:quantity)
     end
end


        # sql = "select product_name,pid,price from mproducts where quantity> 30"
        # raw = ActiveRecord::Base.connection.execute(sql)
        # raw.each do |row|
        #     puts row#.inspect # row is hash, something like {"name" => "Tom", "age" => 28}
        #   end
        # @pid=params[:pid]
        # sql = "Insert into Cproducts (pid,pname) product_name,pid,price from mproducts where quantity> 30"
        # raw = ActiveRecord::Base.connection.execute(sql)

        # @cart=Cproduct.new(product_creds)
    #     p params[:param1]
    # # session[:group] = params[:mproducts][:group]

# <% @search.each do |p|%>
#     <div class="col-sm-3 ">
#         <div class="container-fluid bg-info ">
#             <h3 class="text-center"><%=%></h3>
#             <br/>
#             <h5 class="text-left ">Price : &#8377;<%=p.price%></h5>
#             <h5 class="text-right ">Ratings : &#10031;<%=p.ratings%>no</h5>
#             <h5 class="text-left col-sm-8">Manufacturer : <%=p.product_id%> <%=product.find(p.product_id).username%> </h5>
#            <!-- <% @pid =p.id; %>  -->
#            <%= link_to "Add to cart",new_cproduct_path(param1: @pid),class: "btn btn-primary col-sm-4"%>
#             <h5 class="text-left col-sm-7">Available : <%=p.quantity%></h5>
        # <%= link_to "Add to cart",cproducts_path(pid: p.pid),method: :post,class: "btn btn-primary col-sm-5"%>
            
#         </div>
#     </div>
    
#     <% end%>
    

# <%= link_to "Edit" ,edit_product_path(session[:mid]),class: "btn btn-primary"%>