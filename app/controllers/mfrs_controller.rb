class MfrsController < ApplicationController
	skip_before_filter :verify_login ,only: [:new,:create]
	def index 
		@mfr=Mfr.find(session[:mid])
	end
	def new
		@mfr=Mfr.new
		# p "111111111111111111111111111111111111"

	end
	def create
		@mfr=Mfr.new(mfr_params)
		# p "111111111111111111111111111111111111"
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





# <!-- <%= @mfr.mproduct.each do |s|

# 	s
	
	
	
# 	end %>
# 	-->