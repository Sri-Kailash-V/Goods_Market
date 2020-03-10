class MfrsController < ApplicationController
	skip_before_filter :verify_login ,only: [:new,:create]
	def index 
		@mfr=Mfr.find(session[:mid])
		unless params[:status].nil?
			sql=ActiveRecord::Base.connection.raw_connection.prepare("select c.id,c.pid,c.pname,c.quantity,cu.id,cu.username,cu.address,cu.mobile_no,c.status from cproducts as c,custs as cu,mproducts as mp where mp.mfr_id = ? and mp.pid=c.pid and c.cust_id=cu.id and c.status = ? order by c.id ASC;")
			@out=sql.execute(session[:mid],params[:status])
		else
			sql=ActiveRecord::Base.connection.raw_connection.prepare("select c.id,c.pid,c.pname,c.quantity,cu.id,cu.username,cu.address,cu.mobile_no,c.status from cproducts as c,custs as cu,mproducts as mp where mp.mfr_id = ? and mp.pid=c.pid and c.cust_id=cu.id and c.status!='Cart' order by c.id ASC;")
			@out=sql.execute(session[:mid])
		end
	end
	def new
		@mfr=Mfr.new
	end
	def create
		@mfr=Mfr.new(mfr_params)
		if @mfr.save
			session[:mid]=Mfr.find_by(email: @mfr.email,password: @mfr.password).id
			p session[:mid]
			redirect_to mfrs_path
		else
			render 'new'
		end
	end

	def edit
		@mfr=Mfr.find(session[:mid])
	end

	def update
		@mfr=Mfr.find(session[:mid])
		if @mfr.update(mfr_params)
			redirect_to mprofile_path
		else
			render 'edit'
		end
	end	
	def profile
		@mfr=Mfr.find(session[:mid])
	end
	def logout
		session.delete(:mid)
		redirect_to root_path
	   end
	def destroy 
		@mfr=Mfr.find(session[:mid])
		@mfr.destroy
		logout
	end
	private
	def mfr_params
		params.require(:mfr).permit(:username,:email,:password,:mobile_no)
	end
end

# @mfr=Mfr.find(session[:mid])
# 		unless params[:status].nil?
# 		sql="select c.id,c.pid,c.pname,c.quantity,cu.id,cu.username,cu.address,cu.mobile_no,c.status from cproducts as c,custs as
# 		 cu,mproducts as mp where mp.mfr_id=#{session[:mid]} and mp.pid=c.pid and c.cust_id=cu.id and c.status='#{params[:status]}' order by c.id ASC;"
# 		else
# 		sql="select c.id,c.pid,c.pname,c.quantity,cu.id,cu.username,cu.address,cu.mobile_no,c.status from cproducts as c,custs as
# 		 cu,mproducts as mp where mp.mfr_id=#{session[:mid]} and mp.pid=c.pid and c.cust_id=cu.id and c.status!='Cart' order by c.id ASC;"
# 		end
# 		@out=ActiveRecord::Base.connection.execute(sql)