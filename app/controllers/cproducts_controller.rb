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
        unless Cproduct.find_by(pid:session[:pid],cust_id: session[:cid],status: "Cart")
                @cart=Cproduct.new
        else
             redirect_to edit_cproduct_path(session[:pid])
        end
    end

    def create 
         unless Cproduct.find_by(pid:session[:pid],cust_id: session[:cid],status: "Cart")
            @cart=Cproduct.new(product_creds)
            @cart.cust_id=session[:cid]
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
        unless Cproduct.find_by(cust_id: session[:cid],status: "Cart").nil?
            @cproduct=Cproduct.where(cust_id: session[:cid],status: "Cart")
            @state=true
        else
            @state=false
        end
     end

     def edit
        p params[:id]
        @cproduct=Cproduct.find_by(pid: params[:id],cust_id: session[:cid],status: "Cart")
     end

     def update
         @cproduct = Cproduct.find_by(pid: params[:id],cust_id: session[:cid],status: "Cart")
       
         if @cproduct.update(product_creds)
           redirect_to cart_path,notice: "Cart successfully updated"
         else
            render 'edit',notice: "Update Failed"
         end
     end
     
     def destroy
         @cproduct = Cproduct.find_by(pid: params[:id],cust_id: session[:cid],status: "Cart")
         @cproduct.destroy
            redirect_to cart_url,notice: "Successfully Removed"
     end

     def payment
        @cproduct = Cproduct.where(cust_id: session[:cid])
        @count=0
        @cproduct.each do |a| 
            @count+=1
        end
        @tot_price=params[:tot_price]
        @tot_quantity=params[:tot_quantity]
     end

     
     private
     def product_creds
        params.require(:cproduct).permit(:pid,:pname,:quantity)
     end
end

 # #   @cproduct.cust_id=session[:cid]
        #  p"========================="
        #   p @cproduct
        #   p product_creds
        #   p"========================="
        #   @cproduct.quantity=params[:cproduct][:quantity]
        #   @cproduct.save
        #   p @cproduct.update_attributes(quantity: params[:cproduct][:quantity])
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