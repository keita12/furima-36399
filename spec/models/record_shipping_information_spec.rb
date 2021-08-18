require 'rails_helper'

RSpec.describe RecordShippingInformation, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @record_shipping_information = FactoryBot.build(:record_shipping_information, user_id: @user.id, item_id: @item.id)
    sleep 0.5
  end
  describe "配送先情報" do
    context "配送先情報の入力に成功する時" do
      it "内容に問題がなければ保存できる" do
        expect(@record_shipping_information).to be_valid
      end
      it "建物名は空でも保存できる" do
        @record_shipping_information.building_name = ''
        expect(@record_shipping_information).to be_valid
      end
    end
  end
  context "配送先情報の入力に失敗する時" do
    it "郵便番号が空では保存できない" do
      @record_shipping_information.postal_code = ''
      @record_shipping_information.valid?
      expect(@record_shipping_information.errors.full_messages).to include "Postal code can't be blank"
    end
    it "郵便番号が全角だと保存できない" do
      @record_shipping_information.postal_code = '５５５-５５５５'
      @record_shipping_information.valid?

      expect(@record_shipping_information.errors.full_messages).to include "Postal code is invalid. Enter it as follows (e.g. 123-4567)"
    end
    it "郵便番号がハイフンがないと保存できない" do
      @record_shipping_information.postal_code = '5555555'
      @record_shipping_information.valid?
      expect(@record_shipping_information.errors.full_messages).to include "Postal code is invalid. Enter it as follows (e.g. 123-4567)"
    end
    it "都道府県が空では保存できない" do
      @record_shipping_information.area_id = ''
      @record_shipping_information.valid?
      expect(@record_shipping_information.errors.full_messages).to include "Area can't be blank"
    end
    it "都道府県の情報がid1だと保存できない" do
      @record_shipping_information.area_id = 1
      @record_shipping_information.valid?
      expect(@record_shipping_information.errors.full_messages).to include "Area can't be blank"
    end
    it "市区町村が空だと保存出来ない" do
      @record_shipping_information.municipalities = ''
      @record_shipping_information.valid?
      expect(@record_shipping_information.errors.full_messages).to include "Municipalities can't be blank"
    end
    it "番地が空だと保存出来ない" do
      @record_shipping_information.address = ''
      @record_shipping_information.valid?
      expect(@record_shipping_information.errors.full_messages).to include "Address can't be blank"
    end
    it "電話番号は全角だと保存出来ない" do
      @record_shipping_information.telephone_num = '０９０５５５５６６６６'
      @record_shipping_information.valid?
      expect(@record_shipping_information.errors.full_messages).to include "Telephone num is invalid"
    end
    it "電話番号が9桁以下だと保存出来ない" do
      @record_shipping_information.telephone_num = '123456789'
      @record_shipping_information.valid?
      expect(@record_shipping_information.errors.full_messages).to include "Telephone num is invalid"
    end
    it "電話番号が12桁以上だと保存出来ない" do
      @record_shipping_information.telephone_num = '123456789012'
      @record_shipping_information.valid?
      expect(@record_shipping_information.errors.full_messages).to include "Telephone num is invalid"
    end
    it "tokenが空では登録できないこと" do
      @record_shipping_information.token = nil
      @record_shipping_information.valid?
      expect(@record_shipping_information.errors.full_messages).to include "Token can't be blank"
    end
  end
end

