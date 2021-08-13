require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

	describe "商品出品機能" do
    context '商品出品に成功する時' do
      it '内容に問題なければ保存できる' do
        expect(@item).to be_valid
      end
    end
	end
   context '新規登録に失敗する時' do
		it "画像が空だと保存できない" do
			@item.image = nil
			@item.valid?
			expect(@item.errors.full_messages).to include "Image can't be blank"
		end
		it "商品名が空だと保存できない" do
			@item.item_name = ''
			@item.valid?
			expect(@item.errors.full_messages).to include "Item name can't be blank"
		end
		it "商品説明が空だと保存できない" do
			@item.description = ''
			@item.valid?
			expect(@item.errors.full_messages).to include "Description can't be blank"
		end
		it "カテゴリーが空だと保存できない" do
			@item.category_id = ''
			@item.valid?
			expect(@item.errors.full_messages).to include "Category can't be blank"

		end
		it "商品状態が空だと保存できない" do
			@item.condition_id = ''
			@item.valid?
			expect(@item.errors.full_messages).to include "Condition can't be blank"

		end
		it "配送料の負担が空だと保存できない" do
			@item.delivery_fee_id = ''
			@item.valid?
			expect(@item.errors.full_messages).to include "Delivery fee can't be blank"

		end
		it "発送地域の情報が空だと保存できない" do
			@item.area_id = ''
			@item.valid?
			expect(@item.errors.full_messages).to include "Area can't be blank"
		end
		it "発送までの日付が空だと保存できない" do
			@item.shipping_day_id = ''
			@item.valid?
			expect(@item.errors.full_messages).to include "Shipping day can't be blank"
		end
		it "価格が空だと保存できない" do
			@item.price = ''
			@item.valid?
			expect(@item.errors.full_messages).to include "Price can't be blank"
		end
		it "価格が299円以下だと保存できない" do
			@item.price = 200
			@item.valid?
			expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"
		end
		it "価格が10000000円以上だと保存できない" do
			@item.price = 10000000
			@item.valid?
			
			expect(@item.errors.full_messages).to include "Price must be less than or equal to 9999999"
		end
		
	end
end
