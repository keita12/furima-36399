class OrdersController < ApplicationController
	before_action :authenticate_user!, only: [:index]
	before_action :set_item, only: [:index,:create,:login_record,:login_same]
	before_action :login_record, only: [:index]
	before_action :login_same, only: [:index]
	def index
		 @recordshippinginformation = RecordShippingInformation.new
	end
	def create
		@recordshippinginformation = RecordShippingInformation.new(record_params)
		if @recordshippinginformation.valid?
			pay_item
			@recordshippinginformation.save
			redirect_to root_path
		else
			render :index
		end
	end
	
	private
	def set_item
		@item = Item.find(params[:item_id])
	end
	def record_params
		params.require(:record_shipping_information).permit(:telephone_num,:postal_code,:area_id,:municipalities,:address,:building_name,).merge(user_id: current_user.id,item_id: params[:item_id],token: params[:token])
	end
	def pay_item
		Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: set_item[:price],  
        card: record_params[:token],    
        currency: 'jpy'                 
      )
	end
  def login_record
			if @item.record.present?
				redirect_to root_path
			end
	end
	def login_same
			if current_user.id == @item.user_id
				redirect_to root_path
			end
	end
end
