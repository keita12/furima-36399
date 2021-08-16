class ItemsController < ApplicationController
	before_action :authenticate_user!, except: [:index, :show]
	before_action :move_to_edit, only: [:edit]
	def index
		@items = Item.all.order("created_at DESC")
	end
	def new
		@item = Item.new
	end
	def create
		@item = Item.new(item_params)
		if @item.save
			redirect_to root_path 
		else
			render :new
		end
	end

	def show
		@item = Item.find(params[:id])
	end
	def edit
		@item = Item.find(params[:id])
	end
	def update
		@item = Item.find(params[:id])
		@item.update(item_params)
		if @item.save
			redirect_to item_path 
		else
			render :edit
		end
	end
	def move_to_edit
		@item = Item.find(params[:id])
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
	end
	private
	def item_params
		params.require(:item).permit(:image, :item_name, :description, :category_id, :condition_id, :delivery_fee_id, :area_id, :shipping_day_id, :price).merge(user_id: current_user.id)
	end
end
